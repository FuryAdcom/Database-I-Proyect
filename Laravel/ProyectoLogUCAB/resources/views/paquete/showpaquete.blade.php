@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/paquete">Inicio</a>
						<a href="/paquete/create">Agregar</a>
						<a href="/paquete/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar paquetes</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<h4 style="color:darkred">AVISO: Si el texto del paquete es rojo, su paquete lleva mas de 24 horas en la oficina.</h4>
						<!-- Busqueda -->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Numero guia</th>
											<th>Cliente</th>
											<th>Destinatario</th>
											<th>Clasificacion</th>
											<th>Peso (Kg)</th>
											<th>Medidas (AxLxP m)</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($paquetes as $paquete)
											@if(isset($cliente))
												@if($paquete->FK_Entrega == $cliente->Cedula)
													<tbody @if($paquete->creado < $actual) style="color:indianred" @endif>	
														<th style="text-align:center"> {{$paquete->Numero_guia}} </th>
														<th> {{$paquete->nombre.' '.$paquete->apellido}} </th>
														<th> {{$paquete->Destinatario}} </th>
														<th> {{$paquete->Clasificacion}} </th>
														<th style="text-align:center"> {{$paquete->Peso}} </th>
														<th style="text-align:center"> {{$paquete->Ancho.' x '.$paquete->Largo.' x '.$paquete->Profundidad}} </th>
														<th> 
															<a class="boton_show btn btn-info" href="/paquete/mostrar/{{$paquete->Numero_guia}}"><i class="fa fa-align-left"></i></a>
															<a class="boton_show btn btn-secondary" href="/paquete/edit/{{$paquete->Numero_guia}}"><i class="fa fa-wrench"></i></a>
															<a class="boton_show btn btn-danger" href="/paquete/delete/{{$paquete->Numero_guia}}"><i class="fa fa-times"></i></a> 
														</th>
													</tbody>
												@endif
											@else
												<tbody @if($paquete->creado < $actual) style="color:indianred" @endif>	
													<th style="text-align:center"> {{$paquete->Numero_guia}} </th>
													<th> {{$paquete->nombre.' '.$paquete->apellido}} </th>
													<th> {{$paquete->Destinatario}} </th>
													<th> {{$paquete->Clasificacion}} </th>
													<th style="text-align:center"> {{$paquete->Peso}} </th>
													<th style="text-align:center"> {{$paquete->Ancho.' x '.$paquete->Largo.' x '.$paquete->Profundidad}} </th>
													<th> 
														<a class="boton_show btn btn-info" href="/paquete/mostrar/{{$paquete->Numero_guia}}"><i class="fa fa-align-left"></i></a>
														<a class="boton_show btn btn-secondary" href="/paquete/edit/{{$paquete->Numero_guia}}"><i class="fa fa-wrench"></i></a>
														<a class="boton_show btn btn-danger" href="/paquete/delete/{{$paquete->Numero_guia}}"><i class="fa fa-times"></i></a> 
													</th>
												</tbody>
											@endif
										@endforeach
									</table>
									{{ $paquetes->links() }}
								</div>
							</div>
						</div>
						<!---->
						<h4 style="text-align: center; color: whitesmoke">Consulta extra</h4>
						<a class="btn btn-primary" href="/paquete/promedio" role="button">Peso promedio por oficina</a>
					</div>
				</div>		
@endsection