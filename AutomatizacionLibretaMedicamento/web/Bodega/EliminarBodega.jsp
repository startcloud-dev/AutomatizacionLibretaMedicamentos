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
        <title>Bodega | Eliminar </title>
    </head>
    <body>
        
         <c:set var="msn" scope="request" value="${requestScope.mensaje}" />
        
        <c:if test="${msn}">
            <script>
                alert('<c:out value="${msn}"/>');             
            </script>
        </c:if>

        <header>
            <hgroup>
                <h1>Eliminar de bodega </h1>

            </hgroup>
        </header>
   



        <form name="frmEliminarBodega" action="EliminarBodega" method="POST">

            <table border="1">
                <tbody>
                    <tr>
                        <td>IdSeccion</td>
                        <td><input type="text" name="txtIdSeccion" value="" /></td>
                    </tr>

                </tbody>
            </table>
            <hr>

            <input type="submit" value="Eliminar" name="btnEliminarBodega" />
        </form>


    </body>
</html>
