<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Zona extends Model
{
    protected $table='Zona';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Nombre',
        'Descripcion',
        'Division_area',
        'FK_Divide'  //Oficina
    ];

    protected $guarded =[
        'Codigo'
    ];
}
