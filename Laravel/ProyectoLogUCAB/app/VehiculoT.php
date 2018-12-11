<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class VehiculoT extends Model
{
    protected $table='Vehiculo_Terrestre';

    protected $primaryKey='Placa';

    public $timestamps=false;


    protected $fillable =[
        'Placa',
        'Peso',
        'Capacidad',
        'Serial_Motor',
        'Altura',
        'Velocidad_Maxima',
        'Capacidad_Combustible',
        'Serial_Carroceria',
        'FK_Representa',
        'FK_Cuentacon'
    ];

    protected $guarded =[
        'Placa'
    ];
}
