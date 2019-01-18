@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/envio">Inicio</a>
						<a href="/envio/create">Crear</a>
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
											<th style="width:10px">Codigo</th>
											<th style="width:10px">Guia paquete</th>
											<th>Cedula cliente</th>
											<th>Destinatario</th>
											<th>Oficina Destino</th>
											<th style="width:10px">Monto</th>
											<th style="width:166px">Opciones</th>
										</thead>
										@foreach ($envios as $envio)
											@if(isset($cliente))
												@if($envio->cli == $cliente->Cedula)
													<tbody>	
														<th style="text-align:center"> {{$envio->Codigo}} </th>
														<th style="text-align:center"> {{$envio->paq}} </th>
														<th style="text-align:center"> {{$envio->cli}} </th>
														<th> {{$envio->dest}} </th>
														<th> {{$envio->of}} </th>
														<th style="text-align:center"> {{$envio->Monto}} </th>
														<th> 
															<a class="btn btn-info" href="/envio/mostrar/{{$envio->Codigo}}"><i class="fa fa-align-left"></i>Ver</a>
															<a class="btn btn-danger" href="/envio/cancel/{{$envio->Codigo}}"><i class="fa fa-times"></i>Cancelar</a> 
														</th>
													</tbody>
												@endif
											@else
												<tbody>	
													<th style="text-align:center"> {{$envio->Codigo}} </th>
													<th style="text-align:center"> {{$envio->paq}} </th>
													<th style="text-align:center"> {{$envio->cli}} </th>
													<th> {{$envio->dest}} </th>
													<th> {{$envio->of}} </th>
													<th style="text-align:center"> {{$envio->Monto}} </th>
													<th> 
														<a class="btn btn-info" href="/envio/mostrar/{{$envio->Codigo}}"><i class="fa fa-align-left"></i>Ver</a>
														<a class="btn btn-danger" href="/envio/cancel/{{$envio->Codigo}}"><i class="fa fa-times"></i>Cancelar</a> 
													</th>
												</tbody>
											@endif
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