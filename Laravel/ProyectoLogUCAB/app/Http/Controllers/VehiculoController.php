<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\VehiculoA;
use LogUCAB\VehiculoM;
use LogUCAB\VehiculoT;
use Illuminate\Support\Facades\Redirect;

use DB;

class VehiculoController extends Controller
{
    public function __construct(){

    }

    public function inicio(){
        return view("vehiculo.vehiculo");
    }
    public function create(){
        return view("vehiculo.createvehiculo");
    }
    public function store(Request $request){
        
        if(isset($request->Envergadura)){    
            $request->validate([
            'Placa' => 'required',
            'Peso' => 'required',
            'Capacidad' => 'required',
            'Serial_Motor' => 'required',
            'Altura' => 'required',
            'Velocidad_Maxima' => 'required',
            'Capacidad_Combustible' => 'required',
            'Envergadura' => 'required',
            'Ancho_Cabina' => 'required',
            'Diametro_Fusilaje' => 'required',
            'Peso_Vacio' => 'required',
            'Peso_Max_Despegue' => 'required',
            'Carrera_Despegue' => 'required',
            'Motores' => 'required',
            'FK_Representa' => 'required',
            'FK_Cuentacon' => 'required'
            ]);

            VehiculoA::create($request->all());
        }elseif(isset($request->Nombre)){    
            $request->validate([
            'Placa' => 'required',
            'Peso' => 'required',
            'Capacidad' => 'required',
            'Serial_Motor' => 'required',
            'Altura' => 'required',
            'Velocidad_Maxima' => 'required',
            'Capacidad_Combustible' => 'required',
            'Nombre' => 'required',
            'FK_Representa' => 'required',
            'FK_Cuentacon' => 'required'
            ]);

            VehiculoM::create($request->all());
        }elseif(isset($request->Serial_Carroceria)){    
            $request->validate([
            'Placa' => 'required',
            'Peso' => 'required',
            'Capacidad' => 'required',
            'Serial_Motor' => 'required',
            'Altura' => 'required',
            'Velocidad_Maxima' => 'required',
            'Capacidad_Combustible' => 'required',
            'Serial_Carroceria' => 'required',
            'FK_Representa' => 'required',
            'FK_Cuentacon' => 'required'
            ]);

            VehiculoT::create($request->all());
        }

        Session::flash('message','Vehiculo creado correctamente.');
        return Redirect::to('/vehiculo/lista');
    }
    public function lista(){
        $veha = VehiculoA::paginate(50);
        $vehm = VehiculoM::paginate(50);
        $veht = VehiculoT::paginate(50);
        return view("vehiculo.showvehiculo", compact('veha','vehm','veht'));
    }
    public function edit(){
        return view("vehiculo.editvehiculo");
    }
    public function update(){

    }
    public function destroy(){
        return view("vehiculo.deletevehiculo");
    }
}
