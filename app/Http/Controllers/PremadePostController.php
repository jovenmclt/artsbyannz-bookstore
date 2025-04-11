<?php

namespace App\Http\Controllers;

use App\Models\PremadeLike;
use App\Models\PremadePost;
use Illuminate\Http\Request;
use App\Models\PremadeComment;
use App\Models\CommentReaction;
use Illuminate\Support\Facades\Auth;

class PremadePostController extends Controller
{
    public function newPost(Request $request){
        //dd($request);
        $validatePost = $request->validate([
            'Postimage.*'=>'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:204800',
            'Caption'=>'required|string|max:10000'
        ]);

        $filePaths = [];

        if ($request->hasFile('Postimage')) {
            foreach ($request->file('Postimage') as $file) {
                $filePaths[] = $file->store('images', 'public');
            }
        }

        PremadePost::create([
            'post_images'=>json_encode($filePaths),
            'caption'=>$validatePost['Caption']
        ]);

        return redirect()->route('viewAllpost');
    }

    public function editPost(Request $request, PremadePost $sotrePostId){
        //dd($request);
        $validatePost = $request->validate([
            'Postimage.*'=>'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:204800',
            'Caption'=>'required|string|max:10000'
        ]);

        $filePaths = [];

        if ($request->hasFile('Postimage')) {
            foreach ($request->file('Postimage') as $file) {
                $filePaths[] = $file->store('images', 'public');
            }
            json_encode($filePaths);
        }else{
            $filePaths = $sotrePostId->post_images;
        }

        $sotrePostId->update([
            'post_images'=> $filePaths,
            'caption'=>$validatePost['Caption']
        ]);

        return redirect()->route('viewAllpost');
    }


    public function newLike(Request $request){

        $validateReact = $request->validate([
            'postId'=>'required'
        ]);
        $get_authid = Auth::id();

        $alreadyLiked = PremadeLike::where('post_id', $validateReact['postId'])
                        ->where('user_id', $get_authid)
                        ->exists();

        if($alreadyLiked){
            PremadeLike::where('post_id', $validateReact['postId'])
                ->where('user_id', $get_authid)
                ->delete();
            return back();
        }else{
            PremadeLike::create([
                'post_id'=>$validateReact['postId'],
                'user_id'=>$get_authid
            ]);
            return back();
        }
    }

    public function newComment(Request $request){
        $validateComment = $request->validate([
            'newComment' => 'nullable|string',
            'postId'=>'required'
        ]);

        $auth_id = Auth::id();
        PremadeComment::create([
            'comment_post_id' => $validateComment['postId'],
            'comment_user_id' => $auth_id,
            'comment_text' => $validateComment['newComment']
        ]);

        return back();
    }

    public function replyComment(Request $request){
        $validatereplyComment = $request->validate([
            'comment_post_id'=>'required',
            'comment_text' => 'nullable|string',
            'parent_id' => 'nullable|integer'
        ]);

        $auth_id = Auth::id();

        PremadeComment::create([
            'comment_post_id' => $validatereplyComment['comment_post_id'],
            'comment_user_id' => $auth_id,
            'comment_text' => $validatereplyComment['comment_text'],
            'parent_id' => $validatereplyComment['parent_id']
        ]);

        return back();
    }

    public function newReactComment(Request $request){
        //dd($request);
        $validateReactComment = $request->validate([
            'reaction_comment_id' => 'required'
        ]);

        $auth_id = Auth::id();

        $checkReactComment = CommentReaction::where('reaction_comment_id', $validateReactComment['reaction_comment_id'])
                            ->where('reaction_user_id', $auth_id)
                            ->exists();

        if($checkReactComment){
            CommentReaction::where('reaction_comment_id', $validateReactComment['reaction_comment_id'])
                            ->where('reaction_user_id', $auth_id)
                            ->delete();
            return back();
        }else{
            CommentReaction::create([
                'reaction_comment_id' => $validateReactComment['reaction_comment_id'],
                'reaction_user_id' => $auth_id
            ]);
            return back();
        }
    }

    public function delComment(PremadeComment $commentID) {
        $commentId = $commentID->id;
        $childComments = PremadeComment::where('parent_id', $commentId)->get();
        foreach ($childComments as $child) {
            CommentReaction::where('reaction_comment_id', $child->id)->delete();
            $child->delete();
        }
        CommentReaction::where('reaction_comment_id', $commentId)->delete();
        $commentID->delete();
        return back();
    }

    public function delPost(PremadePost $delpostId){
        $get_postId = $delpostId->id;
        $get_likes = PremadeLike::where('post_id', $get_postId)->delete();
        $get_comments = PremadeComment::where('comment_post_id', $get_postId)->get();
        if($get_comments){
            foreach($get_comments as $comments){
                CommentReaction::where('reaction_comment_id', $comments->id)->delete();
                $comments->delete();
            }
        }
        $delpostId->delete();
        return back();
    }
}
