<%@page import="controllerDAO.CategoriaJDBC"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-dark bg-black">
    <a class="navbar-brand text-primary" href="index"><i class="fas fa-shopping-cart"></i> <%= session.getAttribute("WEBSITE-TITLE") %></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="index"><i class="fas fa-home"></i> Inicio</a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-tags"></i>Productos</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <%
                        List<Categoria> categorias = CategoriaJDBC.instancia().listarCategorias(); 
                        for (Categoria categoria : categorias) {     
                    %> 
                    <a class="dropdown-item" href="index?idCategoria=<%= categoria.getId() %>"><i class="fas fa-tag"></i> <%= categoria.getNombre() %></a>
                    <% } %>
                </div>
           </li>
           <li class="nav-item active"><a class="nav-link" href="index"><i class="fas fa-tags"></i> Tienda</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Iniciar Sesión</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#"><i class="fas fa-user-tag"></i> Usuario</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="TabAdmin"><i class="fas fa-user-secret"></i> Admin</a>

                </div>
           </li>
           <li class="nav-item active"><a class="nav-link" href="index"><i class="fas fa-tags"></i> Productos</a></li>
           <li class="nav-item active"><a class="nav-link" href="index"><i class="fas fa-tags"></i> Reserva</a></li>
           <li class="nav-item active"><a class="nav-link" href="index"><i class="fas fa-tags"></i> Contacto</a></li>
        </ul>        
        <form class="form-inline mt-2 mt-md-0" action="index" method="get">
            <input id="buscar" name="buscar" class="form-control mr-sm-2 border-primary text-primary bg-black" type="text" placeholder="Buscar" aria-label="Buscar">
            <button type="submit" class="btn btn-outline-primary my-2 my-sm-0 mr-sm-2">Buscar</button>
        </form>
    </div>
</nav>