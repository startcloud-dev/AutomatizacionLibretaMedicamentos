<%-- 
    Document   : ModificarBodega
    Created on : 07-04-2017, 17:33:36
    Author     : sergio.aravena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar | Bodega</title>
    </head>
    <body>
        
        
        <form name="frmModificarBodega" action="ModificarBodega" method="POST">
        
            <table border="1">
                <tbody>
                    <tr>
                        <td>Categoria</td>
                        <td><input type="text" name="txtCategoriaModi" value="" /></td>
                    </tr>
                </tbody>
            </table>

            <hr>
            <input type="submit" value="ModificarBodega" name="btnModificarBodega" />
        </form>
       
    </body>
</html>
