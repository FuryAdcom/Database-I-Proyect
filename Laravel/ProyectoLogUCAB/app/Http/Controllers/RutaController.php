<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use LogUCAB\Ruta;
use LogUCAB\Lugar;
use LogUCAB\Office;
use LogUCAB\Ofi_Rut;
use LogUCAB\Veh_Rut;
use LogUCAB\VehiculoT;
use LogUCAB\VehiculoM;
use LogUCAB\VehiculoA;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Session;

use DB;

class RutaController extends Controller
{
    public function __construct(){
    }

    public function inicio(){
        return view("ruta.ruta");
    }

    public function create(){
        $oficinas = Office::select()
        ->orderBy('Nombre', 'asc')->get();
        $rutas = Ruta::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->orderBy('Ruta.Codigo', 'asc')->get();

        return view("ruta.createruta", compact('oficinas', 'rutas'));
    }

    public function store(Request $request){
        $apuer = Office::where('Nombre', 'LIKE', 'AeroLogUCAB%')->get();
        $puer = Office::where('Nombre', 'LIKE', 'MarLogUCAB%')->get();
        $aps = 0; $ps = 0;

        if(isset($request->FK_Ruta)){

            while(isset($request->FK_Ruta)){
                $rutaPrima = Ruta::where('Codigo', $request->FK_Ruta)->first(); 
                $oficina = Office::find($rutaPrima->FK_Ofi_Origen);

                foreach($apuer as $a){
                    if($a->Codigo == $oficina->Codigo){
                        $aps = $aps + 1;
                    }
                }
                foreach($puer as $p){
                    if($p->Codigo == $oficina->Codigo){
                        $ps = $ps + 1;
                    }
                }
            }

            //Para la destino sola
            $oficina = Office::find($request->FK_Ofi_Destino);
            $lugarDest = Lugar::find($oficina->FK_Varios);
            $estDest = Lugar::find($lugarDest->FK_Lugar);
            foreach($apuer as $a){
                if($a->Codigo == $oficina->Codigo){
                    $aps = $aps + 1;
                }
            }
            foreach($puer as $p){
                if($p->Codigo == $oficina->Codigo){
                    $ps = $ps + 1;
                }
            }
            //^

            $ofiog = Office::find($rutaPrima->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);
            $estOg = Lugar::find($lugar->FK_Lugar);

            $able = 0;
            if($estDest != $estOg && $estOg->Codigo != 1616 && $estOg->Codigo != 1625 && $estDest->Codigo != 1616 && $estDest->Codigo != 1625){
                $able = 1;
            }elseif($estDest == $estOg && $estOg->Codigo == 1616){
                $able = 1;
            }

            if($ofiog->Codigo == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

            Ruta::create([
                'Codigo' => Ruta::max('Codigo')+1,
                'Descripcion' => $request->Descripcion,
                'FK_Ruta' => $request->FK_Ruta,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $ofiog->Codigo,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);

            if($able == 1){
                $vehiculos = VehiculoT::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 250,
                        'Duracion' => $request->Duracion,
                        'FK_Camino3' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 250,
                        'Duracion' => $request->Duracion,
                        'FK_Camino3' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }
            if($aps > 1){
                $vehiculos = VehiculoA::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 760,
                        'Duracion' => 105,
                        'FK_Camino' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 760,
                        'Duracion' => 105,
                        'FK_Camino' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }elseif($ps > 1){
                $vehiculos = VehiculoM::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 110,
                        'Duracion' => 1080,
                        'FK_Camino2' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 110,
                        'Duracion' => 1080,
                        'FK_Camino2' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }

        }else{
            //Origen
            $ofiog = Office::find($request->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);
            $estOg = Lugar::find($lugar->FK_Lugar);
            foreach($apuer as $a){
                if($a->Codigo == $ofiog->Codigo){
                    $aps = $aps + 1;
                }
            }
            foreach($puer as $p){
                if($p->Codigo == $ofiog->Codigo){
                    $ps = $ps + 1;
                }
            }
            //
            //Destino
            $oficina = Office::find($request->FK_Ofi_Destino);
            $lugarDest = Lugar::find($oficina->FK_Varios);
            $estDest = Lugar::find($lugarDest->FK_Lugar);
            foreach($apuer as $a){
                if($a->Codigo == $oficina->Codigo){
                    $aps = $aps + 1;
                }
            }
            foreach($puer as $p){
                if($p->Codigo == $oficina->Codigo){
                    $ps = $ps + 1;
                }
            }
            //

            $able = 0;
            if($estDest != $estOg && $estOg->Codigo != 1616 && $estOg->Codigo != 1625 && $estDest->Codigo != 1616 && $estDest->Codigo != 1625){
                $able = 1;
            }elseif($estDest == $estOg && $estOg->Codigo == 1616){
                $able = 1;
            }

            if($request->FK_Ofi_Origen == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

            Ruta::create([
                'Codigo' => Ruta::max('Codigo')+1,
                'Descripcion' => $request->Descripcion,
                'FK_Camino' => $lugar->Codigo,  
                'FK_Ofi_Destino' => $request->FK_Ofi_Origen,  
                'FK_Ofi_Origen' => $request->FK_Ofi_Destino
            ]);

            if($able == 1){
                $vehiculos = VehiculoT::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 250,
                        'Duracion' => $request->Duracion,
                        'FK_Camino3' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 250,
                        'Duracion' => $request->Duracion,
                        'FK_Camino3' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }
            if($aps > 1){
                $vehiculos = VehiculoA::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 760,
                        'Duracion' => 105,
                        'FK_Camino' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 760,
                        'Duracion' => 105,
                        'FK_Camino' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }elseif($ps > 1){
                $vehiculos = VehiculoM::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 110,
                        'Duracion' => 1080,
                        'FK_Camino2' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 110,
                        'Duracion' => 1080,
                        'FK_Camino2' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }
        }

        return view('/ruta/lista');
    }
    
    public function lista(){
        $rutas = Ruta::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->paginate(50);

        return view("ruta.showruta", compact('rutas'));
    }

    public function edit($Codigo){

        $oficinas = Office::select()->orderBy('Nombre', 'asc')->get();
        $rutas = Ruta::leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->orderBy('Ruta.Codigo', 'asc')->get();
        $validated = Ruta::where('Ruta.Codigo', $Codigo)
        ->leftjoin('Oficina as ofiog', 'ofiog.Codigo','=','Ruta.FK_Ofi_Origen')
        ->leftjoin('Oficina as ofidest', 'ofidest.Codigo','=','Ruta.FK_Ofi_Destino')
        ->leftjoin('Lugar as log', 'log.Codigo','=','ofiog.FK_Varios')
        ->leftjoin('Lugar as ogest', 'ogest.Codigo','=','log.FK_Lugar')
        ->leftjoin('Lugar as ldest', 'ldest.Codigo','=','ofidest.FK_Varios')
        ->leftjoin('Lugar as destest', 'destest.Codigo','=','ldest.FK_Lugar')
        ->select(\DB::raw("\"Ruta\".*, ofiog.\"Nombre\" as ofog, ofidest.\"Nombre\" as ofdest, log.\"Nombre\" as og, ldest.\"Nombre\" as dest, ogest.\"Nombre\" as oge, destest.\"Nombre\" as deste"))
        ->orderBy('Ruta.Codigo', 'asc')->first();

        return view("ruta.editruta", compact('validated','rutas','oficinas'));
    }

    public function actualizar(Request $request){

        $apuer = Office::where('Nombre', 'LIKE', 'AeroLogUCAB%')->get();
        $puer = Office::where('Nombre', 'LIKE', 'MarLogUCAB%')->get();
        $aps = 0; $ps = 0;

        $ruta = Ruta::where('Ruta.Codigo', $request->Codigo)->first();
        Ofi_Rut::where('FK_Coche', $ruta->Codigo)->delete();
        Veh_Rut::where('FK_Coche', $ruta->Codigo)->delete();

        if(isset($request->FK_Ruta) && $request->FK_Ruta != $ruta->Codigo){
            while(isset($request->FK_Ruta)){
                $rutaPrima = Ruta::where('Codigo', $request->FK_Ruta)->first(); 
                $oficina = Office::find($rutaPrima->FK_Ofi_Origen);

                foreach($apuer as $a){
                    if($a->Codigo == $oficina->Codigo){
                        $aps = $aps + 1;
                    }
                }
                foreach($puer as $p){
                    if($p->Codigo == $oficina->Codigo){
                        $ps = $ps + 1;
                    }
                }
            }

            //Para la destino sola
            $oficina = Office::find($request->FK_Ofi_Destino);
            $lugarDest = Lugar::find($oficina->FK_Varios);
            $estDest = Lugar::find($lugarDest->FK_Lugar);
            foreach($apuer as $a){
                if($a->Codigo == $oficina->Codigo){
                    $aps = $aps + 1;
                }
            }
            foreach($puer as $p){
                if($p->Codigo == $oficina->Codigo){
                    $ps = $ps + 1;
                }
            }
            //^

            $ofiog = Office::find($rutaPrima->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);
            $estOg = Lugar::find($lugar->FK_Lugar);

            $able = 0;
            if($estDest != $estOg && $estOg->Codigo != 1616 && $estOg->Codigo != 1625 && $estDest->Codigo != 1616 && $estDest->Codigo != 1625){
                $able = 1;
            }elseif($estDest == $estOg && $estOg->Codigo == 1616){
                $able = 1;
            }

            if($ofiog->Codigo == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

            $ruta->Descripcion = $request->Descripcion;
            $ruta->FK_Ruta = $request->FK_Ruta;
            $ruta->FK_Camino = $lugar->Codigo;
            $ruta->FK_Ofi_Origen = $ofiog->Codigo; 
            $ruta->FK_Ofi_Destino = $request->FK_Ofi_Destino;
            $ruta->save();

            if($able == 1){
                $vehiculos = VehiculoT::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 250,
                        'Duracion' => $request->Duracion,
                        'FK_Camino3' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 250,
                        'Duracion' => $request->Duracion,
                        'FK_Camino3' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }
            if($aps > 1){
                $vehiculos = VehiculoA::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 760,
                        'Duracion' => 105,
                        'FK_Camino' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 760,
                        'Duracion' => 105,
                        'FK_Camino' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }elseif($ps > 1){
                $vehiculos = VehiculoM::where('FK_Cuentacon', $ofiog->Codigo)->get();

                foreach($vehiculos as $veh){
                    Ofi_Rut::create([
                        'Codigo' => Ofi_Rut::max('Codigo')+1,
                        'Costo' => 110,
                        'Duracion' => 1080,
                        'FK_Camino2' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                    Veh_Rut::create([
                        'Codigo' => Veh_Rut::max('Codigo')+1,
                        'Costo' => 110,
                        'Duracion' => 1080,
                        'FK_Camino2' => $veh->Placa,
                        'FK_Coche' => Ruta::max('Codigo')
                        ]);
                }
            }

        }else{
            //Origen
            $ofiog = Office::find($request->FK_Ofi_Origen);
            $lugar = Lugar::find($ofiog->FK_Varios);
            $estOg = Lugar::find($lugar->FK_Lugar);
            foreach($apuer as $a){
                if($a->Codigo == $ofiog->Codigo){
                    $aps = $aps + 1;
                }
            }
            foreach($puer as $p){
                if($p->Codigo == $ofiog->Codigo){
                    $ps = $ps + 1;
                }
            }
            //
            //Destino
            $oficina = Office::find($request->FK_Ofi_Destino);
            $lugarDest = Lugar::find($oficina->FK_Varios);
            $estDest = Lugar::find($lugarDest->FK_Lugar);
            foreach($apuer as $a){
                if($a->Codigo == $oficina->Codigo){
                    $aps = $aps + 1;
                }
            }
            foreach($puer as $p){
                if($p->Codigo == $oficina->Codigo){
                    $ps = $ps + 1;
                }
            }
            //

            $able = 0;
            if($estDest != $estOg && $estOg->Codigo != 1616 && $estOg->Codigo != 1625 && $estDest->Codigo != 1616 && $estDest->Codigo != 1625){
                $able = 1;
            }elseif($estDest == $estOg && $estOg->Codigo == 1616){
                $able = 1;
            }

            if($request->FK_Ofi_Origen == $request->FK_Ofi_Destino){
                Session::flash('message','Tiene que escoger origen-destino oficinas diferentes.');
                return Redirect::back()->withInput(Input::all());
            }

                $ruta->Descripcion = $request->Descripcion;
                $ruta->FK_Ruta = NULL;
                $ruta->FK_Camino = $lugar->Codigo;
                $ruta->FK_Ofi_Origen = $request->FK_Ofi_Origen; 
                $ruta->FK_Ofi_Destino = $request->FK_Ofi_Destino;
                $ruta->save();

                if($able == 1){
                    $vehiculos = VehiculoT::where('FK_Cuentacon', $ofiog->Codigo)->get();
    
                    foreach($vehiculos as $veh){
                        Ofi_Rut::create([
                            'Codigo' => Ofi_Rut::max('Codigo')+1,
                            'Costo' => 250,
                            'Duracion' => $request->Duracion,
                            'FK_Camino3' => $veh->Placa,
                            'FK_Coche' => Ruta::max('Codigo')
                            ]);
                        Veh_Rut::create([
                            'Codigo' => Veh_Rut::max('Codigo')+1,
                            'Costo' => 250,
                            'Duracion' => $request->Duracion,
                            'FK_Camino3' => $veh->Placa,
                            'FK_Coche' => Ruta::max('Codigo')
                            ]);
                    }
                }
                if($aps > 1){
                    $vehiculos = VehiculoA::where('FK_Cuentacon', $ofiog->Codigo)->get();
    
                    foreach($vehiculos as $veh){
                        Ofi_Rut::create([
                            'Codigo' => Ofi_Rut::max('Codigo')+1,
                            'Costo' => 760,
                            'Duracion' => 105,
                            'FK_Camino' => $veh->Placa,
                            'FK_Coche' => Ruta::max('Codigo')
                            ]);
                        Veh_Rut::create([
                            'Codigo' => Veh_Rut::max('Codigo')+1,
                            'Costo' => 760,
                            'Duracion' => 105,
                            'FK_Camino' => $veh->Placa,
                            'FK_Coche' => Ruta::max('Codigo')
                            ]);
                    }
                }elseif($ps > 1){
                    $vehiculos = VehiculoM::where('FK_Cuentacon', $ofiog->Codigo)->get();
    
                    foreach($vehiculos as $veh){
                        Ofi_Rut::create([
                            'Codigo' => Ofi_Rut::max('Codigo')+1,
                            'Costo' => 110,
                            'Duracion' => 1080,
                            'FK_Camino2' => $veh->Placa,
                            'FK_Coche' => Ruta::max('Codigo')
                            ]);
                        Veh_Rut::create([
                            'Codigo' => Veh_Rut::max('Codigo')+1,
                            'Costo' => 110,
                            'Duracion' => 1080,
                            'FK_Camino2' => $veh->Placa,
                            'FK_Coche' => Ruta::max('Codigo')
                            ]);
                    }
                }

        }

        Session::flash('message','Ruta modificada correctamente.');
        return redirect('/ruta/lista');
    }

    public function delete($Codigo){
        $ruta = Ruta::where('Codigo', $Codigo)->first();
        Ofi_Rut::where('FK_Coche', $ruta)->delete();
        Veh_Rut::where('FK_Coche', $ruta)->delete();
        $ruta->delete();
        Session::flash('messagedel','Ruta eliminada correctamente.');
        return redirect('/ruta/lista');
    }
}
