<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Office extends Model
{
    protected $table='Oficina';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'Nombre',
        'Tamaño_Deposito',
        'FK_Varios'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
