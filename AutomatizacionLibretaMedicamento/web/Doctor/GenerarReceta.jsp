<%-- 
    Document   : GenerarReceta
    Created on : 19-05-2017, 05:18:09 PM
    Author     : LeslieK
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/bootstrap.min.css" />
        <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
        <title>Generar | Receta</title>



    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Sesion" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <header>
                        <hgroup>
                            <h1>Generar Receta </h1>
                        </hgroup>
                    </header>


                    <c:set var="msn" scope="request" value="${requestScope.mensaje}">

                    </c:set>

                    <c:if test="${msn!=null}">

                        <script>

                            alert('<c:out value="${msn}" />');

                        </script>

                    </c:if>
                    <hgroup>
                        <h3></h3>
                    </hgroup>

                    <form name="frmGenerarReceta" action="/AutomatizacionLibretaMedicamento/GenerarReceta" method="POST">

                      
                        
                       <h4>Codigo Receta </h4>
                       <input type="text" name="txtId" placeholder="codigo receta" required="" value="" />
                               

                        <hr>
                        <p class="login button">
                            <input type="submit" value="Generar Receta" name="btnGenerarRecetas" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Doctor.jsp">Volver al menu</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

