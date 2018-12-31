<?php

namespace LogUCAB;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $table='Cliente';

    protected $primaryKey='Cedula';
    public $incrementing = false;

    public $timestamps=false;

    protected $fillable =[
        'Cedula',
        'Nombre',
        'Apellido',
        'Correo_Personal',
        'Fecha_Nacimiento',
        'Estado_Civil',
        'Empresa',
        'L_Vip',
        'Frecuente',
        'FK_Asignado_Tipo'  //Rol
    ];

    protected $guarded =[
        'Cedula',
        'Correo_Personal'
    ];

    public function getPdf($type = 'stream'){
        $pdf = app('dompdf.wrapper')->loadView('/persona/cliente/carnetclient', ['cliente' => $this]);
    
        if ($type == 'stream') {
            return $pdf->stream('carnet.pdf');
        }
    
        if ($type == 'download') {
            return $pdf->download('carnet.pdf');
        }
    }
}
