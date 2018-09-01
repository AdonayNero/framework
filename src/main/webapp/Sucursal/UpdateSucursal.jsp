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
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="../Form/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Form/css/util.css">
	<link rel="stylesheet" type="text/css" href="../Form/css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Modificar Sucursal
				</span>
                                
                                <label class="label-input100" for="idEncargado">Seleccione un Encargado *</label>
				<div class="wrap-input100 validate-input" data-validate="Seleccione un encargado">
					<select id="idEncargado" class="input100" name="idEncargado">
                                            <option value="">Hola Jóven</option>
                                        </select>
                                            <span class="focus-input100"></span>
				</div>
                            
                                <label class="label-input100" for="idEmpresa">Selecciona una Empresa *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona una empresa">
					<select id="idEmpresa" class="form-control" name="idEmpresa">
                                            <option value="">Hola Jóven</option>
                                        </select>
					<span class="focus-input100"></span>
				</div>
                            
				<label class="label-input100" for="correo">Ingresa el correo *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un email valido: ex@abc.xyz">
                                    <input id="correo" class="input100" type="email" name="correo" value="">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="telefono">Ingrese Número de Teléfono *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido un teléfono valido">
                                    <input id="telefono" class="input100" type="text" name="telefono" value="">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="direccion">Dirección *</label>
				<div class="wrap-input100 validate-input" data-validate = "Dirección es requerida">
                                    <input id="direccion" class="input100" name="direccion" value=""/>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Sucursal
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
		</div>
	</div>



	<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
	<script src="../Form/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../Form/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../Form/vendor/bootstrap/js/popper.js"></script>
	<script src="../Form/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../Form/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="../Form/vendor/daterangepicker/moment.min.js"></script>
	<script src="../Form/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../Form/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../Form/js/main.js"></script>
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