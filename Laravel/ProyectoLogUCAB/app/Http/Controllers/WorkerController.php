<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Worker;
use LogUCAB\Lugar;
use LogUCAB\Office;
use LogUCAB\Phone;
use LogUCAB\Rol;
use LogUCAB\Zona;
use LogUCAB\Emp_Zon;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
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
        $rols = Rol::select()->whereNotBetween('Codigo', [1, 3])->orderBy('Codigo', 'asc')->get();
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $muns = DB::select(DB::raw('SELECT Mun.*, L."Nombre" as est 
        from "Lugar" as Mun left join "Lugar" as L
        on L."Codigo" = Mun."FK_Lugar" 
        where Mun."Tipo" = \'Municipio\' order by Mun."Nombre" asc'));
        $zonas = Zona::leftjoin('Oficina as of', 'of.Codigo', '=' , 'Zona.FK_Divide')
        ->leftjoin('Lugar as lug', 'lug.Codigo','=','of.FK_Varios')
        ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
        ->select(DB::raw('"Zona".*, of."Nombre" as oficina, log."Nombre" as mun, estado."Nombre" as est'))
        ->get();

        return view("persona.empleado.createworker", compact('rols', 'oficinas', 'muns', 'zonas'));
    }

    public function store(Request $request){
        $empleado = Worker::find($request->Cedula);

        if(isset($empleado)){
            Session::flash('message','Ya existe un empleado con la cédula: "'.$request->Cedula.'".');
            return Redirect::back()->withInput(Input::all());
        }else{
            $empleado = Worker::where('Correo_Personal', $request->Correo_Personal)->first();

            if(isset($empleado)){
                Session::flash('message','Ya existe un empleado con el correo: "'.$request->Correo_Personal.'".');
                return Redirect::back()->withInput(Input::all());
            }else{
                $empleado = Worker::where('Empleado_Cargo',$request->Empleado_Cargo)->first();

                if(isset($empleado) && isset($request->Empleado_Cargo)){
                    Session::flash('message','Ya existe un empleado asignado a la oficina: "'.$request->Empleado_Cargo.'".');
                    return Redirect::back()->withInput(Input::all());
                }
            }
        }

        Worker::create([
            'Cedula' => $request->Cedula,
            'Nombre' => $request->Nombre,
            'Apellido' => $request->Apellido,
            'Correo_Personal' => $request->Correo_Personal,
            'Fecha_Nacimiento' => $request->Fecha_Nacimiento,
            'estado_civil' => $request->estado_civil,
            'Nivel_Academico' => $request->Nivel_Academico,
            'Profesion' => $request->Profesion,
            'Num_Hijos' => $request->Num_Hijos,
            'Empleado_Cargo' => $request->Empleado_Cargo,
            'FK_Asignado_Puesto' => $request->FK_Asignado_Puesto,
            'FK_Habitacion' => $request->FK_Habitacion,
        ]);
        Phone::create([
            'Numero' => $request->Telefono,
            'tipo' => 'Personal',
            'FK_Telefonia' => $request->Cedula
        ]);
        Emp_Zon::create([
            'Codigo' => Emp_Zon::max('Codigo')+1,
            'FK_Asiste' => $request->Cedula,
            'FK_Asignar' => $request->Zona
        ]);

        Session::flash('message','Empleado creado correctamente.');
        return Redirect::to('/empleado/lista');
    }
    
    public function lista(){
        $empleados = Worker::leftjoin('Lugar as mun', 'mun.Codigo','=','Empleado.FK_Habitacion')
        ->leftjoin('Rol as rol', 'rol.Codigo','=','Empleado.FK_Asignado_Puesto')
        ->select(\DB::raw("\"Empleado\".*, mun.\"Nombre\" as sitio, rol.\"Tipo\" as rolt"))
        ->paginate(50);
        return view("persona.empleado.showworker", compact('empleados'));
    }

    public function edit($Cedula){
        $rols = Rol::select()->whereNotBetween('Codigo', [1, 3])->orderBy('Codigo', 'asc')->get();
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $muns = DB::select(DB::raw('SELECT Mun.*, L."Nombre" as est 
        from "Lugar" as Mun left join "Lugar" as L
        on L."Codigo" = Mun."FK_Lugar" 
        where Mun."Tipo" = \'Municipio\' order by Mun."Nombre" asc'));
        $validated = Worker::where('Empleado.Cedula', $Cedula)
        ->first();
        $telf = Phone::where('Telefono.FK_Telefonia', $validated->Cedula)->first();
        $zonas = Zona::leftjoin('Oficina as of', 'of.Codigo', '=' , 'Zona.FK_Divide')
        ->leftjoin('Lugar as lug', 'lug.Codigo','=','of.FK_Varios')
        ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
        ->select(DB::raw('"Zona".*, of."Nombre" as oficina, log."Nombre" as mun, estado."Nombre" as est'))
        ->get();

        Session::flash('msg','Favor introducir la oficina de la que esta encargado, si la casilla esta seleccionada.');
        return view("persona.empleado.editworker", compact('rols', 'validated', 'muns', 'oficinas', 'telf', 'zonas'));
    }

    public function actualizar(Request $request){
        $empleadoOG = Worker::find($request->CedulaAnt);
        $empleado = Worker::find($request->Cedula);
        $lugar = Lugar::find($request->FK_Habitacion);
        $telefono = Phone::where('Telefono.FK_Telefonia', $request->CedulaAnt)->first();
        $telfcomp = Phone::find($request->Telefono)->first();
        $zona = Emp_Zon::where('Emp-Zon.FK_Asiste', $request->CedulaAnt)->first();
    
        if(isset($empleado) && $empleado != $empleadoOG){
            Session::flash('message','Ya existe un empleado con la cédula: "'.$request->Cedula.'".');
            return Redirect::back()->withInput(Input::all());
        }else{
            $empleado = Worker::where('Correo_Personal', $request->Correo_Personal)->first();

            if(isset($empleado) && $empleado != $empleadoOG){
                Session::flash('message','Ya existe un empleado con el correo: "'.$request->Correo_Personal.'".');
                return Redirect::back()->withInput(Input::all());
            }else{
                $empleado = Worker::where('Empleado_Cargo',$request->Empleado_Cargo)->first();

                if(isset($empleado) && isset($request->Empleado_Cargo) && $empleado != $empleadoOG){
                    Session::flash('message','Ya existe un empleado asignado a la oficina: "'.$request->Empleado_Cargo.'".');
                    return Redirect::back()->withInput(Input::all());
                }
            }
        }

        $empleadoOG->Nombre = $request->Cedula;
        $empleadoOG->Nombre = $request->Nombre;
        $empleadoOG->Apellido = $request->Apellido;
        $empleadoOG->Correo_Personal = $request->Correo_Personal;
        $empleadoOG->Fecha_Nacimiento = $request->Fecha_Nacimiento;
        $empleadoOG->estado_civil = $request->estado_civil;
        $empleadoOG->Nivel_Academico = $request->Nivel_Academico;
        $empleadoOG->Profesion = $request->Profesion;
        $empleadoOG->Num_Hijos = $request->Num_Hijos;
        $empleadoOG->FK_Asignado_Puesto = $request->FK_Asignado_Puesto;
        $empleadoOG->FK_Habitacion = $request->FK_Habitacion;
        $empleadoOG->save();

        if($telefono->Numero != $request->Telefono && is_null($telfcomp)){
            $telefono->Numero = $request->Telefono;
            $telefono->save();
        }
        if($zona->FK_Asignar != $request->Zona){
            $zona->FK_Asignar = $request->Zona;
            $zona->save();
        }

        Session::flash('message','Empleado modificado correctamente.');
        return Redirect::to('/empleado/lista');
    }

    public function delete($Cedula){
        Worker::find($Cedula)->delete();
        Session::flash('messagedel','Empleado eliminado correctamente.');
        return redirect('/empleado/lista');
    }
}
