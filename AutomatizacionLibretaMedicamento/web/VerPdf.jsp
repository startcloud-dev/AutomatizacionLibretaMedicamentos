<%-- 
    Document   : VerPdf
    Created on : 21-04-2017, 19:40:10
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PDF</title>
    </head>
    <body>
        
        
        <form name="frmPDF" action="/AutomatizacionLibretaMedicamento/GenerarPDF" method="POST">
        
            
            <input type="submit" value="GenerarPDF" name="btnGenerarPdf" />
            
        </form>
        
    </body>
</html>
