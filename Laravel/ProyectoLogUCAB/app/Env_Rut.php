<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Env_Rut extends Model
{
    protected $table='Env-Rut';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'FK_Adquiere_Pa',   //Ruta
        'FK_Recorre'   //Envio
    ];

    protected $guarded =[
        'Codigo'
    ];
}
