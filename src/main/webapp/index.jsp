<%-- 
    Document   : index
    Created on : Aug 30, 2018, 3:18:42 PM
    Author     : Adonay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="./pages/head.html" />
    
    <jsp:include page="./pages/nav.html" />
    <body>
        <div id="content-wrapper">

            <div class="container-fluid">

                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Bienvenido ${sessionScope.usuario} - ${sessionScope.id} - ${sessionScope.acceso}
                    </div>
                    <div class="card-body">
<div class="container-contact100">
    
    
    	<div class="wrap-contact100">
  

			



	<div id="dropDownSelect1"></div>


                    </div>
                </div>
            </div>

    </body>
    

	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
   <%-- 
    Document   : index
    Created on : Aug 30, 2018, 3:18:42 PM <jsp:include page="Rol/AddRol.jsp" />
    Author     : Adonay
--%> 
   
		 </div>
                </div>
            </div>


    
    </body>
    <jsp:include page="./pages/footer.html" />
    
</html>
