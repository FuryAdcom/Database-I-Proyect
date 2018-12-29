<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use Illuminate\Support\Facades\Auth;
use LogUCAB\Worker;
use LogUCAB\Lugar;
use LogUCAB\Office;
use LogUCAB\Phone;
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use LogUCAB\Zona;
use LogUCAB\Emp_Zon;
use LogUCAB\Horario;
use LogUCAB\User;
use LogUCAB\Emp_Hor;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;
use Carbon\Carbon;

class WorkerController extends Controller
{
    public function __construct(){$this->middleware('auth');}

    public function inicio(){
        return view("persona.empleado.worker");
    }

    public function create(){
        $rols = Rol::select()->where('Tipo','LIKE', 'E%')->orderBy('Codigo', 'asc')->get();
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $muns = DB::select(DB::raw('SELECT Mun.*, L."Nombre" as est 
        from "Lugar" as Mun left join "Lugar" as L
        on L."Codigo" = Mun."FK_Lugar" 
        where Mun."Tipo" = \'Municipio\' order by Mun."Nombre" asc'));
        $zonas = Zona::leftjoin('Oficina as of', 'of.Codigo', '=' , 'Zona.FK_Divide')
        ->leftjoin('Lugar as lug', 'lug.Codigo','=','of.FK_Varios')
        ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
        ->select(DB::raw('"Zona".*, of."Nombre" as oficina, lug."Nombre" as mun, estado."Nombre" as est'))
        ->get();

        return view("persona.empleado.createworker", compact('rols', 'oficinas', 'muns', 'zonas'));
    }

    public function store(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',9)
        ->first();

        if(isset($priv)){
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
                'tipo' => 'Móvil',
                'FK_Posee' => $request->Cedula
            ]);
            Emp_Zon::create([
                'Codigo' => Emp_Zon::max('Codigo')+1,
                'FK_Asiste' => $request->Zona,
                'FK_Asignar' => $request->Cedula
            ]);
            $user = User::where('email', $request->Correo_Personal)->first();
            if(isset($user)){
                $user->rol = $request->FK_Asignado_Puesto;
                $user->save();
                $user = Usuario::where('Correo_Personal', $request->Correo_Personal)->first();
                $user->rol = $request->FK_Asignado_Puesto;
                $user->save();
            }

            Session::flash('message','Empleado creado correctamente.');
            return Redirect::to('/empleado/lista');
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
    
    public function lista(){
        $empleados = Worker::leftjoin('Lugar as mun', 'mun.Codigo','=','Empleado.FK_Habitacion')
        ->leftjoin('Rol as rol', 'rol.Codigo','=','Empleado.FK_Asignado_Puesto')
        ->select(\DB::raw("\"Empleado\".*, mun.\"Nombre\" as sitio, rol.\"Tipo\" as rolt"))
        ->orderBy('Empleado.Nombre')
        ->paginate(50);
        return view("persona.empleado.showworker", compact('empleados'));
    }

