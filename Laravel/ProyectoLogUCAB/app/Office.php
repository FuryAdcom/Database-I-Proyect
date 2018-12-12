<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Office extends Model
{
    protected $table='Oficina';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Nombre',
        'Tamaño_deposito',
        'FK_Varios'
    ];

    protected $guarded =[
        'Codigo'
    ];
}
