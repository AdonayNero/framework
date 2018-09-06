<%-- 
    Document   : UpdateVenta
    Created on : 31-ago-2018, 16:33:47
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
			<form form action="${pageContext.request.contextPath}/venta.do" method="POST" class="contact100-form validate-form">
				 <input type="hidden"  name="op" value="modificar">	
                            <span class="contact100-form-title">
					Modificar Venta
				</span>
                                
                                  <input type="hidden"  name="codigo" value="${venta.codigo}">
                                
                             
                            
				<label class="label-input100" for="idCliente">Selecciona un cliente *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona un cliente">
					<select id="idCliente" class="input100" name="idCliente">
                                            <option selected>Selecciona un cliente</option>
                                            <c:forEach items="${requestScope.listarUser}" var="usuario" >
                                            <option value="${usuario.id}">${usuario.nombre}</option>
                                            </c:forEach>
                                        </select>
                                        <span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="idDetalleCupon">Selecciona un Detalle Cupón *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona un detalle cupon">
					<select id="idDetalleCupon" class="input100" name="idDetalleCupon">
                                           <option selected>Selecciona un Detalle Cupón</option>
                                             <c:forEach items="${requestScope.listarDetalle}" var="detalle" >
                                            <option value="${detalle.id}">${detalle.id}</option>
                                            </c:forEach>
                                        </select>
                                            <span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="fechaVenta">Selecciona Fecha y Hora de Venta *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerida la fecha">
                                    <input id="fechaVenta" class="input100" type="date" name="fechaVenta" value="${venta.fechaVenta}">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="formaPago">Selecciona la Forma de Pago *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerida la forma de pago">
                                    <select id="formaPago" class="input100" name="formaPago" value="${venta.formaPago}">
				        <option value="">Contado</option>
                                    </select>	
                                    <span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="estado">Selecciona un Estado *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerido el estado">
                                    <select id="estado" class="input100" name="estado">
                                        <option selected>Selecciona un estado</option>
                                        <option value="activo">Activo</option>
                                        <option value="no activo">No Activo</option>
                                    </select>	
                                        <span class="focus-input100"></span>
				</div>
                                
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Venta
					</button>
                                    </br>
                                    <a href="${pageContext.request.contextPath}/venta.do" class="btn btn-danger" >Cancelar</a>
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