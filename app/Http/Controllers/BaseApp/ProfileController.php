<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Requests\BaseApp\ProfileRequest;
use App\Models\Profile;
use App\Models\User;

class ProfileController extends Controller
{
    public function myProfile(Profile $profile, User $user)
    {
        return response()->json(
            $user->find(auth('sanctum')->id())->profile
        );
    }

    public function editMyProfile(User $user, ProfileRequest $request)
    {
        $a = $user->find(auth('sanctum')->id())->profile;
        $b = $a->update($request->all());
        if ($b) {
            return response()->json(true);
        }
    }
}
