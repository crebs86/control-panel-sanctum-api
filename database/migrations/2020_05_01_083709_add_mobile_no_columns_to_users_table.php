<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMobileNoColumnsToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tickets', function (Blueprint $table) {
            //$table->unsignedBigInteger('conversation')->default(1);//conversations I
            //$table->foreign('conversation')->references('id')->on('conversations');//conversations I
           // $table->timestamp('updated_at')->useCurrent();//conversations
            /*$table->unsignedBigInteger('assigned')->nullable();
            $table->foreign('assigned')->references('id')->on('users');
            $table->unsignedBigInteger('closed_by')->nullable();
            $table->foreign('closed_by')->references('id')->on('users');/*tickets*/

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('conversations', function (Blueprint $table) {
            //$table->softDeletes();
        });
    }
}
