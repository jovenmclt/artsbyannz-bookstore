<?php

namespace App\Http\Controllers;

use DateTime;
use App\Models\User;
use Inertia\Inertia;
use App\Models\PremadeLike;
use App\Models\PremadePost;
use App\Models\transaction;
use Illuminate\Http\Request;
use App\Models\Premade_Items;
use App\Models\PremadeComment;
use Illuminate\Support\Facades\Auth;
use App\Models\donation_table;
use App\Models\conversation_table;
use App\Models\message_table;

class adminFrontendController extends Controller
{

    public function dashboard(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        $get_users = User::where('is_admin', null)->whereYear('created_at', date('Y'))->get();
        $get_sales = transaction::select('completedDate')->whereYear('completedDate', date('Y'))->get();
        $get_income = transaction::select('amount', 'completedDate')->whereYear('completedDate', date('Y'))->get();
        $get_type = transaction::select('item_type')->whereYear('completedDate', date('Y'))->get();
        $get_recentPurchase = transaction::orderBy('created_at', 'desc')->take(12)->get();
        $get_allDonation = donation_table::all();
       // dd($get_recentPurchase);
        return Inertia::render('Index/AdminDashboard', [
            "getAdminImage" => $getAdmin_images,
            "allUsers" => $get_users,
            "get_sale" => $get_sales,
            "get_income" => $get_income,
            "get_recentPurchase" => $get_recentPurchase,
            "get_itemType" => $get_type,
            "get_allDonation" => $get_allDonation
        ]);
    }

