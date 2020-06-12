<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class TicketTypes extends Model
{
    /**
     * @param DateTimeInterface $date
     * @return string
     */
    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }
    public function tickets_groups(){
        return $this->hasMany(TicketsGroup::class, 'ticket_type_id')->select('id', 'group_id', 'ticket_type_id')->with('groups');
    }
}
