<%-- 
    Document   : inicio
    Created on : 09-05-2018, 01:03:47 PM
    Author     : Edwin Bonilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <jsp:include page="./pages/head.html" />
        
    </head>
    <body>
    <jsp:include page="./pages/nav.html" />
    <div class="wrapper mt-3">
    <div id="content">
        <section class="cards-section">
                <div class="card-columns col-md-6">
                    <div class="card">
                        <img class="card-img-top" src="img/1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Title goes here</h5>
                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.
                                This content is a little bit longer.</p>
                            <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal">Read More</a>
                        </div>
                    </div>
                </div>
        </section>
    </div>
    </div>
    </body>
</html>
