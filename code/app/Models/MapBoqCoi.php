<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class MapBoqCoi extends Pivot
{
    protected $table = 'map_boq_coi';

    public $timestamps = false;

    public function coi()
    {
        return $this->belongsTo(Coi::class);
    }

    public function userApproval()
    {
        return $this->belongsTo(User::class, 'approval');
    }
}
