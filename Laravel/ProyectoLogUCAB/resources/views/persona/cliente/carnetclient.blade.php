<!DOCTYPE html><html lang='en' class=''>
<head>
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/58828B1A-2292-3541-81E9-B11F4BD5CC3C/main.js" charset="UTF-8"></script>
    <script src='//static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
    <script src='//static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>
    <meta charset='UTF-8'>
    <meta name="robots" content="noindex">
    <link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
    <link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
    <link rel="canonical" href="https://codepen.io/kirandevadas/pen/NgKOrY" />


<style class="cp-pen-styles">
body {
			background-color: #d7d6d3;
			font-family:'verdana';
}
		.id-card {
			
			background-color: #fff;
			padding: 0px 0px 10px 0px;
			border-radius: 10px;
			text-align: center;
			box-shadow: 0 0 1.5px 0px #b9b9b9;
		}
		.id-card img {
			margin: 0 auto;
		}
		.header img {
    width: 105px;
    margin-top: 10px;
    padding-left: 95px;
		}
		h2 {
			font-size: 12px;
			margin: 5px 0;
      width: 300px;
      padding-left: 80px;
		}
		h3 {
			font-size: 11px;
			margin: 2.5px 0;
			font-weight: 300;
		}
		.image {
			height:80px;
      padding-left: 10px;
		}
		.image img {
			width: 70px;
		}
		p {
			font-size: 5px;
			margin: 2px;
		}
.cardfoot{
  width:400px;
}body {
  background-color: #d7d6d3;
  font-family: "verdana";
}
.id-card-holder {
  width: 400px;
  padding: 4px;
  margin: 0 auto;
  background-color: #1f1f1f;
  border-radius: 5px;
  position: relative;
}
.id-card {
  background-color: #fff;
  padding: 0px 0px 10px 0px;
  border-radius: 10px;
  text-align: center;
  box-shadow: 0 0 1.5px 0px #b9b9b9;
}
.id-card img {
  margin: 0 auto;
}
.header img {
  width: 140px;
  margin-top: 10px;
  padding-left: 95px;
}
h2 {
  font-size: 12px;
  margin: 5px 0;
  width: 300px;
  padding-left: 80px;
}
h3 {
  font-size: 11px;
  margin: 2.5px 0;
  font-weight: 300;
}
.image {
  height: 80px;
  padding-left: 10px;
}
.image img {
  width: 70px;
}
p {
  font-size: 5px;
  margin: 2px;
}
.cardfoot {
  width: 400px;
}
</style></head><body>
<div class="id-card-tag"></div>
<div class="id-card-tag-strip"></div>
<div class="id-card-hook"></div>
<div class="id-card-holder">
  <div class="id-card">
    <div class="header" style="width:400px;height:75px;background-color:#5f6f81;">
      <h2 style="float:left;width: 20px;font-size: x-large;padding-top: 14px; padding-left:20px">VIP</h2>
      <img src="{{public_path('/img/LogUCAB.png')}}">
    </div>
    <div class="image" style="text-align: left">
      <img align="left" src="{{public_path('/img/user-icon-silhouette.png')}}">
      <h2>Nombre: {{$cliente->Nombre.' '.$cliente->Apellido}}</h2>
      <h2>Cedula: {{$cliente->Cedula}}</h2>
    </div>

    <h3>www.logucab.com.ve</h3>

    <hr>
    <div class="cardfoot">
      <p><strong>"LogUCAB"</strong>
        <p>
          <p>Venezuela <strong>695033</strong></p>
    </div>

  </div>
</div>

</body></html>