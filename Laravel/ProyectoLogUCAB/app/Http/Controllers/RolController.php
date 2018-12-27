<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
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

        Rol::create([
            'Codigo' =>  Rol::max('Codigo')+1,
            'Tipo' => $request->Tipo
        ]);

        Session::flash('message','Rol creado correctamente.');
        return Redirect::to('rol');
    }
    
    public function lista(){
        $roles = Rol::orderBy('Codigo')->paginate(50);
        return view("rol.showrol", compact('roles'));
    }

    public function edit($Codigo){

        $validated = Rol::where('Codigo', $Codigo)->first();
        $crear = Priv_Rol::where('FK_Accede_Sis',$validated->Codigo)
        ->where('FK_Opcion', 1)
        ->first();
        $modificar = Priv_Rol::where('FK_Accede_Sis',$validated->Codigo)
        ->where('FK_Opcion', 2)
        ->first();
        $eliminar = Priv_Rol::where('FK_Accede_Sis',$validated->Codigo)
        ->where('FK_Opcion', 3)
        ->first();
        $insertar = Priv_Rol::where('FK_Accede_Sis',$validated->Codigo)
        ->where('FK_Opcion', 4)
        ->first();
        $consultar = Priv_Rol::where('FK_Accede_Sis',$validated->Codigo)
        ->where('FK_Opcion', 5)
        ->first();
        return view("rol.editrol", compact('validated','crear','modificar','eliminar','insertar','consultar'));
    }

    public function actualizar(Request $request){
        $rol = Rol::find($request->Codigo);
        $crear = Priv_Rol::where('FK_Accede_Sis',$request->Codigo)
        ->where('FK_Opcion', 1)
        ->first();
        $modificar = Priv_Rol::where('FK_Accede_Sis',$request->Codigo)
        ->where('FK_Opcion', 2)
        ->first();
        $eliminar = Priv_Rol::where('FK_Accede_Sis',$request->Codigo)
        ->where('FK_Opcion', 3)
        ->first();
        $insertar = Priv_Rol::where('FK_Accede_Sis',$request->Codigo)
        ->where('FK_Opcion', 4)
        ->first();
        $consultar = Priv_Rol::where('FK_Accede_Sis',$request->Codigo)
        ->where('FK_Opcion', 5)
        ->first();
    
        $rol->Tipo = $request->Tipo;
        $rol->save();

        if(isset($crear) && $request->Crear == false){
            $crear->delete();
        }elseif(is_null($crear) && $request->Crear == true){
            Priv_Rol::create([
                'Codigo' =>  Priv_Rol::max('Codigo')+1,
                'FK_Opcion' => 1,
                'FK_Accede_Sis' => $request->Codigo
            ]);
        }
        if(isset($modificar) && $request->Modificar == false){
            $modificar->delete();
        }elseif(is_null($modificar) && $request->Modificar == true){
            Priv_Rol::create([
                'Codigo' =>  Priv_Rol::max('Codigo')+1,
                'FK_Opcion' => 2,
                'FK_Accede_Sis' => $request->Codigo
            ]);
        }
        if(isset($eliminar) && $request->Eliminar == false){
            $eliminar->delete();
        }elseif(is_null($eliminar) && $request->Eliminar == true){
            Priv_Rol::create([
                'Codigo' =>  Priv_Rol::max('Codigo')+1,
                'FK_Opcion' => 3,
                'FK_Accede_Sis' => $request->Codigo
            ]);
        }
        if(isset($insertar) && $request->Insertar == false){
            $insertar->delete();
        }elseif(is_null($insertar) && $request->Insertar == true){
            Priv_Rol::create([
                'Codigo' =>  Priv_Rol::max('Codigo')+1,
                'FK_Opcion' => 4,
                'FK_Accede_Sis' => $request->Codigo
            ]);
        }
        if(isset($consultar) && $request->Consultar == false){
            $consultar->delete();
        }elseif(is_null($consultar) && $request->Consultar == true){
            Priv_Rol::create([
                'Codigo' =>  Priv_Rol::max('Codigo')+1,
                'FK_Opcion' => 5,
                'FK_Accede_Sis' => $request->Codigo
            ]);
        }

        Session::flash('message','Rol modificado correctamente.');
        return Redirect::to('/rol');
    }

    public function delete($Codigo){
        Rol::find($Codigo)->delete();
        Session::flash('messagedel','Rol eliminado correctamente.');
        return redirect('/rol');
    }
}
