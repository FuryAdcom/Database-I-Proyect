@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/oficina">Inicio</a>
		<a href="/oficina/create">Crear</a>
		<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
    <!--Ver-->
        <h3 style="text-align: center; color: whitesmoke">Consulta de oficina </h3>
        
        <!-- oficina -->
        <div style="width: 50%;float:left;">
            <h4 style="color: whitesmoke">Datos de la oficina:</h4>
            <label style="padding-left: 20px; color:whitesmoke">Codigo: {{$oficina->Codigo}}</label><br>
            <label style="padding-left: 20px; color:whitesmoke">Municipio: {{$oficina->sitio}}</label><br>
            <label style="padding-left: 20px; color:whitesmoke">Estado: {{$oficina->estado}}</label><br>
            <label style="padding-left: 20px; color:whitesmoke">Nombre: {{$oficina->Nombre}}</label><br>
            <label style="padding-left: 20px; color:whitesmoke">Tamaño deposito: {{$oficina->Tamaño_Deposito}}</label><br>
        </div>

        <!-- Pago de servicio -->
        <div style="width:100%; height: 40px; float: left; text-align:center">
            <a href="/oficina/servicio/{{$oficina->Codigo}}" class="btn btn-primary">Pagar servicio</a>
        </div>
        <!-- Pago de servicio -->
        @if($comp)
            <!-- Traer de taller -->
            <div style="width:100%; height: 40px; float: left; text-align:center">
                <a href="/taller/salida/{{$oficina->Codigo}}" class="btn btn-primary">Llegada de taller</a>
            </div>
            <!-- Traer de taller -->
        @else
            <!-- Enviar a taller -->
            <div style="width:100%; height: 40px; float: left; text-align:center">
                <a href="/taller/flota/{{$oficina->Codigo}}" class="btn btn-primary">Enviar a taller</a>
            </div>
            <!-- Enviar a taller -->
        @endif
	</div>
</div>		
@endsection