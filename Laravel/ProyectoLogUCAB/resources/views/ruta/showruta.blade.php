@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/ruta">Inicio</a>
						@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
							<a href="/ruta/create">Agregar</a>
						@endif
						<a href="/ruta/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar rutas</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<div>
							<h4 style="width: 100%; color:whitesmoke">Ruta mas usada, con {{$usada[0]->num}} usos: Codigo {{$usada[0]->Codigo.', Descripcion: '.$usada[0]->Descripcion}}</h4>
						</div>
						<!-- Busqueda -->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Codigo</th>
											<th>Descripcion</th>
											<th>Lugar Origen</th>
											<th>Oficina Origen</th>
											<th>Lugar Destino</th>
											<th>Oficina Destino</th>
											@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
											<th style="width: 94px;">Opciones</th>
											@endif
										</thead>
										@foreach ($rutas as $ruta)
										<tbody>	
											<th> {{$ruta->Codigo}} </th>
											<th> {{$ruta->Descripcion}} </th>
											<th> {{$ruta->og.', '.$ruta->oge}} </th>
											<th> {{$ruta->ofog}} </th>
											<th> {{$ruta->dest.', '.$ruta->deste}} </th>
											<th> {{$ruta->ofdest}} </th>
											@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
											<th> 
												<a class="boton_show btn btn-info" href="/ruta/mostrar/{{$ruta->Codigo}}"><i class="fa fa-align-left"></i></a>
												<a class="boton_show btn btn-secondary" href="/ruta/edit/{{$ruta->Codigo}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/ruta/delete/{{$ruta->Codigo}}"><i class="fa fa-times"></i></a> 
											</th>
											@endif
										</tbody>
										@endforeach
									</table>
									{{ $rutas->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection