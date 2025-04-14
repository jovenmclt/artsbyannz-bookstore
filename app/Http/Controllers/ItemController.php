<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use App\Models\transaction;
use App\Models\donation_table;
use Illuminate\Http\Request;
use App\Models\Premade_Items;
use App\Http\Controllers\Controller;
use Srmklive\PayPal\Services\PayPal as PayPalClient;

class ItemController extends Controller
{
    //

     public function addItem(Request $request){
        //dd($request);
        $validatedData = $request->validate([
            'File_Image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'Title' => 'required|string|max:50',
            'Original_Price' => 'required|string|max:50',
            'Discount_Price' => 'nullable|string|max:50',
            'Type' => 'required|string|max:50',
            'Item_Class' => 'nullable|string|max:50',
            'Description' => 'required|string|max:5000',
            'Status' => 'required|boolean'
        ]);


        if ($request->hasFile('File_Image')) {
            $filePath = $request->file('File_Image')->store('images', 'public');
        }

        Premade_Items::create([
            'file_image' => $filePath,
            'title' => $validatedData['Title'],
            'original_price' => $validatedData['Original_Price'],
            'discount_price' => $validatedData['Discount_Price'],
            'type' => $validatedData['Type'],
            'item_class' => $validatedData['Item_Class'],
            'description' => $validatedData['Description'],
            'status' => $validatedData['Status']
        ]);

        return redirect()->route('bookshop');
    }

