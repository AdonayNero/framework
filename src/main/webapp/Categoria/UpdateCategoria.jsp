<%-- 
    Document   : UpdateCategoria
    Created on : 31-ago-2018, 16:23:31
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cuponera</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="../pages/head_folder.html" />
    
    </head>
    <body>
        <jsp:include page="../pages/nav_folder.html" />
         <div id="content-wrapper">
            <div class="container-fluid">
                     <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-table"></i>
                                Bienvenido a Categoria
                            </div>
                            <div class="card-body">
                                <div class="container-contact100">
                                        <div class="wrap-contact100">
                                            <c:if test="${not empty listaErrores}">
                                                <div class="alert alert-danger">
                                                    <ul>
                                                        <c:forEach var="errores"  items="${requestScope.listaErrores}">
                                                            <li>${errores}</li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </c:if>
			<form action="${pageContext.request.contextPath}/categoria.do" method="POST" class="contact100-form validate-form">
                            <input type="hidden"  name="op" value="modificar">
				<span class="contact100-form-title">
					Modificar Categoría
				</span>
                                <input type="hidden"  name="id" value="${cat.id}">
				<label class="label-input100" for="nombre">Ingrese Nombre de Categoría *</label>
				<div class="wrap-input100 validate-input" data-validate="Escriba una categoría">
                                    <input id="nombre" class="input100" type="text" name="nombre" value="${cat.nombre}">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="descripcion">Descripción *</label>
				<div class="wrap-input100 validate-input" data-validate = "Escriba una descripcion">
					<textarea id="descripcion" class="input100" name="descripcion" value="${cat.descripcion}"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Categoría
					</button>
                                    <a href="${pageContext.request.contextPath}/categoria.do" class="btn btn-danger" >Cancelar</a>
				</div>
			</form>

			<div class="contact100-more flex-col-c-m" style="background-image: url('../Form/images/bg-01.jpg');">
				<div class="flex-w size1 p-b-47">
					<div class="txt1 p-r-25">
						<span class="lnr lnr-map-marker"></span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							Address
						</span>

						<span class="txt2">
							Mada Center 8th floor, 379 Hudson St, New York, NY 10018 US
						</span>
					</div>
				</div>

				<div class="dis-flex size1 p-b-47">
					<div class="txt1 p-r-25">
						<span class="lnr lnr-phone-handset"></span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							Lets Talk
						</span>

						<span class="txt3">
							+1 800 1236879
						</span>
					</div>
				</div>

				<div class="dis-flex size1 p-b-47">
					<div class="txt1 p-r-25">
						<span class="lnr lnr-envelope"></span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							General Support
						</span>

						<span class="txt3">
							contact@example.com
						</span>
					</div>
				</div>
			</div>
	



	<div id="dropDownSelect1"></div>


	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>

	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
              
                                        </div>
                                    </div>
                             </div>
                        </div>
                   </div>
              </div>
    
     <jsp:include page="../pages/footer_folder.html" />
</body>
</html>