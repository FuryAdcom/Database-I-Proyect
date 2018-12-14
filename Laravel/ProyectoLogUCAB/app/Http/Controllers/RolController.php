<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Rol;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;


class RolController extends Controller
{
    public function __construct(){

    }

    public function store(Request $request){

        $request->validate([
            'Tipo' => 'required'
        ]);

        Rol::create($request->all());

        Session::flash('message','Rol creado correctamente.');
        return Redirect::to('rol/lista');
    }
    
    public function lista(){
        $roles = Rol::paginate(50);
        return view("rol.showrol", compact('roles'));
    }

    public function edit($Codigo){

        $validated = Rol::where('Codigo', $Codigo)->first();
        return view("rol.editrol", compact('validated'));
    }

    public function actualizar(Request $request){
        $rol = Rol::find($request->Codigo);
    
        $rol->Tipo = $request->Tipo;
        $rol->save();

        Session::flash('message','Rol modificado correctamente.');
        return Redirect::to('/rol/lista');
    }

    public function delete($Codigo){
        DB::table('rol')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Rol eliminado correctamente.');
        return redirect('/rol/lista');
    }
}
