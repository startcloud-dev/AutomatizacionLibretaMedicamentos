<%-- 
    Document   : AgregarPaciente
    Created on : 15-04-2017, 04:05:49 PM
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
       
        <title>Agregar | Paciente</title>
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

                    <form name="frmAgregarPaciente" action="/AutomatizacionLibretaMedicamento/AgregarPaciente" method="POST">
                        <h1>Agregar Paciente</h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Rut </td>
                                    <td><input type="text" name="txtRut" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Nombre</td>
                                    <td><input type="text" name="txtNombre" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Apellido Paterno</td>
                                    <td><input type="text" name="txtApellidoPat" value="" /></td>
                                </tr>
                                <tr>
                                    <td>ApellidoMaterno</td>
                                    <td><input type="text" name="txtApellidoMat" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Direccion</td>
                                    <td><input type="text" name="txtDireccion" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Telefono</td>
                                    <td><input type="text" name="txtTelefono" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Correo</td>
                                    <td><input type="text" name="txtCorreo" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Fecha Nacimiento</td>
                                    <td><input type="date" name="txtFechaNacimiento" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Codigo Reserva</td>
                                    <td><input type="text" name="txtReserva" value="" /></td>
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
                </div>
            </div>
        </div>
    </body>
</html>

