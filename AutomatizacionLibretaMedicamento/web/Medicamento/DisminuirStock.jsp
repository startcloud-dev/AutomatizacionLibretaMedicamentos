<%-- 
    Document   : DisminuirStock
    Created on : 12-06-2017, 17:13:33
    Author     : CETECOM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib   prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <script type="text/javascript" src="/AutomatizacionLibretaMedicamento/js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="/AutomatizacionLibretaMedicamento/js/jquery-3.2.1.min.js" ></script>
        <title>Disminuir stock || farmaceutico</title>
    </head>
    <body>
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Sesion" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <header>
                        <hgroup>
                            <h1>Disminuir Stock</h1>
                        </hgroup>
                    </header>
                    <c:set var="msn" scope="request" value="${requestScope.mensaje}">

                    </c:set>
                    <c:if test="${msn!=null}">
                        <script>
                            alert('<c:out value="${msn}" />');
                        </script>

                    </c:if>

                    <form name="frmAumentarStock" action="/AutomatizacionLibretaMedicamento/DisminuirStock" method="POST">

                        <table  class="" border="0">

                            <tbody>
                                <tr>
                                    <td>Codigo</td>
                                    <td><input type="text" required="" name="txtCodigo"   value="" /></td>
                                </tr>
                                <tr>
                                    <td>Cantidad</td>
                                    <td><input type="text" required="" name="txtCantidad"   value="" /></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr>
                        <p class="login button">
                            <input type="submit" value="DescontarStock" name="btnAumentarStock" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                        </p>
                    </form>
                    <c:set  var="lista" scope="request" 
                            value="${requestScope.lista}">
                    </c:set >

                    <c:if test="${requestScope.lista!=null}">
                        
                        <table  class="table table-bordered" >
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Cantidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.lista}" var = "med" >
                                    <tr>
                                        <td><c:out value="${med.codigo}" /></td>
                                        <td><c:out value="${med.nombre}" /></td>
                                        <td><c:out value="${med.cantidad}" /></td>
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


