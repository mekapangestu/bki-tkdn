<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $guarded = ['id'];

    protected static $logName = 'Purchase Order';
    protected static $logUnguarded = true;

    public function spk()
    {
        return $this->belongsTo(Spk::class, 'spk_no', 'spk_no');
    }

    public function boq()
    {
        return $this->hasMany(Boq::class, 'po_id', 'id');
    }

    public function files()
    {
        return $this->hasMany(Upload::class, 'request_id', 'id')->where('label', 'LIKE', 'po-document')->orderByDesc('updated_at');
    }
}
