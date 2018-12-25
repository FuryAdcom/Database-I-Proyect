<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Envio extends Model
{
    protected $table='Envio';

    protected $primaryKey='Codigo';

    protected $fillable =[
        'Codigo',
        'Monto',
        'FK_Destino'  //Lugar
    ];

    protected $guarded =[
        'Codigo'
    ];

    public function getPdf($type = 'stream'){
        $pdf = app('dompdf.wrapper')->loadView('/envio/order-pdf', ['order' => $this]);
    
        if ($type == 'stream') {
            return $pdf->stream('invoice.pdf');
        }
    
        if ($type == 'download') {
            return $pdf->download('invoice.pdf');
        }
    }
}