    public function bookshop(){
        $getpremade_items = Premade_Items::all();
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
       // dd($getpremade_items);
        return Inertia::render('Index/AdminBookshop', [
            "premade_items" => $getpremade_items,
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function chatbox(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();

        $get_usersinfo = User::where('is_admin', null)->get();

       // dd($get_readmessage);
        return Inertia::render('Index/AdminChatbox', [
            "getAdminImage" => $getAdmin_images,
            "get_usersinfo" => $get_usersinfo,
        ]);
    }

    public function membershipdash(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        $getall_premadepost = PremadePost::all();
        $all_user = User::select('id', 'fullname','file_profile', 'email', 'is_active')->get();
        return Inertia::render('Index/AdminMembershipdash', [
            "getAdminImage" => $getAdmin_images,
            "getall_post" => $getall_premadepost,
            "getall_user" =>  $all_user
        ]);
    }

    public function admindonation(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        $get_allDonation = donation_table::all();
        return Inertia::render('Index/AdminDonation', [
            "getAdminImage" => $getAdmin_images,
            "get_allDonation" => $get_allDonation
        ]);
    }

    public function membershipNewpost(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
       // dd($getpremade_items);
        return Inertia::render('Index/AdminNewpost', [
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function membershipEditpost(PremadePost $editpostId){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        return Inertia::render('Index/AdminEditpost', [
            "getAdminImage" => $getAdmin_images,
            "PremadePost" => $editpostId
        ]);
    }

    public function viewAllpost(){
        $getAuth_id = Auth::id();
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        $getuser_info = User::select('fullname', 'file_profile')->where('id',  $getAuth_id)->first();

        $getall_likes = PremadeLike::all();
        $getall_comments = PremadeComment::all();
        $getall_post = PremadePost::with('premadelike')->with('premadecomment.user')->with('premadecomment.commentreaction')->get();
        return Inertia::render('Index/AdminViewallPost', [
            "getAdminImage" => $getAdmin_images,
            "getall_premadepost" => $getall_post,
            "getall_likes" => $getall_likes,
            "getall_comments" => $getall_comments,
            "get_authID" => $getAuth_id,
            "getuser_info" =>  $getuser_info,
        ]);
    }

    public function additem(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        return Inertia::render('Index/AdminAdditem',[
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function PremadeCovers(){
        $getallPremadeCovers = Premade_Items::where('type', 'Book Cover')->get();
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        return Inertia::render('Index/AdminViewallBookCover',[
            "allPremadeBookcover" => $getallPremadeCovers,
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function PremadeWallpaper(){
        $getallPremadeWallPaper = Premade_Items::where('type', 'WallPaper')->get();
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        return Inertia::render('Index/AdminViewallWallPaper', [
            "allPremadeWallpaper" => $getallPremadeWallPaper,
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function privacySettings(){
        $getAdminacc = User::select('id', 'username', 'password')->first();
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        //dd($getAdminacc);
        return Inertia::render('Index/AdminPrivacySettings', [
            "adminAccount" => $getAdminacc,
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function orderManagement(){

        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();

        $get_pendingCutomer = transaction::selectRaw('MIN(id) as id, clientEmail, ANY_VALUE(clientName) as clientName, ANY_VALUE(status) as status, ANY_VALUE(paymentStats) as paymentStats, MIN(created_at) as created_at')
                                ->where('status', 'Pending')
                                ->groupBy('clientEmail')
                                ->get();
        $get_pendingItem = transaction::where('status', 'Pending')
                                ->get();

        $get_shipmentCutomer = transaction::selectRaw('MIN(id) as id, clientEmail, ANY_VALUE(clientName) as clientName, ANY_VALUE(status) as status, ANY_VALUE(paymentStats) as paymentStats, MIN(shipmentDate) as shipmentDate')
                                ->where('status', 'Shipped')
                                ->groupBy('clientEmail')
                                ->get();
        $get_shipmentItem = transaction::where('status', 'Shipped')
                                ->get();

        $get_completedCutomer = transaction::selectRaw('MIN(id) as id, clientEmail, ANY_VALUE(clientName) as clientName, ANY_VALUE(status) as status, ANY_VALUE(paymentStats) as paymentStats, MIN(completedDate) as completedDate')
                                ->where('status', 'Completed')
                                ->groupBy('clientEmail')
                                ->get();
        $get_completedItem = transaction::where('status', 'Completed')
                                ->get();
       // dd($get_CustomerDistinct);
        return Inertia::render('Index/AdminOrders', [
            "getAdminImage" => $getAdmin_images,
            "get_pendingCustomer" => $get_pendingCutomer,
            "get_pendingItem" => $get_pendingItem,
            "get_shipmentCutomer" => $get_shipmentCutomer,
            "get_shipmentItem" =>  $get_shipmentItem,
            "get_completedCutomer" => $get_completedCutomer,
            "get_completedItem" => $get_completedItem
        ]);
    }

    public function customerPage(){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();
        //dd($getAdminacc);
        $get_recentCutomer = transaction::selectRaw('MIN(id) as id, clientEmail, ANY_VALUE(clientName) as clientName, ANY_VALUE(postalCode) as postalCode, ANY_VALUE(country) as country, MIN(completedDate) as completedDate')
                                ->where('status', 'Completed')
                                ->groupBy('clientEmail')
                                ->get();
        return Inertia::render('Index/AdminCustomer', [
            "getAdminImage" => $getAdmin_images,
            "get_recentCutomer" => $get_recentCutomer
        ]);
    }

    public function customerDetail(transaction $customerId){
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin', '1')->first();

        $getEmail = $customerId->clientEmail;
        $get_cutomerDetail = transaction::selectRaw('MIN(id) as id, clientEmail, ANY_VALUE(clientName) as clientName, ANY_VALUE(postalCode) as postalCode, ANY_VALUE(country) as country, MIN(clientEmail) as clientEmail, MIN(paymentMethod) as paymentMethod')
                            ->where('status', 'Completed')
                            ->where('clientEmail', $getEmail)
                            ->groupBy('clientEmail')
                            ->first();
        $get_CustomerCart = transaction::where('clientEmail', $getEmail)
                        ->get();
        $get_customerPending = transaction::where('clientEmail', $getEmail)
                               ->where('status', 'Pending')
                               ->get();
        $get_customerShipped = transaction::where('clientEmail', $getEmail)
                               ->where('status', 'Shipped')
                               ->get();
        $get_customerCompleted = transaction::where('clientEmail', $getEmail)
                               ->where('status', 'Completed')
                               ->get();
       // dd($get_Customer);
        return Inertia::render('Index/CustomerDetails', [
            "getAdminImage" => $getAdmin_images,
            "get_cutomerDetail" => $get_cutomerDetail,
            "get_customerPending" => $get_customerPending,
            "get_customerShipped" => $get_customerShipped,
            "get_customerCompleted" => $get_customerCompleted,
            "get_CustomerCart" => $get_CustomerCart
        ]);
    }
}
