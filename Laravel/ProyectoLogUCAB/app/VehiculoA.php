<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class VehiculoA extends Model
{
    protected $table='Vehiculo_Aereo';
    protected $primaryKey='Placa';
    public $incrementing = false;

    public $timestamps=false;

    protected $fillable =[
        'Placa',
        'Peso',
        'Capacidad',
        'Serial_Motor',
        'Altura',
        'Velocidad_Maxima',
        'Capacidad_Combustible',
        'Envergadura',
        'Ancho_Cabina',
        'Diametro_Fusilaje',
        'Peso_Vacio',
        'Peso_Max_Despegue',
        'Carrera_Despegue',
        'Motores',
        'FK_Representa',  //Modelo
        'FK_Cuentacon'  //Oficina
    ];

    protected $guarded =[
        'Placa'
    ];
}
