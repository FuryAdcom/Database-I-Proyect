<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Auth;
use Yajra\Datatables\Datatables;
use Session;

use DB;


class RolController extends Controller
{
    public function __construct(){$this->middleware('auth');
    }

    public function store(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',7)
        ->first();

        if(isset($priv)){

            $request->validate([
                'Tipo' => 'required'
            ]);

            Rol::create([
                'Codigo' =>  Rol::max('Codigo')+1,
                'Tipo' => $request->Tipo
            ]);

            Session::flash('message','Rol creado correctamente.');
            return Redirect::to('rol');

        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
    
    public function lista(){

        $roles = Rol::select()->orderBy('Codigo')->paginate(50);
        return view("rol.showrol", compact('roles'));
    }

    public function edit($Codigo){

            $validated = Rol::where('Codigo', $Codigo)->first();
            $privs = DB::table('Privilegio')->orderBy('Codigo')->get();
            $pr = Priv_Rol::where('FK_Accede_Sis', $Codigo)->get();
            return view("rol.editrol", compact('validated','privs','pr'));

    }

    public function actualizar(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',7)
        ->first();

        if(isset($priv)){

            $rol = Rol::find($request->Codigo);
            $privs = DB::table('Privilegio')->orderBy('Codigo')->get();
            Priv_Rol::where('FK_Accede_Sis', $request->Codigo)->delete();
        
            $rol->Tipo = $request->Tipo;
            $rol->save();

            foreach($privs as $priv){
                if($request->{$priv->tipo}){
                    Priv_Rol::create([
                        'Codigo' => Priv_Rol::max('Codigo')+1,
                        'FK_Opcion' => $priv->Codigo,
                        'FK_Accede_Sis' => $rol->Codigo
                    ]);
                }
            }

            Session::flash('message','Rol modificado correctamente.');
            return Redirect::to('/rol');
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }

    public function delete($Codigo){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',7)
        ->first();

        if(isset($priv)){

            Priv_Rol::where('FK_Accede_Sis', $Codigo)->delete();
            Rol::find($Codigo)->delete();
            Session::flash('messagedel','Rol eliminado correctamente.');
            return redirect('/rol');
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
}
