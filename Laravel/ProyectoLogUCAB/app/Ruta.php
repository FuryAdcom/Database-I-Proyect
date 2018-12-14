<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Ruta extends Model
{
    protected $table='Ruta';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Descripcion',
        'FK_Ruta',   //Ruta
        'FK_Camino'   //Lugar
    ];

    protected $guarded =[
        'Codigo'
    ];
}
