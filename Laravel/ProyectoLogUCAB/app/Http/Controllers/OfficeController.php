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
        //Completar esto
        $Lugar = Lugar::find($request->NombreLugar);

        $request->validate([
            'Nombre' => 'required',
            'Tamaño_deposito' => 'required',
            'FK_Varios' => 'required'
        ]);

        Office::create($request->all());

        Session::flash('message','Oficina creada correctamente.');
        return Redirect::to('oficina/lista');
    }
    
    public function lista(){
        $oficinas = Office::paginate(50);
        return view("oficina.showoffice", compact('oficinas'));
    }

    public function edit($Codigo){

        $validated = Office::where('Codigo', $Codigo)->first();
        return view("oficina.editoffice", compact('validated'));
    }

    public function actualizar(Request $request){
        $oficina = Office::find($request->Codigo);
    
        $oficina->Nombre = $request->Nombre;
        $oficina->Tamaño_deposito = $request->Tamaño_deposito;
        $oficina->Cantidad_vehiculos = $request->Cantidad_vehiculos;
        $oficina->Cantidad_empleados = $request->Cantidad_empleados;
        $oficina->Empleado_cargo = $request->Empleado_cargo;
        $oficina->save();

        Session::flash('message','Oficina modificada correctamente.');
        return Redirect::to('/oficina/lista');
    }

    public function delete($Codigo){
        DB::table('oficina')->where('Codigo', $Codigo)->delete();
        Session::flash('messagedel','Oficina eliminada correctamente.');
        return redirect('/oficina/lista');
    }
}
