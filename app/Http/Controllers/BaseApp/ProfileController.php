<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Requests\BaseApp\ProfileRequest;
use App\Http\Traits\AclCore;
use App\Models\Profile;
use App\Models\ProfileEditions;
use App\Models\User;
use Illuminate\Http\Request;


class ProfileController extends Controller
{
    use AclCore;

    /**
     * @param Profile $profile
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function myProfile(Profile $profile, User $user)
    {
        $this->can('user_view_self');
        return response()->json(
            $user->find(auth('sanctum')->id())->profile
        );
    }

    /**
     * @param ProfileRequest $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function editMyProfile(ProfileRequest $request, User $user)
    {
        $this->can('user_edit_self');
        $a = $user->find(auth('sanctum')->id())->profile;
        $old = json_encode($a);
        $b = $a->update($request->all());
        if ($b) {
            $this->saveHistory($old, $a);
            return response()->json(['message' => 'Profile updated']);
        } else {
            return response()->json(['message' => 'Unknown error. Profile not update'], 403);
        }
    }

    /**
     * @param $old
     * @param $new
     * @return void
     */
    private function saveHistory($old, $new)
    {
        $a = new ProfileEditions();
        $a->old = $old;
        $a->new = json_encode($new);
        $a->editor = auth('sanctum')->id();
        $a->profile_id = $new->id;
        $a->save();
    }

    /**
     * @param ProfileRequest $request
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function editProfile(ProfileRequest $request, User $user)
    {
        $this->can('user_manager', 'user_edit');
        $a = $user->find($request->id)->profile;
        $old = json_encode($a);
        if ($a) {
            $b = $a->update(['full_name' => $request->full_name, 'branch_line' => $request->branch_line, 'address' => $request->address, 'sector' => $request->sector]);
            if ($b) {
                $this->saveHistory($old, (object)$request->all());
                return response()->json(['message' => 'Profile updated', 'profile' => $request->all()]);
            } else {
                return response()->json(['message' => 'Unknown error. Profile not update'], 403);
            }
        } else {
            return response()->json(['message' => 'Profile not found'], 403);
        }
    }

    /**
     * Create a new profile
     *
     * @param ProfileRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function create(ProfileRequest $request)
    {
        $p = new Profile();
        $p->user_id = $request->user_id;
        $p->full_name = $request->full_name;
        $p->sector = $request->sector;
        $p->address = $request->address;
        $p->branch_line = $request->branch_line;
        $p->save();
        return response()->json(['message' => 'Profile created successfully', 'profile' => $p]);
    }

    /**
     * @param Request $request
     * @param Profile $profile
     * @return \Illuminate\Http\JsonResponse
     */
    public function getProfile(Request $request, Profile $profile)
    {
        return response()->json(['profile' => $profile->where('user_id', $request->user_id)->get()]);
    }
}
