<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class transaction extends Model
{
    //
    protected $table = 'transaction_table';
    protected $fillable = [
        'premade_id',
        'payment_id',
        'itemFile',
        'itemTitle',
        'quantity',
        'amount',
        'clientName',
        'clientEmail',
        'country',
        'postalCode',
        'paymentStats',
        'paymentMethod',
        'status',
        'shipmentDate',
        'completedDate',
        'item_type'
    ];
}
