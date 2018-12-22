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
        $oficinas = Office::select()
        ->orderBy('Nombre', 'asc')->get();
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

    public function agregar(Request $request){

        if(isset($request->FK_Ruta)){
            while(isset($request->FK_Ruta)){
                $rutaPrima = Ruta::where('Codigo', $request->FK_Ruta)->first();
            }

            $ofiog = Office::find($rutaPrima->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            if($ofiog->Codigo == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

        }else{
            $ofiog = Office::find($request->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            if($request->FK_Ofi_Origen == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

        }

        $max = Ruta::max('Codigo')+1;

        $oficina = Office::find($request->FK_Ofi_Origen)
        ->leftjoin('Vehiculo_Aereo as aero', 'aero.FK_Cuentacon', '=', 'Oficina.Codigo')
        ->leftjoin('Vehiculo_Maritimo as mar', 'mar.FK_Cuentacon', '=', 'Oficina.Codigo')
        ->leftjoin('Vehiculo_Terrestre as terra', 'terra.FK_Cuentacon', '=', 'Oficina.Codigo')
        ->select(\DB::raw("\"Oficina\".*, aero.\"Placa\" as avion, mar.\"Placa\" as barco, terra.\"Placa\" as auto"))
        ->first();

        return view('ruta.createruta2', compact('oficina','request','max'));
    }

    public function store(Request $request){

        $ofiog = Office::find($request->FK_Ofi_Origen);
        $lugar = Lugar::find($ofiog->FK_Varios);

        if(isset($request->FK_Ruta)){
            Ruta::create([
                'Codigo' => $request->Codigo,
                'Descripcion' => $request->Descripcion,
                'FK_Ruta' => $request->FK_Ruta,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $ofiog->Codigo,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);
        }else{
            Ruta::create([
                'Codigo' => $request->Codigo,
                'Descripcion' => $request->Descripcion,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $request->FK_Ofi_Origen,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);
        }

        if(isset($request->FK_Ruta)){
            while(isset($request->FK_Ruta)){
                $rutaPrima = Ruta::where('Codigo', $request->FK_Ruta)->first();
            }

            $ofiog = Office::find($rutaPrima->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            if($ofiog->Codigo == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

            Ruta::create([
                'Codigo' => Ruta::max('Codigo')+1,
                'Descripcion' => $request->Descripcion,
                'FK_Ruta' => $request->FK_Ruta,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $ofiog->Codigo,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);
        }else{
            $ofiog = Office::find($request->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            if($request->FK_Ofi_Origen == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

            Ruta::create([
                'Codigo' => Ruta::max('Codigo')+1,
                'Descripcion' => $request->Descripcion,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $request->FK_Ofi_Origen,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);
        }

        Session::flash('message','Ruta creada correctamente.');
        return redirect('/ruta/lista');
    }
    
    public function lista(){
        $rutas = Ruta::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->paginate(50);

        return view("ruta.showruta", compact('rutas'));
    }

    public function edit($Codigo){

        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $rutas = Ruta::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->orderBy('Ruta.Codigo', 'asc')->get();
        $validated = Ruta::where('Ruta.Codigo', $Codigo)
        ->leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->orderBy('Ruta.Codigo', 'asc')->first();

        return view("ruta.editruta", compact('validated','rutas','oficinas'));
    }

    public function actualizar(Request $request){
        $ruta = Ruta::where('Codigo', $request->Codigo)->first();

        if(isset($request->FK_Ruta)){
            while(isset($request->FK_Ruta)){
                $rutaPrima = Ruta::where('Codigo', $request->FK_Ruta)->first();
            }

            $ofiog = Office::find($rutaPrima->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            if($ofiog->Codigo == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

                $ruta->Descripcion = $request->Descripcion;
                $ruta->FK_Ruta = $request->FK_Ruta;
                $ruta->FK_Camino = $lugar->Codigo;
                $ruta->FK_Ofi_Origen = $ofiog->Codigo; 
                $ruta->FK_Ofi_Destino = $request->FK_Ofi_Destino;
                $ruta->save();

        }else{
            $ofiog = Office::find($request->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);

            if($request->FK_Ofi_Origen == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

                $ruta->Descripcion = $request->Descripcion;
                $ruta->FK_Ruta = NULL;
                $ruta->FK_Camino = $lugar->Codigo;
                $ruta->FK_Ofi_Origen = $request->FK_Ofi_Origen; 
                $ruta->FK_Ofi_Destino = $request->FK_Ofi_Destino;
                $ruta->save();

        }

        Session::flash('message','Ruta modificada correctamente.');
        return redirect('/ruta/lista');
    }

    public function delete($Codigo){
        DB::table('Ruta')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Ruta eliminada correctamente.');
        return redirect('/ruta/lista');
    }
}
