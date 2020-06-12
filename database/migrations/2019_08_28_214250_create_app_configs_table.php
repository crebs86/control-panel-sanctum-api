<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAppConfigsTable extends Migration
{
    /**
     * Run the migrations.
     * Database version: v1.0
     * @return void
     */
    public function up()
    {
        Schema::create('app_configs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('config', 55);
            $table->text('content');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('app_configs');
    }
}
