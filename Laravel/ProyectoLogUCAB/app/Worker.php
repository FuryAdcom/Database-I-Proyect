<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Worker extends Model
{
    protected $table='empleado';

    protected $primaryKey='Cedula';

    public $timestamps=false;


    protected $fillable =[
        'Nombre',
        'Tamaño_deposito',
        'Cantidad_vehiculos',
        'Cantidad_empleados',
        'Empleado_cargo'
    ];

    protected $guarded =[
        'Cedula'
    ];
}
