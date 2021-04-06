<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SurveyUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('survey_users', function (Blueprint $table) {
            $table->integer('survey_id')->unsigned();
            $table->foreign('survey_id')
                ->references('id')
                ->on('surveys');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')
                ->references('id')
                ->on('users');
            $table->enum('status', ['Pending', 'Partially Completed', 'Completed']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('survey_users');
    }
}
