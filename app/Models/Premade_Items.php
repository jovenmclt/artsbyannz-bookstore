<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Premade_Items extends Model
{
    protected $table = 'premade_items';
    protected $fillable =[
        'file_image',
        'title',
        'original_price',
        'discount_price',
        'type',
        'item_class',
        'description',
        'status'
    ];
}
