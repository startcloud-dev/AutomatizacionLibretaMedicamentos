<%-- 
    Document   : AgregarTratamiento
    Created on : 17-04-2017, 17:43:17
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
        <title>Agregar | Tratamiento</title>
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

                    <form name="frmAgregarTratamiento" action="/AutomatizacionLibretaMedicamento/AgregarTratamiento" method="POST">
                        <h1>Agregar Tratamiento</h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Numero </td>
                                    <td><input type="text" name="txtId_tratamiento" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Duracion</td>
                                    <td><input type="text" name="txtDuracion" value="" /></td>
                                </tr>
                                <tr>
                                    <td>N° Reserva</td>
                                    <td><input type="text" name="txtId_Reserva" value="" /></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr>
                        <p class="login button">
                            <input type="submit" value="Agregar" name="btnAgregar" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Doctor.jsp">Volver al menu</a>
                        </p>
                    </form>
                        
                         <hr>
                    <c:set  var="lista" scope="request" 
                            value="${requestScope.lista}">
                    </c:set >

                    <c:if test="${requestScope.lista!=null}">

                        <hr>

                        <table  class="table table-bordered" >
                            <thead>
                                <tr>
                                    <th>IdTratamiento</th>
                                    <th>Duracion</th>
                                    <th>IdReserva</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "trata" >
                                    <tr>
                                        <td><c:out value="${trata.id_tratamiento}" /></td>
                                        <td><c:out value="${trata.duracion}" /></td>
                                        <td><c:out value="${trata.id_reserva}" /></td>

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


