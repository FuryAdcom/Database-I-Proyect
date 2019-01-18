<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Audi extends Model
{
    protected $table='Auditoria';

    protected $primaryKey='Codigo';

    protected $fillable =[
        'Codigo',
        'Usuario',
        'Fecha_Ingreso',
        'Accion',
        'FK_Observa'  //Usuario
    ];

    protected $guarded =[
        'Codigo'
    ];
}
