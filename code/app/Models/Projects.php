<?php

namespace App\Models;

use Status;
use App\Traits\Uuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Projects extends Model
{
    use HasFactory, Uuid;

    protected $guarded = ['id'];

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('tag', 'project');
    }

    public function foto()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('tag', 'foto');
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
        return $this->hasOne(Kepala::class, 'project_id', 'id');
    }

    public function tkdn()
    {
        return $this->hasMany(Tkdn::class, 'project_id', 'id');
    }

    public function logs()
    {
        return $this->hasMany(DocumentReceipt::class, 'project_id', 'id');
    }

    public function additional()
    {
        return $this->hasMany(ProjectAdditional::class, 'project_id', 'id');
    }

    public function projectMeta()
    {
        return $this->hasOne(ProjectMeta::class, 'project_id', 'id');
    }

    public function statuses()
    {
        return $this->belongsTo(Statuses::class, 'status_siinas', 'id');
    }

    public function stageStatus()
    {
        return $this->belongsTo(StageStatus::class, 'stage', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
