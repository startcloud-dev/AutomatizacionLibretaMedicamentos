<%-- 
    Document   : PrescripcionesPendientes
    Created on : 15-05-2017, 17:29:58
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
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/animate-custom.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/bootstrap.min.css" />
        <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
        <title>Prescripciones | Pendientes</title>
    </head>
    <body>
        <c:set var="DTO" scope="request" value="${requestScope.dto}" /> 
        <div id="container_demo" >
            <p style="position:absolute; top:10px;left:1100px;">Bienvenido(a) ${sessionScope.usuario}</p>
            <form action="/AutomatizacionLibretaMedicamento/CierreSession" style="position:absolute; top:10px;left:1250px;">
                <input type="submit" value="Cerrar Sesion" name="btnCerrar" />
            </form>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <c:set  var="msn" scope="request" value="${requestScope.mensaje}" />

                    <c:if test="${msn!=null}">

                        <script>

                            alert('<c:out value="${msn}"/>');

                        </script>


                    </c:if>


                    <form name="frmAgregarFarmaceutico" action="/AutomatizacionLibretaMedicamento/PrescripcionesPendientes" method="POST">
                        <h1>Farmaceutico</h1>

                        <table border="0">

                            <tbody>
                                <tr>
                                    <td>Rut</td>
                                    <td><input type="text" name="txtRut" required="" value="" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <hr>
                        <p class="login button">
                            <input type="submit" value="Buscar" name="btnBuscar" />
                        </p>

                        <p class="login button">
                            <a href="/AutomatizacionLibretaMedicamento/Inicio_Farmaceutico.jsp">Volver al menu</a>
                        </p>
                    </form>

             
                  



                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>IDReceta</th>
                                    <th>FechaEmision</th>
                                    <th>Indicaciones</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                                    <tr>
                                        <td>${DTO.id_receta}</td>
                                        <td>${DTO.fecha_emision}</td>
                                        <td>${DTO.indicaciones}</td>
                                    </tr>
                               
                            </tbody>
                        </table>


                  
                </div>
            </div> 
        </div> 
    </body>
</html>