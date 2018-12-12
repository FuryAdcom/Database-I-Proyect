@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/rol">Inicio</a>
						<a href="/rol/create">Agregar</a>
						<a href="/rol/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar roles</h3>
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
										@foreach ($empleados as $rol)
										<tbody>	
											<th> {{$rol->Codigo}} </th>
											<th> {{$rol->Nombre}} </th>
											<th> {{$rol->Cantidad_vehiculos}} </th>
											<th> {{$rol->Cantidad_empleados}} </th>
											<th> {{$rol->Empleado_cargo}} </th>
										    <th> <a class="btn btn-secondary" href="/rol/edit/{{$rol->Codigo}}">Editar</a><a class="btn btn-danger" href="/rol/delete/{{$rol->Codigo}}">Eliminar</a> </th>
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