<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAllowedFileExtTable extends Migration
{
    /**
     * Run the migrations.
     * Database version: v1.0
     * @return void
     */
    public function up()
    {
        Schema::create('allowed_file_ext', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('ext', 10);
            $table->string('label', 255);
            $table->softDeletes();
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
        Schema::dropIfExists('allowed_file_ext');
    }
}
