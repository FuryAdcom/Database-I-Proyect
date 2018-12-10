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
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>ID</th>
											<th>Nombre</th>
											<th>Vehiculos</th>
											<th>Empleados</th>
											<th>Encargado</th>
											<th>Opciones</th>
										</thead>
										@foreach ($empleados as $empleado)
										<tbody>	
											<th> {{$empleado->Codigo}} </th>
											<th> {{$empleado->Nombre}} </th>
											<th> {{$empleado->Cantidad_vehiculos}} </th>
											<th> {{$empleado->Cantidad_empleados}} </th>
											<th> {{$empleado->Empleado_cargo}} </th>
										    <th> <a class="btn btn-secondary" href="/empleado/edit/{{$empleado->Codigo}}">Editar</a><a class="btn btn-danger" href="/empleado/delete/{{$empleado->Codigo}}">Eliminar</a> </th>
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