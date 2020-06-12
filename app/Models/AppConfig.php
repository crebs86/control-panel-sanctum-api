<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class AppConfig extends Model
{
    public $timestamps = false;
    protected $fillable = ['config', 'content'];
}
