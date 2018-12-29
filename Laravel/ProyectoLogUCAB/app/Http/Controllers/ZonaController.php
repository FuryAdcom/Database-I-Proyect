<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Zona;
use LogUCAB\Lugar;
use LogUCAB\Office;
use LogUCAB\Worker;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Session;

use DB;

class ZonaController extends Controller
{
    public function __construct(){$this->middleware('auth');}

        public function inicio(){
            return view("oficina.zona.zona");
        }
    
        public function create(){
            $oficinas = Office::leftjoin('Lugar as lug', 'lug.Codigo','=','Oficina.FK_Varios')
            ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
            ->select(DB::raw('"Oficina".*, lug."Nombre" as mun, estado."Nombre" as est'))
            ->orderBy('Oficina.Nombre', 'asc')->get();

            return view("oficina.zona.createzona", compact('oficinas'));
        }
    
        public function store(Request $request){
            $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
            ->where('FK_Opcion',3)
            ->first();
    
            if(isset($priv)){
                $oficina = Office::find($request->FK_Divide)->first();
                $samename = Zona::where('Zona.Nombre', $request->Nombre)
                ->where('Zona.FK_Divide', $request->FK_Divide)->first();
                
                if(is_null($samename)){
        
                    Zona::create([
                        'Codigo' => (Zona::max('Codigo')) + 1,
                        'Nombre' => $request->Nombre,
                        'Descripcion' => $request->Descripcion,
                        'Division_area' => $request->Division_area,
                        'FK_Divide' => $request->FK_Divide
                    ]);

                }else{
                    Session::flash('message','El nombre de la zona: '.$request->Nombre.' ya existe en la oficina'.$oficina->Nombre.'.');
                    return Redirect::back()->withInput(Input::all());
                }
        
                Session::flash('message','Zona creada correctamente.');
                return Redirect::to('/zona/lista');
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }
        
        public function lista(){
            
            $zonas = Zona::leftjoin('Oficina as of', 'of.Codigo','=','Zona.FK_Divide')
            ->leftjoin('Lugar as lug', 'lug.Codigo','=','of.FK_Varios')
            ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
            ->select(DB::raw('"Zona".*, of."Nombre" as ofi, lug."Nombre" as mun, estado."Nombre" as est'))
            ->orderBy('FK_Divide')
            ->paginate(50);
    
            return view("oficina.zona.showzona", compact('zonas'));
        }
    
        public function mostrar($Codigo){
            //Ira aqui mostrar ese elemento y relacionados
        }
    
        public function edit($Codigo){
    
            $validated = Zona::where('Zona.Codigo', $Codigo)
            ->first();
            $oficinas = Office::leftjoin('Lugar as lug', 'lug.Codigo','=','Oficina.FK_Varios')
            ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
            ->select(DB::raw('"Oficina".*, lug."Nombre" as mun, estado."Nombre" as est'))
            ->orderBy('Oficina.Nombre', 'asc')->get();
                         
            return view("oficina.zona.editzona", compact('validated', 'oficinas'));
        }
    
        public function actualizar(Request $request){
            $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
            ->where('FK_Opcion',3)
            ->first();
    
            if(isset($priv)){
                $zona = Zona::find($request->Codigo);
                $oficina = Office::find($request->FK_Divide);
                $samename = Zona::select(DB::raw('COUNT(Zona.Codigo) as cuenta'))
                ->where('Zona.Nombre', $request->Nombre)
                ->where('Zona.FK_Divide', $request->FK_Divide);
                
                if($samename == 0){
        
                    $zona->Nombre = $request->Nombre;
                    $zona->Descripcion = $request->Descripcion;
                    $zona->Division_area = $request->Division_area;
                    $zona->FK_Divide = $request->FK_Divide;
                    $zona->save();
        
                }else{
                    Session::flash('message','El nombre de la zona: '.$request->Nombre.' ya existe en la oficina'.$oficina->Nombre.'.');
                    return Redirect::back()->withInput(Input::all());
                }
        
                Session::flash('message','Zona modificada correctamente.');
                return Redirect::to('/zona/lista');
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }
    
        public function delete($Codigo){
            $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
            ->where('FK_Opcion',3)
            ->first();
    
            if(isset($priv)){
                DB::table('Zona')->where('Codigo', $Codigo)->delete();
                Session::flash('messagedel','Zona eliminada correctamente.');
                return redirect('/zona/lista');
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }
}
