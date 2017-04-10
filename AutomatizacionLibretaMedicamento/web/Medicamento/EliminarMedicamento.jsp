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
            <form action="EliminarMedicamento" name="frmEliminarMedicamento" method="POST">

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
        </body>
    </html>
