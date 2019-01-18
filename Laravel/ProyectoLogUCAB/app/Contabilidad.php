<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Contabilidad extends Model
{
    protected $table='Contabilidad';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Descripcion',
        'Monto',
        'Fecha',
        'FK_Calcula'  //Envio
    ];

    protected $guarded =[
        'Codigo'
    ];
}
