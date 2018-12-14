<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\VehiculoA;
use LogUCAB\VehiculoM;
use LogUCAB\VehiculoT;
use LogUCAB\Modelo;
use LogUCAB\Office;
use LogUCAB\Marca;
use Illuminate\Support\Facades\Redirect;
use Session;

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
        
        //Aviones
        if(!is_null($request->Envergadura)){ 
            $request->validate([
            'Placa' => 'required',
            'Peso' => 'required',
            'Capacidad' => 'required',
            'Serial_Motor' => 'required',
            'marca' => 'required',
            'modelo' => 'required',
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
            'oficina' => 'required'
            ]);
            $tipoVehiculo='Aerea';
            $veha = VehiculoA::where('Vehiculo_Aereo.Placa', $request->Placa)
            ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Aereo.FK_Representa')
            ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
            ->first();

            if(is_null($veha)){
                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();

                if(is_null($marca)){
                    Marca::create([
                        'Descripcion' => $request->marca
                    ]);
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => (Marca::max('Codigo'))
                    ]);
                    VehiculoA::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Envergadura' => $request->Envergadura,
                        'Ancho_Cabina' => $request->Ancho_Cabina,
                        'Diametro_Fusilaje' => $request->Diametro_Fusilaje,
                        'Peso_Vacio' => $request->Peso_Vacio,
                        'Peso_Max_Despegue' => $request->Peso_Max_Despegue,
                        'Carrera_Despegue' => $request->Carrera_Despegue,
                        'Motores' => $request->Motores,
                        'FK_Representa' => (Modelo::max('Codigo')),
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }elseif(!is_null($marca) && !!is_null($modelo)){
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => $marca->Codigo
                    ]);
                    VehiculoA::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Envergadura' => $request->Envergadura,
                        'Ancho_Cabina' => $request->Ancho_Cabina,
                        'Diametro_Fusilaje' => $request->Diametro_Fusilaje,
                        'Peso_Vacio' => $request->Peso_Vacio,
                        'Peso_Max_Despegue' => $request->Peso_Max_Despegue,
                        'Carrera_Despegue' => $request->Carrera_Despegue,
                        'Motores' => $request->Motores,
                        'FK_Representa' => (Modelo::max('Codigo')),
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }else{
                    VehiculoA::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Envergadura' => $request->Envergadura,
                        'Ancho_Cabina' => $request->Ancho_Cabina,
                        'Diametro_Fusilaje' => $request->Diametro_Fusilaje,
                        'Peso_Vacio' => $request->Peso_Vacio,
                        'Peso_Max_Despegue' => $request->Peso_Max_Despegue,
                        'Carrera_Despegue' => $request->Carrera_Despegue,
                        'Motores' => $request->Motores,
                        'FK_Representa' => $modelo->Codigo,
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }

            }
        //Barcos
        }elseif(!is_null($request->Nombre)){    
            $request->validate([
            'Placa' => 'required',
            'Peso' => 'required',
            'Capacidad' => 'required',
            'Serial_Motor' => 'required',
            'marca' => 'required',
            'modelo' => 'required',
            'Altura' => 'required',
            'Velocidad_Maxima' => 'required',
            'Capacidad_Combustible' => 'required',
            'Nombre' => 'required',
            'oficina' => 'required'
            ]);
            $tipoVehiculo='Marina';
            $vehm = VehiculoM::where('Vehiculo_Maritimo.Placa', $request->Placa)
            ->leftjoin('Modelo', 'Modelo.Codigo','=','Modelo.FK_Contiene')
            ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
            ->first();

            if(is_null($vehm)){
                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();

                if(is_null($marca)){
                    Marca::create([
                        'Descripcion' => $request->marca
                    ]);
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => (Marca::max('Codigo'))
                    ]);
                    VehiculoM::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Nombre' => $request->Nombre,
                        'FK_Representa' => (Modelo::max('Codigo')),
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }elseif(!is_null($marca) && !!is_null($modelo)){
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => $marca->Codigo
                    ]);
                    VehiculoM::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Nombre' => $request->Nombre,
                        'FK_Representa' => (Modelo::max('Codigo')),
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }else{
                    VehiculoM::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Nombre' => $request->Nombre,
                        'FK_Representa' => $modelo->Codigo,
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }

            }
        //Autos
        }elseif(!is_null($request->Serial_Carroceria)){    
            $request->validate([
            'Placa' => 'required',
            'Peso' => 'required',
            'Capacidad' => 'required',
            'Serial_Motor' => 'required',
            'marca' => 'required',
            'modelo' => 'required',
            'Altura' => 'required',
            'Velocidad_Maxima' => 'required',
            'Capacidad_Combustible' => 'required',
            'Serial_Carroceria' => 'required',
            'oficina' => 'required'
            ]);
            $tipoVehiculo='Terrestre';
            $veht = VehiculoT::where('Vehiculo_Terrestre.Placa', $request->Placa)
            ->leftjoin('Modelo', 'Modelo.Codigo','=','Modelo.FK_Contiene')
            ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
            ->first();
            if(is_null($veht)){
                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();
                if(is_null($marca)){
                    Marca::create([
                        'Descripcion' => $request->marca
                    ]);
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => (Marca::max('Codigo')) 
                    ]);
                    VehiculoT::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Serial_Carroceria' => $request->Serial_Carroceria,
                        'FK_Representa' => (Modelo::max('Codigo')),
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }elseif(isset($marca) && is_null($modelo)){
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => $marca->Codigo
                    ]);
                    VehiculoT::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Serial_Carroceria' => $request->Serial_Carroceria,
                        'FK_Representa' => (Modelo::max('Codigo')),
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }else{
                    VehiculoT::create([
                        'Placa' => $request->Placa,
                        'Peso' => $request->Peso,
                        'Capacidad' => $request->Capacidad,
                        'Serial_Motor' => $request->Serial_Motor,
                        'Altura' => $request->Altura,
                        'Velocidad_Maxima' => $request->Velocidad_Maxima,
                        'Capacidad_Combustible' => $request->Capacidad_Combustible,
                        'Serial_Carroceria' => $request->Serial_Carroceria,
                        'FK_Representa' => $modelo->Codigo,
                        'FK_Cuentacon' => $request->oficina
                    ]);
                }
            }
        }
        //PADORU PADORU
        Session::flash('message','Vehiculo creado correctamente.');
        return Redirect::to('/transporte/lista'.$tipoVehiculo);
    }

    public function listaAvion(){
        $veh = VehiculoA::leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Aereo.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->select(\DB::raw("\"Vehiculo_Aereo\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model"))
        ->paginate(50);
        $tipo = 'Aereo';
        return view("vehiculo.showvehiculo", compact('veh','tipo'));
    }
    public function listaBarco(){
        $veh = VehiculoM::leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Maritimo.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->select(\DB::raw("\"Vehiculo_Maritimo\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model"))
        ->paginate(50);
        $tipo = 'Maritimo';
        return view("vehiculo.showvehiculo", compact('veh','tipo'));
    }
    public function listaTerrestre(){
        $veh = VehiculoT::leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Terrestre.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->select(\DB::raw("\"Vehiculo_Terrestre\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model"))
        ->paginate(50);
        $tipo = 'Terrestre';
        return view("vehiculo.showvehiculo", compact('veh','tipo'));
    }

    public function editAereo($Placa){

        $validated = \LogUCAB\VehiculoA::where('Vehiculo_Aereo.Placa', $Placa)
        ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Aereo.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->leftjoin('Oficina', 'Oficina.Codigo','=','Vehiculo_Aereo.FK_Cuentacon')
        ->select(\DB::raw("\"Vehiculo_Aereo\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model, \"Oficina\".\"Codigo\" as oficina"))
        ->first();
        $class = 'a';

        return view("vehiculo.editvehiculo", compact('validated', 'class'));
    }
    public function editMarino($Placa){

        $validated = \LogUCAB\VehiculoM::where('Vehiculo_Maritimo.Placa', $Placa)
        ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Maritimo.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->leftjoin('Oficina', 'Oficina.Codigo','=','Vehiculo_Aereo.FK_Cuentacon')        
        ->select(\DB::raw("\"Vehiculo_Maritimo\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model, \"Oficina\".\"Codigo\" as oficina"))
        ->first();
        $class = 'm';

        return view("vehiculo.editvehiculo", compact('validated', 'class'));
    }
    public function editTerrestre($Placa){

        $validated = \LogUCAB\VehiculoT::where('Vehiculo_Terrestre.Placa', $Placa)
        ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Terrestre.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->leftjoin('Oficina', 'Oficina.Codigo','=','Vehiculo_Aereo.FK_Cuentacon')
        ->select(\DB::raw("\"Vehiculo_Terrestre\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model, \"Oficina\".\"Codigo\" as oficina"))
        ->first();
        $class = 't';

        return view("vehiculo.editvehiculo", compact('validated', 'class'));
    }

    public function actualizar(Request $request){

        //Aviones
        if(!is_null($request->Envergadura)){ 
            $tipoVehiculo='Aerea';
            $veha = VehiculoA::where('Vehiculo_Aereo.Placa', $request->placa)
            ->first();

                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();
                
                if(is_null($marca)){
                    Marca::create([
                        'Descripcion' => $request->marca
                    ]);
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => (Marca::max('Codigo'))
                    ]);
                        $veha->Peso = $request->Peso;
                        $veha->Capacidad = $request->Capacidad;
                        $veha->Serial_Motor = $request->Serial_Motor;
                        $veha->Altura = $request->Altura;
                        $veha->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $veha->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $veha->Envergadura = $request->Envergadura;
                        $veha->Ancho_Cabina = $request->Ancho_Cabina;
                        $veha->Diametro_Fusilaje = $request->Diametro_Fusilaje;
                        $veha->Peso_Vacio = $request->Peso_Vacio;
                        $veha->Peso_Max_Despegue = $request->Peso_Max_Despegue;
                        $veha->Carrera_Despegue = $request->Carrera_Despegue;
                        $veha->Motores = $request->Motores;
                        $veha->FK_Representa = (Modelo::max('Codigo'));
                        $veha->FK_Cuentacon = $request->oficina;
                        $veha->save();

                }elseif(!is_null($marca) && is_null($modelo)){
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => $marca->Codigo
                    ]);
                        $veha->Peso = $request->Peso;
                        $veha->Capacidad = $request->Capacidad;
                        $veha->Serial_Motor = $request->Serial_Motor;
                        $veha->Altura = $request->Altura;
                        $veha->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $veha->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $veha->Envergadura = $request->Envergadura;
                        $veha->Ancho_Cabina = $request->Ancho_Cabina;
                        $veha->Diametro_Fusilaje = $request->Diametro_Fusilaje;
                        $veha->Peso_Vacio = $request->Peso_Vacio;
                        $veha->Peso_Max_Despegue = $request->Peso_Max_Despegue;
                        $veha->Carrera_Despegue = $request->Carrera_Despegue;
                        $veha->Motores = $request->Motores;
                        $veha->FK_Representa = (Modelo::max('Codigo'));
                        $veha->FK_Cuentacon = $request->oficina;
                        $veha->save();
                }else{
                        $veha->Peso = $request->Peso;
                        $veha->Capacidad = $request->Capacidad;
                        $veha->Serial_Motor = $request->Serial_Motor;
                        $veha->Altura = $request->Altura;
                        $veha->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $veha->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $veha->Envergadura = $request->Envergadura;
                        $veha->Ancho_Cabina = $request->Ancho_Cabina;
                        $veha->Diametro_Fusilaje = $request->Diametro_Fusilaje;
                        $veha->Peso_Vacio = $request->Peso_Vacio;
                        $veha->Peso_Max_Despegue = $request->Peso_Max_Despegue;
                        $veha->Carrera_Despegue = $request->Carrera_Despegue;
                        $veha->Motores = $request->Motores;
                        $veha->FK_Representa = $modelo->Codigo;
                        $veha->FK_Cuentacon = $request->oficina;
                        $veha->save();
                }
        //Barcos
        }elseif(!is_null($request->Nombre)){    
            $tipoVehiculo='Marina';
            $vehm = VehiculoM::where('Vehiculo_Maritimo.Placa', $request->placa)
            ->first();

                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();

                if(is_null($marca)){
                    Marca::create([
                        'Descripcion' => $request->marca
                    ]);
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => (Marca::max('Codigo'))
                    ]);
                        $vehm->Peso = $request->Peso;
                        $vehm->Capacidad = $request->Capacidad;
                        $vehm->Serial_Motor = $request->Serial_Motor;
                        $vehm->Altura = $request->Altura;
                        $vehm->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $vehm->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $vehm->Nombre = $request->Nombre;
                        $vehm->FK_Representa = (Modelo::max('Codigo'));
                        $vehm->FK_Cuentacon = $request->oficina;
                        $vehm->save();
                }elseif(!is_null($marca) && !!is_null($modelo)){
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => $marca->Codigo
                    ]);
                        $vehm->Peso = $request->Peso;
                        $vehm->Capacidad = $request->Capacidad;
                        $vehm->Serial_Motor = $request->Serial_Motor;
                        $vehm->Altura = $request->Altura;
                        $vehm->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $vehm->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $vehm->Nombre = $request->Nombre;
                        $vehm->FK_Representa = (Modelo::max('Codigo'));
                        $vehm->FK_Cuentacon = $request->oficina;
                        $vehm->save();
                }else{
                        $vehm->Peso = $request->Peso;
                        $vehm->Capacidad = $request->Capacidad;
                        $vehm->Serial_Motor = $request->Serial_Motor;
                        $vehm->Altura = $request->Altura;
                        $vehm->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $vehm->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $vehm->Nombre = $request->Nombre;
                        $vehm->FK_Representa = $modelo->Codigo;
                        $vehm->FK_Cuentacon = $request->oficina;
                        $vehm->save();
                }

        //Autos
        }elseif(!is_null($request->Serial_Carroceria)){    
            $tipoVehiculo='Terrestre';
            $veht = VehiculoT::where('Vehiculo_Terrestre.Placa', $request->placa)
            ->first();

                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();
                if(is_null($marca)){
                    Marca::create([
                        'Descripcion' => $request->marca
                    ]);
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => (Marca::max('Codigo')) 
                    ]);
                        $veht->Peso = $request->Peso;
                        $veht->Capacidad = $request->Capacidad;
                        $veht->Serial_Motor = $request->Serial_Motor;
                        $veht->Altura = $request->Altura;
                        $veht->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $veht->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $veht->Serial_Carroceria = $request->Serial_Carroceria;
                        $veht->FK_Representa = (Modelo::max('Codigo'));
                        $veht->FK_Cuentacon = $request->oficina;
                        $veht->save();
                }elseif(isset($marca) && is_null($modelo)){
                    Modelo::create([
                        'Descripcion' => $request->modelo,
                        'FK_Contiene' => $marca->Codigo
                    ]);
                        $veht->Peso = $request->Peso;
                        $veht->Capacidad = $request->Capacidad;
                        $veht->Serial_Motor = $request->Serial_Motor;
                        $veht->Altura = $request->Altura;
                        $veht->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $veht->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $veht->Serial_Carroceria = $request->Serial_Carroceria;
                        $veht->FK_Representa = (Modelo::max('Codigo'));
                        $veht->FK_Cuentacon = $request->oficina;
                        $veht->save();
                }else{
                        $veht->Peso = $request->Peso;
                        $veht->Capacidad = $request->Capacidad;
                        $veht->Serial_Motor = $request->Serial_Motor;
                        $veht->Altura = $request->Altura;
                        $veht->Velocidad_Maxima = $request->Velocidad_Maxima;
                        $veht->Capacidad_Combustible = $request->Capacidad_Combustible;
                        $veht->Serial_Carroceria = $request->Serial_Carroceria;
                        $veht->FK_Representa = $modelo->Codigo;
                        $veht->FK_Cuentacon = $request->oficina;
                        $veht->save();
                }
        }
        //PADORU PADORU
        Session::flash('message','Vehiculo modificado correctamente.');
        return Redirect::to('/transporte/lista'.$tipoVehiculo);
    }

    public function deleteAereo($Placa){
        DB::table('Vehiculo_Aereo')->where('Placa', $Placa)->delete();
        $tipo = 'Aerea';
        Session::flash('messagedel','Vehiculo eliminado correctamente.');
        return Redirect::to('/transporte/lista'.$tipo);
    }
    public function deleteMarino($Placa){
        DB::table('Vehiculo_Maritimo')->where('Placa', $Placa)->delete();
        $tipo = 'Marina';
        Session::flash('messagedel','Oficina eliminada correctamente.');
        return Redirect::to('/transporte/lista'.$tipo);
    }
    public function deleteTerrestre($Placa){
        DB::table('Vehiculo_Terrestre')->where('Placa', $Placa)->delete();
        $tipo = 'Terrestre';
        Session::flash('messagedel','Oficina eliminada correctamente.');
        return Redirect::to('/transporte/lista'.$tipo);
    }
}
