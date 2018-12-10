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
Route::get('/vehiculo','VehiculoController@inicio');
Route::get('/vehiculo/lista','VehiculoController@lista');
Route::get('/vehiculo/create','VehiculoController@create');
Route::post('/vehiculo/store','VehiculoController@store');
Route::get('/vehiculo/edit/{Codigo}','VehiculoController@edit');
Route::post('/vehiculo/update','VehiculoController@actualizar');
Route::get('/vehiculo/delete/{Codigo}','VehiculoController@delete');

//Oficina
Route::get('/oficina','OfficeController@inicio');
Route::get('/oficina/lista','OfficeController@lista');
Route::get('/oficina/create','OfficeController@create');
Route::post('/oficina/store','OfficeController@store');
Route::get('/oficina/edit/{Codigo}','OfficeController@edit');
Route::post('/oficina/update','OfficeController@actualizar');
Route::get('/oficina/delete/{Codigo}','OfficeController@delete');

//Empleado
Route::get('/empleado','WorkerController@inicio');
Route::get('/empleado/lista','WorkerController@lista');
Route::get('/empleado/create','WorkerController@create');
Route::post('/empleado/store','WorkerController@store');
Route::get('/empleado/edit/{Codigo}','WorkerController@edit');
Route::post('/empleado/update','WorkerController@actualizar');
Route::get('/empleado/delete/{Codigo}','WorkerController@delete');

//Usuario
Route::get('/user','UsuarioController@inicio');
Route::get('/user/lista','UsuarioController@lista');
Route::get('/user/create','UsuarioController@create');
Route::post('/user/store','UsuarioController@store');
Route::get('/user/edit/{Codigo}','UsuarioController@edit');
Route::post('/user/update','UsuarioController@actualizar');
Route::get('/user/delete/{Codigo}','UsuarioController@delete');

//Cliente
Route::get('/cliente','ClientController@inicio');
Route::get('/cliente/lista','ClientController@lista');
Route::get('/cliente/create','ClientController@create');
Route::post('/cliente/store','ClientController@store');
Route::get('/cliente/edit/{Codigo}','ClientController@edit');
Route::post('/cliente/update','ClientController@actualizar');
Route::get('/cliente/delete/{Codigo}','ClientController@delete');

//Rol
Route::get('/rol','RolController@inicio');
Route::get('/rol/lista','RolController@lista');
Route::get('/rol/create','RolController@create');
Route::post('/rol/store','RolController@store');
Route::get('/rol/edit/{Codigo}','RolController@edit');
Route::post('/rol/update','RolController@actualizar');
Route::get('/rol/delete/{Codigo}','RolController@delete');

//Rutas
Route::get('/ruta','RutaController@inicio');
Route::get('/ruta/lista','RutaController@lista');
Route::get('/ruta/create','RutaController@create');
Route::post('/ruta/store','RutaController@store');
Route::get('/ruta/edit/{Codigo}','RutaController@edit');
Route::post('/ruta/update','RutaController@actualizar');
Route::get('/ruta/delete/{Codigo}','RutaController@delete');

//Login
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
