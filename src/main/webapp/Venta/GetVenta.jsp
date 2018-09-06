<%-- 
    Document   : GetVenta
    Created on : 31-ago-2018, 16:33:58
    Author     : Manuel Orellana
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <jsp:include page="../pages/head_folder.html" />
    
    </head>
    <body>
       
        <jsp:include page="../pages/nav_folder.jsp" />
         <div id="content-wrapper">
            <div class="container-fluid">
                     <div class="card mb-3">
                    <!-- DataTables Example -->
                        <div class="card mb-3">
                          <div class="card-header">
                            <i class="fas fa-table"></i>
                            Lista Venta - <a href="${pageContext.request.contextPath}/venta.do?op=nuevo" class="btn btn-primary">Nueva Venta</a></div>
                            
                                <div class="card-body">
                                  <div class="table-responsive">
                                      
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        
                                      <thead>
                                        <tr>
                                          <th>Codigo</th>
                                          <th>Cliente</th>
                                          <th>idDetalleCupon</th>                     
                                          <th>Fecha de Venta</th>
                                          <th>Forma de Pago</th>
                                          <th>Estado</th>
                                          <th>Operaciones</th>
                                          
                                          
                                          
                                        </tr>
                                      </thead>


                                          <tbody>
                                              
                                              <c:forEach items="${requestScope.listarVenta}" var="venta" varStatus="i">
                                            <tr>
                                                    <td>${venta.codigo}</td>
                                                    <td>${venta.cliente.nombre}</td>
                                                    <td>${venta.idDetalleCupon}</td>
                                                    <td>${venta.fechaVenta}</td>
                                                    <td>${venta.formaPago}</td>
                                                    <td>${venta.estado}</td>
                                          
                                              <td>
                                                       <a class="btn btn-warning" href="${pageContext.request.contextPath}/venta.do?op=obtener&codigo=${venta.codigo}"><span class="glyphicon glyphicon-edit"></span> Editar</a>
                                                       <a  class="btn btn-danger" href="javascript:eliminar('${venta.codigo}')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a>
                                                   </td>
                                               </tr>
                                       </c:forEach>
                                            </tbody>
                                        </table>
                                      </div>

                                </div>
                        </div>
                     </div>
            </div><script>
            $(document).ready(function(){
               $('#tabla').DataTable(); 
            });
                       <c:if test="${not empty exito}">
                           alertify.success('${exito}');
                          <c:set var="exito" value="" scope="session" />
                       </c:if>
                           <c:if test="${not empty fracaso}">
                           alertify.error('${fracaso}');
                           <c:set var="fracaso" value="" scope="session" />
                       </c:if>
         function eliminar(codigo){
           alertify.confirm("¿Realmente decea eliminar esta Venta?", function(e){
              if(e){
                  location.href="venta.do?op=eliminar&codigo="+ codigo;
              } 
           });
  }
        </script>
        </div>
     <jsp:include page="../pages/footer_folder.html" />     
</body>
</html>
