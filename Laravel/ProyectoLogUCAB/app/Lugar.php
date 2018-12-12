<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Lugar extends Model
{
    protected $table='Lugar';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Nombre',
        'Tipo',
        'FK_Lugar'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
