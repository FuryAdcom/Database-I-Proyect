<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use LogUCAB\Http\Requests;
use LogUCAB\Client;
use LogUCAB\User;
use LogUCAB\Usuario;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;

class ClientController extends Controller
{
    public function __construct(){$this->middleware('auth');
    }

    public function inicio(){
        return view("persona.cliente.client");
    }

    public function create(){
        if(null !== Auth::user()){
            $Correo_Personal = Auth::user()->email;
            return view("persona.cliente.createclient", compact('Correo_Personal'));
        }
        return view("persona.cliente.createclient");
    }

    public function store(Request $request){

        if($request->L_Vip){
            $request->FK_Asignado_Tipo = 1;
        }else{
            $request->FK_Asignado_Tipo = 3;
        }
        $cliente = Client::find($request->Cedula);
        if($cliente->FK_Asignado_Tipo == 2 && $request->FK_Asignado_Tipo != 1){
            $request->FK_Asignado_Tipo = 2;
        }

        if(isset($cliente)){
            Session::flash('message','Ya existe un cliente con la cédula: "'.$request->Cedula.'".');
            return Redirect::back()->withInput(Input::all());
        }else{
            $cliente = Client::where('Correo_Personal', $request->Correo_Personal);
            
            if(isset($cliente->Correo_Personal)){
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
        $user = User::where('email', $request->Correo_Personal)->first();
        if(isset($user)){
            $user->rol = $request->FK_Asignado_Tipo;
            $user->save();
            $user = Usuario::where('Correo_Personal', $request->Correo_Personal)->first();
            $user->rol = $request->FK_Asignado_Tipo;
            $user->save();
        }

        Session::flash('message','Cliente creado correctamente.');
        return Redirect::to('/');
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
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',12)
        ->first();

    if(isset($priv)){
        $clienteOG = Client::find($request->CedulaAnt);
        $cliente = Client::find($request->Cedula);
        if($request->L_Vip){
            $request->FK_Asignado_Tipo = 1;
        }else{
            $request->FK_Asignado_Tipo = 3;
        }
        if($clienteOG->FK_Asignado_Tipo == 2 && $request->FK_Asignado_Tipo != 1){
            $request->FK_Asignado_Tipo = 2;
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
        $user = User::where('email', $request->Correo_Personal)->first();
        if(isset($user)){
            $user->rol = $request->FK_Asignado_Tipo;
            $user->save();
            $user = Usuario::where('Correo_Personal', $request->Correo_Personal)->first();
            $user->rol = $request->FK_Asignado_Tipo;
            $user->save();
        }

        Session::flash('message','Cliente modificado correctamente.');
        return Redirect::to('/cliente/lista');
    }else{
        Session::flash('message','Usted no tiene permisos para realizar esta accion.');
        return Redirect::back()->withInput(Input::all());
    }
    }

    public function carnet($Codigo){

        $cliente = Client::where('Cedula',$Codigo)->first();
        
        //Para el PDF recibo de envio, $order tiene que tener los datos necesarios
        //
        //return $order->getPdf('download'); // Returns the PDF as download
        return $cliente->getPdf(); // Returns stream default
    }

    public function delete($Codigo){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',8)
        ->first();

    if(isset($priv)){
        DB::table('Cliente')->where('Cedula', $Codigo)->delete();
        Session::flash('messagedel','Cliente eliminado correctamente.');
        return redirect('/cliente/lista');
    }else{
        Session::flash('message','Usted no tiene permisos para realizar esta accion.');
        return Redirect::back()->withInput(Input::all());
    }
    }
}
