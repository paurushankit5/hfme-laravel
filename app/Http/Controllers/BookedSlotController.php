<?php

namespace App\Http\Controllers;

use App\BookedSlot;
use App\Slot;
use Illuminate\Http\Request;
use App\Http\Controllers\VehicleTypeController;
use App\Http\Controllers\DefaultParkingStrategy;
use App\Http\Controllers\SlotController;





class BookedSlotController extends Controller
{
    public function park(Request $request){
        $request->validate([
            "vehicle_number" => "required|string",
            "vehicle_type_id" => "required|integer"
        ]);

        $vehicleObj = new VehicleTypeController;
        if(!$vehicleObj->isValidVehicleType($request->vehicle_type_id))
            return response()->json('Invalid Vehicle Type', 422);

        //TODO: check if vehicle is already present in the parking lot
        try{
            \DB::beginTransaction();

            $slot = SlotController::findASlot($request->vehicle_type_id);
            if(empty($slot)) return response()->json('No Parking space availble', 422);
            
            $booking_details = $this->bookNow($request, $slot);
            $slot = SlotController::markSlotAsUnAvailable($slot_id);
            if(empty($slot)){
                \DB::rollback();
                return response()->json('Slot is occupied', 422);
            }
            \DB::commit();
            return $booking_details;

        }catch(Exception $e){
            \DB::rollback();
            throw $e;
        }
    }



 

    private function bookNow(Request $request, Slot $slot){
        $obj = new BookedSlot;
        $obj->vehicle_number = $request->vehicle_number;
        $obj->slot_id = $slot->id;
        $obj->entry_time =  date('Y-m-d H:i:s');
        $obj->is_vehicle_inside = true;
        $obj->price = 0;

        $obj->save();

        return $obj;

    }


    public function unpark(Request $request){
        $request->validate([
            "vehicle_number" => "required|string"
        ]);
        $booking_details = $this->getBookingDetails($request->vehicle_number);
        if(empty($booking_details)) return response()->json('Invalid request', 422);
        
        $price = VehicleTypeController::calculatePrice($booking_details->slot_id, $booking_details->start_time, date('Y-m-d H:i:s'));
        
        try{
            \DB::beginTransaction();
            $this->unparkNow($booking_details, $price);
            $slot = Slot::find($booking_details->slot_id);
            SlotController::markSlotAsAvailable($slot);
            \DB::commit();
            return $booking_details;

        }catch(Exception $e){
            \DB::rollback();
            throw $e;
        }


            

    }

    private function unparkNow(BookedSlot $booking_details, $price){
        $booking_details->exit_time =  date('Y-m-d H:i:s');
        $booking_details->is_vehicle_inside = false;
        $booking_details->price = $price;

        $booking_details->save();

        return $booking_details;

    }

    private function getBookingDetails($vehicle_number){
        return BookedSlot::where('vehicle_number', $vehicle_number)
                        ->where('is_vehicle_inside', true)
                        ->first();
    }

    public function history(Request $rquest, $vehicle_number){
        return BookedSlot::where('vehicle_number', $vehicle_number)
                        ->orderBy('id','DESC')
                        ->get();
    }


    
}
