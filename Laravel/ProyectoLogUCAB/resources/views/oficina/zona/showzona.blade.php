@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/zona">Inicio</a>
						<a href="/zona/create">Agregar</a>
						<a href="/zona/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar zonas</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<!-- Busqueda-->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Nombre</th>
											<th>Tamaño (m­²)</th>
											<th>Oficina</th>
											<th>Municipio</th>
											<th>Estado</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($zonas as $zona)
										<tbody>	
											<th> {{$zona->Nombre}} </th>
											<th> {{$zona->Division_area}} </th>
											<th> {{$zona->ofi}} </th>
											<th> {{$zona->mun}} </th>
											<th> {{$zona->est}} </th>
										    <th> 
												<a class="boton_show btn btn-info" href="/zona/mostrar/{{$zona->Codigo}}"><i class="fa fa-align-left"></i></a>
												<a class="boton_show btn btn-secondary" href="/zona/edit/{{$zona->Codigo}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/zona/delete/{{$zona->Codigo}}"><i class="fa fa-times"></i></a> 
											</th>
										</tbody>
										@endforeach
									</table>
									{{ $zonas->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection