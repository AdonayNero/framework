<%-- 
    Document   : GetUsuario
    Created on : 31-ago-2018, 16:33:03
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <jsp:include page="../pages/head_folder.html" />
    <jsp:include page="../pages/nav_folder.html" />
    </head>
    <body>
         <div id="content-wrapper">
            <div class="container-fluid">
                     <div class="card mb-3">
                          <div class="card-header">
                            <i class="fas fa-table"></i>
                            Lista Roles - <a href="${pageContext.request.contextPath}/usuario.do?op=nuevo" class="btn btn-primary">Nuevo Usuario</a></div>
                            
                                <div class="card-body">
                                  <div class="table-responsive">
                                      
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        
                                      <thead>
                                        <tr>
                                          <th>#</th>
                                          <th>Nombre</th>
                                          <th>email</th>
                                          <th>estado</th>
                                          <th>rol</th>
                                          
                                          <th>dui</th>
                                          <th>direccion</th>
                                          <th>Operaciones</th>
                                        </tr>
                                      </thead>


                                          <tbody>
                                              
                                              <c:forEach items="${requestScope.listaUsuario}" var="cat" varStatus="i">
                                            <tr>
                                                    <td>${i.count}</td>
                                                   <td>${cat.nombre}</td>
                                                   <td>${cat.email}</td>
                                                   <td>${cat.estado}</td>
                                                   <td>${cat.rol.nombre}</td>
                                                   
                                                   <td>${cat.dui}</td>
                                                   <td>${cat.direccion}</td>                                                   
                                                   <td>
                                                       <a class="btn btn-warning" href="${pageContext.request.contextPath}/usuario.do?op=obtener&id=${cat.id}"><span class="glyphicon glyphicon-edit"></span> Editar</a>
                                                       <a  class="btn btn-danger" href="javascript:eliminar('${cat.id}')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a>
                                                   </td>
                                               </tr>
                                       </c:forEach>
                                            </tbody>
                                        </table>
                                      </div>

                                </div>
                                            
                                            
                                            
                                        </div>
                                    </div>
                             </div>
                        </div>
                   </div>
             <script>
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
           alertify.confirm("¿Realmente decea eliminar este Usuario?", function(e){
              if(e){
                  location.href="usuario.do?op=eliminar&id="+ id;
              } 
           });
  }
        </script>
        
     <jsp:include page="../pages/footer_folder.html" />     
    </body>
</html>
