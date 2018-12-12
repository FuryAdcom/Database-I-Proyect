<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Client;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;

class ClientController extends Controller
{
    public function __construct(){

    }

    public function inicio(){
        return view("persona.cliente.client");
    }

    public function create(){
        return view("persona.cliente.createclient");
    }

    public function store(Request $request){
        //Completar esto
        $Lugar = Lugar::find($request->NombreLugar);

        $request->validate([
            'Nombre' => 'required',
            'Tamaño_deposito' => 'required',
            'FK_Varios' => 'required'
        ]);

        Client::create($request->all());

        Session::flash('message','Oficina creada correctamente.');
        return Redirect::to('cliente/lista');
    }
    
    public function lista(){
        $oficinas = Client::paginate(50);
        return view("persona.cliente.showclient", compact('oficinas'));
    }

    public function edit($Codigo){

        $validated = Client::where('Codigo', $Codigo)->first();
        return view("persona.cliente.editclient", compact('validated'));
    }

    public function actualizar(Request $request){
        $cliente = Client::find($request->Codigo);
    
        $cliente->Nombre = $request->Nombre;
        $cliente->Tamaño_deposito = $request->Tamaño_deposito;
        $cliente->Cantidad_vehiculos = $request->Cantidad_vehiculos;
        $cliente->Cantidad_empleados = $request->Cantidad_empleados;
        $cliente->Empleado_cargo = $request->Empleado_cargo;
        $cliente->save();

        Session::flash('message','Oficina modificada correctamente.');
        return Redirect::to('/cliente/lista');
    }

    public function delete($Codigo){
        DB::table('cliente')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Oficina eliminada correctamente.');
        return redirect('/cliente/lista');
    }
}
