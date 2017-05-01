<%-- 
    Document   : EliminarMedicamento
    Created on : 09-04-2017, 1:44:33
    Author     : Sergio
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
        <title>Eliminar | Medicamento </title>
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

                    <c:if test="${msn!=null}">

                        <script>

                            alert('<c:out value="${msn}" />');

                        </script>

                    </c:if>
                    <form action="/AutomatizacionLibretaMedicamento/EliminarMedicamento" name="frmEliminarMedicamento" method="POST">
                        <h1>Eliminar Medicamento</h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Codigo</td>
                                    <td><input type="text" name="txtCodigo" value="" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <hr>
                        <p class="login button">
                            <input type="submit" value="Eliminar" name="btnEliminarMedicamento" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                        </p>
                    </form>

                    <c:set  var="lista" scope="request" 
                            value="${requestScope.lista}">
                    </c:set >

                    <c:if test="${requestScope.lista!=null}">

                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
                                    <th>Fabricante</th>
                                    <th>Componente</th>
                                    <th>Contenido</th>
                                    <th>Cantidad</th>
                                    <th>Gramaje</th>
                                    <th>FechaVencimiento</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "med">
                                    <tr>
                                        <td><c:out value="${med.codigo}" /></td>
                                        <td><c:out value="${med.nombre}" /></td>
                                        <td><c:out  value="${med.tipo}"/></td>
                                        <td><c:out value="${med.fabricante}" /></td>
                                        <td><c:out value="${med.componente}" /></td>
                                        <td><c:out  value="${med.contenido}"/></td>
                                        <td><c:out  value="${med.cantidad}" /></td>
                                        <td><c:out   value="${med.gramaje}"/></td>
                                        <td><c:out   value="${med.fecha_vencimiento}"/></td>
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
