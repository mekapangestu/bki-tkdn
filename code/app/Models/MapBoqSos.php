<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class MapBoqSos extends Pivot
{
    protected $table = 'map_boq_sos';

    public function sos()
    {
        return $this->belongsTo(Sos::class);
    }

    public function boq()
    {
        return $this->belongsTo(Boq::class);
    }
}
