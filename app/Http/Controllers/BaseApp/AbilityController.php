<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Traits\CryptTrait;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;

class AbilityController extends Controller
{
    use CryptTrait;
    public function myAbilities(User $user){
        return response()->json($this->encryptCollectData($user->find(auth('sanctum')->id())->roles->toArray()));
    }
}
