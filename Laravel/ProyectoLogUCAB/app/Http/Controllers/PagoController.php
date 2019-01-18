<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use LogUCAB\Contabilidad;
use LogUCAB\Pago;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use LogUCAB\Http\Requests;
use LogUCAB\Packet;
use LogUCAB\Tipo;
use LogUCAB\Lugar;
use LogUCAB\Envio;
use LogUCAB\Env_Rut;
use LogUCAB\Veh_Rut;
use LogUCAB\Office;
use LogUCAB\Client;
use LogUCAB\Ruta;
use LogUCAB\Audi;
use LogUCAB\Status;
use LogUCAB\Env_Sta;
use LogUCAB\Worker;
use LogUCAB\Zona;
use LogUCAB\Emp_Zon;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Input;
use Session;
use Carbon\Carbon;
use DB;

class PagoController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function store(Request $request){

        if(isset($request->paquete)){
            $ruta = Ruta::find($request->ruta);
            $paquete = Packet::find($request->paquete); 

            //Primero se crea el envio
            Envio::create([
                'Codigo' => Envio::max('Codigo')+1,
                'Monto' => $request->costo,
                'FK_Destino' => $request->destino,
            ]);

            //Al Paquete se le llena la foranea relacionada con Envio
            $paquete->FK_Transporta = Envio::max('Codigo');
            $paquete->save();

            //Se crea un registro de la MaM
            Env_Rut::create([
                'Codigo' => Env_Rut::max('Codigo')+1,
                'FK_Adquiere_Pa' => $ruta->Codigo,
                'FK_Recorre' => Envio::max('Codigo')
            ]);

            $oficina = Office::find($ruta->FK_Ofi_Origen);
            $zona = Zona::where('FK_Divide',$oficina->Codigo)->first();
            $Empzon = Emp_Zon::where('FK_Asiste',$zona->Codigo)->first();
            $worker = Worker::where('Empleado.Cedula','=',$Empzon->FK_Asignar)
            ->inRandomOrder()
            ->first();

            Status::create([
                'Codigo' => Status::max('Codigo')+1,
                'Descripcion' => 'Recibido en origen',
                'FK_Revision' => $worker->Cedula
            ]);
            Env_Sta::create([
                'Codigo' => Env_Sta::max('Codigo')+1,
                'FK_Encuentra_Sta' => Status::max('Codigo'),
                'FK_Revisa_Sta' => Envio::max('Codigo')
            ]);

            //Pago
            if($request->Clasificacion == 'a'){
                //Tarjeta
                DB::table('Tipo_Pago_Credit_Card')->create([
                    'Codigo' => DB::table('Tipo_Pago_Credit_Card')->max('Codigo')+1,
                    'Tipo_Tarjeta' => $request->Tipo_Tarjeta,
                    'Numero_Tarjeta' => $request->Numero_Tarjeta,
                    'Banco' => $request->Banco,
                    'Monto_Total' => $request->costo
                ]);
                Pago::create([
                    'Numero_unico' => Pago::max('Numero_unico')+1,
                    'Fecha' => Carbon::now()->format('Y-m-d'),
                    'Monto_Total' => $request->costo,
                    'FK_Costo' => $paquete->FK_Entrega,
                    'FK_Realiza' => Envio::max('Codigo'), 
                    'FK_Cancela2' => DB::table('Tipo_Pago_Credit_Card')->max('Codigo')
                ]);
                Contabilidad::create([
                    'Codigo' => Contabilidad::max('Codigo')+1,
                    'Fecha' => Carbon::now()->format('Y-m-d'),
                    'Monto' => $request->costo,
                    'Descripcion' => 'Pago envio con tarjeta',
                    'FK_Calcula' => Envio::max('Codigo')
                ]);
            }elseif($request->Clasificacion == 'm'){
                //Cheque
                DB::table('Tipo_Pago_Cheque')->create([
                    'Codigo' => DB::table('Tipo_Pago_Cheque')->max('Codigo')+1,
                    'Numero_Cheque' => $request->Numero_Cheque,
                    'Institucion_Financiera' => $request->Institucion_Financiera,
                    'Monto_Total' => $request->costo
                ]);
                Pago::create([
                    'Numero_unico' => Pago::max('Numero_unico')+1,
                    'Fecha' => Carbon::now()->format('Y-m-d'),
                    'Monto_Total' => $request->costo,
                    'FK_Costo' => $paquete->FK_Entrega,
                    'FK_Realiza' => Envio::max('Codigo'), 
                    'FK_Cancela3' => DB::table('Tipo_Pago_Cheque')->max('Codigo')
                ]);
                Contabilidad::create([
                    'Codigo' => Contabilidad::max('Codigo')+1,
                    'Fecha' => Carbon::now()->format('Y-m-d'),
                    'Monto' => $request->costo,
                    'Descripcion' => 'Pago envio con cheque',
                    'FK_Calcula' => Envio::max('Codigo')
                ]);
            }else{
                //Efectivo
                DB::table('Tipo_Pago_Efectivo')->create([
                    'Codigo' => DB::table('Tipo_Pago_Efectivo')->max('Codigo')+1,
                    'Total_Billetes' => $request->Total_Billetes,
                    'Monto_Total' => $request->costo
                ]);
                Pago::create([
                    'Numero_unico' => Pago::max('Numero_unico')+1,
                    'Fecha' => Carbon::now()->format('Y-m-d'),
                    'Monto_Total' => $request->costo,
                    'FK_Costo' => $paquete->FK_Entrega,
                    'FK_Realiza' => Envio::max('Codigo'), 
                    'FK_Cancela3' => DB::table('Tipo_Pago_Efectivo')->max('Codigo')
                ]);
                Contabilidad::create([
                    'Codigo' => Contabilidad::max('Codigo')+1,
                    'Fecha' => Carbon::now()->format('Y-m-d'),
                    'Monto' => $request->costo,
                    'Descripcion' => 'Pago envio efectivo',
                    'FK_Calcula' => Envio::max('Codigo')
                ]);
            }

            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Crea Pago',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
            Session::flash('message','Envio planificado correctamente.');
            return redirect('/envio/mostrar/'.Envio::max('Codigo'));
        }else{

            DB::table('Tipo_Pago_Efectivo')->create([
                'Codigo' => DB::table('Tipo_Pago_Efectivo')->max('Codigo')+1,
                'Total_Billetes' => $request->Total_Billetes,
                'Monto_Total' => $request->costo
            ]);
            Pago::create([
                'Numero_unico' => Pago::max('Numero_unico')+1,
                'Fecha' => Carbon::now()->format('Y-m-d'),
                'Monto_Total' => $request->costo,
                'FK_Costo' => $paquete->FK_Entrega,
                'FK_Realiza' => $request->envio, 
                'FK_Cancela3' => DB::table('Tipo_Pago_Efectivo')->max('Codigo')
            ]);
            Contabilidad::create([
                'Codigo' => Contabilidad::max('Codigo')+1,
                'Fecha' => Carbon::now()->format('Y-m-d'),
                'Monto' => $request->costo,
                'Descripcion' => 'Pago envio destino efectivo',
                'FK_Calcula' => $request->envio
            ]);

            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Paga en destino',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
            Session::flash('message','Envio cancelado correctamente.');
            return redirect('/envio/lista');
        }
    }
}
