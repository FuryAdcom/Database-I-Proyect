<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Ruta;
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
        return view("ruta.createruta");
    }

    public function store(Request $request){
        $lugar = Lugar::where('Lugar.Nombre', $request->lugar)
        ->where('Lugar.Tipo', 'Municipio')
        ->first();

        $max = Ruta::max('Ruta.Codigo');

        $request->lugar = $lugar->Codigo;

        $request->validate([
            'Nombre' => 'required',
            'Tamaño_Deposito' => 'required',
            'lugar' => 'required'
        ]);

        $ruta = new Ruta;
        $ruta->Codigo = $max + 1;
        $ruta->Nombre = $request->Nombre;
        $ruta->Tamaño_Deposito = $request->Tamaño_Deposito;
        $ruta->FK_Varios = $request->lugar;
        $ruta->save();

        Session::flash('message','Ruta creada correctamente.');
        return Redirect::to('/ruta/lista');
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
