<?php

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
/*-----------------------------
 * Route Unprotected
 ----------------------------*/
Broadcast::routes(['middleware' => ['auth:sanctum']]);
Route::post('/login', 'BaseApp\LoginController@login');
Route::post('getAppConfig', 'BaseApp\AppConfigController@getAppConfig');

Route::middleware('auth:sanctum')->get('/user', 'BaseApp\UserController@user');
Route::middleware('auth:sanctum')->post('/getToken', 'BaseApp\UserController@getToken');
Route::middleware('auth:sanctum')->get('/usersList', 'BaseApp\UserController@list');
Route::middleware('auth:sanctum')->get('/usersListBasic', 'BaseApp\UserController@usersListBasic');
Route::middleware('auth:sanctum')->put('/user/edit', 'BaseApp\UserController@edit');
Route::middleware('auth:sanctum')->get('/user/sendVerificationEmail/{user}', 'BaseApp\UserController@sendVerificationEmail');
Route::middleware('auth:sanctum')->put('/user/markEmailAsConfirmed', 'BaseApp\UserController@markEmailAsConfirmed');
Route::middleware('auth:sanctum')->get('/user/sendWelcomeEmail/{user}', 'BaseApp\UserController@sendWelcomeEmail');
Route::middleware('auth:sanctum')->post('/user/changePassword', 'BaseApp\UserController@changePassword');
Route::middleware('auth:sanctum')->post('/user/changeMyPassword', 'BaseApp\UserController@changeMyPassword');
Route::get('/user/verificationEmail/{check}', 'BaseApp\UserController@verificationEmail');

Route::middleware('auth:sanctum')->post('/register', 'BaseApp\RegisterController@register');
Route::middleware('auth:sanctum')->post('/logout', 'BaseApp\LoginController@logout');

Route::middleware('auth:sanctum')->post('/alert', 'BaseApp\NotificationController@newSystemAlert');
Route::middleware('auth:sanctum')->get('/user/notifications', 'BaseApp\NotificationController@notifications');
Route::middleware('auth:sanctum')->get('/user/allNotifications', 'BaseApp\NotificationController@allNotifications');
Route::middleware('auth:sanctum')->put('/user/markAsRead', 'BaseApp\NotificationController@markAsRead');
Route::middleware('auth:sanctum')->put('/user/markAllAsRead', 'BaseApp\NotificationController@markAllAsRead');
Route::middleware('auth:sanctum')->get('/conversations', 'BaseApp\NotificationController@conversations');
Route::middleware('auth:sanctum')->get('/conversation/{id}', 'BaseApp\NotificationController@conversation');
Route::middleware('auth:sanctum')->post('/conversation/setNew', 'BaseApp\NotificationController@setNewConversation');
Route::middleware('auth:sanctum')->post('/message/new', 'BaseApp\NotificationController@sendMessage');

//Controller Tickets
Route::middleware('auth:sanctum')->get('/ticketTypes', 'BaseApp\TicketsController@ticketTypes');
Route::middleware('auth:sanctum')->get('/tickets', 'BaseApp\TicketsController@tickets');
Route::middleware('auth:sanctum')->get('/my-tickets', 'BaseApp\TicketsController@myTickets');
Route::middleware('auth:sanctum')->post('/tickets/new', 'BaseApp\TicketsController@newTicket');
Route::middleware('auth:sanctum')->post('/ticket/{id}/new-message', 'BaseApp\TicketsController@newMessage');
Route::middleware('auth:sanctum')->post('/ticket/{id}/close-ticket', 'BaseApp\TicketsController@closeTicket');
Route::middleware('auth:sanctum')->put('/ticket/{id}/admin/ticketSetPriority', 'BaseApp\TicketsController@ticketSetPriority');
Route::middleware('auth:sanctum')->get('/ticket/{id}', 'BaseApp\TicketsController@ticket');
Route::middleware('auth:sanctum')->get('/ticket/{id}/admin', 'BaseApp\TicketsController@ticketAdmin');
Route::middleware('auth:sanctum')->put('/ticket/{id}/admin/accept', 'BaseApp\TicketsController@ticketAdminAccept');
Route::middleware('auth:sanctum')->post('/ticket/{id}/admin/accept', 'BaseApp\TicketsController@ticketAdminAcceptConfirm');
Route::middleware('auth:sanctum')->post('/ticket/{id}/new-message-admin', 'BaseApp\TicketsController@newMessageAdmin');
Route::middleware('auth:sanctum')->post('/ticket/{id}/admin/set-new-department', 'BaseApp\TicketsController@setNewDepartment');
Route::middleware('auth:sanctum')->get('departmentUsers/{id}', 'BaseApp\TicketsController@departmentUsers');

