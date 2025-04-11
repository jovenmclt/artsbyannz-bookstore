<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PremadePost extends Model
{
    //
    protected $table = 'premade_posts';
    protected $fillable = [
        'post_images',
        'caption'
    ];

    public function premadelike(){
        return $this->hasMany(PremadeLike::class, 'post_id');
    }

    public function premadecomment(){
        return $this->hasMany(PremadeComment::class, 'comment_post_id');
    }


}
