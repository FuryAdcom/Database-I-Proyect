<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Recibo - #{{$envio->Codigo}}</title>

    <style type="text/css">
        @page {
            margin: 0px;
        }
        body {
            margin: 0px;
        }
        * {
            font-family: Verdana, Arial, sans-serif;
        }
        a {
            color: #fff;
            text-decoration: none;
        }
        table {
            font-size: x-small;
        }
        tfoot tr td {
            font-weight: bold;
            font-size: x-small;
        }
        .invoice table {
            margin: 15px;
        }
        .invoice h3 {
            margin-left: 15px;
        }
        .information {
            background-color: #5f6f81;
            color: #FFF;
        }
        .information .logo {
            margin: 5px;
        }
        .information table {
            padding: 10px;
        }
    </style>

</head>
<body>

<div class="information">
    <table width="100%">
        <tr>
            <td align="left" style="width: 40%;">
                <h3>{{$envio->cnom.' '.$envio->cape}}</h3>
                <pre>
Cedula: {{$envio->cced}}
Empresa: {{$envio->cemp}}
Telefono contacto: {{$envio->cont}}
Venezuela
<br /><br />
Fecha de envio: {{$envio->created_at}}
Destinatario: {{$envio->dest}}
Via: {{$envio->via}}
Vehiculo: {{$envio->vplaca}}
</pre>
          </td>
            <td align="center">
                <img src="{{public_path('/img/LogUCAB.png')}}" alt="Logo" width="250" class="logo"/>
            </td>
            <td align="right" style="width: 40%;">

                <h3>LogUCAB</h3>
                <pre>
                    https://LogUCAB.com.ve

                    Oficina origen:
                    Nombre: {{$envio->ofnom}}
                    <br>
                    Oficina destino:
                    Nombre: {{$envio->ofnomd}}
                    Ubicada: {{$envio->mund.', '.$envio->estd}}
                    Venezuela
                </pre>
            </td>
        </tr>

    </table>
</div>


<br/>

<div class="invoice">
    <h3>Recibo de envio #{{$envio->Codigo}}</h3>
    <h4 style="padding-left: 20px">Paquete N° Guia: {{$envio->pnum}}</h4>
    <table width="100%">
        <thead>
        <tr>
            <th>Descripcion</th>
            <th>Dimensiones (AxLxP)</th>
            <th>Peso</th>
            <th>Total</th>
        </tr>
        </thead>

        <!--Cuerpo del recibo-->
        <tbody>
        <tr>
            <td>{{$envio->class}}</td>
            <td>{{$envio->ancho.' m'.$envio->largo.' m'.$envio->prof.' m'}}</td>
            <td>{{$envio->peso}}</td>
            <td align="left">{{$envio->Monto}} Bs</td>
        </tr>
        </tbody>

        <tfoot>
        <tr>
            <td colspan="1"></td>
            <td colspan="1"></td>
            <td align="left">Total</td>
            <td align="left" class="gray">{{$envio->Monto}} Bs</td>
        </tr>
        </tfoot>
    </table>
</div>

<div class="information" style="position: absolute; bottom: 0;">
    <table width="100%">
        <tr>
            <td align="left" style="width: 50%;">
                &copy; {{ date('Y') }} {{ config('app.url') }} - Derechos reservados.
            </td>
            <td align="right" style="width: 50%;">
                SISLogUCAB
            </td>
        </tr>

    </table>
</div>
</body>
</html>