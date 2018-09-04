<%-- 
    Document   : Rol
    Created on : 30-ago-2018, 12:30:46
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cuponera</title>
 <jsp:include page="../pages/head_folder.html" />
</head>
<body>
<jsp:include page="../pages/nav_folder.html" />

	<div class="container-contact100">
		<div class="wrap-contact100">
                    <c:if test="${not empty listaErrores}">
                        <div class="alert alert-danger">
                            <ul>
                                <c:forEach var="errores"  items="${requestScope.listaErrores}">
                                    <li> ${errores}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/roles.do" method="POST" class="contact100-form validate-form">
                                <input type="hidden"  name="op" value="insertar">
				<span class="contact100-form-title">
					Insertar un Nuevo Rol
				</span>

				<label class="label-input100" for="nombre">Seleccione el Nivel de Acceso *</label>
				<div class="wrap-input100 validate-input" data-validate="Seleccione el Nivel de Acceso">
                                    <input type="text" class="form-control" name="nombre" placeholder="Ingrese un nuevo rol" value="${rol.nombre}"/>
                                        <span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="descripcion">Descripción *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es Requerida una Descripción ">
					<textarea id="descripcion" class="input100" name="descripcion" placeholder="Escriba una descripción">${rol.descripcion}</textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Rol
					</button>
				</div>
			</form>

			<div class="contact100-more flex-col-c-m" style="background-image: url('style/Form/images/bg-01.jpg');">
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
		</div>
	</div>



	<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
	<script src="Form/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Form/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Form/vendor/bootstrap/js/popper.js"></script>
	<script src="Form/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Form/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="Form/vendor/daterangepicker/moment.min.js"></script>
	<script src="Form/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Form/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Form/js/main.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
</body>
</html>