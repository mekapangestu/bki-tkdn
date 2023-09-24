<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class Boq extends Model
{
    use LogsActivity;
    use HasFactory;

    protected $guarded = ['id'];

    protected static $logName = 'Equipment';
    protected static $logUnguarded = true;

    public function type()
    {
        return $this->belongsTo(Type::class, 'project_type', 'id');
    }

    public function equipments()
    {
        return $this->belongsTo(CoiTemplate::class, 'equipment', 'equipment');
    }
    
    public function po()
    {
        return $this->belongsTo(PurchaseOrder::class, 'po_id', 'id');
    }
    
    public function do()
    {
        return $this->hasOne(MapBoqDos::class);
    }

    public function sos()
    {
        return $this->hasOne(MapBoqSos::class);
    }

    public function je()
    {
        return $this->hasOne(MapBoqJe::class);
    }

    public function coi()
    {
        return $this->hasOne(MapBoqCoi::class);
    }

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('label', 'LIKE', 'boq-document')->orderByDesc('updated_at');
    }
}