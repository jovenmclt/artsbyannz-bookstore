<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class message_table extends Model
{
    //

    protected $table = 'message_table';
    protected $fillable = [
        'conversation_id',
        'sender_id',
        'message',
    ];
}
