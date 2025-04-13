<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use App\Models\PremadeLike;
use App\Models\PremadePost;
use App\Models\transaction;
use Illuminate\Http\Request;
use App\Models\Premade_Items;
use App\Models\PremadeComment;
use App\Models\conversation_table;
use App\Models\message_table;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class FrontEndController extends Controller
{
    public function index(){
        $get1_RomancePremade = Premade_Items::where('item_class', 'ROMANCE PREMADE COVERS')
                                ->take(1)
                                ->get();
        $get1_AffordablePremade = Premade_Items::where('type', 'Book Cover' )->where('status', '1')->whereRaw('CAST(discount_price AS UNSIGNED) < ?', [200])
                                 ->take(6)
                                 ->get();
        $get_latestItem =  Premade_Items::where('type', 'Book Cover')->where('status', '1')->orderBy('created_at', 'desc')
                                ->take(6)
                                ->get();
        $get_PremadeBookCover = Premade_Items::where('item_class', 'UNIQUE BOOK COVERS')->where('status', '1')
                                ->take(6)
                                ->get();
        $get_PremadeWallpaper = Premade_Items::where('type', 'WallPaper')->where('status', '1')
                                ->take(3)
                                ->get();
        $get_lastItem =  Premade_Items::where('type', 'Book Cover')->orderBy('created_at', 'asc')->where('status', '1')
                                ->take(6)
                                ->get();
       // $getID = Auth::id();
       $getcart = session('premadeItem', []);
        return Inertia::render('Index/Index',[
            "get1_romancePremade" => $get1_RomancePremade,
            "get1_affordablepremade" =>  $get1_AffordablePremade,
            "get_latestitem" => $get_latestItem,
            "get1_premadebookCover" => $get_PremadeBookCover,
            "get_PremadeWallpaper" => $get_PremadeWallpaper,
            "get_lastItem" => $get_lastItem,
            "userCart" => $getcart,
        ]);
    }

    public function AllProducts(){
        $getallItems = Premade_Items::all()->where('status', '1');
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/AllProducts', [
            "get_allPremade" =>  $getallItems,
            "userCart" => $getcart,
        ]);
    }

    public function PremadeCovers(){
        $get_premadeCovers = Premade_Items::where('type', 'Book Cover')->where('status', '1')
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/PremadeCovers', [
            "get_premadeCovers" =>  $get_premadeCovers,
            "userCart" => $getcart,
        ]);
    }

    public function PremadeWallPaper(){
        $get_premadeWallPaper = Premade_Items::where('type', 'WallPaper')->where('status', '1')
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/PremadeWallPapers', [
            "get_premadeWallPaper" =>  $get_premadeWallPaper,
            "userCart" => $getcart,
        ]);
    }

    public function Membership(){
        $get_authid = Auth::id();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/Membership', [
            "userId" => $get_authid,
            "userCart" => $getcart,
        ]);
    }

    public function AffordablePremade() {
        $get_affordable = Premade_Items::where('type', 'Book Cover' )->where('status', '1')->whereRaw('CAST(discount_price AS UNSIGNED) < ?', [200])
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/AffordablePremade', [
            "get_affordableItem" => $get_affordable,
            "userCart" => $getcart,
        ]);
    }

    public function UniquePremade() {
        $get_unique = Premade_Items::where('item_class', 'UNIQUE BOOK COVERS' )->where('status', '1')
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/UniquePremade', [
            "get_uniqueItem" => $get_unique,
            "userCart" => $getcart,
        ]);
    }

    public function RomancePremade() {
        $get_romance = Premade_Items::where('item_class', 'ROMANCE PREMADE COVERS' )->where('status', '1')
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/RomancePremade', [
            "get_romanceItem" => $get_romance,
            "userCart" => $getcart,
        ]);
    }

    public function ViewItem(Premade_Items $premadeId){
        $get_latestItem = Premade_Items::where('type', 'Book Cover')->where('status', '1')->orderBy('created_at', 'desc')
                            ->take(5)
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/ViewItem', [
            "get_viewItem" =>  $premadeId,
            "get_latestItem" => $get_latestItem,
            "userCart" => $getcart,
        ]);
    }

    public function MembershipDashboard(){
        $get_authid = Auth::id();
        $get_userInfo = User::select('email', 'fullname', 'username', 'file_profile')->where('id', $get_authid)->first();
        $getall_likes = PremadeLike::all();
        $getall_comments = PremadeComment::all();
        $getcart = session('premadeItem', []);
        $getall_post = PremadePost::with('premadelike')->with('premadecomment.user')->with('premadecomment.commentreaction')->get();
        return Inertia::render('Index/MembershipDashboard', [
           "userId" => $get_authid,
           "userInfo" =>  $get_userInfo,
           "getall_premadepost" => $getall_post,
           "getall_likes" => $getall_likes,
           "getall_comments" => $getall_comments,
           "userCart" => $getcart,
        ]);
    }

    public function MemberProfile(){
        $get_authid = Auth::id();
        $get_userInfo = User::select('email', 'fullname', 'username', 'file_profile')->where('id', $get_authid)->first();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/MemberProfile', [
           "userId" => $get_authid,
           "userInfo" =>  $get_userInfo,
           "userCart" => $getcart
        ]);
    }

    public function MemberBilling(){
        $get_authid = Auth::id();
        $get_userInfo = User::select('email', 'fullname', 'username', 'file_profile')->where('id', $get_authid)->first();
        $getcart = session('premadeItem', []);

        $get_authEmail = User::select('email')->where('id', $get_authid)->first();
        $get_transaction = transaction::where('clientEmail', $get_authEmail->email)->get();

        return Inertia::render('Index/MemberBilling', [
           "userId" => $get_authid,
           "userInfo" =>  $get_userInfo,
           "userCart" => $getcart,
           "transaction" => $get_transaction
        ]);
    }

    public function MemberMessage(){
        $get_authid = Auth::id();
        $get_userInfo = User::select('email', 'fullname', 'username', 'file_profile')->where('id', $get_authid)->first();
        $get_adminProfile = User::select('file_profile')->where('is_admin', '1')->first();
        $getcart = session('premadeItem', []);

        $get_conversationId = conversation_table::where('member_id', $get_authid)
                            ->first();

        $get_convomessage = [];

        if ($get_conversationId) {
            $get_convomessage = message_table::where('conversation_id', $get_conversationId->id)
                                ->orderBy('created_at', 'asc')
                                ->get();
        }
        return Inertia::render('Index/MemberMessage', [
           "userId" => $get_authid,
           "userInfo" =>  $get_userInfo,
           "adminProfile" => $get_adminProfile,
           "userCart" => $getcart,
           "messageConvo" => $get_convomessage
        ]);
    }

    public function cart(){
         $get_latestItem = Premade_Items::where('type', 'Book Cover')->where('status', '1')->orderBy('created_at', 'desc')
                            ->take(5)
                            ->get();
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/Cart', [
            "userCart" => $getcart,
            "get_latestItem" => $get_latestItem
        ]);
    }

    public function OfficialReceipt(){
        $get_latestCheckout = transaction::select('itemFile', 'itemTitle', 'quantity', 'amount', 'clientName', 'payment_id', 'paymentMethod', 'country', 'postalCode', 'created_at')->orderBy('created_at', 'desc')
                            ->first();
        return Inertia::render('Index/Receipt', [
            "latestCheckout" =>  $get_latestCheckout
        ]);
    }

    public function Donation(Request $request){
        //dd($request->name);
        return Inertia::render('Index/Donation', [
            "name" => $request->name,
            "message" => $request->message
        ]);
    }
}
