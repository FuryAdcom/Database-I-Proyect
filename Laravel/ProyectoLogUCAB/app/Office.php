<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Office extends Model
{
    protected $table='oficina';

    protected $primaryKey='Codigo';

    public $timestamps=false;


    protected $fillable =[
        'Nombre',
        'Tamaño_deposito',
        'Cantidad_vehiculos',
        'Cantidad_empleados',
        'Empleado_cargo'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
