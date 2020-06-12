<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    public $timestamps = false;
    protected $fillable = ['id', 'full_name', 'branch_line', 'avatar', 'sector', 'address'];
}
