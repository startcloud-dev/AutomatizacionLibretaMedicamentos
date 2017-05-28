<%-- 
    Document   : AgregarMedicamento
    Created on : 09-04-2017, 0:29:27
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
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/bootstrap.min.css" />
        <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
        <title>Agregar | Medicamento</title>
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

                    <form name="frmAgregarMedicamento" action="/AutomatizacionLibretaMedicamento/AgregarMedicamento" method="POST">
                        <h1>Agregar Medicamento</h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Codigo</td>
                                    <td><input type="text" required="" name="txtCodigo" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Nombre</td>
                                    <td><input type="text" required="" name="txtNombre" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Tipo</td>
                                    <td><input type="text" required="" name="txtTipo" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Fabricante</td>
                                    <td><input type="text" required="" name="txtFabricante" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Componente</td>
                                    <td><input type="text" required="" name="txtComponente" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Contenido</td>
                                    <td><input type="text" required="" name="txtContenido" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Cantidad</td>
                                    <td><input type="text" required="" name="txtCantidad" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Gramaje</td>
                                    <td><input type="text" required="" name="txtGramaje" value="" /></td>
                                </tr>
                                <tr>
                                    <td>FechaVencimiento</td>
                                    <td><input type="date" required="" name="txtFechaVencimiento" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Id Seccion</td>
                                    <td><input type="text" required="" name="txtIdSeccion" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Id Reserva</td>
                                    <td><input type="text" required="" name="txtReserva" value="" /></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr>
                        <p class="login button">
                            <input type="submit" value="Agregar" name="btnAgregar" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                        </p>
                    </form>

                    <c:set  var="lista" scope="request" 
                            value="${requestScope.lista}">
                    </c:set >

                    <c:if test="${requestScope.lista!=null}">

                        <table class="table table-bordered" >
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
