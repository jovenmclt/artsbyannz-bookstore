<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class conversation_table extends Model
{
    //
    protected $table = 'conversation_table';
    protected $fillable = [
        'member_id',
        'admin_id',
    ];
}
