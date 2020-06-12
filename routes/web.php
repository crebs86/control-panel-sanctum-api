<?php

use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('test-broadcast', function (\Illuminate\Http\Request $request) {
    //broadcast(new \App\Events\FreeEvent());
    return date('d/m/Y  H:i:s');
});
Route::get('test-private', function (\Illuminate\Http\Request $request) {
    broadcast(new \App\Events\PrivateEvent(\App\User::where('id', 2)->first(), ['type'=>'message','key' => 'value', 'order' => 1]));
});
Route::get('test-notification', function (\Illuminate\Http\Request $request) {
    $a = \App\User::find(2);
    dd($a->notifications);
    $notifications = $a->unreadNotifications;

    return response()->json(compact('notifications'));
});

Route::get('info', function () {
    return phpinfo();
});

Route::get('/teste', 'Test@test');
