<%-- 
    Document   : EliminarFarmaceutivo
    Created on : 08-04-2017, 20:53:16
    Author     : Sergio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar | Farmaceutico</title>
    </head>
    <body>

        <c:set var="msn" scope="request" value="${requestScope.mensaje}" />

        <c:if test="${msn !=null}">
            <script>
                alert('<c:out value="${msn}" />');
            </script>

        </c:if>

        <form name="frmFarmaceutico" action="/AutomatizacionLibretaMedicamento/EliminarFarmaceutivo" method="POST">

            <table border="1">
                <tbody>
                    <tr>
                        <td>RutFarmaceutico</td>
                        <td><input type="text" name="txtRut" value="" /></td>
                    </tr>
                </tbody>
            </table>
            <hr>

            <input type="submit" value="Eliminar" name="btnELiminar" />

        </form>


             <c:set var="lista" scope="request" value="${requestScope.lista}" />
            
            <c:if test="${lista!=null}">
                
                
                
                <table border="1">
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
            

    </body>
</html>
