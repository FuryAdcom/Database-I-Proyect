@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/envio">Inicio</a>
						<a href="/envio/create">Agregar</a>
						<a href="/envio/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar envios</h3>
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
											<th>Descripcion</th>
											<th>Lugar Origen</th>
											<th>Oficina Origen</th>
											<th>Lugar Destino</th>
											<th>Oficina Destino</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($envios as $envio)
										<tbody>	
											<th> {{$envio->Descripcion}} </th>
											<th> {{$envio->og.', '.$envio->oge}} </th>
											<th> {{$envio->ofog}} </th>
											<th> {{$envio->dest.', '.$envio->deste}} </th>
											<th> {{$envio->ofdest}} </th>
											<th> 
												<a class="boton_show btn btn-info" href="/envio/mostrar/{{$envio->Codigo}}"><i class="fa fa-align-left"></i></a>
												<a class="boton_show btn btn-secondary" href="/envio/edit/{{$envio->Codigo}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/envio/delete/{{$envio->Codigo}}"><i class="fa fa-times"></i></a> 
											</th>
										</tbody>
										@endforeach
									</table>
									{{ $envios->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection