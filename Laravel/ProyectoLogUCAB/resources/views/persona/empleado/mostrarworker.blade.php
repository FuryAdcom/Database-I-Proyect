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
    <h3 style="text-align: center; color: whitesmoke">Consulta de empleado </h3>
    
    <!---->
    <div style="width: 50%;float:left;">
        <h4 style="color: whitesmoke">Datos del empleado:</h4>
        <label style="padding-left: 20px; color:whitesmoke">CI: {{$empleado->Cedula}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Nombre: {{$empleado->Nombre}}</label><br>
        <label style="padding-left: 20px; color:whitesmoke">Apellido: {{$empleado->Apellido}}</label><br>
        @if(isset($telf))<label style="padding-left: 20px; color:whitesmoke">Telefono: {{$telf->Numero}}</label><br>@endif
        <label style="padding-left: 20px; color:whitesmoke">Fecha nacimiento: {{$empleado->Fecha_Nacimiento}}</label><br>
        @if(isset($empleado->Empleado_Cargo))<label style="padding-left: 20px; color:whitesmoke">Gerente de oficina codigo: {{$empleado->Empleado_Cargo}}</label><br>@endif
    </div>
    <!-- Cambio de status -->
    <h3 style="text-align: center; color: whitesmoke; ">Marcar asistencia</h3>
    <form action="/empleado/assist" method="POST">
    @csrf
			<input type="number" name="Cedula" value="{{$empleado->Cedula}}" class="form-control" hidden>
            <div class="form-group" style="width:49%; float: right">
            <label for="inputinicio" style="color: whitesmoke">Hora inicio:</label>
            <input type="time" name="I" class="form-control" id="inicio" placeholder="Introduzca hora" required>
    </div>
    <div class="form-group" style="width:49%; float: right">
            <label for="inputfin" style="color: whitesmoke">Hora fin:</label>
            <input type="time" name="F" class="form-control" id="fin" placeholder="Introduzca hora" required>
    </div>
        <div style="width:100%; height: 40px; float: right; ">
            <button type="submit" style="float: right;"  class="btn btn-primary">Asistio</button>
        </div>
    </form>

    <!-- Horario -->
@if(isset($horarios))
    <div class="row" style="width:100%; float: left; ">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-condensed table-hover">
                        <thead class="thead-dark">
                            <th>Dia</th>
                            <th>Descripcion</th>
                            <th>Inicio</th>
                            <th>Fin</th>
                        </thead>
                        @foreach ($horarios as $horario)
                        <tbody>	
                            <th> {{$horario->Dia}} </th>
                            <th> {{$horario->Descripcion}} </th>
                            <th> {{$horario->Hora_Inicio}} </th>
                            <th> {{$horario->Hora_Fin}} </th>
                        </tbody>
                        @endforeach
                    </table>
                    {{ $horarios->links() }}
                </div>
            </div>
        </div>
@endif

	</div>
</div>		
@endsection