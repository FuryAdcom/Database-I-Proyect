@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/rol" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar rol</h3>
		<form method="POST" action="/rol/update">
			@csrf
			<input type="text" name="Codigo" value="{{$validated->Codigo}}" hidden="">

			<div class="form-group" style="width:100%; float: left">
				<label for="inputTipo" style="color: whitesmoke">Tipo</label>
				<input type="text" name="Tipo" value="{{$validated->Tipo}}" class="form-control" id="Tipo" placeholder="Introduzca el nombre" required>
			</div>
			<!-- Privilegios -->
			<div class="form-group" style="width:100%; float: left">
				<h4 for="inputTipo" style="width:100%;color: whitesmoke;">Seleccione Privilegios</h4>
				@foreach ($privs as $priv)
					<input class="form-check-input" name="{{$priv->tipo}}" type="checkbox" value="true" 
					@foreach ($pr as $x)
						@if ( $x->FK_Opcion==$priv->Codigo ) checked @endif
					@endforeach id="input{{$priv->tipo}}">
					<label for="inputTipo" style="padding-left:20px;width:100%;color: whitesmoke;">{{$priv->tipo}}</label>
				@endforeach
			</div>
			<!---->
			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection