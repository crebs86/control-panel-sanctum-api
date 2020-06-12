<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Model
{
    use Notifiable, HasApiTokens;

    public function profile()
    {
        return $this->hasOne(Profile::class);
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class)->select('roles.id', 'name', 'label')->with('permissions');
    }
    public function users_groups()
    {
        return $this->hasMany(UsersGroup::class)->select('user_id', 'group_id')->with('groups');
    }
}
