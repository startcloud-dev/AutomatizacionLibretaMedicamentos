<%-- 
    Document   : EliminarReceta
    Created on : 08-05-2017, 16:17:44
    Author     : CETECOM
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
        <title>Eliminar Receta | Doctor</title>
    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
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

                    <form name="frmFarmaceutico" action="/AutomatizacionLibretaMedicamento/EliminarReceta" method="POST">
                        <h1>Eliminar Receta</h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Codigo Receta</td>
                                    <td><input type="text" required="" name="txtReceta" value="" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <hr>
                        <p class="login button">
                            <input type="submit" value="Eliminar" name="btnELiminar" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Doctor.jsp">Volver al menu</a>
                        </p>
                    </form>

                    <c:set var="lista" scope="request" value="${requestScope.lista}" />

                    <c:if test="${lista!=null}">

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Receta</th>
                                    <th>Fecha Emision</th>
                                    <th>CodMedicamento</th>
                                    <th>Indicaciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "receta">
                                    <tr>
                                        <td><c:out value="${receta.id_receta}"/></td>
                                        <td><c:out value="${receta.fecha_emision}" /></td>
                                        <td><c:out value="${receta.codigo}" /></td>
                                        <td><c:out value="${receta.indicaciones}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>   
    </body>
</html>

