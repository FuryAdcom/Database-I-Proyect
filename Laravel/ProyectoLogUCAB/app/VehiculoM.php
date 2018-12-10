<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class VehiculoM extends Model
{
    protected $table='Vehiculo_Maritimo';

    protected $primaryKey='Placa';

    public $timestamps=false;


    protected $fillable =[
        'Placa',
        'Clasificacion',
        'Peso',
        'Capacidad',
        'Serial_Motor',
        'Altura',
        'Velocidad_Maxima',
        'Capacidad_Combustible',
        'Nombre'
    ];

    protected $guarded =[
        'Placa',
        'Nombre'
    ];
}
