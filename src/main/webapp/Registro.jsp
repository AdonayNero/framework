<%-- 
    Document   : Registro
    Created on : 31-ago-2017, 3:08:37
    Author     : HP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <title>Registro de usuarios</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>Registro de usuario</h3>
            </div>
            <div class="row col-md-10" >
                <c:if test="${not empty requestScope.listaErrores}">
                    <div class="alert alert-danger">
                        <ul>
                            <c:forEach var="error" items="${requestScope.listaErrores}">
                                <li>${error}</li>
                                </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <form action="${base}/usuarios.do" method="POST">
                    <input type="hidden" name="operacion" value="insertar"/>
                    <div class="col-md-8">
                        <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong></div>
                        <div class="form-group">
                            <label for="usuario">Nombre de usuario:</label>
                            <div class="input-group">
                                <input type="text" name="usuario" id="usuario" class="form-control" value="${usuario.usuario}"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="correo">Telefono</label>
                            <div class="input-group">
                                <input type="text" name="tel" id="tel" class="form-control" value="${usuario.telefono}"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <div class="input-group">
                                <input type="email" name="correo" id="correo" class="form-control" value="${usuario.correo}"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control" id="password" value="${usuario.pass}"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-info">Registrar</button>
                        <button type="reset" class="btn btn-danger">Limpiar</button>
                    </div>
                </form>
            </div>
        </div> 
    </body>
</html>
