<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Env_Sta extends Model
{
    protected $table='Env-Est';

    protected $primaryKey='Codigo';

    protected $fillable =[
        'Codigo',
        'FK_Revisa_Sta',  //Envio
        'FK_Encuentra_Sta'   //Estatus
    ];

    protected $guarded =[
        'Codigo'
    ];
}
