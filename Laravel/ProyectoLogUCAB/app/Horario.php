<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    protected $table='Horario';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Dia',  
        'Descripcion',
        'Hora_Inicio',
        'Hora_Fin',
        'FK_cada-uno'  //Empleado
    ];

    protected $guarded =[
        'Codigo'
    ];
}