    public function mostrar($Cedula){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',10)
        ->first();

        if(isset($priv)){
            $empleado = Worker::find($Cedula); 
            $telf = Phone::where('FK_Posee', $empleado->Cedula)->first();

            $hor = Horario::where('FK_cada-uno', $empleado->Cedula)->orderBy('Dia','desc')->paginate(50);

            if(isset($hor)){
                $horarios = $hor;
            }

            return view("persona.empleado.mostrarworker", compact('empleado','telf','horarios'));
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }

    public function assist(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',10)
        ->first();

        if(isset($priv)){
            $empleado = Worker::find($request->Cedula); 

            Horario::create([
                'Codigo' => Horario::max('Codigo')+1,
                'Dia' => Carbon::now()->format('Y-m-d'),
                'Descripcion' => 'Horario regular',
                'Hora_Inicio' => $request->I,
                'Hora_Fin' => $request->F,
            ]);
            Emp_Hor::create([
                'Codigo' => Emp_Hor::max('Codigo')+1,
                'Fecha' => Carbon::now()->format('Y-m-d'),
                'FK_Asistencia' => $request->Cedula,
                'FK_Recibe_Emp' => Horario::max('Codigo')
            ]);
            $horarios = Horario::where('FK_cada-uno', $request->Cedula)->orderBy('Dia','desc')->paginate(50);

            return view("persona.empleado.mostrarworker", compact('empleado','telf','horarios'));
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }

    public function edit($Cedula){
        $rols = Rol::select()->whereNotBetween('Codigo', [1, 3])->orderBy('Codigo', 'asc')->get();
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $muns = DB::select(DB::raw('SELECT Mun.*, L."Nombre" as est 
        from "Lugar" as Mun left join "Lugar" as L
        on L."Codigo" = Mun."FK_Lugar" 
        where Mun."Tipo" = \'Municipio\' order by Mun."Nombre" asc'));
        $validated = Worker::where('Empleado.Cedula', $Cedula)
        ->leftjoin('Telefono as tlf', 'tlf.FK_Posee','=','Empleado.Cedula')
        ->leftjoin('Emp-Zon as ez', 'ez.FK_Asignar','=','Empleado.Cedula')
        ->leftjoin('Zona as z', 'z.Codigo','=','ez.FK_Asiste')
        ->select(DB::raw('"Empleado".*, tlf."Numero" as telf, z."Codigo" as zona'))
        ->first();
        $zonas = Zona::leftjoin('Oficina as of', 'of.Codigo', '=' , 'Zona.FK_Divide')
        ->leftjoin('Lugar as lug', 'lug.Codigo','=','of.FK_Varios')
        ->leftjoin('Lugar as estado', 'estado.Codigo','=','lug.FK_Lugar')
        ->select(DB::raw('"Zona".*, of."Nombre" as oficina, lug."Nombre" as mun, estado."Nombre" as est'))
        ->get();

        return view("persona.empleado.editworker", compact('rols', 'validated', 'muns', 'oficinas', 'zonas'));
    }

    public function actualizar(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',10)
        ->first();

        if(isset($priv)){
            $empleadoOG = Worker::find($request->CedulaAnt);
            $empleado = Worker::find($request->Cedula);
            $lugar = Lugar::find($request->FK_Habitacion);
            $telefono = Phone::where('Telefono.FK_Posee', $request->CedulaAnt)->first();
            $telfcomp = Phone::find($request->Telefono);
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

            $empleadoOG->Cedula = $request->Cedula;
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
            $user = User::where('email', $request->Correo_Personal)->first();
            if(isset($user)){
                $user->rol = $request->FK_Asignado_Puesto;
                $user->save();
                $user = Usuario::where('Correo_Personal', $request->Correo_Personal)->first();
                $user->rol = $request->FK_Asignado_Puesto;
                $user->save();
            }
            
            if(is_null($telefono)){
                Phone::create([
                    'Numero' => $request->Telefono,
                    'tipo' => 'Móvil',
                    'FK_Posee' => $request->Cedula
                ]);
            }elseif($telefono->Numero != $request->Telefono && is_null($telfcomp)){
                $telefono->Numero = $request->Telefono;
                $telefono->save();
            }
            if(is_null($zona)){
                Emp_Zon::create([
                    'Codigo' => Emp_Zon::max('Codigo')+1,
                    'FK_Asiste' => $request->Zona,
                    'FK_Asignar' => $request->Cedula
                ]);
            }elseif($zona->FK_Asignar != $request->Zona){
                $zona->FK_Asignar = $request->Zona;
                $zona->save();
            }

            Session::flash('message','Empleado modificado correctamente.');
            return Redirect::to('/empleado/lista');
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }

    public function delete($Cedula){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',11)
        ->first();

        if(isset($priv)){
            Worker::find($Cedula)->delete();
            Session::flash('messagedel','Empleado eliminado correctamente.');
            return redirect('/empleado/lista');
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
}
