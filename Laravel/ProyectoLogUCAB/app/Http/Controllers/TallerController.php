<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Zona;
use LogUCAB\Lugar;
use LogUCAB\Office;
use LogUCAB\Worker;
use LogUCAB\Rol;
use LogUCAB\PC;
use LogUCAB\Taller;
use LogUCAB\Falla;
use LogUCAB\Priv_Rol;
use LogUCAB\VehiculoA;
use LogUCAB\VehiculoM;
use LogUCAB\VehiculoT;
use LogUCAB\Audi;
use LogUCAB\Contabilidad;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Session;
use Carbon\Carbon;

use DB;

class ZonaController extends Controller
{
    public function __construct(){$this->middleware('auth');}

        public function inicio(){
            $talleres = Taller::leftjoin('Lugar as lug', 'lug.Codigo','=','Taller.FK_Locacion')
            ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
            ->select(DB::raw('"Taller".*, lug."Nombre" as mun, estado."Nombre" as est'))
            ->orderBy('Taller.Codigo')
            ->paginate(50);
    
            return view("taller.taller", compact('talleres'));
        }
    
        public function create(){
            $muns = DB::select(DB::raw('SELECT Mun.*, L."Nombre" as est 
            from "Lugar" as Mun left join "Lugar" as L
            on L."Codigo" = Mun."FK_Lugar" 
            where Mun."Tipo" = \'Municipio\' order by Mun."Nombre" asc'));

            return view("taller.createtaller", compact('muns'));
        }
    
