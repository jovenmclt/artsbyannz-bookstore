<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommentReaction extends Model
{
    //
    protected $table = 'comment_reaction';
    protected $fillable = [
        'reaction_comment_id',
        'reaction_user_id'
    ];
}
