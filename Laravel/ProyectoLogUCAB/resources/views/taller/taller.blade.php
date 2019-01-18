@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/taller">Inicio</a>
						<a href="/taller/create">Agregar</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h2 style="text-align: center; color: whitesmoke">Consultar talleres</h2>
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
											<th>Codigo</th>
											<th>Revisado</th>
											<th>Fecha Entrada</th>
											<th>Salida Prevista</th>
											<th>Salida</th>
											<th>Ubicado</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($talleres as $office)
										<tbody>	
											<th> {{$office->Codigo}} </th>
											<th> {{$office->Flota_Revision}} </th>
											<th> {{$office->Fecha_Entrada}} </th>
											<th> {{$office->Fecha_Salida_Prevista}} </th>
											<th> {{$office->Fecha_Salida_Real}} </th>
											<th> {{$office->mun.', '.$office->est}} </th>
										    <th> 
												<a class="boton_show btn btn-secondary" href="/taller/edit/{{$office->Codigo}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/taller/delete/{{$office->Codigo}}"><i class="fa fa-times"></i></a> 
											</th>
										</tbody>
										@endforeach
									</table>
									{{ $talleres->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection