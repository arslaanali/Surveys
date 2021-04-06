<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSurveyAttributesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('survey_attributes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('survey_id')->unsigned();
            $table->string('label',100);
            $table->text('label_value')->nullable();
            $table->enum('label_type',['text_field','radio_button','text_area','dropdown','checkbox']);
        });

        Schema::table('survey_attributes', function(Blueprint $table) {
            $table->foreign('survey_id')
                ->references('id')
                ->on('surveys');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('survey_attributes');
    }
}
