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
    return view('layouts/home');
});

//Transporte
Route::get('/transporte','VehiculoController@inicio');
Route::get('/transporte/listaAerea','VehiculoController@listaAvion');
Route::get('/transporte/listaMarina','VehiculoController@listaBarco');
Route::get('/transporte/listaTerrestre','VehiculoController@listaTerrestre');
Route::get('/transporte/mostrarAereo/{Placa}','VehiculoController@mostrarAvion');
Route::get('/transporte/mostrarMarino/{Placa}','VehiculoController@mostrarBarco');
Route::get('/transporte/mostrarTerrestre/{Placa}','VehiculoController@mostrarTerrestre');
Route::get('/transporte/create','VehiculoController@create');
Route::post('/transporte/store','VehiculoController@store');
Route::get('/transporte/editAereo/{Placa}','VehiculoController@editAereo');
Route::get('/transporte/editMarino/{Placa}','VehiculoController@editMarino');
Route::get('/transporte/editTerrestre/{Placa}','VehiculoController@editTerrestre');
Route::post('/transporte/update','VehiculoController@actualizar');
Route::get('/transporte/deleteAereo/{Placa}','VehiculoController@deleteAereo');
Route::get('/transporte/deleteMarino/{Placa}','VehiculoController@deleteMarino');
Route::get('/transporte/deleteTerrestre/{Placa}','VehiculoController@deleteTerrestre');

//Oficina
Route::get('/oficina','OfficeController@inicio');
Route::get('/oficina/lista','OfficeController@lista');
Route::get('/oficina/mostrar/{Codigo}','OfficeController@mostrar');
Route::get('/oficina/create','OfficeController@create');
Route::post('/oficina/store','OfficeController@store');
Route::get('/oficina/edit/{Codigo}','OfficeController@edit');
Route::post('/oficina/update','OfficeController@actualizar');
Route::get('/oficina/delete/{Codigo}','OfficeController@delete');

//Zona
Route::get('/zona','ZonaController@inicio');
Route::get('/zona/lista','ZonaController@lista');
//Route::get('/zona/mostrar/{Codigo}','ZonaController@mostrar');
Route::get('/zona/create','ZonaController@create');
Route::post('/zona/store','ZonaController@store');
Route::get('/zona/edit/{Codigo}','ZonaController@edit');
Route::post('/zona/update','ZonaController@actualizar');
Route::get('/zona/delete/{Codigo}','ZonaController@delete');

//Empleado
Route::get('/empleado','WorkerController@inicio');
Route::get('/empleado/lista','WorkerController@lista');
Route::get('/empleado/mostrar/{Codigo}','WorkerController@mostrar');
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
Route::get('/cliente/mostrar/{Codigo}','ClientController@mostrar');
Route::get('/cliente/create','ClientController@create');
Route::post('/cliente/store','ClientController@store');
Route::get('/cliente/edit/{Codigo}','ClientController@edit');
Route::post('/cliente/update','ClientController@actualizar');
Route::get('/cliente/delete/{Codigo}','ClientController@delete');

//Rol
Route::get('/rol','RolController@lista');
Route::post('/rol/store','RolController@store');
Route::get('/rol/edit/{Codigo}','RolController@edit');
Route::post('/rol/update','RolController@actualizar');
Route::get('/rol/delete/{Codigo}','RolController@delete');

//Rutas
Route::get('/ruta','RutaController@inicio');
Route::get('/ruta/lista','RutaController@lista');
Route::get('/ruta/mostrar/{Codigo}','RutaController@mostrar');
Route::get('/ruta/create','RutaController@create');
Route::post('/ruta/store','RutaController@store');
Route::get('/ruta/edit/{Codigo}','RutaController@edit');
Route::post('/ruta/update','RutaController@actualizar');
Route::get('/ruta/delete/{Codigo}','RutaController@delete');

//Paquete
Route::get('/paquete','PacketController@inicio');
Route::get('/paquete/lista','PacketController@lista');
Route::get('/paquete/mostrar/{Codigo}','PacketController@mostrar');
Route::get('/paquete/create','PacketController@create');
Route::post('/paquete/store','PacketController@store');
Route::get('/paquete/edit/{Codigo}','PacketController@edit');
Route::post('/paquete/update','PacketController@actualizar');
Route::get('/paquete/delete/{Codigo}','PacketController@delete');

//Envios
Route::get('/envio','EnvioController@inicio');
Route::get('/envio/lista','EnvioController@lista');
Route::get('/envio/mostrar/{Codigo}','EnvioController@mostrar');
Route::post('/envio/status/{Codigo}','EnvioController@status');
Route::post('/envio/recibo/{Codigo}','EnvioController@recibo');
Route::get('/envio/create','EnvioController@create');
Route::post('/envio/store','EnvioController@store');
Route::post('/envio/store2','EnvioController@store2');
Route::post('/envio/store3','EnvioController@store3');
Route::get('/envio/cancel/{Codigo}','EnvioController@cancelar');

//Login
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
