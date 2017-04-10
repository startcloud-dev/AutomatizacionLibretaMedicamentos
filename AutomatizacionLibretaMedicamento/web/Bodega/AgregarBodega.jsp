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
        <title>Bodega | Farmaceutica</title>
    </head>
    <body>
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
            <h3>Ingreso de bodega</h3>
        </hgroup>


        <form name="frmAgregarBodega" action="AgregarBodega" method="POST">


            <table border="1">

                <tbody>
                    <tr>
                        <td>IdSeccion</td>
                        <td><input type="text" name="txtIdSeccion" value="" /></td>
                    </tr>
                    <tr>
                        <td>Categoria</td>
                        <td><input type="text" name="txtCategoria" value="" /></td>
                    </tr>
                </tbody>
            </table>

            <hr>

            <input type="submit" value="Ingresar" name="btnAgregarBodega" /> <a href="Bodega/EliminarBodega.jsp">EliminarBodega</a>

        </form>

             <c:set  var="lista" scope="request" 
                value="${requestScope.lista}">
        </c:set >
            
        <c:if test="${requestScope.lista!=null}">


            <hr>
            
            
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

            

     

    </body>
</html>
