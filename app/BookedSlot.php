<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BookedSlot extends Model
{
    public function slot(){
        $this->belongsTo(Slot::class);
    }
}
