<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="index.html">Cuponera</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-primary" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </form>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
 
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <c:if test="${not empty sessionScope.acceso}">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/usuario.do?op=outlogin">Logout</a>
            </c:if>
            <c:if test="${empty sessionScope.acceso }">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/usuario.do?op=nuevo">Regsitrarse Cliente</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/InicioSesion.jsp">Ingresar</a>
            </c:if>
          </div>
        </li>
      </ul>

    </nav>


<c:if test="${not empty sessionScope.acceso}">
    <div id="wrapper">
           <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        
          
                        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Menu Inicio</span>
          </a>
        </li>
        <c:if test="${sessionScope.acceso eq 'admin'}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Categorias</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="Categoria/GetCategoria.jsp">Lista de Categorias</a>
            <a class="dropdown-item" href="Categoria/AddCategoria.jsp">Agregar Categoria</a>
            <a class="dropdown-item" href="Categoria/UpdateCategoria.jsp">Modificar Categoria</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Roles</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="Rol/GetRol.jsp">Lista de Roles</a>
            <a class="dropdown-item" href="Rol/AddRol.jsp">Agregar Rol</a>
            <a class="dropdown-item" href="Rol/UpdateRol.jsp">Modificar Rol</a>
          </div>
        </li>
        </c:if>
        <c:if test="${sessionScope.acceso eq 'admin'  or sessionScope.acceso eq 'adminEmp'}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Detalles Cupon</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="DetalleCupon/GetDetalleCupon.jsp">Lista de Cupones</a>
            <a class="dropdown-item" href="DetalleCupon/AddDetalleCupon.jsp">Agregar Cupon</a>
            <a class="dropdown-item" href="DetalleCupon/UpdateDetalleCupon.jsp">Modificar Cupon</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Empresas</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="Empresa/GetEmpresa.jsp">Lista de Empresas</a>
            <a class="dropdown-item" href="Empresa/AddEmpresa.jsp">Agregar Empresa</a>
            <a class="dropdown-item" href="Empresa/UpdateEmpresa.jsp">Modificar Empresa</a>
          </div>
        </li>
       </c:if>
        <c:if test="${sessionScope.acceso eq 'admin' || sessionScope.acceso eq 'usuario' || sessionScope.acceso eq 'adminEmp'}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Ofertas</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
         
        
            <a class="dropdown-item" href="Oferta/GetOferta.jsp">Lista de Ofertas</a>
        <c:if test="${sessionScope.acceso eq 'admin'  or sessionScope.acceso eq 'adminEmp'}">    
            <a class="dropdown-item" href="Oferta/AddOferta.jsp">Agregar Oferta</a>
            <a class="dropdown-item" href="Oferta/UpdateOferta.jsp">Modificar Oferta</a>
        </c:if>
          </div>
        </li>
        </c:if>
        <c:if test="${sessionScope.acceso eq 'admin'  or sessionScope.acceso eq 'adminEmp'}">         
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Sucursal</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="Sucursal/GetSucursal.jsp">Lista de Sucursales</a>
            <a class="dropdown-item" href="Sucursal/AddSucursal.jsp">Agregar Sucursal</a>
            <a class="dropdown-item" href="Sucursal/UpdateSucursal.jsp">Modificar Sucursal</a>
          </div>
        </li>
        </c:if>
        <c:if test="${sessionScope.acceso eq 'admin' or sessionScope.acceso eq 'usuario' or sessionScope.acceso eq 'adminEmp'}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Usuarios</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          
            <a class="dropdown-item" href="Usuario/UpdateUsuario.jsp">Modificar Usuarios</a> 
        <c:if test="${sessionScope.acceso eq 'admin'  or sessionScope.acceso eq 'adminEmp'}">      
            <a class="dropdown-item" href="Usuario/GetUsuario.jsp">Lista de Usuarios</a>
            <a class="dropdown-item" href="Usuario/AddUsuario.jsp">Agregar Usuario</a>
        </c:if>    
            
          </div>
        </li>
        </c:if>  
        <c:if test="${sessionScope.acceso eq 'admin'  or sessionScope.acceso eq 'adminEmp'}">         
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Ventas</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="Venta/GetVenta.jsp">Lista de Ventas</a>
          </div>
        </li>
        </c:if>
        
        
        
        
        <li class="nav-item">
          <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="tables.html">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
        </li>
         
        
      </ul>
    
</c:if>