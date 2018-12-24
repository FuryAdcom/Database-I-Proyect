<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Ofi_Paq extends Model
{
    protected $table='Ofi-Paq';

    protected $primaryKey='Codigo';

    protected $fillable =[
        'Codigo',
        'FK_Almacena',  //Oficina
        'FK_Llega'  //Paquete
    ];

    protected $guarded =[
        'Codigo'
    ];
}
