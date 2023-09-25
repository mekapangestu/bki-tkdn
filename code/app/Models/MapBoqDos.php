<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class MapBoqDos extends Pivot
{
    protected $table = 'map_boq_dos';

    public function do()
    {
        return $this->belongsTo(DeliveryOrder::class);
    }

    public function boq()
    {
        return $this->belongsTo(Boq::class);
    }
}
