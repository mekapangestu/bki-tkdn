<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Status;

class Projects extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id');
    }

    public function data()
    {
        return $this->hasOne(Asesors::class, 'project_id', 'id');
    }

    public function statuses()
    {
        return $this->belongsTo(Statuses::class, 'status', 'id');
    }
}