//Controller Groups
Route::middleware('auth:sanctum')->get('/usersGroups', 'BaseApp\UsersGroupsController@list');
Route::middleware('auth:sanctum')->get('/usersGroupId/{id}/id', 'BaseApp\UsersGroupsController@usersGroupId');
Route::middleware('auth:sanctum')->get('/usersGroups/all', 'BaseApp\UsersGroupsController@listAll');
Route::middleware('auth:sanctum')->get('/usersGroupsWithName/{group}', 'BaseApp\UsersGroupsController@usersGroupsWithName');
Route::middleware('auth:sanctum')->post('/usersGroups/{id}/edit', 'BaseApp\UsersGroupsController@edit');
Route::middleware('auth:sanctum')->post('/usersGroups/{id}/delete', 'BaseApp\UsersGroupsController@delete');
Route::middleware('auth:sanctum')->post('/usersGroups/{id}/restore', 'BaseApp\UsersGroupsController@restore');
Route::middleware('auth:sanctum')->post('/usersGroups/create', 'BaseApp\UsersGroupsController@create');
Route::middleware('auth:sanctum')->post('/editUsersOnGroups', 'BaseApp\UsersGroupsController@editUsersOnGroups');

//Controller ACL
Route::middleware('auth:sanctum')->get('/ACL/roles', 'BaseApp\ACLController@roles');
Route::middleware('auth:sanctum')->get('/ACL/adminRoles', 'BaseApp\ACLController@adminRoles');
Route::middleware('auth:sanctum')->post('/ACL/editAdminRoles', 'BaseApp\ACLController@editAdminRoles');
Route::middleware('auth:sanctum')->get('/ACL/permissions', 'BaseApp\ACLController@permissions');
Route::middleware('auth:sanctum')->get('/ACL/adminPermissions', 'BaseApp\ACLController@adminPermissions');
Route::middleware('auth:sanctum')->post('/ACL/editAdminPermissionsOnRole', 'BaseApp\ACLController@editAdminPermissionsOnRole');
Route::middleware('auth:sanctum')->post('/ACL/permissions/new', 'BaseApp\ACLController@newPermission');
Route::middleware('auth:sanctum')->post('/ACL/roles/new', 'BaseApp\ACLController@newRole');
Route::middleware('auth:sanctum')->get('/ACL/permissionsRoles', 'BaseApp\ACLController@permissionsRoles');
Route::middleware('auth:sanctum')->get('/ACL/rolePermissions/{id}', 'BaseApp\ACLController@rolePermissions');
Route::middleware('auth:sanctum')->post('/ACL/saveACL/{id}', 'BaseApp\ACLController@saveACL');
Route::middleware('auth:sanctum')->post('/ACL/saveRoleUser/{id}', 'BaseApp\ACLController@saveRoleUser');
Route::middleware('auth:sanctum')->get('/ACL/loadRoleUser/{id}', 'BaseApp\ACLController@loadRoleUser');

//Controller ProfileRequest
Route::middleware('auth:sanctum')->get('/profile', 'BaseApp\ProfileController@myProfile');
Route::middleware('auth:sanctum')->post('/profile/new', 'BaseApp\ProfileController@create');
Route::middleware('auth:sanctum')->post('/profile/{id}/editMyProfile', 'BaseApp\ProfileController@editMyProfile');
Route::middleware('auth:sanctum')->put('/profile/{id}/editProfile', 'BaseApp\ProfileController@editProfile');
Route::middleware('auth:sanctum')->get('/profile/{user_id}/get', 'BaseApp\ProfileController@getProfile');

//Controller Abilities
Route::middleware('auth:sanctum')->get('/profile/abilities', 'BaseApp\AbilityController@myAbilities');
