<%-- 
    Document   : GenerarInformes
    Created on : 24-04-2017, 12:35:12
    Author     : Sergio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/animate-custom.css" />
        <title>Generar Informes</title>
    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1000px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Sesion" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <c:set var="msn" scope="request" value="${requestScope.mensaje}" />

                    <c:if test="${msn !=null}">
                        <script>
                            alert('<c:out value="${msn}" />');
                        </script>

                    </c:if>
                    <form name="frmMedicamento" action="/AutomatizacionLibretaMedicamento/InformeMedicamento" method="POST">
                        <h1>Generar Informe </h1>
                        <h4>Informe Medicamento </h4>
                        <p class="login button">
                            <input type="submit" value="Generar Informe" name="btnInformeM" />
                        </p>
                    </form>
                    <form name="frmReserva" action="/AutomatizacionLibretaMedicamento/InformeReserva" method="POST">
                        <h4>Informe Reserva </h4>
                        <p class="login button">
                            <input type="submit" value="Generar Informe" name="btnInformeR" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>   
    </body>
</html>
