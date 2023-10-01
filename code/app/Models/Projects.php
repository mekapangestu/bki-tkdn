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
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('tag', 'project');
    }

    public function internal_files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('tag', 'internal');
    }

    public function template_files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('tag', 'template');
    }

    public function orders()
    {
        return $this->hasOne(Orders::class, 'no_berkas', 'no_berkas')->orderByDesc('created_at');
    }

    public function data()
    {
        return $this->hasOne(Asesors::class, 'project_id', 'id');
    }

    public function asesors()
    {
        return $this->hasMany(Asesors::class, 'project_id', 'id');
    }

    public function qc()
    {
        return $this->hasOne(Qcs::class, 'project_id', 'id');
    }

    public function kepala()
    {
        return $this->hasOne(Heads::class, 'project_id', 'id');
    }

    public function tkdn()
    {
        return $this->hasOne(Tkdn::class, 'project_id', 'id');
    }

    public function logs()
    {
        return $this->hasMany(DocumentReceipt::class, 'project_id', 'id');
    }

    public function statuses()
    {
        return $this->belongsTo(Statuses::class, 'status', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
