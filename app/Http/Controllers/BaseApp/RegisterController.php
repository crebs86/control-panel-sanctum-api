<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Traits\AclCore;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;

class RegisterController extends Controller
{
    use AclCore;
    public function register(Request $request)
    {
        $this->setMessageError('You can\'t create a user!')->can('user_create', 'user_manager');
        $request->validate([
            'name' => ['required'],
            'email' => ['required', 'email', 'unique:users'],
            'password' => ['required', 'min:8', 'confirmed']
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        return $user;
    }
}
