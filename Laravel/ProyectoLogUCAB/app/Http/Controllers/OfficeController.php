<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Office;
use LogUCAB\Lugar;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;


class OfficeController extends Controller
{
    public function __construct(){

    }

    public function inicio(){
        return view("oficina.office");
    }

    public function create(){
        return view("oficina.createoffice");
    }

    public function store(Request $request){
        $lugar = Lugar::where('Lugar.Nombre', $request->lugar)
        ->where('Lugar.Tipo', 'Municipio')
        ->first();

        $max = Office::max('Oficina.Codigo');

        $request->lugar = $lugar->Codigo;

        $request->validate([
            'Nombre' => 'required',
            'Tamaño_Deposito' => 'required',
            'lugar' => 'required'
        ]);

        $office = new Office;
        $office->Codigo = $max + 1;
        $office->Nombre = $request->Nombre;
        $office->Tamaño_Deposito = $request->Tamaño_Deposito;
        $office->FK_Varios = $request->lugar;
        $office->save();

        Session::flash('message','Oficina creada correctamente.');
        return Redirect::to('/oficina/lista');
    }
    
    public function lista(){
        $oficinas = Office::leftjoin('Lugar', 'Lugar.Codigo','=','Oficina.FK_Varios')
        ->select(\DB::raw("\"Oficina\".*, \"Lugar\".\"Nombre\" as sitio"))
        ->paginate(50);

        return view("oficina.showoffice", compact('oficinas'));
    }

    public function edit($Codigo){

        $validated = \LogUCAB\Office::where('Oficina.Codigo', $Codigo)
        ->leftjoin('Lugar', 'Lugar.Codigo','=','Oficina.FK_Varios')
        ->select(\DB::raw("\"Oficina\".*, \"Lugar\".\"Nombre\" as sitio"))
        ->first();

        return view("oficina.editoffice", compact('validated'));
    }

    public function actualizar(Request $request){
        $oficina = Office::find($request->Codigo);
        $lugar = Lugar::where('Lugar.Nombre', $request->sitio)
        ->where('Lugar.Tipo', 'Municipio')
        ->first();
    
        $oficina->Nombre = $request->Nombre;
        $oficina->Tamaño_Deposito = $request->Tamaño_Deposito;
        $oficina->FK_Varios = $lugar->Codigo;
        $oficina->save();

        Session::flash('message','Oficina modificada correctamente.');
        return Redirect::to('/oficina/lista');
    }

    public function delete($Codigo){
        DB::table('Oficina')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Oficina eliminada correctamente.');
        return redirect('/oficina/lista');
    }
}
