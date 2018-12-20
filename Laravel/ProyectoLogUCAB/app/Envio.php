<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Envio extends Model
{
    protected $table='Envio';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Monto',
        'Codigo',
        'FK_Destino'  //Lugar
    ];

    protected $guarded =[
        'Codigo'
    ];
}
