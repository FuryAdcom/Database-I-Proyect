<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Marca extends Model
{
    protected $table='Marca';

    protected $primaryKey='Codigo';

    public $timestamps=false;


    protected $fillable =[
        'Descripcion'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
