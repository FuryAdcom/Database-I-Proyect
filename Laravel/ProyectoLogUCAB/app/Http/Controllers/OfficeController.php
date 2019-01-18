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
use LogUCAB\Ofi_Ser;
use LogUCAB\Servicio;
use LogUCAB\VehiculoM;
use LogUCAB\VehiculoT;
use LogUCAB\Veh_Tall;
use LogUCAB\Audi;
use LogUCAB\Usuario;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Session;
use Carbon\Carbon;

use DB;

class OfficeController extends Controller
{
    public function __construct(){$this->middleware('auth');}

    public function inicio(){
        return view("oficina.office");
    }

    public function create(){
        $estados = Lugar::where('Tipo','Estado')->orderBy('Nombre')->get();
        $muns = Lugar::leftjoin('Lugar as l','l.Codigo','=','Lugar.FK_Lugar')
        ->where('Lugar.Tipo','Municipio')
        ->select(DB::raw("\"Lugar\".*, l.\"Nombre\" as est"))
        ->orderBy('Lugar.Nombre')->get();

        return view("oficina.createoffice",compact('estados','muns'));
    }

    public function store(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',3)
        ->first();

        if(isset($priv)){
            $edo = Lugar::where('Lugar.Nombre', $request->est)
            ->where('Lugar.Tipo', 'Estado')
            ->first();
            $lugar = Lugar::where('Lugar.Nombre', $request->lugar)
            ->where('Lugar.Tipo', 'Municipio')
            ->where('Lugar.FK_Lugar',$edo->Codigo)
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

            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Crea Oficina',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
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
        ->orderby('Oficina.Codigo')
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
    public function listaestado(){
        $oficinas = Office::leftjoin('Lugar as mun', 'mun.Codigo','=','Oficina.FK_Varios')
        ->leftjoin('Lugar as est', 'est.Codigo','=','mun.FK_Lugar')
        ->select(\DB::raw("\"Oficina\".\"Codigo\",\"Oficina\".\"Nombre\",\"Oficina\".\"Tamaño_Deposito\", est.\"Nombre\" as estado"))
        ->orderby('est.Nombre','asc')
        ->orderby('Oficina.Nombre')
        ->paginate(50);

        return view("oficina.listaestado", compact('oficinas'));
    }

    public function mostrar($Codigo){
        $oficina = Office::find($Codigo) 
        ->leftjoin('Lugar as mun', 'mun.Codigo','=','Oficina.FK_Varios')       
        ->leftjoin('Lugar as est', 'est.Codigo','=','mun.FK_Lugar')
        ->select(\DB::raw("\"Oficina\".*, mun.\"Nombre\" as sitio, est.\"Nombre\" as estado"));
        $vt = VehiculoT::where('FK_Cuentacon', $oficina->Codigo)->first();
        $vm = VehiculoM::where('FK_Cuentacon', $oficina->Codigo)->first();

        if(isset($vt)){
            $tt = Veh_Tall::where('FK_Enviar3', $vt->Placa)->first();
        }
        if(isset($vm)){
            $tm = Veh_Tall::where('FK_Enviar2', $vm->Placa)->first();
        }

        $comp = false;
        if(isset($tt)){
            if(is_null($tt->Fecha_Salida_Real))
                $comp = true;
        }elseif(isset($tm)){
            if(is_null($tm->Fecha_Salida_Real))
                $comp = true;
        }

        return view("oficina.mostraroffice", compact('oficina','comp'));
    }

    public function servicio($Codigo){
        $oficina = Office::find($Codigo)        
        ->leftjoin('Lugar as mun', 'mun.Codigo','=','Oficina.FK_Varios')       
        ->leftjoin('Lugar as est', 'est.Codigo','=','mun.FK_Lugar')
        ->select(\DB::raw("\"Oficina\".*, mun.\"Nombre\" as sitio, est.\"Nombre\" as estado"));

        return view("oficina.servicio", compact('oficina'));
    }
    public function servpago(Request $request){
        $servicio = Servicio::where('Descripcion', $request->Serv)->first();

        Contabilidad::create([
            'Monto' => $request->Monto_Total,
            'Descripcion' => 'Pago '.$request->Serv,
            'Fecha' => Carbon::now()->format('Y-m-d'),
            'Codigo' => Contabilidad::max('Codigo')+1
        ]);
        Ofi_Ser::create([
            'FK_Gasta' => $request->of,
            'FK_Pago' => Contabilidad::max('Codigo'),
            'FK_Ofrece' => $servicio->Codigo,
            'Codigo' => Ofi_Ser::max('Codigo')+1
        ]);

        $user = Usuario::where('Correo', Auth::user()->email)->first();
        Audi::create([
            'Codigo' => Audi::max('Codigo')+1,
            'Usuario' => Auth::user()->name,
            'Accion' => 'Cancela Servicio',
            'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
            'FK_Observa' => $user->Codigo
        ]);
        return view("oficina.showoffice");
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

        $estados = Lugar::where('Tipo','Estado')->orderBy('Nombre')->get();
        $muns = Lugar::leftjoin('Lugar as l','l.Codigo','=','Lugar.FK_Lugar')
        ->where('Lugar.Tipo','Municipio')
        ->select(DB::raw("\"Lugar\".*, l.\"Nombre\" as est"))
        ->orderBy('Lugar.Nombre')->get();

                     
        return view("oficina.editoffice", compact('validated','estados','muns'));
    }

    public function actualizar(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',3)
        ->first();

        if(isset($priv)){
            $oficina = Office::find($request->Codigo);
            $edo = Lugar::where('Lugar.Nombre', $request->est)
            ->where('Lugar.Tipo', 'Estado')
            ->first();
            $lugar = Lugar::where('Lugar.Nombre', $request->lugar)
            ->where('Lugar.Tipo', 'Municipio')
            ->where('Lugar.FK_Lugar',$edo->Codigo)
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

            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Modifica Oficina',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
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

            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Elimina Oficina',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
            Session::flash('messagedel','Oficina eliminada correctamente.');
            return redirect('/oficina/lista');

        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
}
