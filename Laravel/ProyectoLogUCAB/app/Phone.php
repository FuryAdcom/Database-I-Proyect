<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Phone extends Model
{
    protected $table='Telefono';

    protected $primaryKey='Numero';

    public $timestamps=false;

    protected $fillable =[
        'Numero',
        'tipo',
        'FK_Dispositivo',  //Taller
        'FK_Comunicado',  //Persona-Contacto
        'FK_Telefonia',  //Empleado
        'FK_Posee'  //Oficina
    ];

    protected $guarded =[
        'Numero'
    ];
}
