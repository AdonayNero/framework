<%-- 
    Document   : index
    Created on : Aug 30, 2018, 3:18:42 PM
    Author     : Adonay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="./pages/head.html" />

    <jsp:include page="./pages/nav.html" />
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
   <form action="${pageContext.request.contextPath}/roles.do" method="POST" class="contact100-form validate-form">
                <input type="hidden"  name="op" value="insertar">
				<span class="contact100-form-title">
					Insertar un Nuevo Rol
				</span>        
                        
				<label class="label-input100" for="nombre">Seleccione el Nivel de Acceso *</label>
				<div class="wrap-input100 validate-input" data-validate="Seleccione el Nivel de Acceso">
                                    <input id="nombre" class="form-control" name="nombre" placeholder="Escriba un rol"/>
                                            <span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="descripcion">Descripción *</label>
				<div class="wrap-input100 validate-input" data-validate = "Es Requerida una Descripción ">
					<textarea id="descripcion" class="input100" name="descripcion" placeholder="Escriba una descripción"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Enviar Rol
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


                    </div>
                </div>
            </div>

    </body>
    

	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
   <%-- 
    Document   : index
    Created on : Aug 30, 2018, 3:18:42 PM <jsp:include page="Rol/AddRol.jsp" />
    Author     : Adonay
--%> 
   
		 </div>
                </div>
            </div>


    
    </body>
    <jsp:include page="./pages/footer.html" />
    
</html>
