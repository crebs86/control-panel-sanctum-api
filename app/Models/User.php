<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Model
{
    use Notifiable, HasApiTokens;

    protected $fillable = ['password'];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

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
