<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Models\message_table;
use App\Models\conversation_table;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
{

    public function SendMessage_member(Request $request){

        $validateRequest = $request->validate([
            'memberMessage' => 'required'
        ]);

        $get_memberID = auth::id();
        $get_adminID = User::select('id')->where('is_admin', '1')->first();

        $check_Conversation = conversation_table::where('member_id', $get_memberID)->first();

        if(!$check_Conversation){
            $check_Conversation = conversation_table::create([
                'member_id' => $get_memberID,
                'admin_id' => $get_adminID->id
            ]);
        }
        message_table::create([
            'conversation_id' => $check_Conversation->id,
            'sender_id' => $get_memberID,
            'message' => $validateRequest['memberMessage'],
            'is_read' => '1'
        ]);

        return back();
    }

    public function admin_getmessage(User $userId){
        //dd($get_memberId);
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin','1')->first();
        $get_authId = auth::id();

        $get_membermessage =[];
        $get_memberId = $userId->id;

        $get_conversationId =  conversation_table::select('id')->where('member_id', $get_memberId)->first();
        if($get_conversationId){
            $get_membermessage= message_table::where('conversation_id',$get_conversationId->id)->orderBy('created_at', 'asc')->get();
        }

        if($userId){
            message_table::where('sender_id', $get_memberId)->update([
                'is_read' => false
            ]);
        }

        return Inertia::render('Index/AdminMessage', [
            "getAdminImage" => $getAdmin_images,
            "get_authId" => $get_authId,
            "memberInfo" => $userId,
            "get_membermessage" => $get_membermessage,
        ]);
    }

    public function sendmessage_admin(Request $request){

        $validateRequest = $request->validate([
            'memberMessage' => 'required',
        ]);

        $get_authId = auth::id();

        $check_Conversation = conversation_table::where('member_id', $request->memberId)->first();

        if(!$check_Conversation){
            $check_Conversation = conversation_table::create([
                'member_id' => $request->memberId,
                'admin_id' => $get_authId
            ]);
        }

        message_table::create([
            'conversation_id' => $check_Conversation->id,
            'sender_id' => $get_authId,
            'message' => $validateRequest['memberMessage']
        ]);

        return back();
    }
}
