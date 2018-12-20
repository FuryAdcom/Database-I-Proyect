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

        if($request->L_Vip){
            $request->FK_Asignado_Tipo = 1;
        }else{
            $request->FK_Asignado_Tipo = 3;
        }
        $cliente = Client::find($request->Cedula);

        if(isset($cliente)){
            Session::flash('message','Ya existe un cliente con la cédula: "'.$request->Cedula.'".');
            return Redirect::back()->withInput(Input::all());
        }else{
            $cliente = Client::where('Correo_Personal',$request->Correo_Personal);
            
            if(isset($cliente)){
                Session::flash('message','Ya existe un cliente con el correo: "'.$request->Correo_Personal.'".');
                return Redirect::back()->withInput(Input::all());
            }
        }

        Client::create([
        'Cedula' => $request->Cedula,
        'Nombre' => $request->Nombre,
        'Apellido' => $request->Apellido,
        'Correo_Personal' => $request->Correo_Personal,
        'Fecha_Nacimiento' => $request->Fecha_Nacimiento,
        'Estado_Civil' => $request->Estado_Civil,
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

    public function edit($Codigo){

        $validated = Client::find($Codigo);
        return view("persona.cliente.editclient", compact('validated'));
    }

    public function actualizar(Request $request){
        $clienteOG = Client::find($request->CedulaAnt);
        $cliente = Client::find($request->Cedula);
        if($request->L_Vip){
            $request->FK_Asignado_Tipo = 1;
        }else{
            $request->FK_Asignado_Tipo = 3;
        }
        
        if(isset($cliente) && $cliente != $clienteOG){
            Session::flash('message','Ya existe un cliente con la cédula: "'.$request->Cedula.'".');
            return Redirect::back()->withInput(Input::all());
        }else{
            $cliente = Client::where('Correo_Personal', $request->Correo_Personal)->first();

            if(isset($cliente) && $cliente != $clienteOG){
                Session::flash('message','Ya existe un cliente con el correo: "'.$request->Correo_Personal.'".');
                return Redirect::back()->withInput(Input::all());
            }
        }

        $clienteOG->Cedula = $request->Cedula;
        $clienteOG->Nombre = $request->Nombre;
        $clienteOG->Apellido = $request->Apellido;
        $clienteOG->Correo_Personal = $request->Correo_Personal;
        $clienteOG->Fecha_Nacimiento = $request->Fecha_Nacimiento;
        $clienteOG->Estado_Civil = $request->Estado_Civil;
        $clienteOG->Empresa = $request->Empresa;
        $clienteOG->Frecuente = $request->Frecuente;
        $clienteOG->FK_Asignado_Tipo = $request->FK_Asignado_Tipo;
        $clienteOG->save();

        Session::flash('message','Cliente modificado correctamente.');
        return Redirect::to('/cliente/lista');
    }

    public function delete($Codigo){
        DB::table('Cliente')->where('Cedula', $Cedula)->delete();
        Session::flash('messagedel','Cliente eliminado correctamente.');
        return redirect('/cliente/lista');
    }
}
