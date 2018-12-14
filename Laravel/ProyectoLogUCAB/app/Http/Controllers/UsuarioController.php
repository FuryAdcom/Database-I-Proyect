<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Usuario;
use LogUCAB\Rol;
use Illuminate\Support\Facades\Redirect;
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
        return view("persona.usuario.createuser");
    }

    public function store(Request $request){

        $request->validate([
            'Nombre' => 'required',
            'Correo' => 'required',
            'Contraseña' => 'required',
            'FK_Sele_Concede' => 'required'
        ]);

        Usuario::create($request->all());

        Session::flash('message','Usuario creado correctamente.');
        return Redirect::to('/usuario/lista');
    }
    
    public function lista(){
        $users = Usuario::paginate(50);
        return view("persona.usuario.showuser", compact('users'));
    }

    public function edit($Codigo){
        $validated = Usuario::where('Usuario.Codigo', $Codigo)
        ->leftjoin('Rol','Rol.Codigo','=','Usuario.FK_Sele_Concede')
        ->first();
        return view("persona.usuario.edituser", compact('validated'));
    }

    public function actualizar(Request $request){
        $usuario = Usuario::find($request->Codigo);
        $rol = DB::table('Rol')->where('Tipo', $request->rolname)->first();

    
        $usuario->Nombre = $request->Nombre;
        $usuario->Correo = $request->Correo;
        $usuario->Contraseña = $request->Contraseña;
        $usuario->FK_Sele_Concede = $rol->Codigo;
        $usuario->save();

        Session::flash('message','Usuario modificado correctamente.');
        return Redirect::to('/user/lista');
    }

    public function delete($Codigo){
        DB::table('usuario')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Usuario eliminada correctamente.');
        return redirect('/user/lista');
    }
}
