<%-- 
    Document   : AgregarFarmaceutico
    Created on : 07-04-2017, 22:12:50
    Author     : Sergio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar | Farmaceutico</title>
    </head>
    <body>
        <c:set  var="msn" scope="request" value="${requestScope.mensaje}" />

        <c:if test="${msn!=null}">

            <script>

                alert('<c:out value="${msn}"/>');

            </script>


        </c:if>


        <form name="frmAgregarFarmaceutico" action="AgregarFarmaceutico" method="POST">


            <table border="1">

                <tbody>
                    <tr>
                        <td>Rut</td>
                        <td><input type="text" name="txtRut" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="txtNombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>Direccion</td>
                        <td><input type="text" name="txtDireccion" value="" /></td>
                    </tr>
                    <tr>
                        <td>Telefono</td>
                        <td><input type="text" name="txtTelefono" value="" /></td>
                    </tr>
                    <tr>
                        <td>IdSeccion</td>
                        <td><input type="text" name="txtIdSeccion" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td<input type="text" name="txtPassword" value="" />></td>
                    </tr>
                </tbody>
            </table>
            <hr>
            <input type="submit" value="Ingresar" name="btnIngresar" />

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
