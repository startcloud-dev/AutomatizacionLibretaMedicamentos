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
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/AutomatizacionLibretaMedicamento/css/animate-custom.css" />
        <title>Agregar | Farmaceutico</title>
    </head>
    <body>    
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script>
        </c:if>
        <h1>Inicio de Session / Registro</h1>
        <div id="container_demo" >
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form  action="/AutomatizacionLibretaMedicamento/LoginFarmaceutico" autocomplete="off" method="POST"> 
                        <h1>Iniciar Sesion</h1> 
                        <p> 
                            <label> Rut </label>
                            <input id="username" name="txtRut" required="required" type="text"/>
                        </p>
                        <p> 
                            <label> Contraseña </label>
                            <input id="password" name="txtPass" required="required" type="password" /> 
                        </p>
                        <p class="login button"> 
                            <input type="submit" value="Iniciar Session" /> 
                        </p>
                        <p class="change_link">
                            Aun no es miembro ?
                            <a href="#toregister" class="to_register">Registrese</a>
                        </p>
                    </form>
                </div>

                <div id="register" class="animate form">
                    <form  action="/AutomatizacionLibretaMedicamento/AgregarFarmaceutico" autocomplete="false" method="POST"> 
                        <h1>Registro Farmaceutico</h1> 
                        <p> 
                            <label> Rut </label>
                            <input id="usernamesignup" name="txtRut" required="required" type="text"/>
                        </p>
                        <p> 
                            <label> Clave </label>
                            <input id="usernamesignup" name="txtClave" required="required" type="password"/>
                        </p>
                        <p> 
                            <label> Confirmar Clave </label>
                            <input id="usernamesignup" name="txtConfClave" required="required" type="password"/>
                        </p>
                        <p> 
                            <label> Nombre </label>
                            <input id="usernamesignup" name="txtNombre" required="required" type="text"/>
                        </p>

                        <p> 
                            <label> Direccion </label>
                            <input id="passwordsignup_confirm" name="txtDireccion" required="required" type="text"/>
                        </p>

                        <p> 
                            <label> Telefono </label>
                            <input id="passwordsignup_confirm" name="txtTelefono" required="required" type="text"/>
                        </p>
                        <p> 
                            <label> Seccion </label>
                            <input id="passwordsignup_confirm" name="txtSeccion" required="required" type="text"/>
                        </p>
                        <p> 
                            <label> Reserva </label>
                            <input id="passwordsignup_confirm" name="txtReserva" required="required" type="text"/>
                        </p>
                        <a href="../Index.jsp">Volver</a>
                        <p class="signin button"> 
                            <input type="submit" value="Enviar"/> 
                        </p>
                        <p class="change_link">  
                            Ya es miembro ?
                            <a href="#tologin" class="to_register"> Ingrese Aqui </a>
                        </p>
                    </form>
                </div>
            </div>
        </div>  
    </body>
</html>
