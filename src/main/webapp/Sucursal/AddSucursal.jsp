<%-- 
    Document   : Sucursal
    Created on : 30-ago-2018, 12:30:30
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

	<title>Cuponera</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="../pages/head_folder.html" />
    

<body>
    
<jsp:include page="../pages/nav_folder.html" />
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
			<input type="hidden"  name="op" value="insertar">	
                            <span class="contact100-form-title">
					Ingrese una Nueva Sucursal
				</span>
                                                           
                                <label class="label-input100" for="idEmpresa">Selecciona una Empresa *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona una empresa">
					<select id="idEmpresa" class="form-control" name="idEmpresa">
                                            <option selected>Seleccione una empresa</option>
                                            <c:forEach items="${requestScope.listaRoles}" var="emp">
                                            <option value="${emp.id}">${emp.nombre}</option>
                                            
                                            </c:forEach>
                                        </select>
					<span class="focus-input100"></span>
				</div>
                            
				<label class="label-input100" for="correo">Ingresa el correo *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un email valido: ex@abc.xyz">
                                    <input id="correo" class="input100" type="email" name="correo" placeholder="Ej. example@email.com">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="telefono">Ingrese Número de Teléfono *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un teléfono valido">
					<input id="telefono" class="input100" type="text" name="telefono" placeholder="Ej 2295-4262">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="direccion">Dirección *</label>
				<div class="wrap-input100 validate-input" data-validate = "Dirección es requerida">
					<textarea id="direccion" class="input100" name="direccion" placeholder="Escriba la Dirección"></textarea>
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="idEncargado">Seleccione un Encargado *</label>
				<div class="wrap-input100 validate-input" data-validate="Seleccione un encargado">
					<select id="idEncargado" class="form-control" name="idEncargado">
					    <option selected>Seleccione un encargado</option>
                                            <c:forEach items="${requestScope.listaUsuario}" var="usuario" varStatus="i">
                                            <option value="${usuario.id}">${usuario.nombre}</option>
                                            
                                            </c:forEach>
                                        </select>
                                            <span class="focus-input100"></span>
				</div>
                                
                                <div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Sucursal
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
                             </div>
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
        
         <jsp:include page="../pages/footer_folder.html" />
        
</body>
</html>