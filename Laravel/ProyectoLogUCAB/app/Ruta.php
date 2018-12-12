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
        'FK_Ruta',
        'FK_Camino'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
