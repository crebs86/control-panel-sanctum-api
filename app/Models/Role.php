<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Role extends Model
{
    use SoftDeletes;

    protected $fillable = ['name', 'label'];

    public function permissions()
    {
        return $this->belongsToMany(Permission::class)->select('permissions.id', 'label', 'name');
    }
}