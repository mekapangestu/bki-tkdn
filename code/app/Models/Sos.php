<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class Sos extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $guarded = ['id'];

    protected $table = 'sos';

    protected static $logName = 'Branch Assignment';
    protected static $logUnguarded = true;

    public function boq()
    {
        return $this->belongsToMany(Boq::class, MapBoqSos::class, 'sos_id', 'boq_id');
    }

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('label', 'LIKE', 'sos-document')->orderByDesc('updated_at');
    }
}