        public function store(Request $request){
            if(Auth::user()->rol == 6)
                $priv = 6;
            else
                $priv = NULL;
    
            if(isset($priv)){
                $contacto = PC::find($request->CI);
                
                if(is_null($contacto)){
        
                    Taller::create([
                        'Codigo' => (Taller::max('Codigo')) + 1,
                        'FK_Locacion' => $request->FK_Locacion
                    ]);
                    PC::create([
                        'CI' => $request->CI,
                        'Nombre' => $request->Nombre
                    ]);
                    Phone::create([
                        'Numero' => $request->TelefonoC,
                        'tipo' => 'Personal',
                        'FK_Comunicado' => $request->CI
                    ]);
                    Phone::create([
                        'Numero' => $request->Telefono,
                        'tipo' => 'Taller',
                        'FK_Dispositivo' => Taller::max('Codigo')
                    ]);
                    DB::table('Tall-Per.C')->create([
                        'Codigo' => DB::table('Tall-Per.C')->max('Codigo') + 1,
                        'FK_Conoce' => Taller::max('Codigo'),
                        'FK_Referente' => $request->CI 
                    ]);

                }else{
                    Session::flash('message','El contacto ya existe.');
                    return Redirect::back()->withInput(Input::all());
                }
        
                $user = Usuario::where('Correo', Auth::user()->email)->first();
                Audi::create([
                    'Codigo' => Audi::max('Codigo')+1,
                    'Usuario' => Auth::user()->name,
                    'Accion' => 'Crea Taller',
                    'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                    'FK_Observa' => $user->Codigo
                ]);
                Session::flash('message','Taller creado correctamente.');
                return Redirect::to('/taller');
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }
    
        public function edit($Codigo){
    
            $taller = Taller::where('Codigo', $Codigo)
            ->first();
            $contacto = PC::leftjoin('Tall-Per.C as TC','TC.FK_Conoce','=',$Codigo)
            ->where('Persona-Contacto.CI','TC.FK_Referente')
            ->first();
            $muns = DB::select(DB::raw('SELECT Mun.*, L."Nombre" as est 
            from "Lugar" as Mun left join "Lugar" as L
            on L."Codigo" = Mun."FK_Lugar" 
            where Mun."Tipo" = \'Municipio\' order by Mun."Nombre" asc'));
                         
            return view("taller.edittaller", compact('taller', 'contacto', 'oficinas'));
        }
    
        public function actualizar(Request $request){
            if(Auth::user()->rol == 6)
            $priv = 6;
        else
            $priv = NULL;

        if(isset($priv)){
            $taller = Taller::find($request->Codigo);
            $contactog = PC::find($request->CIog);
            $contacto = PC::find($request->CI);
            $TC = DB::table('Tall-Per.C as TP')->where('TP.FK_Referente',$request->CIog)->get();
            $telftog = Phone::where('FK_Dispositivo',$request->Codigo)->first();
            $telft = Phone::where('FK_Dispositivo',$request->Telefono)->first();
            $telfcog = Phone::where('FK_Comunicado',$request->CIog)->first();
            $telfc = Phone::where('FK_Comunicado',$request->TelefonoC)->first();
            
            //Edit here
            $taller->FK_Locacion = $request->FK_Locacion;
            $taller->save();
            if(isset($contacto) && $contactog != $contacto){
                Session::flash('message','Ya existe un contacto con la cedula '.$request->CI.'.');
                return Redirect::back()->withInput(Input::all());
            }else{
                $contactog->CI = $request->CI;
                $contactog->Nombre = $request->Nombre;
                $contactog->save();
                foreach($TC as $t){
                    $t->FK_Referente = $request->CI;
                    $t->save();
                }
            }
            if(isset($telft) && $telft != $telftog){
                Session::flash('message','Ya existe un telefono '.$request->Telefono.'.');
                return Redirect::back()->withInput(Input::all());
            }else{
                $telftog->Numero = $request->Telefono;
                $telfcog->save();
            }
            if(isset($telfc) && $telfc != $telfcog){
                Session::flash('message','Ya existe un telefono '.$request->TelefonoC.'.');
                return Redirect::back()->withInput(Input::all());
            }else{
                $telfcog->Numero = $request->TelefonoC;
                $telfcog->FK_Comunicado = $request->CI;
                $telfcog->save();
            }
    
            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Modifica Taller',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
            Session::flash('message','Taller creado correctamente.');
            return Redirect::to('/taller');
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
        }
    
        public function delete($Codigo){
            if(Auth::user()->rol == 6)
            $priv = 6;
        else
            $priv = NULL;
    
            if(isset($priv)){
                Taller::where('Codigo', $Codigo)->delete();

                $user = Usuario::where('Correo', Auth::user()->email)->first();
                Audi::create([
                    'Codigo' => Audi::max('Codigo')+1,
                    'Usuario' => Auth::user()->name,
                    'Accion' => 'Elimina Taller',
                    'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                    'FK_Observa' => $user->Codigo
                ]);
                Session::flash('messagedel','Taller eliminado correctamente.');
                return redirect('/taller');
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }

        public function flota($Codigo){
            if(Auth::user()->rol == 6)
                $priv = 6;
            else
                $priv = NULL;
    
            if(isset($priv)){
                $oficina = Office::find($Codigo);
                
                $talleres = Taller::leftjoin('Lugar as mun', 'mun.Codigo','=','Taller.FK_Varios')       
                ->leftjoin('Lugar as est', 'est.Codigo','=','mun.FK_Lugar')
                ->select(\DB::raw("\"Taller\".*, mun.\"Nombre\" as sitio, est.\"Nombre\" as estado"))
                ->get();
                return redirect('/taller/flotataller', compact('oficina', 'talleres'));
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }

        public function envio(Request $request){
            if(Auth::user()->rol == 6)
                $priv = 6;
            else
                $priv = NULL;
    
            if(isset($priv)){
                $taller = Taller::find($request->taller);
                $oficina = Office::find($request->oficina);

                $va = VehiculoA::where('FK_Cuentacon', $oficina->Codigo)->get();
                $vm = VehiculoM::where('FK_Cuentacon', $oficina->Codigo)->get();
                $vt = VehiculoT::where('FK_Cuentacon', $oficina->Codigo)->get();
                
                if(isset($va) || isset($vm) || isset($vt)){
                    Contabilidad::create([
                        'Codigo' => Contabilidad::max('Codigo')+1,
                        'Descripcion' => 'Envio de flota a taller',
                        'Monto' => 1000,
                        'Fecha' => Carbon::now()->format('Y-m-d')
                    ]);
                    if(isset($va)){
                        foreach($va as $a){
                            Veh_Tall::create([
                                'Codigo' => Veh_Tall::max('Codigo')+1,
                                'Flota_Revision' => 'De oficina: '.$oficina->Codigo,
                                'Fecha_Entrada' => Carbon::now()->format('Y-m-d'),
                                'Fecha_Salida_Prevista' => Carbon::now()->addDays(15)->format('Y-m-d'),
                                'Proxima_Fecha' => Carbon::now()->addMonths(6)->format('Y-m-d'),
                                'FK_Enviar' => $a->Placa,
                                'FK_Chequear' => $taller->Codigo,
                                'FK_Refleja' => Contabilidad::max('Codigo')
                            ]);
                            Falla::create([
                                'Codigo' => Falla::max('Codigo')+1,
                                'Descripcion' => $request->falla,
                                'FK_Enviar' => $a->Placa
                            ]);
                        }
                    }if(isset($vm)){
                        foreach($vm as $a){
                            Veh_Tall::create([
                                'Codigo' => Veh_Tall::max('Codigo')+1,
                                'Flota_Revision' => 'De oficina: '.$oficina->Codigo,
                                'Fecha_Entrada' => Carbon::now()->format('Y-m-d'),
                                'Fecha_Salida_Prevista' => Carbon::now()->addDays(15)->format('Y-m-d'),
                                'Proxima_Fecha' => Carbon::now()->addMonths(6)->format('Y-m-d'),
                                'FK_Enviar2' => $a->Placa,
                                'FK_Chequear' => $taller->Codigo,
                                'FK_Refleja' => Contabilidad::max('Codigo')
                            ]);
                            Falla::create([
                                'Codigo' => Falla::max('Codigo')+1,
                                'Descripcion' => $request->falla,
                                'FK_Enviar2' => $a->Placa
                            ]);
                        }
                    }if(isset($vt)){
                        foreach($vt as $a){
                            Veh_Tall::create([
                                'Codigo' => Veh_Tall::max('Codigo')+1,
                                'Flota_Revision' => 'De oficina: '.$oficina->Codigo,
                                'Fecha_Entrada' => Carbon::now()->format('Y-m-d'),
                                'Fecha_Salida_Prevista' => Carbon::now()->addDays(15)->format('Y-m-d'),
                                'Proxima_Fecha' => Carbon::now()->addMonths(6)->format('Y-m-d'),
                                'FK_Enviar3' => $a->Placa,
                                'FK_Chequear' => $taller->Codigo,
                                'FK_Refleja' => Contabilidad::max('Codigo')
                            ]);
                            Falla::create([
                                'Codigo' => Falla::max('Codigo')+1,
                                'Descripcion' => $request->falla,
                                'FK_Enviar3' => $a->Placa
                            ]);
                        }
                    }
                }

                $user = Usuario::where('Correo', Auth::user()->email)->first();
                Audi::create([
                    'Codigo' => Audi::max('Codigo')+1,
                    'Usuario' => Auth::user()->name,
                    'Accion' => 'Envia flota Taller',
                    'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                    'FK_Observa' => $user->Codigo
                ]);
                Session::flash('message','Se ha enviado la flota al taller seleccionado.');
                return redirect('/oficina/lista');
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }

        public function salida($Codigo){
            if(Auth::user()->rol == 6)
                $priv = 6;
            else
                $priv = NULL;
    
            if(isset($priv)){
                $oficina = Office::find($Codigo);

                $va = VehiculoA::where('FK_Cuentacon', $oficina->Codigo)->get();
                $vm = VehiculoM::where('FK_Cuentacon', $oficina->Codigo)->get();
                $vt = VehiculoT::where('FK_Cuentacon', $oficina->Codigo)->get();
                
                if(isset($va)){
                    foreach($va as $a){
                        $v = Veh_Tall::where('FK_Enviar', $a->Placa)->first();

                        $v->Fecha_Salida_Real = Carbon::now()->format('Y-m-d');
                        $v->save();
                    }
                    foreach($vm as $a){
                        $v = Veh_Tall::where('FK_Enviar2', $a->Placa)->first();

                        $v->Fecha_Salida_Real = Carbon::now()->format('Y-m-d');
                        $v->save();
                    }
                    foreach($vt as $a){
                        $v = Veh_Tall::where('FK_Enviar3', $a->Placa)->first();

                        $v->Fecha_Salida_Real = Carbon::now()->format('Y-m-d');
                        $v->save();
                    }
                }

                return redirect('/oficina/mostrar/'.$Codigo);
            }else{
                Session::flash('message','Usted no tiene permisos para realizar esta accion.');
                return Redirect::back()->withInput(Input::all());
            }
        }
}
