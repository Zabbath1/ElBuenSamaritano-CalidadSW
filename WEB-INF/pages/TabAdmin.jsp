<%@page import="controllerDAO.ClienteJDBC"%>
<%@page import="model.Cliente"%>
<%@page import="controllerDAO.UsuarioJDBC"%>
<%@page import="model.Usuario"%>
<%@page import="controllerDAO.ProductoJDBC"%>
<%@page import="model.Producto"%>
<%@page import="controllerDAO.CategoriaJDBC"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    Boolean loginAdmin = (Boolean) session.getAttribute("loginAdmin");
    loginAdmin = (loginAdmin == null ? false : loginAdmin);

    String estado = (String) session.getAttribute("estado");
    estado = (estado == null ? "" : estado);
%>
<html lang="UTF-8">
    <head>
        <jsp:include page="/WEB-INF/includes/pageHeaderMetaInc.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/includes/pageHeaderStandarInc.jsp"></jsp:include>
        <%
            if (loginAdmin == false) {
        %>
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.0rem;
                }
            }
            html,
            body {
                height: 100%;
            }

            body {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                padding-top: 35px;
                padding-bottom: 35px;
                background-color: #f5f5f5;
            }

            .form-signin {
                width: 100%;
                max-width: 330px;
                padding: 15px;
                margin: auto;
            }
            .form-signin .checkbox {
                font-weight: 400;
            }
            .form-signin .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            .form-signin .form-control:focus {
                z-index: 2;
            }
            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }
            .form-signin input[type="password"] {
                margin-bottom: 12px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }            
        </style>     
        <%
            }
        %>
    </head>
    <body class="text-center text-primary">
        <%
            if (loginAdmin == false) {
        %>
        <form class="form-signin" action="TabAdmin" method="post">
            <%
                if (estado.length() > 0) {
            %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Sorry!</h4>
                <p><%= estado%></p>
            </div>
            <%
                }
            %>            

            <h1 class="h3 mb-3 font-weight-normal">Administrador</h1>
            <label for="usuario" class="sr-only">Usuario</label>
            <input type="text" id="usuario" name="email" class="form-control text-primary bg-transparent mb-2" placeholder="Usuario" required autofocus>
            <label for="clave" class="sr-only">Contrase&ntilde;a</label>
            <input type="password" id="clave" name="Clave" class="form-control text-primary bg-transparent mb-2" placeholder="clave" required>
            <span data-testid="switchToSignUpDescription" class="_2DZur">¿Eres nuevo en este sitio?</span>
            <button class="_3WTly" data-testid="switchToSignUp" type="button">Regístrate</button>
            <input id="accion" name="accion" type="hidden" value="entrar">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Sesión</button>
            <button class="TMDGQ _2ENj1" data-testid="forgotPasswordDesktop" type="button">¿Olvidaste la contraseña?</button>
            
        </form>
        <% } else {%>
        <jsp:include page="/WEB-INF/includes/pageNavbarAdminInc.jsp"></jsp:include>
            <main role="main" class="container">
                <div class="my-3 p-3 bg-white rounded shadow-sm text-left">
                    <h6 class="border-bottom border-gray pb-2 mb-0">Resumen</h6>
                    <div class="row text-muted pt-3">
                    <%
                        List<Categoria> categorias = CategoriaJDBC.instancia().listarCategorias();
                        if (categorias != null) {
                            if (categorias.size() > 0) {
                    %>

                    <div class="col-sm-6 col-md-4 mb-3">
                        <div class="media border rounded p-3">
                            <i class="fas fa-tag fa-3x pr-3 text-primary"></i>
                            <div class="media-body pb-3 mb-0 small lh-125">
                                <div class="d-flex justify-content-between align-items-center w-100">
                                    <strong class="text-gray-dark">Categorias</strong>
                                    <a class="text-primary" href="TabAdmin?accion=categorias">Ver</a>
                                </div>
                                <span class="d-block">@Registros <%= categorias.size()%></span>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %>


                    <%
                        List<Producto> producto = ProductoJDBC.instancia().listarProductos();
                        if (producto != null) {
                            if (producto.size() > 0) {
                    %>

                    <div class="col-sm-6 col-md-4 mb-3">
                        <div class="media border rounded p-3">
                            <i class="fas fa-tag fa-3x pr-3 text-primary"></i>
                            <div class="media-body pb-3 mb-0 small lh-125">
                                <div class="d-flex justify-content-between align-items-center w-100">
                                    <strong class="text-gray-dark">Productos</strong>
                                    <a class="text-primary" href="TabAdmin?accion=productos">Ver</a>
                                </div>
                                <span class="d-block">@Registros <%= producto.size()%></span>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %>


                    <%
                        List<Usuario> usuario = UsuarioJDBC.instancia().listarUsuarios();
                        if (usuario != null) {
                            if (usuario.size() > 0) {
                    %>

                    <div class="col-sm-6 col-md-4 mb-3">
                        <div class="media border rounded p-3">
                            <i class="fas fa-tag fa-3x pr-3 text-primary"></i>
                            <div class="media-body pb-3 mb-0 small lh-125">
                                <div class="d-flex justify-content-between align-items-center w-100">
                                    <strong class="text-gray-dark">Usuarios</strong>
                                    <a class="text-primary" href="TabAdmin?accion=usuarios">Ver</a>
                                </div>
                                <span class="d-block">@Registros <%= usuario.size()%></span>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %>                    


                    <%
                        List<Cliente> cliente = ClienteJDBC.instancia().listarClientes();
                        if (cliente != null) {
                            if (cliente.size() > 0) {
                    %>

                    <div class="col-sm-6 col-md-4 mb-3">
                        <div class="media border rounded p-3">
                            <i class="fas fa-tag fa-3x pr-3 text-primary"></i>
                            <div class="media-body pb-3 mb-0 small lh-125">
                                <div class="d-flex justify-content-between align-items-center w-100">
                                    <strong class="text-gray-dark">Clientes</strong>
                                    <a class="text-primary" href="TabADmin?accion=clientes">Ver</a>
                                </div>
                                <span class="d-block">@Registros <%= cliente.size()%></span>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %>                    
                </div>
                <small class="d-block text-right mt-3">
                    <a class="text-primary" href="TabAdmin?accion=salir"><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
                </small>
            </div>
        </main>        
        <% }%>
    </body>
</html>