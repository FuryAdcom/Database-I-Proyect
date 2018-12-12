<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $table='Cliente';

    protected $primaryKey='Cedula';

    public $timestamps=false;

    protected $fillable =[
        'Cedula',
        'Nombre',
        'Apellido',
        'Correo_Personal',
        'Fecha_Nacimiento',
        'estado_civil',
        'Empresa',
        'l_vip',
        'Frecuente'
    ];

    protected $guarded =[
        'Cedula',
        'Correo_Personal'
    ];
}
