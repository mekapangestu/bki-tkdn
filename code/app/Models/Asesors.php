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
    
    public function project()
    {
        return $this->belongsTo(Projects::class, 'project_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'asesor', 'id');
    }
}
