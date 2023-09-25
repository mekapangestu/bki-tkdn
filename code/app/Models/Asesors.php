<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asesors extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function statusAsesor()
    {
        return $this->belongsTo(Statuses::class, 'asesor_status', 'id');
    }
}
