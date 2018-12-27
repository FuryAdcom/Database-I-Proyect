<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Emp_Hor extends Model
{
    protected $table='Emp-Hor';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Fecha',
        'FK_Asistencia',  //Empleado
        'FK_Recibe_Emp'  //Horario
    ];

    protected $guarded =[
        'Codigo'
    ];
}
