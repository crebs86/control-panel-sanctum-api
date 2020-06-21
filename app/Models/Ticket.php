<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id')->select('id', 'name');
    }

    public function assigned_user()
    {
        return $this->belongsTo(User::class, 'assigned', 'id')->select('id', 'name');
    }

    public function department()
    {
        return $this->belongsTo(TicketTypes::class, 'ticket_type_id', 'id')->select('id', 'desc');
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }
}
