<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:api', 'auth.superuser'])->group(function () {

    Route::get('/test', 'HomeController@test');
    Route::get('/test1', 'HomeController@test1');



    Route::post('/slots/create' , 'SlotController@store');

    Route::post('/vehicle/park', 'BookedSlotController@park');

    
    Route::post('/vehicle/unpark', 'BookedSlotController@unpark');
    Route::get('/vehicle/history/{vehicle_number}', 'BookedSlotController@history');

    
});




Route::middleware(['auth:api','auth.superuser'])->get('/user', 'HomeController@test');


Route::post('/login', 'AuthController@login');

