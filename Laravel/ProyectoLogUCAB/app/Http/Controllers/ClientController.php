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
        $request->edo = $request->Estado;
        if($request->L_Vip){
            $request->FK_Asignado_Tipo = 3;
        }else{
            $request->FK_Asignado_Tipo = 2;
        }
        $request->Frecuente = false;

        Client::create(['Cedula' => $request->Cedula,
        'Nombre' => $request->Nombre,
        'Apellido' => $request->Apellido,
        'Correo_Personal' => $request->Correo_Personal,
        'Fecha_Nacimiento' => $request->Fecha_Nacimiento,
        'Estado_Civil' => $request->edo,
        'Empresa' => $request->Empresa,
        'L_Vip' => $request->L_Vip,
        'Frecuente' => $request->Frecuente,
        'FK_Asignado_Tipo' => $request->FK_Asignado_Tipo
        ]);

        Session::flash('message','Cliente creado correctamente.');
        return Redirect::to('/cliente/lista');
    }
    
    public function lista(){
        $clientes = Client::paginate(50);
        return view("persona.cliente.showclient", compact('clientes'));
    }

    public function edit($Cedula){

        $validated = Client::where('Cedula', $Cedula)->first();
        return view("persona.cliente.editclient", compact('validated'));
    }

    public function actualizar(Request $request){
        $cliente = Client::find($request->Cedula);
        if($request->L_Vip){
            $request->FK_Asignado_Tipo = 3;
        }else{
            $request->FK_Asignado_Tipo = 2;
        }
    
        $cliente->Nombre = $request->Nombre;
        $cliente->Apellido = $request->Apellido;
        $cliente->Correo_Personal = $request->Correo_Personal;
        $cliente->Fecha_Nacimiento = $request->Fecha_Nacimiento;
        $cliente->Estado_Civil = $request->Estado_Civil;
        $cliente->Empresa = $request->Empresa;
        $cliente->Frecuente = $request->Frecuente;
        $cliente->FK_Asignado_Tipo = $request->FK_Asignado_Tipo;
        $cliente->save();

        Session::flash('message','Cliente modificado correctamente.');
        return Redirect::to('/cliente/lista');
    }

    public function delete($Cedula){
        DB::table('Cliente')->where('Cedula', $Cedula)->delete();
        Session::flash('messagedel','Cliente eliminado correctamente.');
        return redirect('/cliente/lista');
    }
}
