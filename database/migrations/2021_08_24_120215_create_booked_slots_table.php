<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookedSlotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booked_slots', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('vehicle_number');
            $table->bigInteger('slot_id')->unsigned()->nullable();
            $table->foreign('slot_id')->references('id')->on('slots');
            $table->dateTime('entry_time');
            $table->dateTime('exit_time')->nullable();
            $table->boolean('is_vehicle_inside')->default(true);
            $table->integer('price')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('booked_slots');
    }
}
