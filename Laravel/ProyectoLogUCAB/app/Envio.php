<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Envio extends Model
{
    protected $table='Envio';

    protected $primaryKey='Codigo';

    protected $fillable =[
        'Codigo',
        'Monto',
        'FK_Destino'  //Lugar
    ];

    protected $guarded =[
        'Codigo'
    ];
}
