@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/transporte">Inicio</a>
						<a href="/transporte/create">Agregar</a>
						<a href="/transporte/edit">Modificar</a>
						<a href="/transporte/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
                        <h3 style="text-align: center; color: whitesmoke">Consultar vehiculo</h3>
						<!-- Busqueda -->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Placa</th>
											<th>Clasificacion</th>
											<th>Marca</th>
											<th>Modelo</th>
											<th>Opciones</th>
										</thead>
										<tbody>
											@foreach ($veha or $vehm or $veht as $vehiculo)
												@if($vehiculo->Clasificacion == 'a')
													<th> {{$vehiculo->Placa}} </th>
													<th> Aereo </th>
													<th> {{$vehiculo->Marca}} </th>
													<th> {{$vehiculo->Modelo}} </th>
													<th> <a class="btn btn-primary">Crear</a><a class="btn btn-secondary">Editar</a><a class="btn btn-danger">Eliminar</a> </th>
												@endif
												@if($vehiculo->Clasificacion == 'm')
													<th> {{$vehiculo->Placa}} </th>
													<th> Maritimo </th>
													<th> {{$vehiculo->Marca}} </th>
													<th> {{$vehiculo->Modelo}} </th>
													<th> <a class="btn btn-primary">Crear</a><a class="btn btn-secondary">Editar</a><a class="btn btn-danger">Eliminar</a> </th>
												@endif
												@if($vehiculo->Clasificacion == 't')
													<th> {{$vehiculo->Placa}} </th>
													<th> Terrestre </th>
													<th> {{$vehiculo->Marca}} </th>
													<th> {{$vehiculo->Modelo}} </th>
													<th> <a class="btn btn-primary">Crear</a><a class="btn btn-secondary">Editar</a><a class="btn btn-danger">Eliminar</a> </th>
												@endif
											@endforeach
										</tbody>
									</table>
									{{ $veha->links() }}
									{{ $vehm->links() }}
									{{ $veht->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@stop