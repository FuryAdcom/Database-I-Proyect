<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Packet extends Model
{
    protected $table='Paquete';

    protected $primaryKey='Numero_guia';

    public $timestamps=false;

    protected $fillable =[
        'Numero_guia',
        'Destinatario',
        'Peso',
        'Clasificacion',  
        'Telefono_Contacto',  
        'Ancho',  
        'Largo',  
        'Profundidad',  
        'FK_Transporta',  //Envio
        'FK_Entrega'   //Cliente
    ];

    protected $guarded =[
        'Numero_guia'
    ];
}
