@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/empleado">Inicio</a>
						<a href="/empleado/create">Agregar</a>
						<a href="/empleado/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar empleados</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<!-- Busqueda -->
						<div class="row">
							<div class="col-lg-15">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Cedula</th>
											<th>Nombre</th>
											<th>Apellido</th>
											<th>Correo</th>
											<th>Fecha de nacimiento</th>
											<th>Puesto</th>
											<th>Residencia</th>
											<th>Opciones</th>
										</thead>
										@foreach ($empleados as $empleado)
										<tbody>	
											<th> {{$empleado->Cedula}} </th>
											<th> {{$empleado->Nombre}} </th>
											<th> {{$empleado->Apellido}} </th>
											<th> {{$empleado->Correo_Personal}} </th>
											<th> {{$empleado->Fecha_Nacimiento}} </th>
											<th> {{$empleado->FK_Asignado_Puesto}} </th>
											<!-- Mostrar toda -->
											<th> {{$empleado->FK_Habitacion}} </th>
										    <th> <a class="btn btn-secondary" href="/empleado/edit/{{$empleado->Cedula}}">Editar</a><a class="btn btn-danger" href="/empleado/delete/{{$empleado->Cedula}}">Eliminar</a> </th>
										</tbody>
										@endforeach
									</table>
									{{ $empleados->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection