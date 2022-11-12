<%@page import="controllerDAO.CategoriaJDBC"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-dark bg-black">
    <a class="navbar-brand text-success" href="TabAdmin"><i class="fas fa-shopping-cart"></i> <%= session.getAttribute("WEBSITE-TITLE") %></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="TabAdmin"><i class="fas fa-home"></i> Inicio</a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-tags"></i> Opciones</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="TabAdmin?accion=categorias"><i class="fas fa-tag"></i> Bastones</a>
                    <a class="dropdown-item" href="TabAdmin?accion=productos"><i class="fas fa-tag"></i> Caminadores</a>
                    <a class="dropdown-item" href="TabAdmin?accion=usuarios"><i class="fas fa-tag"></i> Muletas</a>
                    <a class="dropdown-item" href="TabAdminaccion=clientes"><i class="fas fa-tag"></i> Sillas de ruedas</a>
                </div>
           </li>
        </ul>
        <ul class="navbar-nav">
           <li class="nav-item"><a class="nav-link" href="TabAdmin?accion=salir"><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a></li>
        </ul>
    </div>
</nav>