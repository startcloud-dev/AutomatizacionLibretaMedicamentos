<%-- 
    Document   : ModificarMedicamento
    Created on : 09-04-2017, 2:16:05
    Author     : Sergio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar | Medicamento</title>
    </head>
    <body>

     <c:set  var="msn" scope="request" value="${requestScope.mensaje}" />

        <c:if test="${msn!=null}">

            <script>

                alert('<c:out value="${msn}"/>');

            </script>


        </c:if>    
    
        <form name="frmModificarMedicamento" action="ModificarMedicamento" method="POST">
            
            <table border="1">
                <tbody>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="txtNombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>Tipo</td>
                        <td><input type="text" name="txtTipo" value="" /></td>
                    </tr>
                    <tr>
                        <td>Fabricante</td>
                        <td><input type="text" name="txtFabricante" value="" /></td>
                    </tr>
                    <tr>
                        <td>Componente</td>
                        <td><input type="text" name="txtComponente" value="" /></td>
                    </tr>
                    <tr>
                        <td>Contenido</td>
                        <td><input type="text" name="txtContenido" value="" /></td>
                    </tr>
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="txtCantidad" value="" /></td>
                    </tr>
                    <tr>
                        <td>Gramaje</td>
                        <td><input type="text" name="txtGramaje" value="" /></td>
                    </tr>
                    <tr>
                        <td>FechaVencimiento</td>
                        <td><input type="text" name="txtFechaVencimiento" value="" /></td>
                    </tr>
                    <tr>
                        <td>Estado</td>
                        <td><input type="text" name="txtEstado" value="" /></td>
                    </tr>
                    <tr>
                        <td>IdSeccion</td>
                        <td><<input type="text" name="txtIdSeccion" value="" />/td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Modificar" name="btnModificar" />
        </form>
        
    </body>
</html>
