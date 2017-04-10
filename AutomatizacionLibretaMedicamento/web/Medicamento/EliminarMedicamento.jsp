<%-- 
    Document   : EliminarMedicamento
    Created on : 09-04-2017, 1:44:33
    Author     : Sergio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar | Medicamento </title>
    </head>
    <body>
        <c:set var="msn" scope="request" value="${requestScope.mensaje}" />




        <c:if test="${msn!=null}">

            <script>

                alert('<c:out value="${msn}" />');

            </script>

        </c:if>
            <form action="/AutomatizacionLibretaMedicamento/EliminarMedicamento" name="frmEliminarMedicamento" method="POST">

                <table border="1">
                    <tbody>
                        <tr>
                            <td>Codigo</td>
                            <td><input type="text" name="txtCodigo" value="" /></td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <input type="submit" value="Eliminar" name="btnEliminarMedicamento" />
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


            
        </body>
    </html>
