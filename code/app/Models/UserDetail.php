<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class UserDetail extends Model
{
    use HasFactory, LogsActivity;

    protected $guarded = ['id'];

    protected static $logName = 'User';
    protected static $logUnguarded = true;

    protected $table = 'user_details';
}
