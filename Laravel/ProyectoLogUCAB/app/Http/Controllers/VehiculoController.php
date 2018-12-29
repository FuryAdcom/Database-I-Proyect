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
use LogUCAB\Rol;
use LogUCAB\Priv_Rol;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;
use Session;

use DB;

class VehiculoController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function inicio(){
        return view("vehiculo.vehiculo");
    }

    public function create(){
        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        return view("vehiculo.createvehiculo", compact('oficinas'));
    }

    public function store(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',2)
        ->first();

        if(isset($priv)){
            //Aviones
            if($request->Clasificacion == 'a'){ 
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
                'FK_Cuentacon' => 'required'
                ]);
                $tipoVehiculo='Aerea';
                $veha = VehiculoA::find($request->Placa);

                if(is_null($veha)){
                    $marca = Marca::where('Marca.Descripcion', $request->marca)
                    ->first();
                    $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                    ->first();

                    if(is_null($marca)){
                        Marca::create([
                            'Codigo' => (Marca::max('Codigo'))+1,
                            'Descripcion' => $request->marca
                        ]);
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
                        ]);
                    }elseif(!is_null($marca) && !!is_null($modelo)){
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
                        ]);
                    }

                }else{
                    Session::flash('message','El vehiculo de placa '.$request->Placa.' ya existe.');
                    return Redirect::back()->withInput(Input::all());
                }
            //Barcos
            }elseif($request->Clasificacion == 'm'){    
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
                'FK_Cuentacon' => 'required'
                ]);
                $tipoVehiculo='Marina';
                $vehm = VehiculoM::find($request->Placa);

                if(is_null($vehm)){
                    $marca = Marca::where('Marca.Descripcion', $request->marca)
                    ->first();
                    $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                    ->first();

                    if(is_null($marca)){
                        Marca::create([
                            'Codigo' => (Marca::max('Codigo'))+1,
                            'Descripcion' => $request->marca
                        ]);
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
                        ]);
                    }elseif(isset($marca) && is_null($modelo)){
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
                        ]);
                    }

                }else{
                    Session::flash('message','El vehiculo de placa '.$request->Placa.' ya existe.');
                    return Redirect::back()->withInput(Input::all());
                }
            //Autos
            }elseif($request->Clasificacion == 't'){    
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
                'FK_Cuentacon' => 'required'
                ]);
                $tipoVehiculo='Terrestre';
                $veht = VehiculoT::find($request->Placa);

                if(is_null($veht)){
                    $marca = Marca::where('Marca.Descripcion', $request->marca)
                    ->first();
                    $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                    ->first();
                    if(is_null($marca)){
                        Marca::create([
                            'Codigo' => (Marca::max('Codigo'))+1,
                            'Descripcion' => $request->marca
                        ]);
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
                        ]);
                    }elseif(isset($marca) && is_null($modelo)){
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
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
                            'FK_Cuentacon' => $request->FK_Cuentacon
                        ]);
                    }
                }else{
                    Session::flash('message','El vehiculo de placa '.$request->Placa.' ya existe.');
                    return Redirect::back()->withInput(Input::all());
                }
            }
            //PADORU PADORU
            Session::flash('message','Vehiculo creado correctamente.');
            return Redirect::to('/transporte/lista'.$tipoVehiculo);
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
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

        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $validated = VehiculoA::where('Vehiculo_Aereo.Placa', $Placa)
        ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Aereo.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->leftjoin('Oficina', 'Oficina.Codigo','=','Vehiculo_Aereo.FK_Cuentacon')
        ->select(\DB::raw("\"Vehiculo_Aereo\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model, \"Oficina\".\"Codigo\" as oficina"))
        ->first();
        $class = 'a';

        return view("vehiculo.editvehiculo", compact('validated', 'class','oficinas'));
    }
    public function editMarino($Placa){

        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $validated = VehiculoM::where('Vehiculo_Maritimo.Placa', $Placa)
        ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Maritimo.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->leftjoin('Oficina', 'Oficina.Codigo','=','Vehiculo_Maritimo.FK_Cuentacon')        
        ->select(\DB::raw("\"Vehiculo_Maritimo\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model, \"Oficina\".\"Codigo\" as oficina"))
        ->first();
        $class = 'm';

        return view("vehiculo.editvehiculo", compact('validated', 'class','oficinas'));
    }
    public function editTerrestre($Placa){

        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $validated = VehiculoT::where('Vehiculo_Terrestre.Placa', $Placa)
        ->leftjoin('Modelo', 'Modelo.Codigo','=','Vehiculo_Terrestre.FK_Representa')
        ->leftjoin('Marca', 'Marca.Codigo','=','Modelo.FK_Contiene')
        ->leftjoin('Oficina', 'Oficina.Codigo','=','Vehiculo_Terrestre.FK_Cuentacon')
        ->select(\DB::raw("\"Vehiculo_Terrestre\".*, \"Marca\".\"Descripcion\" as mark, \"Modelo\".\"Descripcion\" as model, \"Oficina\".\"Codigo\" as oficina"))
        ->first();
        $class = 't';

        return view("vehiculo.editvehiculo", compact('validated', 'class','oficinas'));
    }

    public function actualizar(Request $request){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',2)
        ->first();

        if(isset($priv)){
            //Aviones
            if($request->Clasificacion == 'a'){ 
                $tipoVehiculo='Aerea';
                $veh = VehiculoM::find($request->Placa);
                $veha = VehiculoA::find($request->PlacaAnt);

                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();

                if(is_null($veh)){
                    if(is_null($marca)){
                        Marca::create([
                            'Codigo' => (Marca::max('Codigo'))+1,
                            'Descripcion' => $request->marca
                        ]);
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
                            'Descripcion' => $request->modelo,
                            'FK_Contiene' => (Marca::max('Codigo'))
                        ]);
                            $veha->Placa = $request->Placa;
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
                            $veha->FK_Cuentacon = $request->FK_Cuentacon;
                            $veha->save();

                    }elseif(!is_null($marca) && is_null($modelo)){
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
                            'Descripcion' => $request->modelo,
                            'FK_Contiene' => $marca->Codigo
                        ]);
                            $veha->Placa = $request->Placa;
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
                            $veha->FK_Cuentacon = $request->FK_Cuentacon;
                            $veha->save();
                    }else{
                            $veha->Placa = $request->Placa;
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
                            $veha->FK_Cuentacon = $request->FK_Cuentacon;
                            $veha->save();
                    }
                }else{
                    Session::flash('message','El vehiculo de placa '.$request->Placa.' ya existe.');
                    return Redirect::back()->withInput(Input::all());
                }
            //Barcos
            }elseif($request->Clasificacion == 'm'){    
                $tipoVehiculo='Marina';
                $vehm = VehiculoM::find($request->PlacaAnt);
                $veh = VehiculoM::find($request->Placa);


                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();

                if(is_null($veh)){
                    if(is_null($marca)){
                        Marca::create([
                            'Codigo' => (Marca::max('Codigo'))+1,
                            'Descripcion' => $request->marca
                        ]);
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
                            'Descripcion' => $request->modelo,
                            'FK_Contiene' => (Marca::max('Codigo'))
                        ]);
                            $vehm->Placa = $request->Placa;
                            $vehm->Peso = $request->Peso;
                            $vehm->Capacidad = $request->Capacidad;
                            $vehm->Serial_Motor = $request->Serial_Motor;
                            $vehm->Altura = $request->Altura;
                            $vehm->Velocidad_Maxima = $request->Velocidad_Maxima;
                            $vehm->Capacidad_Combustible = $request->Capacidad_Combustible;
                            $vehm->Nombre = $request->Nombre;
                            $vehm->FK_Representa = (Modelo::max('Codigo'));
                            $vehm->FK_Cuentacon = $request->FK_Cuentacon;
                            $vehm->save();
                    }elseif(!is_null($marca) && !!is_null($modelo)){
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
                            'Descripcion' => $request->modelo,
                            'FK_Contiene' => $marca->Codigo
                        ]);
                            $vehm->Placa = $request->Placa;
                            $vehm->Peso = $request->Peso;
                            $vehm->Capacidad = $request->Capacidad;
                            $vehm->Serial_Motor = $request->Serial_Motor;
                            $vehm->Altura = $request->Altura;
                            $vehm->Velocidad_Maxima = $request->Velocidad_Maxima;
                            $vehm->Capacidad_Combustible = $request->Capacidad_Combustible;
                            $vehm->Nombre = $request->Nombre;
                            $vehm->FK_Representa = (Modelo::max('Codigo'));
                            $vehm->FK_Cuentacon = $request->FK_Cuentacon;
                            $vehm->save();
                    }else{
                            $vehm->Placa = $request->Placa;
                            $vehm->Peso = $request->Peso;
                            $vehm->Capacidad = $request->Capacidad;
                            $vehm->Serial_Motor = $request->Serial_Motor;
                            $vehm->Altura = $request->Altura;
                            $vehm->Velocidad_Maxima = $request->Velocidad_Maxima;
                            $vehm->Capacidad_Combustible = $request->Capacidad_Combustible;
                            $vehm->Nombre = $request->Nombre;
                            $vehm->FK_Representa = $modelo->Codigo;
                            $vehm->FK_Cuentacon = $request->FK_Cuentacon;
                            $vehm->save();
                    }

                }else{
                        Session::flash('message','El vehiculo de placa '.$request->Placa.' ya existe.');
                        return Redirect::back()->withInput(Input::all());
                    }
            //Autos
            }elseif($request->Clasificacion == 't'){    
                $tipoVehiculo='Terrestre';
                $veht = VehiculoT::find($request->PlacaAnt);
                $veh = VehiculoT::find($request->Placa);

                $marca = Marca::where('Marca.Descripcion', $request->marca)
                ->first();
                $modelo = Modelo::where('Modelo.Descripcion', $request->modelo)
                ->first();

                if(is_null($veh)){
                    if(is_null($marca)){
                        Marca::create([
                            'Codigo' => (Marca::max('Codigo'))+1,
                            'Descripcion' => $request->marca
                        ]);
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
                            'Descripcion' => $request->modelo,
                            'FK_Contiene' => (Marca::max('Codigo')) 
                        ]);
                            $veht->Placa = $request->Placa;
                            $veht->Peso = $request->Peso;
                            $veht->Capacidad = $request->Capacidad;
                            $veht->Serial_Motor = $request->Serial_Motor;
                            $veht->Altura = $request->Altura;
                            $veht->Velocidad_Maxima = $request->Velocidad_Maxima;
                            $veht->Capacidad_Combustible = $request->Capacidad_Combustible;
                            $veht->Serial_Carroceria = $request->Serial_Carroceria;
                            $veht->FK_Representa = (Modelo::max('Codigo'));
                            $veht->FK_Cuentacon = $request->FK_Cuentacon;
                            $veht->save();
                    }elseif(isset($marca) && is_null($modelo)){
                        Modelo::create([
                            'Codigo' => (Modelo::max('Codigo'))+1,
                            'Descripcion' => $request->modelo,
                            'FK_Contiene' => $marca->Codigo
                        ]);
                            $veht->Placa = $request->Placa;
                            $veht->Peso = $request->Peso;
                            $veht->Capacidad = $request->Capacidad;
                            $veht->Serial_Motor = $request->Serial_Motor;
                            $veht->Altura = $request->Altura;
                            $veht->Velocidad_Maxima = $request->Velocidad_Maxima;
                            $veht->Capacidad_Combustible = $request->Capacidad_Combustible;
                            $veht->Serial_Carroceria = $request->Serial_Carroceria;
                            $veht->FK_Representa = (Modelo::max('Codigo'));
                            $veht->FK_Cuentacon = $request->FK_Cuentacon;
                            $veht->save();
                    }else{
                            $veht->Placa = $request->Placa;
                            $veht->Peso = $request->Peso;
                            $veht->Capacidad = $request->Capacidad;
                            $veht->Serial_Motor = $request->Serial_Motor;
                            $veht->Altura = $request->Altura;
                            $veht->Velocidad_Maxima = $request->Velocidad_Maxima;
                            $veht->Capacidad_Combustible = $request->Capacidad_Combustible;
                            $veht->Serial_Carroceria = $request->Serial_Carroceria;
                            $veht->FK_Representa = $modelo->Codigo;
                            $veht->FK_Cuentacon = $request->FK_Cuentacon;
                            $veht->save();
                    }
                }else{
                        Session::flash('message','El vehiculo de placa '.$request->Placa.' ya existe.');
                        return Redirect::back()->withInput(Input::all());
                    }
            }
            //PADORU PADORU
            Session::flash('message','Vehiculo modificado correctamente.');
            return Redirect::to('/transporte/lista'.$tipoVehiculo);
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }

    public function deleteAereo($Placa){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',2)
        ->first();

        if(isset($priv)){
            DB::table('Vehiculo_Aereo')->where('Placa', $Placa)->delete();
            $tipo = 'Aerea';
            Session::flash('messagedel','Vehiculo eliminado correctamente.');
            return Redirect::to('/transporte/lista'.$tipo);
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
    public function deleteMarino($Placa){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',2)
        ->first();

        if(isset($priv)){
            DB::table('Vehiculo_Maritimo')->where('Placa', $Placa)->delete();
            $tipo = 'Marina';
            Session::flash('messagedel','Oficina eliminada correctamente.');
            return Redirect::to('/transporte/lista'.$tipo);
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
    public function deleteTerrestre($Placa){
        $priv = Priv_Rol::where('FK_Accede_Sis',Auth::user()->rol)
        ->where('FK_Opcion',2)
        ->first();

        if(isset($priv)){
            DB::table('Vehiculo_Terrestre')->where('Placa', $Placa)->delete();
            $tipo = 'Terrestre';
            Session::flash('messagedel','Oficina eliminada correctamente.');
            return Redirect::to('/transporte/lista'.$tipo);
        }else{
            Session::flash('message','Usted no tiene permisos para realizar esta accion.');
            return Redirect::back()->withInput(Input::all());
        }
    }
}
