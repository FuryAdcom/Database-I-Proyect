<?php

namespace LogUCAB\Http\Controllers;

use LogUCAB\Http\Requests;
use LogUCAB\Packet;
use LogUCAB\Lugar;
use LogUCAB\Tipo;
use LogUCAB\Client;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use LogUCAB\Audi;
use LogUCAB\Usuario;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Session;
use Carbon\Carbon;

use DB;

class PacketController extends Controller
{
    public function __construct(){$this->middleware('auth');}

        public function inicio(){
            return view("paquete.paquete");
        }
    
        public function create(){
            $clientes = Client::select()->orderBy('Nombre', 'asc')->get();

            return view("paquete.createpaquete", compact('clientes'));
        }
    
        public function store(Request $request){

            $guidenum = rand(1, 999999999);
            $comp = Packet::find($guidenum);
            while(isset($comp)){
                $guidenum = rand(1, 999999999);
                $comp = Packet::find($guidenum);
            }
    
                $request->validate([
                    'Destinatario' => 'required',
                    'Clasificacion' => 'required',
                    'Peso' => 'required',
                    'Ancho' => 'required',
                    'Largo' => 'required',
                    'Profundidad' => 'required',
                    'Telefono_Contacto' => 'required',
                    'FK_Entrega' => 'required'
                ]);
    
                Packet::create([
                    'Numero_guia' => $guidenum,
                    'Destinatario' => $request->Destinatario,
                    'Clasificacion' => $request->Clasificacion,
                    'Peso' => $request->Peso,
                    'Ancho' => $request->Ancho,
                    'Largo' => $request->Largo,
                    'Profundidad' => $request->Profundidad,
                    'Telefono_Contacto' => $request->Telefono_Contacto,
                    'FK_Entrega' => $request->FK_Entrega
                ]);
                Tipo::create([
                    'Codigo' => Tipo::max('Codigo'),
                    'Nombre' => 'Paquete',
                    'Descripcion' => $request->Clasificacion,
                    'Costo' => rand(1, 2000),
                    'FK_Es_de' => $guidenum
                ]);
    
                $user = Usuario::where('Correo', Auth::user()->email)->first();
                Audi::create([
                    'Codigo' => Audi::max('Codigo')+1,
                    'Usuario' => Auth::user()->name,
                    'Accion' => 'Crea Paquete',
                    'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                    'FK_Observa' => $user->Codigo
                ]);
            Session::flash('message','Paquete creado correctamente.');
            return Redirect::to('/paquete/lista');
        }
        
        public function lista(){

            $paquetes = Packet::leftjoin('Cliente as client', 'client.Cedula','=','Paquete.FK_Entrega')
            ->leftjoin('Ofi-Paq as op', 'op.FK_Llega','=','Paquete.Numero_guia')
            ->select(\DB::raw("\"Paquete\".*, client.\"Nombre\" as nombre, client.\"Apellido\" as apellido, op.created_at as creado"))
            ->orderBy('Paquete.Numero_guia')
            ->paginate(50);

            $actual = Carbon::now();
            foreach($paquetes as $p){
                if(isset($p->creado))
                    $p->creado = Carbon::parse($p->creado)->addHours(24);
            }

            $cliente = Client::where('Correo_Personal', Auth::user()->email)->first();

            if(is_null($cliente)){
                return view("paquete.showpaquete", compact('paquetes','actual'));
            }else{
                return view("paquete.showpaquete", compact('paquetes','actual', 'cliente'));
            }
        }
        public function listaprom(){

            $avgpeso = DB::select(DB::Raw("SELECT o.\"Codigo\" as Codigo, avg(paq.\"Peso\") as avgpeso
            from \"Paquete\" as paq, \"Env-Rut\" as er, \"Envio\" as e, \"Ruta\" as r, \"Oficina\" as o
            where paq.\"FK_Transporta\" = e.\"Codigo\" and e.\"Codigo\" = er.\"FK_Recorre\" and er.\"FK_Adquiere_Pa\" = r.\"Codigo\" and r.\"FK_Ofi_Origen\" = o.\"Codigo\"
            group by o.\"Codigo\""));

                return view("paquete.pesoprom", compact('avgpeso'));
        }
    
        public function mostrar($Codigo){
            //Ira aqui mostrar ese elemento y relacionados
        }
    
        public function edit($Codigo){
    
            $validated = Packet::where('Paquete.Numero_guia', $Codigo)
            ->first();
            $clientes = Client::select()->orderBy('Nombre', 'asc')->get();
                         
            return view("paquete.editpaquete", compact('validated','clientes'));
        }
    
        public function actualizar(Request $request){
            $paquete = Packet::find($request->Numero_guia);
    
            $paquete->Destinatario = $request->Destinatario;
            $paquete->Clasificacion = $request->Clasificacion;
            $paquete->Peso = $request->Peso;
            $paquete->Ancho = $request->Ancho;
            $paquete->Largo = $request->Largo;
            $paquete->Profundidad = $request->Profundidad;
            $paquete->Telefono_Contacto = $request->Telefono_Contacto;
            $paquete->FK_Entrega = $request->FK_Entrega;
            $paquete->FK_Transporta = $request->FK_Transporta;
            $paquete->save();
    
            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Modifica Paquete',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
            Session::flash('message','Paquete modificado correctamente.');
            return Redirect::to('/paquete/lista');
        }
    
        public function delete($Codigo){
            DB::table('Paquete')->where('Numero_guia', $Codigo)->delete();

            $user = Usuario::where('Correo', Auth::user()->email)->first();
            Audi::create([
                'Codigo' => Audi::max('Codigo')+1,
                'Usuario' => Auth::user()->name,
                'Accion' => 'Elimina Paquete',
                'Fecha_Ingreso' => Carbon::now()->format('Y-m-d'),
                'FK_Observa' => $user->Codigo
            ]);
            Session::flash('messagedel','Paquete eliminado correctamente.');
            return redirect('/paquete/lista');
        }
}
