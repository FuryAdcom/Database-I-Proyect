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
Route::get('/oficina/porestado','OfficeController@listaestado');
Route::get('/oficina/mostrar/{Codigo}','OfficeController@mostrar');
Route::get('/oficina/servicio/{Codigo}','OfficeController@servicio');
Route::post('/oficina/servpago','OfficeController@servpago');
Route::get('/oficina/create','OfficeController@create');
Route::post('/oficina/store','OfficeController@store');
Route::get('/oficina/edit/{Codigo}','OfficeController@edit');
Route::post('/oficina/update','OfficeController@actualizar');
Route::get('/oficina/delete/{Codigo}','OfficeController@delete');

//Taller
Route::get('/taller','TallerController@inicio');
Route::get('/taller/mostrar/{Codigo}','TallerController@mostrar');
Route::get('/taller/servicio/{Codigo}','TallerController@servicio');
Route::post('/taller/servpago','TallerController@servpago');
Route::get('/taller/create','TallerController@create');
Route::post('/taller/store','TallerController@store');
Route::get('/taller/edit/{Codigo}','TallerController@edit');
Route::post('/taller/update','TallerController@actualizar');
Route::get('/taller/delete/{Codigo}','TallerController@delete');
Route::get('/taller/flota/{Codigo}','TallerController@flota');
Route::post('/taller/envio','TallerController@envio');
Route::get('/taller/salida/{Codigo}','TallerController@salida');

//Zona
Route::get('/zona','ZonaController@inicio');
Route::get('/zona/lista','ZonaController@lista');
Route::get('/zona/create','ZonaController@create');
Route::post('/zona/store','ZonaController@store');
Route::get('/zona/edit/{Codigo}','ZonaController@edit');
Route::post('/zona/update','ZonaController@actualizar');
Route::get('/zona/delete/{Codigo}','ZonaController@delete');

//Empleado
Route::get('/empleado','WorkerController@inicio');
Route::get('/empleado/lista','WorkerController@lista');
Route::get('/empleado/mostrar/{Cedula}','WorkerController@mostrar');
Route::post('/empleado/assist','WorkerController@assist');
Route::get('/empleado/create','WorkerController@create');
Route::post('/empleado/store','WorkerController@store');
Route::get('/empleado/edit/{Cedula}','WorkerController@edit');
Route::post('/empleado/update','WorkerController@actualizar');
Route::get('/empleado/delete/{Cedula}','WorkerController@delete');

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
Route::post('/cliente/store','ClientController@store');
Route::get('/cliente/carnet/{Codigo}','ClientController@carnet');
Route::get('/cliente/create','ClientController@create');
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
Route::get('/paquete/promedio','PacketController@listaprom');
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
Route::get('/envio/status/{Codigo}','EnvioController@status');
Route::get('/envio/recibo/{Codigo}','EnvioController@recibo');
Route::get('/envio/create','EnvioController@create');
Route::post('/envio/store','EnvioController@store');
Route::post('/envio/store2','EnvioController@store2');
Route::post('/envio/store3','EnvioController@store3');
Route::get('/envio/cancel/{Codigo}','EnvioController@cancelar');

//Auditoria
Route::get('/auditoria/lista','UsuarioController@alista');

//Pago
Route::post('/pago/store','EnvioController@store');

//Login
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/logout', 'Auth\LoginController@logout')->name('logout');
