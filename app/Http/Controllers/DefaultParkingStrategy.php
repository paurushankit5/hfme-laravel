<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ParkingStrategy;

class DefaultParkingStrategy extends ParkingStrategy
{
    public function pickASlot($slots){
        if(count($slots)){
            return $slots[0];
        }
        return null;
    }
}
