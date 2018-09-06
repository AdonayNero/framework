<%-- 
    Document   : GetSucursal
    Created on : 31-ago-2018, 16:32:09
    Author     : Manuel Orellana
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                            Lista Sucursales - <a href="${pageContext.request.contextPath}/sucursal.do?op=nuevo" class="btn btn-primary">Nueva Sucursal</a></div>
                            
                                <div class="card-body">
                                  <div class="table-responsive">
                                      
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        
                                      <thead>
                                        <tr>
                                          <th>#</th>
                                          <th>Empresa</th>
                                          <th>Correo</th>
                                          <th>Telefono</th>
                                          <th>Direccion</th>
                                          <th>Encargado</th>
                                          <th>Operaciones</th>
                                        </tr>
                                      </thead>


                                          <tbody>
                                              
                                              <c:forEach items="${requestScope.listarSucursal}" var="sucursal" varStatus="i">
                                            <tr>
                                                    <td>${i.count}</td>
                                                   <td>${sucursal.empresa.nombre}</td>
                                                   <td>${sucursal.correo}</td>
                                                   <td>${sucursal.telefono}</td>
                                                   <td>${sucursal.direccion}</td>
                                                   <td>${sucursal.usuario.nombre}</td>
                                                   <td>
                                                       <a class="btn btn-warning" href="${pageContext.request.contextPath}/sucursal.do?op=obtener&id=${sucursal.id}"><span class="glyphicon glyphicon-edit"></span> Editar</a>
                                                       <a  class="btn btn-danger" href="javascript:eliminar('${sucursal.id}')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a>
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
           alertify.confirm("¿Realmente decea eliminar este Sucursal?", function(e){
              if(e){
                  location.href="sucursal.do?op=eliminar&id="+ id;
              } 
           });
  }
        </script>
        </div>
     <jsp:include page="../pages/footer_folder.html" />        
    </body>
    
</html>
