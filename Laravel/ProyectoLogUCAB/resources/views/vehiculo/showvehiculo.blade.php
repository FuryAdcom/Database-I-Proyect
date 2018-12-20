@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/transporte">Inicio</a>
						<a href="/transporte/create">Agregar</a>
						<a href="/transporte/listaAerea">Aereos</a>
						<a href="/transporte/listaMarina">Maritimos</a>
						<a href="/transporte/listaTerrestre" style="border-bottom: 0px">Terrestres</a>
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
											<th>Peso</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($veh as $vehiculo)
										<tbody>
											<th> {{$vehiculo->Placa}} </th>
											<th> {{$tipo}} </th>
											<th> {{$vehiculo->mark}} </th>
											<th> {{$vehiculo->model}} </th>
											<th> {{$vehiculo->Peso}} </th>
											<th> 
												<a class="boton_show btn btn-info" href="/transporte/mostrar{{$tipo}}/{{$vehiculo->Placa}}"><i class="fa fa-align-left"></i></a>
												<a class="boton_show btn btn-secondary" href="/transporte/edit{{$tipo}}/{{$vehiculo->Placa}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/transporte/delete{{$tipo}}/{{$vehiculo->Placa}}"><i class="fa fa-times"></i></a> 
											</th>
										</tbody>
										@endforeach
									</table>
									{{ $veh->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@stop