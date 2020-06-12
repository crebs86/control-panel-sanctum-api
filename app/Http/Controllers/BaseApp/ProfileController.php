<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Requests\BaseApp\ProfileRequest;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function myProfile(Profile $profile, User $user)
    {
        return response()->json(
            $user->find(auth('sanctum')->id())->profile
        );
    }

    public function editMyProfile(Profile $profile, ProfileRequest $request)
    {
        return response()->json((boolean) $profile->find(auth('sanctum')->id())->update($request->all()));
    }
}
