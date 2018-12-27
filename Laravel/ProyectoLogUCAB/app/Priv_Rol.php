<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Priv_Rol extends Model
{
    protected $table='Priv-Rol';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'FK_Opcion',  //Privilegio
        'FK_Accede_Sis'  //Rol
    ];

    protected $guarded =[
        'Codigo'
    ];
}
