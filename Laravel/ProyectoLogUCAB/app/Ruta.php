<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Ruta extends Model
{
    protected $table='Ruta';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Descripcion',
        'FK_Ruta',   //Ruta
        'FK_Camino',   //Lugar
        'FK_Ofi_Destino',  //Oficina (Llegada)
        'FK_Ofi_Origen'    //Oficina (Salida)
    ];

    protected $guarded =[
        'Codigo'
    ];
}
