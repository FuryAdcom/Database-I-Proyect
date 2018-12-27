@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/envio">Inicio</a>
		<a href="/envio/create">Crear</a>
		<a href="/envio/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
    <!--Ver-->
    <h3 style="text-align: center; color: whitesmoke">Consulta de envio </h3>
    
    <!-- Recibo -->
    <div style="width:100%; height: 40px; float: left; text-align:right">
        <a href="/envio/recibo/{{$envio->Codigo}}" class="btn btn-dark btn-lg">Ver recibo</a>
    </div>
    <!-- Recibo -->
    <!-- Envio -->
    <div style="width: 50%;float:left;">
        <h4 style="color: whitesmoke">Datos del envio:</h4>
        <label style="padding-left: 20px; color:whitesmoke">Codigo: {{$envio->Codigo}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Origen: {{'Oficina '.$oo->Nombre}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Destino: {{'Oficina '.$od->Nombre.' en '.$destino->Nombre.', estado '.$destino->est}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Cliente: {{$cliente->Nombre.' '.$cliente->Apellido}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Telefono contacto: {{$packet->Telefono_Contacto}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Destinatario: {{$packet->Destinatario}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Monto a pagar: {{$envio->Monto}} Bs</label><br>
    </div>
    <!-- Paquete -->
    <div style="width: 50%;float:right">
        <h4 style="color: whitesmoke">Datos del paquete:</h4>
        <label style="padding-left: 20px; color:whitesmoke">Numero guia: {{$packet->Numero_guia}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Clasificacion: {{$packet->Clasificacion}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Peso: {{$packet->Peso}} Kg</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Dimensiones (AxLxP): {{$packet->Ancho}} m x {{$packet->Largo}} m x {{$packet->Profundidad}} m</label><br>
    </div><br>
    <h2 style="width:100%; text-align:center; color:whitesmoke; float: left"> Fecha estimada de llegada: {{$est}} </h2>
    <!-- Termometro -->
    <div id="conterm">

        <div id="thermometer">
                        
            <div class="track">
                                        <div class="goal">
                                            <div class="amount"> 100 </div>
                                            <label style="color:darkslategrey">Fecha: @if($amount == 100) {{$fecha}} @else - @endif</label>
                                        </div>
                                        <div class="progress">
                                            <div class="amount"> {{$amount}} </div>
                                        </div>
                                        <div class="stop1">
                                            <div class="amount"> Recibido en origen </div>
                                            <label style="color:darkslategrey">Fecha: {{$envio->created_at}}</label>
                                        </div>
                                        <div class="stop2">
                                            <div class="amount"> Trasladando </div>
                                            <label style="color:darkslategrey">Fecha: @if($amount == 25) {{$fecha}} @else - @endif </label>
                                        </div>
                                        <div class="stop3">
                                            <div class="amount"> Transportando a destino </div>
                                            <label style="color:darkslategrey">Fecha: @if($amount == 50) {{$fecha}} @else - @endif </label>
                                        </div>
                                        <div class="stop4">
                                            <div class="amount"> En espera de retiro </div>
                                            <label style="color:darkslategrey">Fecha: @if($amount == 75) {{$fecha}} @else - @endif </label>
                                        </div>
            </div>
                        
        </div>
                        
    </div>
    <!-- Termometro -->
    <!-- Cambio de status -->
    <div style="width:100%; height: 40px; float: left; text-align:center">
        <a href="/envio/status/{{$envio->Codigo}}" class="btn btn-primary">Cambiar status</a>
    </div>
    <!-- Cambio de status -->

	</div>
</div>		
@endsection