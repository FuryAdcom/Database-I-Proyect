<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $table='Cliente';

    protected $primaryKey='Cedula';
    public $incrementing = false;

    public $timestamps=false;

    protected $fillable =[
        'Cedula',
        'Nombre',
        'Apellido',
        'Correo_Personal',
        'Fecha_Nacimiento',
        'Estado_Civil',
        'Empresa',
        'L_Vip',
        'Frecuente',
        'FK_Asignado_Tipo'  //Rol
    ];

    protected $guarded =[
        'Cedula',
        'Correo_Personal'
    ];
}
