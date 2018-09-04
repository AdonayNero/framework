<%-- 
    Document   : Usuario
    Created on : 30-ago-2018, 12:30:07
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
    <jsp:include page="../pages/nav_folder.html" />
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
			<form action="${pageContext.request.contextPath}/usuario.do" method="POST" class="contact100-form validate-form">
                                <input type="hidden"  name="op" value="insertar">
				<span class="contact100-form-title">
					Ingrese un Nuevo Usuario
				</span>

				<label class="label-input100" for="nombre">Ingrese su Nombre Completo *</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Escriba su nombre">
					<input id="nombre" class="input100" type="text" name="nombre" placeholder="Nombre">
					<span class="focus-input100"></span>
				</div>
				
				<label class="label-input100" for="email">Ingrese su correo *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un correo valido: ex@abc.xyz">
                                    <input id="email" class="input100" type="email" name="email" placeholder="Ej. example@email.com">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="telefono">Ingrese su Número de Teléfono *</label>
				<div class="wrap-input100" data-validate = "Es requerido un número valido: 2295-4758">
					<input id="telefono" class="input100" type="text" name="telefono" placeholder="Ej. 7104-0000">
					<span class="focus-input100"></span>
				</div>
                                <label class="label-input100" for="dui">Ingrese su DUI *</label>
				<div class="wrap-input100" data-validate = "Es requerido un dui valido: 012345678-9">
					<input id="dui" class="input100" type="text" name="dui" placeholder="Ej. 012345678-9">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="pass">Ingrese su Contraseña *</label>
				<div class="wrap-input100" data-validate = "Es requerido un número valido: ex@abc.xyz">
                                    <input id="pass" class="input100" type="password" name="pass" placeholder="Ingrese su contraseña">
					<span class="focus-input100"></span>
				</div>
                                                
                                <label class="label-input100" for="tipoAcceso">Selecciona el Tipo de Acceso *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona un tipo de acceso">
					<select id="tipoAcceso" class="form-control" name="tipoAcceso">
                                            <option selected>Seleccione un Tipo de Acceso</option>
                                            <c:forEach items="${requestScope.listaRoles}" var="rol" varStatus="i">
                                            <option value="${rol.id}">${rol.nombre}</option>
                                            
                                            </c:forEach>
                                        </select>
                                        <span class="focus-input100"></span>
				</div>

                                <label class="label-input100" for="foto">Ingrese una Foto de Perfil *</label>
				<div class="wrap-input100" validate-input data-validate="Seleccione una foto: jpg/png">
					<input id="foto" class="form-control-file" type="file" name="foto">
					<span class="focus-input100"></span>
				</div>
                                                                                              
				<label class="label-input100" for="direccion">Ingrese su Dirección *</label>
				<div class="wrap-input100 validate-input" data-validate = "Dirección es requerida">
					<textarea id="direccion" class="input100" name="direccion" placeholder="Escriba su dirección"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Usuario
					</button>
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
    </body>
     <jsp:include page="../pages/footer_folder.html" />
</body>
</html>