<%-- 
    Document   : ModificarReserva
    Created on : 22-abr-2017, 23:19:07
    Author     : Kevin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.ReservaDto"%>
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
        <title>Modificar | Reserva</title>
    </head>
    <body>
        <% ReservaDto dto = (ReservaDto) request.getAttribute("dto");%>
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
                    <form action="/AutomatizacionLibretaMedicamento/ModificarReserva" method="POST">
                        <h1> Modificar Reserva </h1>
                        <table border="0">                   
                            <tbody>
                                <tr>
                                    <td>Codigo</td>
                                    <td><input type="text" name="txtCodigo" disable="on" value="<%= dto.getId_reserva()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Fecha Inicio</td>
                                    <td><input type="date" name="txtFechaIni" disable="on" value="<%= dto.getFecha_inicio()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Fecha Termino</td>
                                    <td><input type="date" name="txtFechaTer" disable="on" value="<%= dto.getFecha_termino()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Rut Paciente</td>
                                    <td><input type="text" name="txtPaciente" disable="on" value="<%= dto.getRut_paciente()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Id tratamiento</td>
                                    <td><input type="text" name="txtTratamiento" disable="on" value="<%= dto.getId_tratamiento()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Rut Farmaceutico</td>
                                    <td><input type="text" name="txtFarmacuetico" disable="on" value="<%= dto.getRut_farmaceutico()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Estado</td>
                                    <td><input type="text" name="txtEstado" value="<%= dto.getEstado()%>" readonly="readonly"/></td>
                                </tr>
                                <tr>
                                    <td>Codigo Medicamento</td>
                                    <td><input type="text" name="txtMedicamento" disable="on" value="<%= dto.getCodigo()%>" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Cajas Solicitadas</td>
                                    <td><input type="text" name="txtCantidad" disable="on" value="<%= dto.getCantidad()%>" readonly="readonly" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="login button">
                            <input type="submit" value="Modificar" name="btnModificar" />
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
