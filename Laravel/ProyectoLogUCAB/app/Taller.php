<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Taller extends Model
{
    protected $table='Taller';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'FK_Locacion'  //Lugar
    ];

    protected $guarded =[
        'Codigo'
    ];
}
