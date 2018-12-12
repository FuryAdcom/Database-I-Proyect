@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/oficina">Inicio</a>
						<a href="/oficina/create">Agregar</a>
						<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar oficinas</h3>
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
										@foreach ($oficinas as $office)
										<tbody>	
											<th> {{$office->Codigo}} </th>
											<th> {{$office->Nombre}} </th>
											<th> {{$office->Cantidad_vehiculos}} </th>
											<th> {{$office->Cantidad_empleados}} </th>
											<th> {{$office->Empleado_cargo}} </th>
										    <th> <a class="btn btn-secondary" href="/oficina/edit/{{$office->Codigo}}">Editar</a><a class="btn btn-danger" href="/oficina/delete/{{$office->Codigo}}">Eliminar</a> </th>
										</tbody>
										@endforeach
									</table>
									{{ $oficinas->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection