<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Office;
use LogUCAB\Lugar;
use LogUCAB\Phone;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use LogUCAB\Env_Rut;
use LogUCAB\Ruta;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Session;

use DB;

class OfficeController extends Controller
{
    public function __construct(){$this->middleware('auth');}

    public function inicio(){
        return view("oficina.office");
    }

    public function create(){
        return view("oficina.createoffice");
    }

    public function store(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',3)
        ->first();

        if(isset($priv)){
            $lugar = Lugar::where('Lugar.Nombre', $request->lugar)
            ->where('Lugar.Tipo', 'Municipio')
            ->first();
            $edo = Lugar::where('Lugar.Nombre', $request->est)
            ->where('Lugar.Tipo', 'Estado')
            ->first();
            
            if(isset($lugar->Nombre) && $lugar->FK_Lugar==$edo->Codigo){
                $request->lugar = $lugar->Codigo;

                $request->validate([
                    'Nombre' => 'required',
                    'Deposito' => 'required',
                    'lugar' => 'required',
                    'est' => 'required'
                ]);

                Office::create([
                    'Codigo' => (Office::max('Codigo')) + 1,
                    'Nombre' => $request->Nombre,
                    'Tamaño_Deposito' => $request->Deposito,
                    'FK_Varios' => $request->lugar
                ]);
                Phone::create([
                    'Numero' => $request->Telefono,
                    'tipo' => 'Oficina',
                    'FK_Telefonia' => Office::max('Codigo')
                ]);

            }elseif(isset($lugar->Nombre) && $lugar->FK_Lugar!=$edo->Codigo){
                Session::flash('message','El municipio '.$lugar->Nombre.' no existe en el estado '.$edo->Nombre.'.');
                return Redirect::back()->withInput(Input::all());
            }else{
                Session::flash('message','El municipio '.$request->lugar.' no existe.');
                return Redirect::back()->withInput(Input::all());
            }

            Session::flash('message','Oficina creada correctamente.');
            return Redirect::to('/oficina/lista');

        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
    
    public function lista(){
        $oficinas = Office::leftjoin('Lugar as mun', 'mun.Codigo','=','Oficina.FK_Varios')
        ->leftjoin('Lugar as est', 'est.Codigo','=','mun.FK_Lugar')
        ->select(\DB::raw("\"Oficina\".*, mun.\"Nombre\" as sitio, est.\"Nombre\" as estado"))
        ->paginate(50);
        $os = Office::get();
        $masenv = 0;
        $masrec = 0;
        $ofi = NULL;
        foreach($os as $o){

            $comp = Env_Rut::leftjoin('Ruta as r','r.Codigo','=','Env-Rut.FK_Adquiere_Pa')
            ->where('r.FK_Ofi_Origen',$o->Codigo)
            ->count();

            if(isset($comp) && $comp > $masenv){
                $masenv = $comp;
                $ofi = $o;
            }
        }
        $masenv = $ofi;
        //dd($masenv);
        foreach($os as $o){

            $comp = Env_Rut::leftjoin('Ruta as r','r.Codigo','=','Env-Rut.FK_Adquiere_Pa')
            ->where('r.FK_Ofi_Destino',$o->Codigo)
            ->count();

            if(isset($comp) && $comp > $masrec){
                $masrec = $comp;
                $ofi = $o;
            }
        }
        $masrec = $ofi;
    //    return $ofi; //Return para debug
        return view("oficina.showoffice", compact('oficinas','masenv','masrec'));
    }

    public function mostrar($Codigo){
        //Ira aqui mostrar ese elemento y relacionados
    }

    public function edit($Codigo){

        $validated = \LogUCAB\Office::where('Oficina.Codigo', $Codigo)
        ->leftjoin('Lugar', 'Lugar.Codigo','=','Oficina.FK_Varios')
        ->leftjoin('Telefono as tlf', 'tlf.FK_Telefonia','=','Oficina.Codigo')
        ->select(\DB::raw("\"Oficina\".*, \"Lugar\".\"Nombre\" as lugar, tlf.\"Numero\" as telf"))
        ->first();
        $lug = DB::table('Lugar')
        ->where('Lugar.Codigo', $validated->FK_Varios)
        ->first();
        $validated->est = \LogUCAB\Lugar::where('Lugar.Codigo', $lug->FK_Lugar)
        ->value('Nombre');
                     
        return view("oficina.editoffice", compact('validated'));
    }

    public function actualizar(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',3)
        ->first();

        if(isset($priv)){
            $oficina = Office::find($request->Codigo);
            $lugar = Lugar::where('Lugar.Nombre', $request->lugar)
            ->where('Lugar.Tipo', 'Municipio')
            ->first();
            $edo = Lugar::where('Lugar.Nombre', $request->est)
            ->where('Lugar.Tipo', 'Estado')
            ->first();
            $telefono = Phone::where('Telefono.FK_Telefonia', $request->Codigo)->first();
            $telfcomp = Phone::find($request->Telefono);
        
            if(isset($lugar) && $lugar->FK_Lugar==$edo->Codigo){

                $oficina->Nombre = $request->Nombre;
                $oficina->Tamaño_Deposito = $request->Tamaño_Deposito;
                $oficina->FK_Varios = $lugar->Codigo;
                $oficina->save();

                if(is_null($telefono)){
                    Phone::create([
                        'Numero' => $request->Telefono,
                        'tipo' => 'Oficina',
                        'FK_Telefonia' => Office::max('Codigo')
                    ]);    
                }elseif($telefono != $request->Telefono && is_null($telfcomp)){
                    $telefono->Numero = $request->Telefono;
                    $telefono->save();
                }

            }elseif(isset($lugar) && $lugar->FK_Lugar!=$edo->Codigo){
                Session::flash('message','El municipio '.$lugar->Nombre.' no existe en el estado '.$edo->Nombre.'.');
                return Redirect::back()->withInput(Input::all());
            }else{
                Session::flash('message','El municipio '.$request->lugar.' no existe.');
                return Redirect::back()->withInput(Input::all());
            }

            Session::flash('message','Oficina modificada correctamente.');
            return Redirect::to('/oficina/lista');

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
            DB::table('Oficina')->where('Codigo', $Codigo)->delete();
            Session::flash('messagedel','Oficina eliminada correctamente.');
            return redirect('/oficina/lista');

        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
}
