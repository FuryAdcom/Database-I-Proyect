<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>LogUCAB Website</title>
		<meta name="description" content="A sidebar menu as seen on the Google Nexus 7 website" />
		<meta name="keywords" content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
		<meta name="author" content="Codrops" />
		<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="{{asset('/css/normalize.css')}}" />
		<link rel="stylesheet" type="text/css" href="{{asset('/css/demo.css')}}" />
		<link rel="stylesheet" type="text/css" href="{{asset('/css/component.css')}}" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    	<script src="{{asset('/js/modernizr.custom.js')}}"></script>
	</head>
	<body style="background: #34495e; overflow-y: scroll">
		<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li class="gn-search-item">
									<input placeholder="Buscar" type="search" class="gn-search">
									<a class="gn-icon gn-icon-search"><span>Buscar</span></a>
								</li>
								<li>
									<a href="/vehiculo"><i class="fa fa-car" id="inside_opt"></i>Vehiculos</a>
									<ul class="gn-submenu">
										<a href="/vehiculo/create"><li class="sub_option"><i class="fa fa-plus" id="inside_opt"></i>Agregar</li></a>
										<a href="/vehiculo/edit"><li class="sub_option"><i class="fa fa-wrench" id="inside_opt"></i>Modificar</li></a>
										<a href="/vehiculo/show"><li class="sub_option"><i class="fa fa-newspaper" id="inside_opt"></i>Consultar</li></a>
										<a href="/vehiculo/destroy"><li class="sub_option"><i class="fa fa-times" id="inside_opt"></i>Eliminar</li></a>
									</ul>
								</li>
								<li><a class="gn-icon gn-icon-cog">Settings</a></li>
								<li><a class="gn-icon gn-icon-help">Help</a></li>
								<li><a class="gn-icon gn-icon-help">Prueba</a></li>
								<li>
									<a class="gn-icon gn-icon-archive">Archives</a>
									<ul class="gn-submenu">
										<li><a class="gn-icon gn-icon-article">Articles</a></li>
										<li><a class="gn-icon gn-icon-pictures">Images</a></li>
										<li><a class="gn-icon gn-icon-videos">Videos</a></li>
									</ul>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a href="#">LogUCAB</a></li>
				<li><a href="#"><i class="fa fa-user"></i> <span>Login</span></a></li>
			</ul>
		<div class="container">
			<!--@yield('Content')-->
			@yield('contenido')
			<!--Til here-->	
		</div><!-- /container -->
		<script src="{{asset('/js/classie.js')}}"></script>
		<script src="{{asset('/js/gnmenu.js')}}"></script>
		<script src="{{asset('/js/forms.js')}}"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
	</body>
</html>