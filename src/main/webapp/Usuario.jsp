<%-- 
    Document   : Usuario
    Created on : 30-ago-2018, 12:30:07
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cuponera</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="Form/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Form/css/util.css">
	<link rel="stylesheet" type="text/css" href="Form/css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Ingrese un Nuevo Usuario
				</span>

				<label class="label-input100" for="nombre">Ingrese su Nombre Completo *</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Escriba su nombre">
					<input id="nombre" class="input100" type="text" name="nombre" placeholder="Nombre">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Escriba su apellido">
					<input class="input100" type="text" name="apellido" placeholder="Apellidos">
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
                                                
                                <label class="label-input100" for="estado">Selecciona un Estado *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido el estado">
                                    <Select id="estado" class="form-control" name="estado">
                                        <option selected>Seleccione un estado</option>
                                        <option value="activo">Activo</option>
                                        <option value="no activo">No Activo</option>
                                    </select>
                                        <span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="tipoAcceso">Selecciona el Tipo de Acceso *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona un tipo de acceso">
					<select id="tipoAcceso" class="form-control" name="tipoAcceso">
                                            <option selected>Seleccione un Tipo de Acceso</option>
                                            <option value="admin">Administrador</option>
                                            <option value="cliente">Cliente</option>
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

			<div class="contact100-more flex-col-c-m" style="background-image: url('Form/images/bg-01.jpg');">
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