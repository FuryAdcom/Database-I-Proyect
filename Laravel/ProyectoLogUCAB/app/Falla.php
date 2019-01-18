<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Falla extends Model
{
    protected $table='Falla';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Descripcion',  
        'FK_Origina',  //A
        'FK_Origina2',  //M
        'FK_Origina3'  //T
    ];

    protected $guarded =[
        'Codigo'
    ];
}
