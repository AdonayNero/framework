<%-- 
    Document   : listaRoles
    Created on : 30-ago-2018, 9:12:00
    Author     : Edal Bonilla
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-striped table-bordered table-hover" id="tabla">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Nombre</th>
                            <th>descripcion</th>
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach items="${requestScope.listaRoles}" var="roles">
                         <tr>
                                <td>${roles.id}</td>
                                <td>${roles.nombre}</td>
                                <td>${roles.descripcion}</td>
                                <td>
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/autores.do?op=obtener&id=${autores.codigoAutor}"><span class="glyphicon glyphicon-edit"></span> Editar</a>
                                    <a  class="btn btn-danger" href="javascript:eliminar('${autores.codigoAutor}')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a>
                                </td>
                            </tr>
                    </c:forEach>
                           
                   
                    </tbody>
                </table>
    </body>
</html>
