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

//Transporte
Route::get('transporte','VehiculoController@inicio');
Route::get('transporte/lista','VehiculoController@lista');
Route::get('transporte/create','VehiculoController@create');
Route::get('transporte/edit','VehiculoController@edit');

//Oficina
Route::get('oficina','OfficeController@inicio');
Route::get('oficina/lista','OfficeController@lista');
Route::get('oficina/create','OfficeController@create');
Route::get('oficina/edit','OfficeController@edit');

//Login
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
