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
use Carbon\Carbon;

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
        if($request->rol = 'Administrador'){
            $request->FK_Asignado_Puesto = 1;
        }else{
            $request->FK_Asignado_Puesto = 4;
        }

        $request->validate([
            'Cedula' => 'required',
            'Nombre' => 'required',
            'Apellido' => 'required',
            'Correo_Personal' => 'required',
            'Fecha_Nacimiento' => 'required',
            'estado_civil' => 'required',
            'Nivel_Academico' => 'required',
            'Profesion' => 'required',
            'Num_Hijos' => 'required',
            'Empleado_Cargo' => 'required',
            'FK_Asignado_Puesto' => 'required',
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
        $validated = Worker::where('Empleado.Cedula', $Cedula)
        ->leftjoin('Rol','Rol.Codigo','=','Empleado.FK_Asignado_Puesto')
        ->select(\DB::raw("\"Empleado\".*, \"Rol\".\"Tipo\" as rol"))
        ->first();
        return view("persona.empleado.editworker", compact('validated'));
    }

    public function actualizar(Request $request){
        $empleado = Worker::find($request->Cedula);
        $lugar = Lugar::find($request->FK_Habitacion);
        if($request->rol = 'Administrador'){
            $request->FK_Asignado_Puesto = 1;
        }else{
            $request->FK_Asignado_Puesto = 4;
        }
    
        $empleado->Nombre = $request->Nombre;
        $empleado->Apellido = $request->Apellido;
        $empleado->Correo_Personal = $request->Correo_Personal;
        $empleado->Fecha_Nacimiento = $request->Fecha_Nacimiento;
        $empleado->estado_civil = $request->estado_civil;
        $empleado->Nivel_Academico = $request->Nivel_Academico;
        $empleado->Profesion = $request->Profesion;
        $empleado->Num_Hijos = $request->Num_Hijos;
        $empleado->FK_Asignado_Puesto = $request->FK_Asignado_Puesto;
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
