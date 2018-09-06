<%-- 
    Document   : GetCategoria
    Created on : 31-ago-2018, 16:23:46
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
                            Lista DetallesCupon - <a href="${pageContext.request.contextPath}/detalle.do?op=nuevo" class="btn btn-primary">Nuevo detalle</a></div>
                            
                                <div class="card-body">
                                  <div class="table-responsive">
                                      
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        
                                      <thead>
                                        <tr>
                                          <th>#</th>
                                          <th>idOferta</th>
                                          <th>idSucursal</th>
                                          <th>idCategoria</th>
                                          <th>estado</th>
                                          <th>cantidad</th>
                                          <th>fechaInicio</th>
                                          <th>fechaFin</th>
                                        
                                          
                                          
                                          
                                        </tr>
                                      </thead>


                                          <tbody>
                                              
                                              <c:forEach items="${requestScope.listaDetalles}" var="detalle" varStatus="i">
                                            <tr>
                                                    <td>${i.count}</td>
                                                   <td>${detalle.idOferta}</td>
                                                   <td>${detalle.idSucursal}</td>
                                                    <td>${detalle.idCategoria}</td>
                                                    <td>${detalle.estado}</td>
                                                    <td>${detalle.cantidad}</td>
                                                    <td>${detalle.fechaInicio}</td>
                                                    <td>${detalle.fechaFin}</td>
                                                  
                                                   
                                                   <td>
                                                       <a class="btn btn-warning" href="${pageContext.request.contextPath}/empresa.do?op=obtener&id=${empresa.id}"><span class="glyphicon glyphicon-edit"></span> Editar</a>
                                                       <a  class="btn btn-danger" href="javascript:eliminar('${empresa.id}')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a>
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
         function eliminar(id){
           alertify.confirm("¿Realmente decea eliminar este Empresa?", function(e){
              if(e){
                  location.href="empresa.do?op=eliminar&id="+ id;
              } 
           });
  }
        </script>
        </div>
     <jsp:include page="../pages/footer_folder.html" />        
    </body>
</html>
