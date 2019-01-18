<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Pago extends Model
{
    protected $table='Pago';

    protected $primaryKey='Numero_unico';

    public $timestamps=false;

    protected $fillable =[
        'Numero_unico',
        'Fecha',
        'Monto_Total',
        'FK_Costo',  //Cliente
        'FK_Realiza',  //Envio
        'FK_Cancela1',  //Tipo Efectivo
        'FK_Cancela2',  //Tipo CC
        'FK_Cancela3'  //Tipo Cheque
    ];

    protected $guarded =[
        'Numero_unico'
    ];
}
