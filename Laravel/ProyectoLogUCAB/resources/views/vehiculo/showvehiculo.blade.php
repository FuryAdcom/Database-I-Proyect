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
										</thead>
										<tbody>
											<!-- Tabla para listar -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@stop