<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class MapBoqJe extends Pivot
{
    protected $table = 'map_boq_je';

    public function je()
    {
        return $this->belongsTo(JobExecutor::class);
    }

    public function boq()
    {
        return $this->belongsTo(Boq::class);
    }
}
