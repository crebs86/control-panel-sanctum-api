<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class UsersGroup extends Model
{
    public $timestamps = false;
    protected $fillable = ['user_id', 'group_id'];
    public function users()
    {
        return $this->belongsToMany(User::class)->select('id', 'name');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id')->select('id', 'name');
    }

    public function user_id()
    {
        return $this->hasOne(User::class, 'id', 'user_id')->select('id');
    }

    public function groups()
    {
        return $this->belongsTo(Group::class, 'group_id', 'id')->select('id')->with('tickets_groups');
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

}
