<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Projects extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id');
    }
}
