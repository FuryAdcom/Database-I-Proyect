<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Ofi_Ser extends Model
{
    protected $table='Ofi-Ser';

    protected $primaryKey='Codigo';

    public $timestamps=false;

    protected $fillable =[
        'Codigo',
        'FK_Gasta',  //Oficina
        'FK_Pago', //Contabilidad
        'FK_Ofrece'  //Servicio
    ];

    protected $guarded =[
        'Codigo'
    ];
}
