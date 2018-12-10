<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Worker;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;


class WorkerController extends Controller
{
    public function __construct(){

    }

    public function inicio(){
        return view("persona.empleado.worker");
    }

    public function create(){
        return view("persona.empleado.createworker");
    }

    public function store(Request $request){

        $request->validate([
            'Nombre' => 'required',
            'Tamaño_deposito' => 'required',
            'Cantidad_vehiculos' => 'required',
            'Cantidad_empleados' => 'required',
            'Empleado_cargo' => 'required',
        ]);

        Worker::create($request->all());

        Session::flash('message','Empleado creado correctamente.');
        return Redirect::to('/empleado/lista');
    }
    
    public function lista(){
        $empleados = Worker::paginate(50);
        return view("persona.empleado.showworker", compact('empleados'));
    }

    public function edit($Cedula){
        $validated = Worker::where('Cedula', $Cedula)->first();
        return view("persona.empleado.editworker", compact('validated'));
    }

    public function actualizar(Request $request){
        $empleado = Worker::find($request->Cedula);
    
        $empleado->Nombre = $request->Nombre;
        $empleado->Tamaño_deposito = $request->Tamaño_deposito;
        $empleado->Cantidad_vehiculos = $request->Cantidad_vehiculos;
        $empleado->Cantidad_empleados = $request->Cantidad_empleados;
        $empleado->Empleado_cargo = $request->Empleado_cargo;
        $empleado->save();

        Session::flash('message','Empleado modificado correctamente.');
        return Redirect::to('/empleado/lista');
    }

    public function delete($Cedula){
        DB::table('empleado')->where('Cedula', $Cedula)->delete();
        Session::flash('messagedel','Empleado eliminado correctamente.');
        return redirect('/empleado/lista');
    }
}
