<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class Spk extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $guarded = ['id'];

    protected static $logName = 'SPK';
    protected static $logUnguarded = true;
}
