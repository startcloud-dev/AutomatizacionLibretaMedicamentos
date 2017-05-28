<%-- 
    Document   : Inicio_Farmaceutico
    Created on : 11-abr-2017, 14:06:59
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/animate-custom.css" />
        <title> Login |Farmaceutico</title>
    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Sesion" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <h1>CESFAM :: Menu Farmaceutico</h1>
                    <br>
                    <a href="/AutomatizacionLibretaMedicamento/Bodega/AgregarBodega.jsp">Agregar Bodega</a>
                    <br>
                    <br>
                    <a href="/AutomatizacionLibretaMedicamento/Bodega/EliminarBodega.jsp">Eliminar Bodega</a>
                    <br>
                    <br>
                    <a href="Medicamento/AgregarMedicamento.jsp">Agregar Stock Medicamento</a>
                    <br>
                    <br>
                    <a href="Medicamento/EliminarMedicamento.jsp">Eliminar Stock Medicamento</a>
                    <br>
                    <br>
                    <a href="Farmaceutico/ReservaMedicamento.jsp">Reservar Medicamento</a>
                    <br>
                    <br>
                    <a href="Farmaceutico/EliminarReserva.jsp">Eliminar Reserva</a>
                    <br>
                    <br>
                    <a href="Farmaceutico/BuscarReserva.jsp">Buscar Reserva/ModificarEstado</a>
                    <br>
                    <br>
                    <a href="Farmaceutico/GenerarInformes.jsp">Emitir Informes </a>
                    <br>
                    <br>
                    <a href="Medicamento/BajaMedicamento.jsp">Justificar Baja de Medicamento </a>
                    <br>
                    <br>
                    <a href="Farmaceutico/RecetasPendientes.jsp" >RecetasPendientes</a>
                </div>
            </div>
        </div>
    </body>
</html>
