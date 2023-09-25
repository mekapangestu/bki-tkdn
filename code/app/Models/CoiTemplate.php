<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class CoiTemplate extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $guarded = ['id'];

    protected static $logName = 'COI Template';
    protected static $logUnguarded = true;

    // public function mapComponent()
    // {
    //     return $this->hasMany(MapCoiTemplate::class);
    // }
}
