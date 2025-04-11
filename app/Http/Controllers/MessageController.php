<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\message_table;
use App\Models\conversation_table;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
{

    public function SendMessage_member(Request $request){

        $validateRequest = $request->validate([
            'memberMessage' => 'required|string'
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
            'message' => $validateRequest['memberMessage']
        ]);

        return back();
    }
}
