<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

abstract class ParkingStrategy
{
    abstract public function pickASlot($slots);
}
