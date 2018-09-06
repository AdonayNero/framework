<%-- 
    Document   : DetalleCupon
    Created on : 30-ago-2018, 12:31:33
    Author     : Manuel Orellana
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                            <form action="${pageContext.request.contextPath}/detalle.do" class="contact100-form validate-form">
                                        <input type="hidden"  name="op" value="insertar">
                                                <span class="contact100-form-title">
					Ingresa un Nuevo Detalle de Cupón
				</span>

				<label class="label-input100" for="idOferta">Selecciona una Oferta *</label>
				<div class="wrap-input100 validate-input" data-validate="Selecciona una empresa">
					<select id="idOferta" class="form-control" name="idOferta">
					    <option selected>Seleccione un encargado</option>
                                            <c:forEach items="${requestScope.listarOferta}" var="oferta" >
                                            
                                            <option value="${oferta.id}">${oferta.titulo}</option>
                                            
                                            </c:forEach>
                                            
                                            
                                            
                                            
                                        </select>
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="idSucursal">Selecciona una Sucural *</label>
				<div class="wrap-input100 validate-input" data-validate = "Selecciona una sucursal">
					<select id="idSucursal" class="form-control" name="idSucursal">
                                            <option selected>Selecciona una Sucursal</option>
                                            
                                           <c:forEach items="${requestScope.listarSucursal}" var="sucursal" >
                                               <c:if test="${sucursal.empresa.idEncargado eq sessionScope.id }">
                                            <option value="${sucursal.id}">${sucursal.direccion}</option>
                                               </c:if>
                                            </c:forEach> 
                                            <c:forEach items="${requestScope.listarSucursal}" var="sucursal" >
                                            <c:if test="${not sessionScope.acceso eq 'adminEmp' }">
                                                <option value="${sucursal.id}">${sucursal.direccion}</option>
                                               </c:if>
                                            </c:forEach> 
                                        </select>
                                            <span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="idCategoria">Selecciona una Categoría *</label>
				<div class="wrap-input100 validate-input" data-validate = "Selecciona una categoría">
					<select id="idCategoria" class="form-control" name="idCategoria">
                                            <option selected>Selecciona un Categoría</option>
                                           <c:forEach items="${requestScope.listarCategoria}" var="categoria" >
                                            <option value="${categoria.id}">${categoria.nombre}</option>
                                            </c:forEach> 
                                        </select>
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

                                <label class="label-input100" for="cantidad">Ingrese una Cantidad *</label>
				<div class="wrap-input100 validate-input" data-validate = "Ingrese una cantidad">
					<input id="cantidad" class="input100" type="text" name="cantidad" placeholder="2">
					<span class="focus-input100"></span>
				</div>
                                
                                <label class="label-input100" for="fechaInicio">Selecciona Fecha y Hora de Inicio *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerida la fecha">
                                    <input id="fechaInicio" class="input100" type="date" name="fechaInicio" placeholder="Seleccione la fecha inicio">
					<span class="focus-input100"></span>
				</div>

                                <label class="label-input100" for="fechaFin">Selecciona Fecha y Hora Fin *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es requerida la fecha">
                                    <input id="fechaFin" class="input100" type="date" name="fechaFin" placeholder="Seleccione la fecha fin">
					<span class="focus-input100"></span>
				</div>
                                
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Detalle Cupón
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
