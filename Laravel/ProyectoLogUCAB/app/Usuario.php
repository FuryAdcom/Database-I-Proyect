<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $table='Usuario';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Nombre',
        'Correo',
        'Contraseña',
        'FK_Sele_Concede'
    ];

    protected $guarded =[
        'Cedula',
        'Correo',
        'Contraseña'
    ];
}
