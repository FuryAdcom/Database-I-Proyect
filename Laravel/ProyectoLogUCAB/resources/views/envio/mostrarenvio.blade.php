@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/envio">Inicio</a>
		<a href="/envio/create">Crear</a>
		<a href="/envio/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Ver-->
                        <h3 style="text-align: center; color: whitesmoke">Consulta de envio </h3>
						<form action="/envio/store3" method="POST">
							@csrf


							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Enviar</button>
							</div>
                        </form>
                        <!---->

                        <div id="content">

                                <div id="thermometer">
                        
                                    <div class="track">
                                        <div class="goal">
                                            <div class="amount"> 800 </div>
                                        </div>
                                        <div class="progress">
                                            <div class="amount">734 </div>
                                        </div>
                                        <div class="stop1">
                                            <div class="amount">$0 </div>
                                        </div>
                                        <div class="stop2">
                                            <div class="amount">$200 </div>
                                        </div>
                                        <div class="stop3">
                                            <div class="amount">$400 </div>
                                        </div>
                                        <div class="stop4">
                                            <div class="amount">$600 </div>
                                        </div>
                                    </div>
                        
                                </div>
                        
                            </div>

					</div>
				</div>		
@endsection