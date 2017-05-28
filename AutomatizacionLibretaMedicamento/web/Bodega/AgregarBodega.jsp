<%-- 
    Document   : AgregarBodega
    Created on : 05-04-2017, 23:16:52
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib   prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page     import="dto.BodegaDto" %>
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
        <title>Bodega | Farmaceutico</title>



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
                            <h1>Bodega farmaceutica </h1>
                        </hgroup>
                    </header>

                    <c:set var="msn" scope="request" value="${requestScope.mensaje}">

                    </c:set>

                    <c:if test="${msn!=null}">

                        <script>

                            alert('<c:out value="${msn}" />');
                         
                        </script>

                    </c:if>
                    <hgroup>
                        <h3></h3>
                    </hgroup>

                    <form name="frmAgregarBodega" action="/AutomatizacionLibretaMedicamento/AgregarBodega" method="POST">

                        <table  class="" border="0">

                            <tbody>
                                <tr>
                                    <td>Id Seccion </td>
                                    <td><input type="text" required="" name="txtIdSeccion" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Categoria </td>
                                    <td><input type="text" required="" name="txtCategoria" value="" /></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr>
                        <p class="login button">
                            <input type="submit" value="Ingresar" name="btnAgregarBodega" />
                        </p>
                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
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
