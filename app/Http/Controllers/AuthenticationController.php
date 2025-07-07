<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;

class AuthenticationController extends Controller
{
    public function admin(){
        return Inertia::render('Index/Admin');
    }

    public function MemberLogin(){
        $getcart = session('premadeItem', []);
        return Inertia::render('Index/MembershipLogin', [
            "userCart" => $getcart
        ]);
    }

    public function registerAcc(Request $request){

        //dd($request);
        $validated = $request->validate([
            'Fullname'=>'required|string|max:50',
            'Email'=>'required|string|max:50|unique:users,email',
            'Username'=>'required|string|max:20|unique:users,username',
            'Password'=>'required|string|max:20'
        ]);

        User::create([
            'email'=>$validated['Email'],
            'fullname'=>$validated['Fullname'],
            'username'=>$validated['Username'],
            'password'=>Hash::make($validated['Password'])
        ]);

        return redirect()->route('loginMember');

    }

    public function updateAdmin(Request $request, User $adminId)
    {
        $validated = $request->validate([
            'username' => 'required|string|max:20',
            'password' => 'nullable|string|max:20'
        ]);

        $password = $adminId->password;
        if (!empty($validated['password'])) {
            $password = Hash::make($validated['password']);
        }
        $adminId->update([
            'username' => $validated['username'],
            'password' => $password
        ]);

        return redirect()->route('dashboard');
    }

    public function updateProfile(Request $request, User $adminId)
    {
        $validated = $request->validate([
            'Logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'Profile' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ]);
        //dd($validated);
        $currLogo = $adminId->file_logo;
        $currProfile = $adminId->file_profile;

        if($request->hasFile('Logo')){
            $currLogo = $request->file('Logo')->store('images', 'public');
        }
        if($request->hasFile('Profile')){
            $currProfile = $request->file('Profile')->store('images', 'public');
        }
        //dd($currLogo, $currProfile);
        $adminId->update([
            'file_logo' => $currLogo,
            'file_profile' => $currProfile
        ]);

        return redirect()->route('dashboard');
    }


    public function login(LoginRequest $request)
    {

        if (!Auth::attempt($request->only('username', 'password'))) {
            return redirect()->back()->with('failedLogin', 'Invalid username or password.');
        }

        $request->session()->regenerate();
        $get_auth = Auth::id();
        User::where('id', $get_auth)->update(['is_active' => 1]);

        return auth()->user()->is_admin
            ? redirect()->route('dashboard')
            : redirect()->route('membershipdashboard');
    }

    public function logout(){
        $get_auth = Auth::id();
        User::where('id', $get_auth)->update(['is_active' => 0]);

        Auth::logout();
        return redirect()->route('login');
    }

    public function logoutMember()
    {
        $get_auth = Auth::id();
        User::where('id', $get_auth)->update(['is_active' => 0]);

        Auth::logout();
        return redirect()->route('homepage');
    }

    public function logoutUser(User $user){
        DB::table('sessions')->where('user_id', $user->id)->delete();
        $user->update(['is_active' => 0]);
        return back();
    }

    public function updateMemberProfile(Request $request, User $memberiD){

        $validateRequest = $request->validate([
            'Fullname'=>'required|string|max:40',
            'Email'=>'required|string|max:40',
            'Username'=>'required|string|max:40',
            'Password'=>'nullable|string|max:40',
            'Profile'=>'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $currPassword = $memberiD->password;
        $currProfile = $memberiD->file_profile;

        if(!empty($validateRequest['Password'])){
            $currPassword = Hash::make($validateRequest['Password']);
        }
        if($request->hasFile('Profile')){
            $currProfile = $request->file('Profile')->store('images', 'public');
        }
        //dd($currProfile);
        $memberiD->update([
            'fullname'=>$validateRequest['Fullname'],
            'email'=>$validateRequest['Email'],
            'username'=>$validateRequest['Username'],
            'password'=>$currPassword,
            'file_profile'=>$currProfile
        ]);

        return redirect()->route('membershipdashboard');
    }


    //membership forgot password

    public function sendEmail(Request $request) {

        $request->validate(['email' => ['email']]);

        $status = Password::sendResetLink(
            $request->only('email')
        );
       //dd($status);
        return $status === Password::RESET_LINK_SENT
            ? back()->with('status', 'Email verification sent successfully!')
            : back()->with('failedStatus', 'Email not found.');
    }

    public function passwordReset(Request $request) {
        $get_userLogo = User::select('file_logo')
                        ->where('is_admin', '1')
                        ->first();
        return Inertia::render('Index/MembershipReset', [
            'email' => $request->email,
            'token' => $request->route('token'),
            'get_userLogo' => $get_userLogo
        ]);
    }

    public  function resetPassword(Request $request) {
        //dd($request);
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function (User $user, string $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));

                $user->save();

                event(new PasswordReset($user));
            }
        );
        //dd($status);
        return redirect()->route('loginMember');
    }
}



