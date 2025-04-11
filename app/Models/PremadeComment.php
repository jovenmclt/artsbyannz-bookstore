<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PremadeComment extends Model
{
    //
    protected $table = 'premade_comment';
    protected $fillable = [
        'comment_post_id',
        'comment_user_id',
        'comment_text',
        'parent_id'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'comment_user_id', 'id');
    }

    public function commentreaction(){
        return $this->hasMany(CommentReaction::class, 'reaction_comment_id');
    }
}
