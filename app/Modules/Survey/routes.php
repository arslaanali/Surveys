<?php
# app/Modules/Survey/routes.php

/*
|--------------------------------------------------------------------------
| Survey Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for survey module.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return redirect()->route('survey-list');
});

Route::group(['prefix' => 'survey', 'namespace' => '\App\Modules\Survey\Controllers', 'middleware' => ['web', 'auth']], function () {
    /***
     * Survey listing
     */
    Route::get('/list', [ 'as' => 'survey-list', 'uses' => 'SurveyController@index']);
    /***
     * Fill survey form
     */
    Route::get('/fill-form/{id}', ['as' => 'fill-form', 'uses' => 'SurveyController@fillForm']);

    /***
     * View filled survey form
     */
    Route::get('/view-form/{id}', ['as' => 'view-form', 'uses' => 'SurveyController@viewForm']);

    /***
     * Save form
    */
    Route::post('save-form', ['as' => 'save-form', 'uses' => 'SurveyController@saveForm']);
});
