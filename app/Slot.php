<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Slot extends Model
{
    public function vehicle_type(){
        return $this->belongsTo('App\VehicleType');
    }




    
}
