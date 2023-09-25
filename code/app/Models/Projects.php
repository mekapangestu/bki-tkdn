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

    public function orders()
    {
        return $this->hasOne(Orders::class, 'no_berkas', 'no_berkas')->orderByDesc('created_at');
    }

    public function data()
    {
        return $this->hasOne(Asesors::class, 'project_id', 'id');
    }

    public function tkdn()
    {
        return $this->hasOne(Tkdn::class, 'project_id', 'id');
    }

    public function statuses()
    {
        return $this->belongsTo(Statuses::class, 'status', 'id');
    }
}
