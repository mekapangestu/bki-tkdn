<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coi extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $dates = [
        'expire_date',
        'coi_date',
        'detail_report',
        'created_at',
        'updated_at'
    ];

    public function activity()
    {
        return $this->hasMany(CoiActivity::class)->orderByDesc('created_at');
    }

    public function coi()
    {
        return $this->hasOne(MapBoqCoi::class);
    }

    public function boq()
    {
        return $this->belongsToMany(Boq::class, 'map_boq_coi', 'coi_id', 'boq_id');
    }
}
