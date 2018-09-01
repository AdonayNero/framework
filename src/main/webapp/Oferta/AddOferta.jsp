<%-- 
    Document   : Oferta
    Created on : 30-ago-2018, 12:30:58
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
					Ingrese una Nueva Oferta
				</span>

				<label class="label-input100" for="titulo">Ingrese Título *</label>
				<div class="wrap-input100 validate-input" data-validate="Escriba un Título">
					<input id="titulo" class="input100" type="text" name="titulo" placeholder="Título">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="subTitulo">Ingrese SubTítulo *</label>
				<div class="wrap-input100 validate-input" data-validate="Escriba un SubTítulo">
					<input id="subTitulo" class="input100" type="text" name="subTitulo" placeholder="SubTítulo">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="imagen">Ingrese una Imagen *</label>
				<div class="wrap-input100" validate-input data-validate="Seleccione una Imagen: jpg/png">
                                    <input id="imagen" class="form-control-file" type="file" name="imagen">
					<span class="focus-input100"></span>
				</div>
                                
				<label class="label-input100" for="valor">Ingrese Valor Normal ($) *</label>
				<div class="wrap-input100" validate-input data-validate="Escriba un valor">
					<input id="valor" class="input100" type="text" name="valor" placeholder="15.75">
					<span class="focus-input100"></span>
				</div>
                                
				<label class="label-input100" for="valorOferta">Ingrese Valor Oferta ($) *</label>
				<div class="wrap-input100" validate-input data-validate="Seleccione un valor">
					<input id="valorOferta" class="input100" type="text" name="valorOferta" placeholder="10.95">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="estado">Selecciona un Estado *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido el estado">
                                    <select id="estado" class="form-control" name="estado">
                                        <option selected>Selecciona un Estado</option>
                                        <option value="activo">Activo</option>
                                        <option value="no activo">No Activo</option>
                                    </select>        
                                            <span class="focus-input100"></span>
				</div>
                                        
                                <label class="label-input100" for="detalles">Detalles Generales *</label>
				<div class="wrap-input100">
					<input id="detalles" class="input100" type="text" name="detalles" placeholder="Detalles">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="descripcion">Descripción *</label>
				<div class="wrap-input100">
                                    <input id="descripcion" class="input100" type="text" name="descripcion" placeholder="Descripción">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="Observaciones">Observaciones *</label>
				<div class="wrap-input100">
					<textarea id="Observaciones" class="input100" name="Observaciones" placeholder="Observaciones"></textarea>
					<span class="focus-input100"></span>
				</div>
                                
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Oferta
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