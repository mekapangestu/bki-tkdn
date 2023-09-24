<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class JobExecutor extends Model
{
    use HasFactory;
    use LogsActivity;
    
    protected $guarded = ['id'];
    
    protected $dates = [
        'inspection_date',
        'minutes_date',
        'expired_date',
        'bast_date',
        'plo_date',
        'coi_date',
        'created_at',
        'updated_at'
    ];

    protected static $logName = 'Job Progress';
    protected static $logUnguarded = true;
    
    public function boq()
    {
        return $this->belongsToMany(Boq::class, 'map_boq_je', 'je_id', 'boq_id');
    }

    public function status()
    {
        return $this->belongsTo(JobStatus::class, 'job_status', 'id');
    }

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('label', 'LIKE', 'job-doc%')->orderByDesc('updated_at');
    }

    public function inspectors()
    {
        return $this->hasOne(User::class, 'id', 'inspector');
    }

    public function coiTemplate()
    {
        return $this->hasOne(CoiTemplate::class, 'id', 'template');
    }
}
