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
