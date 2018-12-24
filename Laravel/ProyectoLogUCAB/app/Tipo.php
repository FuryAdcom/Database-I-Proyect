<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Tipo extends Model
{
    protected $table='Tipo';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Nombre',
        'Descripcion',
        'Costo',
        'FK_Es_de'  //Paquete
    ];

    protected $guarded =[
        'Codigo'
    ];
}
