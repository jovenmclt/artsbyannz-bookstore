<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ItemController;
use App\Http\Middleware\AdminMiddleware;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\FrontEndController;
use App\Http\Controllers\PremadePostController;
use App\Http\Controllers\PremadeItemsController;
use App\Http\Controllers\adminFrontendController;
use App\Http\Controllers\AuthenticationController;


//Main index
Route::get('/', [FrontEndController::class, 'index'])->name('homepage');
Route::get('/allproducts', [FrontEndController::class, 'AllProducts']);
Route::get('/premadecovers', [FrontEndController::class, 'PremadeCovers']);
Route::get('/premadewallpapers', [FrontEndController::class, 'PremadeWallPaper']);
Route::get('/membership', [FrontEndController::class, 'Membership'])->name('members');;
Route::get('/affordablepremade', [FrontEndController::class, 'AffordablePremade']);
Route::get('/uniquepremade', [FrontEndController::class, 'UniquePremade']);
Route::get('/romancepremade', [FrontEndController::class, 'RomancePremade']);
Route::get('/membershipdashboard', [FrontEndController::class, 'MembershipDashboard'])->name('membershipdashboard');
Route::get('/memberprofile', [FrontEndController::class, 'MemberProfile']);
Route::get('/memberBilling', [FrontEndController::class, 'MemberBilling']);
Route::get('/memberMessage', [FrontEndController::class, 'MemberMessage'])->name('MemberMessage');
Route::get('/cart', [FrontEndController::class, 'cart'])->name('cart');
Route::get('/donation', [FrontEndController::class, 'Donation'])->name('donation');

//Main actions
Route::get('/viewitem/{premadeId}', [FrontEndController::class, 'ViewItem']);
Route::post('/updatememberprofile/{memberiD}', [AuthenticationController::class, 'updateMemberProfile']);
//premade posting
Route::post('/storeLikes', [PremadePostController::class, 'newLike']);
Route::post('/storeComment', [PremadePostController::class, 'newComment']);
Route::post('/storeReply', [PremadePostController::class, 'replyComment']);
Route::post('/storeReactcomment', [PremadePostController::class, 'newReactComment']);
Route::get('/delcomment/{commentID}', [PremadePostController::class, 'delComment']);

//login
Route::post('/registerStore', [AuthenticationController::class, 'registerAcc']);
//membership
Route::get('/loginmember', [AuthenticationController::class, 'MemberLogin'])->name('loginMember');
Route::post('/logouts', [AuthenticationController::class, 'logoutMember']);

Route::post('/forgot-password', [AuthenticationController::class, 'sendEmail'])->name('password.email');
Route::get('/reset-password/{token}', [AuthenticationController::class, 'passwordReset'])->name('password.reset');
Route::post('/reset-password', [AuthenticationController::class, 'resetPassword'])->name('password.update');
//admin
Route::get('/login', [AuthenticationController::class, 'admin'])->name('login');
Route::post('/loginStore', [AuthenticationController::class, 'login']);

//cart and checkout
Route::post('/storeCart', [ItemController::class, 'cartItem']);
Route::get('/delCart/{id}', [ItemController::class, 'removeCartItem']);
Route::post('/storeQupdate/{itemId}', [ItemController::class, 'updateQuantity']);
Route::get('/checkout/{itemId}', [ItemController::class, 'checkout_item']);

//Paypal payment
Route::post('/storePaypal', [ItemController::class, 'payment_paypal']);
Route::get('success', [ItemController::class, 'success_paypal'])->name('success');
Route::get('/OfficialReceipt', [FrontEndController::class, 'OfficialReceipt'])->name('receipt');

//paypal donation
Route::post('/storePaypal_donation', [ItemController::class, 'paymentPaypal_donation']);
Route::get('success_paypaldonation', [ItemController::class, 'success_paypalDonation'])->name('success_paypaldonation');

//Stripe payment
Route::post('/storeStripe', [ItemController::class, 'payment_stripe']);
Route::get('successStripe', [ItemController::class, 'success_stripe'])->name('successStripe');

//stripe donation
Route::post('/storeStripe_donation', [ItemController::class, 'payment_stripeDonation']);
Route::get('success_stripedonation', [ItemController::class, 'success_stripeDonation'])->name('success_stripedonation');

//message
Route::post('/sendmessage', [MessageController::class, 'SendMessage_member']);

Route::group(['middleware' => ['auth', AdminMiddleware::class]], function(){
    Route::get('/admin/dashboard', [adminFrontendController::class, 'dashboard'])->name('dashboard');
    Route::get('/admin/bookshop', [adminFrontendController::class, 'bookshop'])->name('bookshop');
    Route::get('/admin/membership', [adminFrontendController::class, 'membershipdash'])->name('membershipdash');
    Route::get('/admin/customers', [adminFrontendController::class, 'customerPage'])->name('customerPage');
    Route::get('/admin/orders', [adminFrontendController::class, 'orderManagement'])->name('orderManagement');
    Route::get('/admin/donation', [adminFrontendController::class, 'admindonation'])->name('admindonation');
    Route::get('/customerdetails/{customerId}', [adminFrontendController::class, 'customerDetail'])->name('customerDetail');

    //premade post
    Route::get('/admin/membership/newpost', [adminFrontendController::class, 'membershipNewpost'])->name('membershipNewpost');
    Route::get('/admin/membership/allpost', [adminFrontendController::class, 'viewAllpost'])->name('viewAllpost');
    Route::get('/editpost/{editpostId}', [adminFrontendController::class, 'membershipEditpost']);
    Route::post('/storePost', [PremadePostController::class, 'newPost']);
    Route::post('/delpost/{delpostId}', [PremadePostController::class, 'delPost']);
    Route::post('/storeEdit/{sotrePostId}', [PremadePostController::class, 'editPost']);

    //premade item
    Route::get('/admin/additem', [adminFrontendController::class, 'additem'])->name('additem');
    Route::get('/admin/PremadeCovers', [adminFrontendController::class, 'PremadeCovers'])->name('PremadeCovers');
    Route::get('/admin/PremadeWallpaper', [adminFrontendController::class, 'PremadeWallpaper'])->name('PremadeWallpaper');
    Route::get('/admin/privacySettings', [adminFrontendController::class, 'privacySettings'])->name('privacySettings');

    Route::post('/storeItem', [ItemController::class, 'addItem']);
    Route::get('/viewItem/{viewItemId}', [ItemController::class, 'ViewItem']);
    Route::get('/EditItem/{EditItemId}', [ItemController::class, 'editItem']);
    Route::post('/updateItem/{updateItemId}', [ItemController::class, 'updateItem']);
    Route::post('/deleteItem/{deleteItemId}', [ItemController::class, 'deleteItem']);

    //order management
    Route::post('/shipment/{customerId}', [ItemController::class, 'pendingToShipped']);
    Route::post('/complete/{customerId}', [ItemController::class, 'shippedToComplete']);

    Route::post('/updateCredentials/{adminId}', [AuthenticationController::class, 'updateAdmin']);
    Route::post('/updateProfile/{adminId}', [AuthenticationController::class, 'updateProfile']);
    Route::post('/logout', [AuthenticationController::class, 'logout']);
    Route::get('/logoutUser/{user}', [AuthenticationController::class, 'logoutUser']);
});
