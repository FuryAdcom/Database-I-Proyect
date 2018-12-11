<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Worker extends Model
{
    protected $table='Empleado';

    protected $primaryKey='Cedula';

    public $timestamps=false;

    protected $fillable =[
        'Cedula',
        'Nombre',
        'Apellido',
        'Correo_Personal',
        'Fecha_Nacimiento',
        'estado_civil',
        'Nivel_Academico',
        'Profesion',
        'Num_hijos',
        'FK_Habitacion'
    ];

    protected $guarded =[
        'Cedula',
        'Correo_Personal'
    ];
}
