<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Usuario;
use LogUCAB\Rol;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;


class UsuarioController extends Controller
{
    public function __construct(){

    }

    public function inicio(){
        return view("persona.usuario.user");
    }

    public function create(){
        $rols = Rol::select()->orderBy('Codigo', 'asc')->get();
        return view("persona.usuario.createuser", compact('rols'));
    }

    public function store(Request $request){

        $us = Usuario::where('Usuario.Nombre', $request->Nombre)->first();
        $rols = Rol::select()->orderBy('Codigo', 'asc')->get();
        if(isset($us)){
            
            Session::flash('message','El nombre de usuario '.$request->Nombre.' ya existe.');
            return Redirect::back()->withInput(Input::all())->with('rols', $rols);
        }else{
            $us = Usuario::where('Usuario.Correo', $request->Correo)->first();
            if(isset($us)){
                Session::flash('message','El correo '.$request->Correo.' ya existe.');
                return Redirect::back()->withInput(Input::all())->with('rols', $rols);
            }
        }
        $request->validate([
            'Nombre' => 'required',
            'Correo' => 'required',
            'Contraseña' => 'required',
            'FK_Sele_Concede' => 'required'
        ]);
        
        Usuario::create([
            "Codigo" => Usuario::max('Codigo')+1,
            "Nombre" => $request->Nombre,
            "Correo" => $request->Correo,
            "Contraseña" => $request->Contraseña,
            "FK_Sele_Concede" => $request->FK_Sele_Concede
        ]);

        Session::flash('message','Usuario creado correctamente.');
        return Redirect::to('/user/lista');
    }
    
    public function lista(){
        $users = Usuario::leftjoin('Rol','Rol.Codigo','=','Usuario.FK_Sele_Concede')
        ->select(\DB::raw('"Usuario".*, "Rol"."Tipo" as rol'))
        ->paginate(50);
        return view("persona.usuario.showuser", compact('users'));
    }

    public function edit($Codigo){
        $validated = Usuario::where('Usuario.Codigo', $Codigo)
        ->leftjoin('Rol','Rol.Codigo','=','Usuario.FK_Sele_Concede')
        ->select(\DB::raw("\"Usuario\".*,\"Rol\".\"Codigo\" as cod, \"Rol\".\"Tipo\" as rol"))
        ->first();
        $rols = Rol::select()->orderBy('Codigo', 'asc')->get();

        return view("persona.usuario.edituser", compact('validated', 'rols'));
    }

    public function actualizar(Request $request){
        $us = Usuario::where('Usuario.Nombre', $request->Nombre)->first();
        $usuario = Usuario::find($request->Codigo);
        $rols = Rol::select()->orderBy('Codigo', 'asc')->get();
        $usuario->FK_Sele_Concede = $request->FK_Sele_Concede;
        $usuario->save();

        if(isset($us) && $usuario->Codigo != $us->Codigo && $request->Nombre == $us->Nombre){
            Session::flash('message','El nombre de usuario '.$request->Nombre.' ya existe.');
            return Redirect::back()->withInput(Input::all())->with('rols', $rols);
        }else{
            $us = Usuario::where('Usuario.Correo', $request->Correo)->first();
           
            if(isset($us) && $usuario->Codigo != $us->Codigo && $request->Correo == $us->Correo){
                Session::flash('message','El correo '.$request->Correo.' ya existe.');
                return Redirect::back()->withInput(Input::all())->with('rols', $rols);
            }
        }
        $usuario->Nombre = $request->Nombre;
        $usuario->Correo = $request->Correo;
        $usuario->Contraseña = $request->Contraseña;
        $usuario->save();

        Session::flash('message','Usuario modificado correctamente.');
        return Redirect::to('/user/lista');
    }

    public function delete($Codigo){
        DB::table('usuario')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Usuario eliminado correctamente.');
        return redirect('/user/lista');
    }
}