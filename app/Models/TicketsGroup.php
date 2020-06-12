<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class TicketsGroup extends Model
{
    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function groups()
    {
        return $this->hasOne(Group::class, 'id', 'group_id')->select('id')->with('users_group');
    }

    public function department()
    {
        return $this->belongsTo(TicketTypes::class, 'ticket_type_id', 'id')->select('id', 'slug');
    }
    public function ticket_types(){
        return $this->hasOne(TicketTypes::class, 'id', 'ticket_type_id')->select('id');
    }
}
