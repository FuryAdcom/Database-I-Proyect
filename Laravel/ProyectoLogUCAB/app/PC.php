<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class PC extends Model
{
    protected $table='Persona-Contacto';

    protected $primaryKey='CI';

    public $timestamps=false;

    protected $fillable =[
        'CI',
        'Nombre'
    ];

    protected $guarded =[
        'CI'
    ];
}
