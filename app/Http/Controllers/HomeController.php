<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public static $counter;
    public function __construct()
    {
       //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {   
        return view('home');
    }

    public function test(Request $request){
        \DB::beginTransaction();

        $user = User::where('id',1)->lockForUpdate()->first();
        //sleep(10);

        \DB::commit();

        return $user;
    }

    public function test1(){
        return User::where('id',2)->count();
    }
}
