<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Veh_Tall extends Model
{
    protected $table='Veh-Tall';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Flota_Revision',
        'Fecha_Entrada',
        'Fecha_Salida_Prevista',
        'Fecha_Salida_Real',
        'Proxima_Fecha',
        'FK_Enviar', //Aer
        'FK_Enviar2',  //Mar    
        'FK_Enviar3',  //Terrestre
        'FK_Chequear',   //Taller
        'FK_Refleja'  //Contabilidad
    ];

    protected $guarded =[
        'Codigo'
    ];
}
