<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Traits\AclCore;
use App\Http\Traits\Helper;
use App\Models\User;
use App\Models\UserEditions;
use App\Notifications\BaseApp\VerificationEmail;
use App\Notifications\BaseApp\WelcomeEmail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    use AclCore, Helper;

    /**
     * Get a user data
     *
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function user(User $user)
    {
        $a = $user->where('id', auth('sanctum')->id())->get(['id', 'name', 'email', 'email_verified_at', 'created_at'])->toArray();
        if (count($a) === 1) {
            return response()->json($a[0]);
        } else {
            return response()->json(['message' => 'Error get user'], 403);
        }
    }

    /**
     * Get users list
     *
     * @return User[]|\Illuminate\Database\Eloquent\Collection
     */
    public function list()
    {
        $this->can('user_manager', 'user_view', 'super-admin');
        return User::where('id', '<>', 1)->get(['id', 'name', 'email', 'email_verified_at', 'created_at', 'updated_at']);
    }

    /**
     * Get users list with basic data
     *
     * @return array
     */
    public function usersListBasic()
    {
        $this->can('user_manager', 'user_view', 'super-admin');
        return collect(User::where('id', '<>', 1)->get(['id', 'name', 'email'])->toArray())->sortBy('name')->values()->all();
    }

    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function getToken(Request $request)
    {
        return response($request->user()->tokens()->get());
    }

    /**
     * Edit a user on database
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request, User $user)
    {
        $this->can('user_manager', 'user_edit', 'super-admin');
        $u = $user->select('id', 'name', 'email', 'email_verified_at')->find($request->id);
        $message = 'User Edited';
        $old = json_encode($u);
        if ($u) {
            $change_mail = $this->checkMailChangeAndConfig($u->email, $request->email);
            $u->name = $request->name;
            $u->email = $request->email;
            $u->save();
            $this->saveHistory($old, $u);
            if ($change_mail) {
                $this->setAndSendMailConfirmation($u);
                $message = 'A confirmation email account was sendo to ' . $u->email;
            }
            return response()->json(['message' => $message, 'user' => $u]);
        } else {
            return response()->json(['message' => 'User not found'], 403);
        }
    }

    /**
     * Verify if has change on user mail and if required send a verification email
     *
     * @param $current
     * @param $post
     * @return bool
     */
    private function checkMailChangeAndConfig($current, $post)
    {
        if ($current !== $post) {
            $c = $this->getConfig('app_config');
            if ($c) {
                return json_decode($c[0]->content)->email_verified;
            }
        }
        return false;
    }

    /**
     * Save a history after changes on users data
     *
     * @param $old
     * @param $new
     * @return void
     */
    private function saveHistory($old, $new)
    {
        $a = new UserEditions();
        $a->old = $old;
        $a->new = json_encode($new);
        $a->editor = auth('sanctum')->id();
        $a->user_id = $new->id;
        $a->save();
    }

    /**
     * Define URL and send a verification email
     *
     * @param User $user
     * @return User
     */
    private function setAndSendMailConfirmation(User $user)
    {
        $url = env('APP_URL') . '/mailVerification/' . Crypt::encryptString($user->email) . '.' . Crypt::encryptString($user->id);
        $user->email_verified_at = null;
        $user->save();
        $user->notify(new VerificationEmail((object)['url' => $url, 'user' => $user->name]));
        return $user;
    }

    /**
     * Send verification email to user email account
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendVerificationEmail(Request $request, User $user)
    {
        $this->can('user_manager', 'user_edit', 'super-admin');
        $u = $user->select('id', 'name', 'email', 'email_verified_at')->find($request->user);
        if ($u) {
            $usr = $this->setAndSendMailConfirmation($user);
            return response()->json(['message' => 'Verification Email was send to ' . $u[0]->email, 'user' => $usr]);
        } else {
            return response()->json(['message' => 'Unknown Error'], 403);
        }
    }

    /**
     * Mark user email as confirmed
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function markEmailAsConfirmed(Request $request, User $user)
    {
        $this->can('user_manager', 'user_edit', 'super-admin');
        $u = $user->select('id', 'email', 'email_verified_at')->find($request->user);
        if ($u && $u->emailverified_at === null) {
            $u->email_verified_at = now();
            $u->save();
            $this->sendWelcomeEmail($request);
            return response()->json(['message' => 'The email address ' . $u->email . ' was verified successfully.', 'user' => $u]);
        } else {
            return response()->json(['message' => 'Failed verification. User not found or email already verified.'], 403);
        }
    }

    /**
     * Send a welcome email to user
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendWelcomeEmail(Request $request)
    {
        $this->can('user_manager', 'user_edit', 'super-admin');
        $u = User::select('id', 'name', 'email')->find($request->user);
        if ($u) {
            $u->notify(new WelcomeEmail($u->name));
            return response()->json(['message' => 'A email was send to user ' . $u->name . ' [' . $u->email . '].']);
        } else {
            return response()->json(['message' => 'Error. User not found.'], 403);
        }
    }

    /**
     * Confirm email account, set datetime on database
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function verificationEmail(Request $request, User $user)
    {
        $b = explode('.', $request->check);
        $u = $user->select('id', 'email', 'email_verified_at')->find((int)Crypt::decryptString($b[1]));
        if ($u && $u->email === Crypt::decryptString($b[0]) && $u->email_verified_at === null) {
            $u->email_verified_at = now();
            $u->save();
            return response()->json(['message' => 'Congratulation. Your email address ' . $u->email . ' was verified successfully.']);
        } else {
            return response()->json(['message' => 'Failed verification. User not found or email already verified.'], 403);
        }
    }

    /**
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function changePassword(Request $request, User $user)
    {
        $this->can('user_manager', 'user_edit', 'super-admin');
        $request->validate([
            'password' => ['required', 'min:8', 'confirmed'],
            'user' => ['int', 'exists:users,id']
        ]);
        $u = $user->select('email')->find($request->user);
        if ($u) {
            $u->update(['password' => Hash::make($request->password)]);
            return response()->json(['message' => 'Password changed successfully for ' . $u->email]);
        } else {
            return response()->json(['message' => 'Failed verification. Password no changed'], 403);
        }
    }

    /**
     * Change Password of Logged User
     *
     * @param Request $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function changeMyPassword(Request $request, User $user)
    {
        $this->can('user_edit_self');
        if (auth('sanctum')->id() !== $request->user) {
            return response()->json(['message' => 'Failed verification. Request wrong way!'], 403);
        }
        $request->validate([
            'password' => ['required', 'min:8', 'confirmed'],
            'user' => ['int', 'exists:users,id']
        ]);
        $u = $user->select('id')->find(auth('sanctum')->id());
        if ($u) {
            $u->update(['password' => Hash::make($request->password)]);
            return response()->json(['message' => 'Password changed successfully']);
        } else {
            return response()->json(['message' => 'Failed verification. Password no changed'], 403);
        }
    }

}
