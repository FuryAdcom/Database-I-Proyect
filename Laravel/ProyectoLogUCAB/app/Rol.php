<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Rol extends Model
{
    protected $table='Rol';

    protected $primaryKey='Codigo';

    public $timestamps=false;


    protected $fillable =[
        'Codigo',
        'Tipo',
        'FK_Asignado_tipo',
        'FK_Asignado_Puesto'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
