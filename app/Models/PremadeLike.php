<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PremadeLike extends Model
{
    //
    protected $table = 'premade_like';
    protected $fillable =[
        'post_id',
        'user_id'
    ];
}
