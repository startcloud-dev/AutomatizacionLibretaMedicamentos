<%-- 
   Document   : EliminarBodega
   Created on : 07-04-2017, 15:19:05
   Author     : sergio.aravena
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Bodega | Eliminar </title>
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
                            alert('<c:out value="${msn}"/>');
                        </script>
                    </c:if>

                    <header>
                        <hgroup>
                            <h1>Eliminar de bodega </h1>

                        </hgroup>
                    </header>

                    <form name="frmEliminarBodega" action="/AutomatizacionLibretaMedicamento/EliminarBodega" method="POST">

                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>Id Seccion</td>
                                    <td><input type="text" name="txtIdSeccion" value="" /></td>
                                </tr>

                            </tbody>
                        </table>
                        <hr>

                        <p class="login button">
                            <input type="submit" value="Eliminar" name="btnEliminarBodega" />
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
                                    <th>IdSeccion</th>
                                    <th>Categoria</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "bodega" >
                                    <tr>
                                        <td><c:out value="${bodega.id_seccion}" /></td>
                                        <td><c:out value="${bodega.categoria}" /></td>

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
