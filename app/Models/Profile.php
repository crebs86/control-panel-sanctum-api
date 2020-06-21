<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    public $timestamps = false;
    protected $fillable = ['id', 'full_name', 'branch_line', 'avatar', 'sector', 'address'];
    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }
}
