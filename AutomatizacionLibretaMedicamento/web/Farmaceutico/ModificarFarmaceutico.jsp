<%-- 
    Document   : ModificarFarmaceutico
    Created on : 08-04-2017, 23:03:53
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
        <title>Modificar | Farmaceutico  </title>
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

                    <form name="frmModificarFarmaceutico" action="/AutomatizacionLibretaMedicamento/ModificarFarmaceutico" method="POST">
                        <h1>Modificar Farmaceutico </h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td><input type="text" name="txtNombre" value="" /></td>
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
                                    <td>Id Seccion</td>
                                    <td><input type="text" name="txtIdSeccion" value="" /></td>
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

                    <c:set var="lista" scope="request" value="${requestScope.lista}" />

                    <c:if test="${lista!=null}">

                        <table class="table table-bordered" >
                            <thead>
                                <tr>
                                    <th>Rut</th>
                                    <th>Nombre</th>
                                    <th>Direccion</th>
                                    <th>Telefono</th>
                                    <th>IdSeccion</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "farma">
                                    <tr>
                                        <td><c:out value="${farma.rut_farmaceutico}"/></td>
                                        <td><c:out value="${farma.nombre}" /></td>
                                        <td><c:out value="${farma.direccion}"/></td>
                                        <td><c:out value="${farma.telefono}"/></td>
                                        <td><c:out value="${farma.id_seccion}"/></td>
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
