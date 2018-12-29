@extends('layouts.app')

@section('contenido')
<div class="wrapper">
    <div class="contenido_ppal" style="width: 100%">
       
        <h3 style="text-align: center; color: whitesmoke">Inicio</h3>
        @if(Auth::check() && Auth::user()->rol == 7)
        <div style="width:100%; height: 40px; float: left; text-align:center">
            <a href="/cliente/create" class="btn btn-info btn-lg">Formulario</a>
        </div>
        @endif
    </div>
</div>		
@endsection
