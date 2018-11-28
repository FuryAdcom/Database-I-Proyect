<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('layouts/app');
});

Route::get('vehiculo','VehiculoController@inicio');
Route::get('vehiculo/lista','VehiculoController@lista');
Route::get('vehiculo/create','VehiculoController@create');
Route::get('vehiculo/edit','VehiculoController@edit');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
