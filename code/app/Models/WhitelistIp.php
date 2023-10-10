<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WhitelistIp extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function scopeFindWhitelist($query)
    {
        return $query->where('status', true)->pluck('ip')->all();
    }
}