    public function ViewItem(Premade_Items $viewItemId){
        //dd($viewItem);
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin','1')->first();
        return Inertia::render('Index/AdminViewItem', [
            "premadeItems" => $viewItemId,
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function editItem(Premade_Items $EditItemId){
        //
        //dd($EditItemId);
        $getAdmin_images = User::select('file_logo', 'file_profile', 'username', 'email')->where('is_admin','1')->first();
        return Inertia::render('Index/AdminEdit', [
            "premadeItems" => $EditItemId,
            "getAdminImage" => $getAdmin_images
        ]);
    }

    public function updateItem(Request $request, Premade_Items $updateItemId){
        //
        //dd($request);
        try{
            $validateRequest = $request->validate([
                'update_File_Image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'update_Titles' => 'required|string|max:50',
                'update_Original_Price' => 'required|string|max:50',
                'update_Discount_Price' => 'nullable|string|max:50',
                'update_Type' => 'required|string|max:50',
                'update_Item_Class' => 'nullable|string|max:50',
                'update_Description' => 'required|string|max:5000',
                'update_Status' => 'required|boolean'
            ]);

            $filePath = $updateItemId->file_image;
            if ($request->hasFile('update_File_Image')) {
                $filePath = $request->file('update_File_Image')->store('images', 'public');
            }

            $updateItemId->update([
                'file_image' => $filePath,
                'title' => $validateRequest['update_Titles'],
                'original_price' => $validateRequest['update_Original_Price'],
                'discount_price' => $validateRequest['update_Discount_Price'],
                'type' => $validateRequest['update_Type'],
                'item_class' => $validateRequest['update_Item_Class'],
                'description' => $validateRequest['update_Description'],
                'status' => $validateRequest['update_Status']
            ]);
            return redirect()->route('bookshop');

        }catch(ValidationException $e){

        }
    }

    public function deleteItem(Premade_Items $deleteItemId){
        $deleteItemId->delete();
        return redirect()->route('bookshop');
    }

    public function cartItem(Request $request){

        $cartItems = session('premadeItem', []);

        $cartItem = [
            'Item_id'=> $request->Item_id,
            'Item_image'=>$request->Item_image,
            'Title'=>$request->Title,
            'Quantity'=>$request->Quantity,
            'Price'=>$request->Price,
            'Type'=>$request->Type,
            'checkout' => false
        ];

        foreach($cartItems as $item){
            if($item['Item_id'] == $cartItem['Item_id']){
                return redirect()->route('cart');
            }
        }

        session()->push('premadeItem' , $cartItem);

        return redirect()->route('cart');

    }

    public function updateQuantity(Request $request, $itemId){
        $cartItems = session('premadeItem', []);

        foreach ($cartItems as &$item) {
            if ($item['Item_id'] == $itemId) {
                $item['Quantity'] = $request->updateQuantity;
            }
        }

        session()->put('premadeItem', $cartItems);

        return back();
    }

    public function removeCartItem($id){
        $cartItems = session('premadeItem', []);

        if (!empty($cartItems)) {
            $updatedCart = array_filter($cartItems, function ($item) use ($id) {
                return $item['Item_id'] != $id;
            });
            session()->put('premadeItem', array_values($updatedCart));
        }

        return back();
    }

    public function checkout_item($itemId){

        $cartItems = session('premadeItem', []);

        foreach ($cartItems as &$item) {
            if ($item['Item_id'] == $itemId) {
                return Inertia::render('Index/Checkout', [
                    "itemCheckout" => $item
                ]);
            }
        }

    }

    public function payment_paypal(Request $request){

       // dd($request);
        $validateInfo = $request->validate([
            'Emailadd' => 'required|string|max:200',
            'country' => 'required|string|max:200',
            'postalCode' => 'required|string|max:200',
        ]);

        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $provider->getAccessToken();
        $response = $provider->createOrder([
            "intent" => "CAPTURE",
            "application_context" => [
                "return_url" => route('success'),
                "cancel_url" => ""
            ],
            "purchase_units" => [
                [ "amount" => [ "currency_code" => "USD", "value" => $request->subtotal] ]
            ]
        ]);
        //dd($response);
        if(isset($response['id']) && $response['id'] != null){
            foreach($response['links'] as $link){
                if($link['rel'] == 'approve'){
                    session()->put('itemId',  $request->itemId);
                    session()->put('itemFile',  $request->itemFile);
                    session()->put('itemTitle', $request->itemTitle);
                    session()->put('quantity', $request->quantity);
                    session()->put('itemType', $request->itemType);
                    session()->put('email', $validateInfo['Emailadd']);
                    session()->put('country', $validateInfo['country']);
                    session()->put('postalCode', $validateInfo['postalCode']);
                    return Inertia::location($link['href']);
                }
            }
        }else{
            return back();
        }

    }

    public function success_paypal(Request $request){
        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $provider->getAccessToken();
        $response = $provider->capturePaymentOrder($request->token);

       // dd($response);
        if(isset($response['status']) && $response['status'] == 'COMPLETED'){

            transaction::create([
                'premade_id' => session()->get('itemId'),
                'payment_id' => $response['id'],
                'itemFile' => session()->get('itemFile'),
                'itemTitle' => session()->get('itemTitle'),
                'quantity' => session()->get('quantity'),
                'amount' => $response['purchase_units'][0]['payments']['captures'][0]['amount']['value'],
                'clientName' => $response['payer']['name']['given_name'] . ' ' . $response['payer']['name']['surname'],
                'clientEmail' => session()->get('email'),
                'country' => session()->get('country'),
                'postalCode' => session()->get('postalCode'),
                'paymentStats' => "COMPLETED",
                'item_type' => session()->get('itemType'),
                'paymentMethod' => "Paypal",
                'status' => "Pending"
            ]);

            $cartItems = session('premadeItem', []);
            foreach ($cartItems as &$item) {
                if ($item['Item_id'] == session()->get('itemId')) {
                    $item = null; // Set item to null to indicate removal
                    break;
                }
            }
            $cartItems = array_filter($cartItems); // Remove null values
            session()->put('premadeItem', array_values($cartItems)); // Reindex the array

           return redirect()->route('receipt');

            unset($_SESSION['itemFile']);
            unset($_SESSION['itemTitle']);
            unset($_SESSION['quantity']);
            unset($_SESSION['email']);
            unset($_SESSION['country']);
            unset($_SESSION['postalCode']);
        }else{
            return back();
        }
    }

    public function paymentPaypal_donation(Request $request){

        //dd($request);
        $validateInfo = $request->validate([
            'email' => 'required|string|max:200',
            'name' => 'required|string|max:200',
            'amount' => 'required',
        ]);

        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $provider->getAccessToken();
        $response = $provider->createOrder([
            "intent" => "CAPTURE",
            "application_context" => [
                "return_url" => route('success_paypaldonation'),
                "cancel_url" => ""
            ],
            "purchase_units" => [
                [ "amount" => [ "currency_code" => "USD", "value" => $request->amount] ]
            ]
        ]);
         //dd($response);
        if(isset($response['id']) && $response['id'] != null){
            foreach($response['links'] as $link){
                if($link['rel'] == 'approve'){
                    session()->put('email', $validateInfo['email']);
                    session()->put('name', $validateInfo['name']);
                    session()->put('message', $request->message);
                    return Inertia::location($link['href']);
                }
             }
        }else{
            return back();
        }

    }

    public function success_paypalDonation(Request $request){
        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $provider->getAccessToken();
        $response = $provider->capturePaymentOrder($request->token);

       // dd($response);
        if(isset($response['status']) && $response['status'] == 'COMPLETED'){

            donation_table::create([
                'email' => session()->get('email'),
                'name' => session()->get('name'),
                'message' => session()->get('message'),
                'amount' => $response['purchase_units'][0]['payments']['captures'][0]['amount']['value'],
                'payment' => "Paypal",
            ]);

           return redirect()->route('homepage');

            unset($_SESSION['email']);
            unset($_SESSION['name']);
            unset($_SESSION['message']);
        }else{
            return back();
        }
    }

    public function payment_stripe(Request $request){

        $validateInfo = $request->validate([
            'Emailadd' => 'required|string|max:200',
            'country' => 'required|string|max:200',
            'postalCode' => 'required|string|max:200',
        ]);

        $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));
        //dd($request);
        $response =  $stripe->checkout->sessions->create([
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => 'usd',
                        'product_data' => [
                            'name' => $request->itemTitle,
                            //'images' => [asset('storage/' . $request->itemFile)]
                        ],
                        'unit_amount' => $request->subtotal*100,
                    ],
                    'quantity' => $request->quantity,
                ],
            ],
            'mode' => 'payment',
            'success_url' => route('successStripe').'?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => 'https://example.com/cancel',
        ]);

        if(isset($response->id) && $response->id != ''){
            session()->put('itemTitle', $request->itemTitle);
            session()->put('quantity', $request->quantity);
            session()->put('subtotal', $request->subtotal);
            session()->put('itemFile', $request->itemFile);
            session()->put('itemId',  $request->itemId);
            session()->put('itemType', $request->itemType);
            session()->put('email', $validateInfo['Emailadd']);
            session()->put('country', $validateInfo['country']);
            session()->put('postalCode', $validateInfo['postalCode']);
            return Inertia::location($response->url);
        }
    }

    public function success_stripe(Request $request){

       if(isset($request->session_id)){
            $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));
            $response = $stripe->checkout->sessions->retrieve($request->session_id);
            //dd($response);

            transaction::create([
                'premade_id' => session()->get('itemId'),
                'payment_id' => $response->created,
                'itemFile' => session()->get('itemFile'),
                'itemTitle' => session()->get('itemTitle'),
                'quantity' => session()->get('quantity'),
                'amount' => number_format($response->amount_total / 100, 2, '.', ''),
                'clientName' =>  $response->customer_details->name,
                'clientEmail' => session()->get('email'),
                'country' => session()->get('country'),
                'postalCode' =>session()->get('postalCode'),
                'paymentStats' =>  "COMPLETED",
                'item_type' => session()->get('itemType'),
                'paymentMethod' => "Stripe",
                'status' => "Pending"
            ]);

            $cartItems = session('premadeItem', []);
            foreach ($cartItems as &$item) {
                if ($item['Item_id'] == session()->get('itemId')) {
                    $item = null; // Set item to null to indicate removal
                    break;
                }
            }
            $cartItems = array_filter($cartItems); // Remove null values
            session()->put('premadeItem', array_values($cartItems)); // Reindex the array

            return redirect()->route('receipt');

            unset($_SESSION['itemFile']);
            unset($_SESSION['itemTitle']);
            unset($_SESSION['quantity']);
            unset($_SESSION['subtotal']);
            unset($_SESSION['email']);
            unset($_SESSION['postalCode']);
            unset($_SESSION['country']);
       }
    }

    public function payment_stripeDonation(Request $request){
       // dd($request);
        $validateInfo = $request->validate([
            'email' => 'required|string|max:200',
            'name' => 'required|string|max:200',
            'amount' => 'required',
        ]);

        $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));
        //dd($request);
        $response =  $stripe->checkout->sessions->create([
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => 'usd',
                        'product_data' => [
                            'name' => "Donation",
                            //'images' => [asset('storage/' . $request->itemFile)]
                        ],
                        'unit_amount' => $validateInfo['amount']*100,
                    ],
                    'quantity' => 1,
                ],
            ],
            'mode' => 'payment',
            'success_url' => route('success_stripedonation').'?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => 'https://example.com/cancel',
        ]);

        if(isset($response->id) && $response->id != ''){
            session()->put('email', $validateInfo['email']);
            session()->put('name', $validateInfo['name']);
            session()->put('message', $request->message);
            session()->put('amount', $validateInfo['amount']);
            return Inertia::location($response->url);
        }
    }

    public function success_stripeDonation(Request $request){

        if(isset($request->session_id)){
            $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));
            $response = $stripe->checkout->sessions->retrieve($request->session_id);
             //dd($response);

            donation_table::create([
                'email' => session()->get('email'),
                'name' => session()->get('name'),
                'message' => session()->get('message'),
                'amount' => number_format((float) session()->get('amount'), 2, '.', ''),
                'payment' => "Stripe",

            ]);

            return redirect()->route('homepage');

            unset($_SESSION['email']);
            unset($_SESSION['name']);
            unset($_SESSION['message']);
            unset($_SESSION['amount']);
        }
    }

    public function pendingToShipped(Request $request, transaction $customerId){
        //dd($year);
        $dateToday = date('Y-m-d');
        $customerId->update([
            'status' => $request->updateStatus,
            'shipmentDate' => $dateToday
        ]);
        return redirect()->route('orderManagement');
    }

    public function shippedToComplete(Request $request, transaction $customerId){
        //dd($year);
        $dateToday = date('Y-m-d');
        $customerId->update([
            'status' => $request->updateStatus,
            'completedDate' => $dateToday
        ]);
        return redirect()->route('orderManagement');
    }
}
