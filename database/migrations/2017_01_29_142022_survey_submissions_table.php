<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SurveySubmissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('survey_submissions', function (Blueprint $table) {
            $table->integer('survey_attribute_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->text('value');
        });

        Schema::table('survey_submissions', function (Blueprint $table) {
            $table->foreign('survey_attribute_id')
                ->references('id')
                ->on('survey_attributes');
            $table->foreign('user_id')
                ->references('id')
                ->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('survey_submissions');
    }
}
