<%-- 
    Document   : UpdateSucursal
    Created on : 31-ago-2018, 16:31:56
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cuponera</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 <jsp:include page="../pages/head_folder.html" />
 <jsp:include page="../pages/nav_folder.jsp" />
</head>
<body>

    <div id="content-wrapper">
            <div class="container-fluid">
                     <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-table"></i>
                                Bienvenido Prro
                            </div>
                            <div class="card-body">
                                <div class="container-contact100">
                                        <div class="wrap-contact100">

	
			<form action="${pageContext.request.contextPath}/sucursal.do" method="POST" class="contact100-form validate-form">
			 <input type="hidden"  name="op" value="modificar">	
                            <span class="contact100-form-title">
					Modificar Sucursal
				</span>
                         
                                    <input type="hidden"  name="id" value="${sucursal.id}">
                                
				<label class="label-input100" for="correo">Ingresa el correo *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un email valido: ex@abc.xyz">
                                    <input id="correo" class="input100" type="email" name="correo" value="${sucursal.correo}">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="telefono">Ingrese Número de Teléfono *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un teléfono valido">
                                    <input id="telefono" class="input100" type="text" name="telefono" value="${sucursal.telefono}">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="direccion">Dirección *</label>
				<div class="wrap-input100 validate-input" data-validate = "Dirección es requerida">
                                    <textarea id="direccion" class="input100" name="direccion" value="">${sucursal.direccion}</textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Editar Sucursal
					</button>
                                    </br>
                                    <a href="${pageContext.request.contextPath}/sucursal.do" class="btn btn-danger" >Cancelar</a>
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