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
         <jsp:include page="./pages/head_folder.html" />
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
        <jsp:include page="./pages/nav_folder.jsp" />
        <div class="container">
            <div class="card text-center">
            <div class="card-header">
                Confirmacion
            </div>
            <div class="card-body">
                <h5 class="card-title">Revisa tu correo</h5>
                <p class="card-text">Se ha generado un correo para que puedas completar tu registrp.</p>
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Regresar Pagina Principal</a>
            </div>
            <div class="card-footer text-muted">
                Gracias por preferirnos
            </div>
            </div>
        </div>
            <jsp:include page="./pages/footer_folder.html" />
    </body>
</html>
