<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Servicio extends Model
{
    protected $table='Servicio';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $guarded =[
        'Codigo'
    ];
}
