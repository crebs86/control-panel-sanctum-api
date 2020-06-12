<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function user(Request $request)
    {
        return $request->user()->only(['id', 'name', 'email', 'email_verified_at']);
    }

    /**
     * @return User[]|\Illuminate\Database\Eloquent\Collection
     */
    public function list()
    {
        return User::all();
    }

    /**
     * @return array
     */
    public function usersListBasic()
    {
        return collect(User::all('id', 'name', 'email')->toArray())->sortBy('name')->values()->all();
    }

    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function getToken(Request $request)
    {
        return response($request->user()->tokens()->get());
    }
}
