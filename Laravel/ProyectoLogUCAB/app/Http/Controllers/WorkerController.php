<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Worker;
use LogUCAB\Lugar;
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
            'Apellido' => 'required',
            'Correo_Personal' => 'required',
            'Fecha_Nacimiento' => 'required',
            'estado_civil' => 'required',
            'Nivel_Academico' => 'required',
            'Profesion' => 'required',
            'Num_hijos' => 'required',
            'FK_Habitacion' => 'required',
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
        $lugar = Lugar::find($request->FK_Habitacion);
    
        $empleado->Nombre = $request->Nombre;
        $empleado->Apellido = $request->Apellido;
        $empleado->Correo_Personal = $request->Correo_Personal;
        $empleado->Fecha_Nacimiento = $request->Fecha_Nacimiento;
        $empleado->estado_civil = $request->estado_civil;
        $empleado->Nivel_Academico = $request->Nivel_Academico;
        $empleado->Profesion = $request->Profesion;
        $empleado->Num_hijos = $request->Num_hijos;
        $empleado->FK_Habitacion = $lugar->Codigo;
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
