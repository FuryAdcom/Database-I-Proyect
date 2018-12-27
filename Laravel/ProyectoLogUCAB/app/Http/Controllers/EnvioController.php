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
use LogUCAB\Zona;
use LogUCAB\Emp_Zon;
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
        $paquetes = Packet::leftjoin('Cliente as client', 'client.Cedula','=','Paquete.FK_Entrega')
        ->select(\DB::raw("\"Paquete\".*, client.\"Nombre\" as nombre, client.\"Apellido\" as apellido"))
        ->get();

        return view("envio.createenvio", compact('rutas','paquetes'));
    }

    public function store(Request $request){

        $paquete = Packet::find($request->Paquete)->orderBy('Numero_guia');

        $ruta = Ruta::find($request->Ruta);

        $vehiculos = Veh_Rut::where('FK_Coche', $ruta->Codigo)->get();

        return view('envio.createenvio2', compact('vehiculos', 'paquete'));
    }
    public function store2(Request $request){

        $paquete = Packet::find($request->paquete);
        $cliente = Client::find($paquete->FK_Entrega);
        $vr = Veh_Rut::find($request->Vehiculo);
        $ruta = Ruta::find($vr->FK_Coche);
        $ofiog = Office::find($ruta->FK_Ofi_Origen);
        $ofidest = Office::find($ruta->FK_Ofi_Destino);
        $dest = Lugar::find($ofidest->FK_Varios);
        $route = $ruta->Codigo;

        //Para los VIP hay que poner 10% descuento
        if($cliente->L_Vip){
            if($paquete->Peso < 10){
                if($paquete->Clasificacion == 'Linea blanca'){
                $costo = (250 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Alimento'){
                $costo = (12 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Electrónica'){
                $costo = (60 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Vestimenta'){
                $costo = (80 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Juguete'){
                $costo = (20 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Automovil'){
                $costo = (500 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Medicamento'){
                $costo = (4 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Otro'){
                $costo = (130 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }else{
                $costo = (100 + $vr->Costo) * $paquete->Peso;
                $costo = ($costo*90)/100;
            }
        }else{

                if($paquete->Clasificacion == 'Linea blanca'){
                $costo = (250 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Alimento'){
                $costo = (12 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Electrónica'){
                $costo = (60 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Vestimenta'){
                $costo = (80 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Juguete'){
                $costo = (20 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Automovil'){
                $costo = (500 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Medicamento'){
                $costo = (4 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }elseif($paquete->Clasificacion == 'Otro'){
                $costo = (130 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
            }else{
                $costo = (100 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
                $costo = ($costo*90)/100;
                }
            }
        }else{
        if($paquete->Peso < 10){

            if($paquete->Clasificacion == 'Linea blanca'){
                $costo = (250 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Alimento'){
                $costo = (12 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Electrónica'){
                $costo = (60 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Vestimenta'){
                $costo = (80 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Juguete'){
                $costo = (20 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Automovil'){
                $costo = (500 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Medicamento'){
                $costo = (4 + $vr->Costo) * $paquete->Peso;
            }elseif($paquete->Clasificacion == 'Otro'){
                $costo = (130 + $vr->Costo) * $paquete->Peso;
            }else{
                $costo = (100 + $vr->Costo) * $paquete->Peso;
            }
        }else{

            if($paquete->Clasificacion == 'Linea blanca'){
                $costo = (250 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Alimento'){
                $costo = (12 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Electrónica'){
                $costo = (60 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Vestimenta'){
                $costo = (80 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Juguete'){
                $costo = (20 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Automovil'){
                $costo = (500 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Medicamento'){
                $costo = (4 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }elseif($paquete->Clasificacion == 'Otro'){
                $costo = (130 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }else{
                $costo = (100 + $vr->Costo) * (($paquete->Ancho) * ($paquete->Largo) * ($paquete->Profundidad));
            }
        }
    }
        //
            $est = Carbon::now()->addMinutes($vr->Duracion)->addHours(5)->format('d/m/Y - h:i:s A');


        Session::flash('message','Ruta creada correctamente.');
        return view('envio.createenvio3', compact('costo', 'paquete', 'est', 'request', 'ofiog', 'ofidest', 'dest', 'route'));
    }
    public function store3(Request $request){

        $ruta = Ruta::find($request->ruta)->first();
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

        $oficina = Office::find($ruta->FK_Ofi_Origen)->first();
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

        Session::flash('message','Envio planificado correctamente.');
        return redirect('/envio/mostrar/'.Envio::max('Codigo'));
    }
    
    public function lista(){
        //Esto cambiara debido a reportes
        $envios = Envio::leftjoin('Oficina as o','o.Codigo','=','Envio.FK_Destino')
        ->leftjoin('Paquete as p','p.FK_Transporta','=','Envio.Codigo')
        ->leftjoin('Cliente as c','c.Cedula','=','p.FK_Entrega')
        ->select(DB::raw("\"Envio\".*, o.\"Nombre\" as of, p.\"Numero_guia\" as paq, p.\"Destinatario\" as dest, c.\"Cedula\" as cli"))
        ->orderBy('Envio.Codigo')
        ->paginate(50);

        return view("envio.showenvio", compact('envios'));
    }

    //Mostrar el envio con un goal thermomether
    public function mostrar($Codigo){
        $envio = Envio::find($Codigo);
        $er = Env_Rut::where('FK_Recorre',$envio->Codigo)->first();
        $ruta = Ruta::find($er->FK_Adquiere_Pa);
        $vr = Veh_Rut::where('FK_Coche',$ruta->Codigo)->first();
        $oo = Office::find($ruta->FK_Ofi_Origen);
        $od = Office::find($ruta->FK_Ofi_Destino);
        $es = Env_Sta::where('FK_Revisa_Sta',$envio->Codigo)->first();
        $status = Status::find($es->FK_Encuentra_Sta);
        $packet = Packet::where('FK_Transporta',$envio->Codigo)->first();
        $cliente = Client::find($packet->FK_Entrega);
        $destino = Lugar::where('Lugar.Codigo',$envio->FK_Destino)
        ->leftjoin('Lugar as l','l.Codigo','=','Lugar.FK_Lugar')
        ->select(DB::raw("\"Lugar\".*, l.\"Nombre\" as est"))->first();
        
        $est =$envio->created_at->addMinutes($vr->Duracion)->addHours(5)->diffForHumans(Carbon::now());
        
        //Fechas
        if($status->Descripcion == 'Recibido en origen'){
            $amount = 0;
        }elseif($status->Descripcion == 'Trasladando'){
            $amount = 25;
            $fecha = $status->updated_at;
        }elseif($status->Descripcion == 'Transportando a destino'){
            $amount = 50;
            $fecha = $status->updated_at;
        }elseif($status->Descripcion == 'En espera de retiro'){
            $amount = 75;
            $fecha = $status->updated_at;
        }elseif($status->Descripcion == 'Entregado'){
            $amount = 100;
            $fecha = $status->updated_at;
        }

        return view("envio.mostrarenvio", compact('envio','es','status','packet','cliente','destino','amount','oo','od','est','recibido','fecha'));
    }

    //Para un boton que ira cambiando el termometro goal en la view "mostrar"
    public function status($Codigo){
        $envio = Envio::find($Codigo);
        $er = Env_Rut::where('FK_Recorre',$envio->Codigo)->first();
        $ruta = Ruta::find($er->FK_Adquiere_Pa);
        $vr = Veh_Rut::where('FK_Coche',$ruta->Codigo)->first();
        $oo = Office::find($ruta->FK_Ofi_Origen);
        $od = Office::find($ruta->FK_Ofi_Destino);
        $es = Env_Sta::where('FK_Revisa_Sta',$envio->Codigo)->first();
        $status = Status::find($es->FK_Encuentra_Sta);
        $packet = Packet::where('FK_Transporta',$envio->Codigo)->first();
        $cliente = Client::find($packet->FK_Entrega);
        $destino = Lugar::where('Lugar.Codigo',$envio->FK_Destino)
        ->leftjoin('Lugar as l','l.Codigo','=','Lugar.FK_Lugar')
        ->select(DB::raw("\"Lugar\".*, l.\"Nombre\" as est"))->first();

        $est =$envio->created_at->addMinutes($vr->Duracion)->addHours(5)->diffForHumans(Carbon::now());
        
        //Fechas
        if($status->Descripcion == 'Recibido en origen'){
            $status->Descripcion = 'Trasladando';
            $status->save();
            $amount = 25;
            $fecha = $status->updated_at;
        }elseif($status->Descripcion == 'Trasladando'){
            $status->Descripcion = 'Transportando a destino';
            $status->save();
            $amount = 50;
            $fecha = $status->updated_at;
        }elseif($status->Descripcion == 'Transportando a destino'){
            $status->Descripcion = 'En espera de retiro';
            $status->save();
            $amount = 75;
            $fecha = $status->updated_at;
        }elseif($status->Descripcion == 'En espera de retiro'){

            //Pago

            $status->Descripcion = 'Entregado';
            $status->save();
            $amount = 100;
            $fecha = $status->updated_at;
        }

        return view("envio.mostrarenvio", compact('envio','es','status','packet','cliente','destino','amount','oo','od','est','recibido','fecha'));
    }

    public function recibo($Codigo){

        $envio = Envio::where('Envio.Codigo',$Codigo)
        ->leftjoin('Paquete as p','p.FK_Transporta','=','Envio.Codigo')
        ->leftjoin('Cliente as c','c.Cedula','=','p.FK_Entrega')
        ->select(DB::raw("\"Envio\".*, p.\"Numero_guia\" as pnum,p.\"Destinatario\" as dest,p.\"Telefono_Contacto\" as cont,p.\"Clasificacion\" as class,p.\"Ancho\" as ancho,p.\"Largo\" as largo,p.\"Profundidad\" as prof,p.\"Peso\" as peso,c.\"Nombre\" as cnom, c.\"Apellido\" as cape, c.\"Cedula\" as cced, c.\"Empresa\" as cemp"))
        ->first();

        $er = Env_Rut::where('FK_Recorre',$envio->Codigo)->first();
        $ruta = Ruta::find($er->FK_Adquiere_Pa);
        $vr = Veh_Rut::where('FK_Coche',$ruta->Codigo)->first();
        if(isset($vr->FK_Camino)){
            $envio->via = 'Aerea';
            $envio->vplaca = $vr->FK_Camino;
        }elseif(isset($vr->FK_Camino2)){
            $envio->via = 'Marina';
            $envio->vplaca = $vr->FK_Camino2;
        }elseif(isset($vr->FK_Camino3)){
            $envio->via = 'Terrestre';
            $envio->vplaca = $vr->FK_Camino3;
        }

        $oo = Office::find($ruta->FK_Ofi_Origen);
        $od = Office::find($ruta->FK_Ofi_Destino);
        $es = Env_Sta::where('FK_Revisa_Sta',$envio->Codigo)->first();
        $status = Status::find($es->FK_Encuentra_Sta);
        $destino = Lugar::where('Lugar.Codigo',$envio->FK_Destino)
        ->leftjoin('Lugar as l','l.Codigo','=','Lugar.FK_Lugar')
        ->select(DB::raw("\"Lugar\".*, l.\"Nombre\" as est"))->first();

        $envio->ofnom = $oo->Nombre;
        $envio->ofnomd = $od->Nombre;
        $envio->mund = $destino->Nombre;
        $envio->estd = $destino->est;
        
        //Para el PDF recibo de envio, $order tiene que tener los datos necesarios
        //
        //return $order->getPdf('download'); // Returns the PDF as download
        return $envio->getPdf(); // Returns stream default
    }

    public function cancelar($Codigo){
        DB::table('Envio')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Envio cancelado correctamente.');
        return redirect('/envio/lista');
    }
}


