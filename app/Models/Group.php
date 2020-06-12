<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Group extends Model
{
    use SoftDeletes;
    //
    public $timestamps = false;
    protected $fillable = ['slug', 'desc'];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function users_group(){
        return $this->hasMany(UsersGroup::class)->select('id', 'group_id', 'user_id');
    }

    public function users_id(){
        return $this->hasMany(UsersGroup::class)->select('id', 'group_id', 'user_id')->with('user_id');
    }

    public function users_group_with_name(){
        return $this->hasMany(UsersGroup::class)->select('id', 'group_id', 'user_id')->with('user');
    }

    public function tickets_groups(){
        return $this->belongsTo(TicketsGroup::class, 'id', 'group_id')->select('id', 'group_id', 'ticket_type_id')->with('ticket_types');
    }
}
