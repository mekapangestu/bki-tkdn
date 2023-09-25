<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class CoiActivity extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $guarded = ['id'];

    protected static $logName = 'COI';
    protected static $logUnguarded = true;

    protected $dates = [
        'created_at',
        'updated_at'
    ];

    public function coi()
    {
        return $this->belongsTo(Coi::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
