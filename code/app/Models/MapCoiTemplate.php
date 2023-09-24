<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class MapCoiTemplate extends Pivot
{
    public $timestamps = false;

    public function component()
    {
        return $this->belongsTo(CoiComponent::class, 'coi_component_id', 'id');
    }
}
