<%-- 
    Document   : DisponibilidadStock
    Created on : 12-06-2017, 16:43:16
    Author     : CETECOM
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib   prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/bootstrap.min.css" />
        <script type="text/javascript" src="/AutomatizacionLibretaMedicamento/js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="/AutomatizacionLibretaMedicamento/js/jquery-3.2.1.min.js" ></script>
        <title>Disponibilidad stock || farmaceutico</title>

    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Sesion" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <h1>Disponibilidad stock </h1>
                    <a href="/AutomatizacionLibretaMedicamento/Medicamento/AumentarStock.jsp">Aumentar stock medicamento</a>
                    <br>
                    <br>
                    <a href="/AutomatizacionLibretaMedicamento/Medicamento/DisminuirStock.jsp">Entregar medicamento</a>

                    <p class="login button">
                        <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>
