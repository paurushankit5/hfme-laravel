<?php

namespace App\Http\Controllers;

use App\VehicleType;
use Illuminate\Http\Request;

class VehicleTypeController extends Controller
{
    public function isValidVehicleType($id){
        return VehicleType::where('id',$id)->count() ? true : false;
    }


    public static function calculatePrice($vehicle_type_id, $start_time, $end_time){
        return rand(100, 500);
    }
}
