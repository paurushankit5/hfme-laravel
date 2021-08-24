<?php

namespace App\Http\Controllers;

use App\Slot;
use Illuminate\Http\Request;
use App\Http\Controllers\DefaultParkingStrategy;


class SlotController extends Controller
{
    
    public function store(Request $request)
    {

        if($request->param && count($request->param)){
            foreach($request->param as $param){
                for($i =0; $i< $param['slots']; $i++){
                    $obj = new Slot;
                    $obj->vehicle_type_id = $param['vehicle_type_id'];
                    $obj->save();
                }
            }
            return 'Slots added';
        }
        return response()->json('Invalid data', 422);

    }


    public static function findASlot($vehicle_type_id){
        $query = Slot::where('vehicle_type_id', $vehicle_type_id)
                                    ->where('is_slot_free', true);
            
        if($query->count() == 0) return null;

        $all_available_slots = $query->get();

        $strategy = new DefaultParkingStrategy;
        $slot = $strategy->pickASlot($all_available_slots);
        return $slot;
    }

    public static function markSlotAsUnAvailable($slot){

        $slot = Slot::where('is_slot_free', true)
                ->where('id', $slot_id)
                ->lockForUpdate()
                ->first();

        if(!$slot) return null;   
        $slot->is_slot_free = false;
        $slot->save();
        return $slot;
    }

    public static function markSlotAsAvailable(Slot $slot){
        $slot->is_slot_free = true;
        $slot->save();
        return $slot;
    }

    

    
}
