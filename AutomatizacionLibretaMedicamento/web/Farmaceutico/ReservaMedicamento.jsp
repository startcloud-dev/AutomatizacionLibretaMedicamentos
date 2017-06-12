<%-- 
    Document   : Recerva_Medicamento
    Created on : 15-04-2017, 02:20:08 PM
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
        <title>Recerva Medicamento | Farmaceutico  </title>
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

                    <form name="frmReservaMedicamento" action="/AutomatizacionLibretaMedicamento/AgregarReserva" method="POST">
                        <h1> Reservar Medicamento </h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td> Codigo Reserva </td>
                                    <td><input type="text" name="txtReserva" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Fecha Inicio </td>
                                    <td><input type="date" name="txtFechaIni" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Fecha Termino </td>
                                    <td><input type="date" name="txtFechaTer" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Rut Paciente </td>
                                    <td><input type="text" name="txtPaciente"  required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Codigo Tratamiento </td>
                                    <td><input type="text" name="txtTratamiento" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Rut Farmaceutico </td>
                                    <td><input type="text" name="txtFarmaceutico" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Estado </td>
                                    <td><input type="text" name="txtEstado" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td> Codigo Medicamento </td>
                                    <td><input type="text" name="txtCodigo" required="" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Cantidad a reservar (cajas) </td>
                                    <td><input type="text" name="txtCantidad" value="" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="login button">
                            <input type="submit" value="Reservar" name="btnReservar" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                        </p>
                    </form>

                    <c:set var="lista" scope="request" value="${requestScope.lista}" />

                    <c:if test="${lista!=null}">

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Reserva</th>
                                    <th>Fecha inicio</th>
                                    <th>Fecha termino</th>
                                    <th>Paciente</th>
                                    <th>Tratamiento</th>
                                    <th>Farmaceutico</th>
                                    <th>Estado</th>
                                    <th>Codigo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "reserva">
                                    <tr>
                                        <td><c:out value="${reserva.id_reserva}"/></td>
                                        <td><c:out value="${reserva.fecha_inicio}" /></td>
                                        <td><c:out value="${reserva.fecha_termino}"/></td>
                                        <td><c:out value="${reserva.rut_paciente}"/></td>
                                        <td><c:out value="${reserva.id_tratamiento}"/></td>
                                        <td><c:out value="${reserva.rut_farmaceutico}"/></td>
                                        <td><c:out value="${reserva.estado}"/></td>
                                        <td><c:out value="${reserva.codigo}"/></td>
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
