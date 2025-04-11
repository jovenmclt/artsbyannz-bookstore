<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class donation_table extends Model
{
    //
    protected $table = 'donation_table';
    protected $fillable = [
        'email',
        'name',
        'message',
        'amount',
        'payment'
    ];
}
