<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

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
use LogUCAB\Status;
use LogUCAB\Env_Sta;
use LogUCAB\Worker;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Input;
use Session;
use Carbon\Carbon;
use DB;

class EnvioController extends Controller
{
    public function __construct(){
    }

    public function inicio(){
        return view("envio.envio");
    }

    public function create(){
        $rutas = Ruta::select('Ruta.FK_Ofi_Origen', 'Ruta.FK_Ofi_Destino')
        ->distinct()
        ->leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->get();
        $paquetes = Packet::leftjoin('Cliente as client', 'client.Codigo','=','Paquete.FK_Entrega')
        ->select(\DB::raw("\"Paquete\".*, client.\"Nombre\" as nombre, client.\"Apellido\" as apellido"))
        ->get();

        return view("envio.createenvio", compact('rutas','paquetes'));
    }

    public function store(Request $request){

        $paquete = Packet::find($request->Paquete)->first();

        $ruta = Ruta::find($request->Ruta)->first();

        $vehiculos = Veh_Rut::where('FK_Coche', $ruta->Codigo)->get();

        return view('envio.createenvio2', compact('vehiculos', 'paquete'));
    }
    public function store2(Request $request){

        $paquete = Packet::find($request->paquete)->first();
        $vehiculo = Veh_Rut::find($request->Vehiculo)->first();
        $ruta = Ruta::find($vehiculo->FK_Coche)->first();
        $ofiog = Office::find($ruta->FK_Ofi_Origen)->first();
        $ofidest = Office::find($ruta->FK_Ofi_Destino)->first();
        $dest = Lugar::find($ofidest->FK_Varios)->first();
        $destino = $dest->Codigo;
        $route = $ruta->Codigo;


        //Para los VIP hay que poner 10% descuento
        if($paquete->Peso < 10){

            if($paquete->Clasificacion == 'Linea blanca'){
                $costo = (250 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Alimento'){
                $costo = (12 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Electrónica'){
                $costo = (60 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Vestimenta'){
                $costo = (80 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Juguete'){
                $costo = (20 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Automovil'){
                $costo = (500 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Medicamento'){
                $costo = (4 + $vehiculo->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Otro'){
                $costo = (130 + $vehiculo->Costo) * $paquete->Peso;
            }
        }else{

            if($paquete->Clasificacion == 'Linea blanca'){
                $costo = (250 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Alimento'){
                $costo = (12 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Electrónica'){
                $costo = (60 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Vestimenta'){
                $costo = (80 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Juguete'){
                $costo = (20 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Automovil'){
                $costo = (500 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Medicamento'){
                $costo = (4 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }elseif($paquete->Clasificacion == 'Otro'){
                $costo = (130 + $vehiculo->Costo) * (($paquete->Ancho/100) * ($paquete->Largo/100) * ($paquete->Profundidad/100));
            }
        }
        //

        $est = Carbon::now()->addMinutes($vehiculo->Duracion)->addHours(5)->format('l jS \\of F Y h:i:s A');

        Session::flash('message','Ruta creada correctamente.');
        return view('envio.createenvio3', compact('costo', 'paquete', 'est', 'request', 'ofiog', 'ofidest', 'destino', 'route'));
    }
    public function store3(Request $request){

        $ruta = Ruta::find($request->ruta)->first();
        $paquete = Packet::find($request->paquete)->first();

        //Primero se crea el envio
        Envio::create([
            'Codigo' => Envio::max('Codigo')+1,
            'Monto' => $request->costo,
            'FK_Destino' => $request->destino
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

        $oficina = Office::find($ruta->FK_Ofi_Origen)->first();
        $lugar = Lugar::find($oficina->FK_Varios)->first();
        //Hay que crear Zona
       // $worker = Worker::where();

        //::inRandomOrder()->get();
        Status::create([
            'Codigo' => Status::max('Codigo')+1,
            'Descripcion' => 'Recibido en '.$oficina->Nombre,
            //'FK_Revision' => 
        ]);

        Session::flash('message','Envio creado correctamente.');
        return redirect('/envio/lista');
    }
    
    public function lista(){
        $envios = Envio::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->paginate(50);

        return view("envio.showenvio", compact('envios'));
    }

    public function cancelar($Codigo){
        DB::table('Envio')->where('Cedula', $Codigo)->delete();
        Session::flash('messagedel','Envio cancelado correctamente.');
        return redirect('/envio/lista');
    }
}
