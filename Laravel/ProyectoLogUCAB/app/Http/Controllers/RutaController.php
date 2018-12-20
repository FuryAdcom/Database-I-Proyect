<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Ruta;
use LogUCAB\Lugar;
use LogUCAB\Office;
use LogUCAB\Ofi_Rut;
use LogUCAB\Env_Rut;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;


class RutaController extends Controller
{
    public function __construct(){
    }

    public function inicio(){
        return view("ruta.ruta");
    }

    public function create(){
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $rutas = Ruta::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->orderBy('Ruta.Codigo', 'asc')->get();

        return view("ruta.createruta", compact('oficinas', 'rutas'));
    }

    public function store(Request $request){

        if($request->FK_Ofi_Origen == $request->FK_Ofi_Destino){
            Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
            return Redirect::back()->withInput(Input::all());
        }

        if(isset($request->FK_Ruta)){
            while(isset($request->FK_Ruta)){
                $rutaPrima = Ruta::where('Codigo', $request->FK_Ruta)->first();
            }

            $ofiog = Office::find($rutaPrima->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            Ruta::create([
                'Codigo' => Ruta::max('Codigo')+1,
                'Descripcion' => $request->Descripcion,
                'FK_Ruta' => $request->FK_Ruta,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $ofiog->Codigo,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);
        }



        
        
        
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();

        return redirect('/ruta/lista');
    }
    
    public function lista(){
        $rutas = Ruta::leftjoin('Lugar', 'Lugar.Codigo','=','Ruta.FK_Camino')
        ->leftjoin('Ofi-Rut', 'Ofi-Rut.Codigo','=','Ruta.FK_Varios')
        ->select(\DB::raw("\"Ruta\".*, \"Lugar\".\"Nombre\" as sitio"))
        ->paginate(50);

        return view("ruta.showruta", compact('rutas'));
    }

    public function edit($Codigo){

        $validated = \LogUCAB\Ruta::where('Ruta.Codigo', $Codigo)
        ->leftjoin('Lugar', 'Lugar.Codigo','=','Ruta.FK_Varios')
        ->select(\DB::raw("\"Ruta\".*, \"Lugar\".\"Nombre\" as sitio"))
        ->first();

        return view("ruta.editruta", compact('validated'));
    }

    public function actualizar(Request $request){
        $ruta = Ruta::find($request->Codigo);
        $lugar = Lugar::where('Lugar.Nombre', $request->sitio)
        ->where('Lugar.Tipo', 'Municipio')
        ->first();
    
        $ruta->Nombre = $request->Nombre;
        $ruta->Tamaño_Deposito = $request->Tamaño_Deposito;
        $ruta->FK_Varios = $lugar->Codigo;
        $ruta->save();

        Session::flash('message','Ruta modificada correctamente.');
        return Redirect::to('/ruta/lista');
    }

    public function delete($Codigo){
        DB::table('Ruta')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Ruta eliminada correctamente.');
        return redirect('/ruta/lista');
    }
}
