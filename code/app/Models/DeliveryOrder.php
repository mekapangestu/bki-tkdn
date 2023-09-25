<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class DeliveryOrder extends Model
{
    use HasFactory;
    use LogsActivity;
    // use \Staudenmeir\EloquentHasManyDeep\HasRelationships;
    // use \Znck\Eloquent\Traits\BelongsToThrough;

    protected $guarded = ['id'];

    protected static $logName = 'Delivery Order';
    protected static $logUnguarded = true;

    public function boq()
    {
        return $this->belongsToMany(Boq::class, 'map_boq_dos', 'do_id', 'boq_id');
    }

    // public function sos()
    // {
    //     return $this->hasManyDeep(
    //         Sos::class,
    //         [MapBoqDos::class, Boq::class, MapBoqSos::class],
    //         ['do_id','id','boq_id','id'],
    //         ['id','boq_id','id','sos_id']
    //     );
    // }

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('label', 'LIKE', 'do-document')->orderByDesc('updated_at');
    }
}
