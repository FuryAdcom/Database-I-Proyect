<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    protected $table='Estatus';

    protected $primaryKey='Codigo';

    protected $fillable =[
        'Codigo',
        'Descripcion',
        'FK_Revision'  //Empleado
    ];

    protected $guarded =[
        'Codigo'
    ];
}
