<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Heads extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function statusKepala()
    {
        return $this->belongsTo(Statuses::class, 'kepala_status', 'id');
    }

    public function project()
    {
        return $this->belongsTo(Projects::class, 'project_id', 'id');
    }
}
