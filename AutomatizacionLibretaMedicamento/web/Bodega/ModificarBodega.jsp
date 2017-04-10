<%-- 
    Document   : ModificarBodega
    Created on : 07-04-2017, 17:33:36
    Author     : sergio.aravena
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar | Bodega</title>
    </head>
    <body>
        
        <c:set var="dto" scope="request" value="${requestScope.BodegaDto}"/>
        
        <c:set var="msn" scope="request" value="${requestScope.mensaje}" />
        
        <c:if test="${msn!=null}">
            <script>
                alert('<c:out value="${msn}"/>');             
            </script>
        </c:if>
        
            
            
        <form name="frmModificarBodega" action="/AutomatizacionLibretaMedicamento/ModificarBodega" method="POST">
        
            <table border="1">
                <tbody>
                    <tr>
                        <td>Categoria</td>
                        <td><input type="text" name="txtCategoria" value="${dto.BodegaDto.categoria}" /></td>
                    </tr>
                </tbody>
            </table>

            <hr>
            <input type="submit" value="ModificarBodega" name="btnModificarBodega" />
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

            
    </body>
</html>
