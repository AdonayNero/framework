<%-- 
    Document   : login
    Created on : 31-ago-2017, 2:55:29
    Author     : HP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <h2>Inicio de Sesión</h2>
                    <c:if test="${not empty sessionScope.exito}">
                        <div class="alert alert-success">
                            <p>${sessionScope.exito}</p>
                            <c:set var="exito" value="" scope="session"/>
                        </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.fracaso}">
                        <div class="alert alert-danger">
                            <p>${sessionScope.fracaso}</p>
                            <c:set var="fracaso" value="" scope="session"/>
                        </div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/usuario.do" method="POST">
                        <input type="hidden" name="op" value="login"/>
                        <div class="form-group">
                            <label for="usuario">Usuario</label>
                            <input type="text" name="email" id="usuario" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" name="pass" id="password" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-primary btn-block">Iniciar sesion</button> 
                        </div>
                    </form>
                    <a href="${base}/usuario.do?operacion=listar">Registrarse</a>
                </div>
            </div>
        </div>
    </body>
</html>
