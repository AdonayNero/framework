<%-- 
    Document   : inicio
    Created on : 09-05-2018, 01:03:47 PM
    Author     : Edwin Bonilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <jsp:include page="/pages/head_folder.html" />  
        
    </head>
    <body>
    <jsp:include page="/pages/nav_folder.jsp" />
    <div class="wrapper">
    <div id="content">
        <section class="cards-section row p-4">
            <c:forEach items="${requestScope.listaOferta}" var="ofer">
                <div class="col-md-4">
                    <div class="card">
                        <img class="card-img-top" src="img/1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${ofer.titulo}</h5>
                            <p class="card-text">${ofer.descripcion}</p>
                            <a href="#" class="btn btn-primary mt-3" data-toggle="modal" data-target="#exampleModal">Ver Oferta</a>
                        </div>
                    </div>
                </div>
        </c:forEach>
        </section>
    </div>
    </div>
    <jsp:include page="/pages/footer_folder.html" />   
    </body>
</html>
