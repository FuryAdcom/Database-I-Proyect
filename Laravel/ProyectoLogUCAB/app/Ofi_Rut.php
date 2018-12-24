<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Ofi_Rut extends Model
{
    protected $table='Ofi-Rut';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Costo',
        'Duracion',
        'FK_Camino', //Aer
        'FK_Camino2',  //Mar    
        'FK_Camino3',  //Terrestre
        'FK_Coche'   //Ruta
    ];

    protected $guarded =[
        'Codigo'
    ];
}
