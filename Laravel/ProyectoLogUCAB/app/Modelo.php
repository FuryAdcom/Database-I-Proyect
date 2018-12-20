<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Modelo extends Model
{
    protected $table='Modelo';

    protected $primaryKey='Codigo';

    public $timestamps=false;


    protected $fillable =[
        'Codigo',
        'Descripcion',
        'FK_Contiene'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
