<%-- 
    Document   : ModificarMedicamento
    Created on : 09-04-2017, 2:16:05
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
        <title>Modificar | Medicamento</title>
    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Session" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <c:set  var="msn" scope="request" value="${requestScope.mensaje}" />

                    <c:if test="${msn!=null}">

                        <script>

                            alert('<c:out value="${msn}"/>');

                        </script>


                    </c:if>    

                    <form name="frmModificarMedicamento" action="/AutomatizacionLibretaMedicamento/ModificarMedicamento" method="POST">
                        <h1>Modificar Medicamento</h1>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td><input type="text" name="txtNombre" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Tipo</td>
                                    <td><input type="text" name="txtTipo" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Fabricante</td>
                                    <td><input type="text" name="txtFabricante" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Componente</td>
                                    <td><input type="text" name="txtComponente" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Contenido</td>
                                    <td><input type="text" name="txtContenido" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Cantidad</td>
                                    <td><input type="text" name="txtCantidad" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Gramaje</td>
                                    <td><input type="text" name="txtGramaje" value="" /></td>
                                </tr>
                                <tr>
                                    <td>FechaVencimiento</td>
                                    <td><input type="text" name="txtFechaVencimiento" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Estado</td>
                                    <td><input type="text" name="txtEstado" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Id Seccion</td>
                                    <td><input type="text" name="txtIdSeccion" value="" />
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
                                    <th>Gramaje/th>
                                    <th>FechaVencimiento</th>
                                    <th>Estado</th>
                                    <th>IdSeccion</th>
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
                                        <td><c:out  value="${med.estado}" /></td>
                                        <td><c:out  value="${med.id_seccion}" /></td>
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
