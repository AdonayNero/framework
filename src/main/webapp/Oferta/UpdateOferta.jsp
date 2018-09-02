<%-- 
    Document   : UpdateOferta
    Created on : 31-ago-2018, 16:30:11
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
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Modificar Oferta
				</span>

				<label class="label-input100" for="titulo">Ingrese Título *</label>
				<div class="wrap-input100 validate-input" data-validate="Escriba un Título">
                                    <input id="titulo" class="input100" type="text" name="titulo" value="">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="subTitulo">Ingrese SubTítulo *</label>
				<div class="wrap-input100 validate-input" data-validate="Escriba un SubTítulo">
                                    <input id="subTitulo" class="input100" type="text" name="subTitulo" value="">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="imagen">Ingrese una Imagen *</label>
				<div class="wrap-input100" validate-input data-validate="Seleccione una Imagen: jpg/png">
                                    <input id="imagen" class="form-control-file" type="file" name="imagen" value="">
					<span class="focus-input100"></span>
				</div>
                                
				<label class="label-input100" for="valor">Ingrese Valor Normal ($) *</label>
				<div class="wrap-input100" validate-input data-validate="Escriba un valor">
                                    <input id="valor" class="input100" type="text" name="valor" value="">
					<span class="focus-input100"></span>
				</div>
                                
				<label class="label-input100" for="valorOferta">Ingrese Valor Oferta ($) *</label>
				<div class="wrap-input100" validate-input data-validate="Seleccione un valor">
                                    <input id="valorOferta" class="input100" type="text" name="valorOferta" value="">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="estado">Selecciona un Estado *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido el estado">
                                    <select id="estado" class="form-control" name="estado">
                                        <option value="activo">Activo</option>
                                        <option value="no activo">No Activo</option>
                                    </select>        
                                            <span class="focus-input100"></span>
				</div>
                                        
                                <label class="label-input100" for="detalles">Detalles Generales *</label>
				<div class="wrap-input100">
                                    <input id="detalles" class="input100" type="text" name="detalles" value="">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="descripcion">Descripción *</label>
				<div class="wrap-input100">
                                    <input id="descripcion" class="input100" type="text" name="descripcion" value="">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="Observaciones">Observaciones *</label>
				<div class="wrap-input100">
                                    <input id="Observaciones" type="text" class="input100" name="Observaciones" value="">
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