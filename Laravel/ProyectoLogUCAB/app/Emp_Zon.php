<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Emp_Zon extends Model
{
    protected $table='Emp-Zon';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'FK_Asiste',  //Empleado
        'FK_Asignar'  //Zona
    ];

    protected $guarded =[
        'Codigo'
    ];
}
