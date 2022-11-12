<%@page import="controllerDAO.ProductoJDBC"%>
<%@page import="model.Producto"%>
<%@page import="controllerDAO.CategoriaJDBC"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    Boolean loginAdmin = (Boolean) session.getAttribute("loginAdmin");
    loginAdmin = (loginAdmin == null ? false : loginAdmin);

    String tabla = "";
    try {
        tabla = (String) request.getParameter("tabla");
    } catch (Exception excepcion) {
        tabla = "";
    }
    tabla = (tabla == null ? "" : tabla);

    Integer numeroId = 0;
    try {
        numeroId = Integer.parseInt(request.getParameter("id"));
    } catch (Exception excepcion) {
        numeroId = 0;
    }
    numeroId = (numeroId == null ? 0 : numeroId);

    String stringId = "";
    try {
        stringId = (String) request.getParameter("id");
    } catch (Exception excepcion) {
        stringId = "";
    }
    stringId = (stringId == null ? "" : stringId);
%>
<html lang="UTF-8">
    <head>
        <jsp:include page="/WEB-INF/includes/pageHeaderMetaInc.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/includes/pageHeaderStandarInc.jsp"></jsp:include>
            <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css">
            <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>    
        </head>
        <body class="text-success">
        <%
            if (loginAdmin == false) {
        %>
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">No autorizado!</h4>
            <p>Intente como perfil adminstrador</p>
            <hr>
            <p class="mb-0">Contacte al administrador.</p>
        </div>
        <%
        } else {
            if (tabla.length() > 0) {
        %>
        <jsp:include page="/WEB-INF/includes/pageNavbarAdminInc.jsp"></jsp:include>
            <main role="main" class="inner cover mt-3">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col">
                            <!-- init -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb text-capitalize">
                                    <li class="breadcrumb-item active" aria-current="page"><%= tabla%></li>
                            </ol>
                        </nav>
                        <div class="card">
                            <h5 class="card-header">Edición <% if (numeroId > 0) {%><span class="badge badge-secondary"><%= numeroId%></span><% } else if (stringId.length() > 0) {%><span class="badge badge-primary"><%= stringId%></span><% } %> </h5>
                            <div class="card-body">
                                <%
                                    if (tabla.equals("categorias")) {
                                        Categoria categoria = CategoriaJDBC.instancia().consultarCategoria(numeroId);
                                %>
                                <form>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="id">ID</label>
                                                <input type="number" class="form-control" id="id" name="id" aria-describedby="id" value="<%= (categoria != null ? categoria.getId() : "")%>" <%= (categoria != null ? (categoria.getId() > 0 ? "disabled=\"disabled\"" : "") : "")%>>
                                                <small id="id" name="id" class="form-text text-muted">Numero de prodcuto</small>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label for="nombre">Nombre categoria</label>
                                                <input type="text" id="nombre" name="nombre" class="form-control" value="<%= (categoria != null ? categoria.getNombre() : "")%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="descripcion">Descripción categoria</label>
                                                <textarea type="text" id="descripcion" name="descripcion" class="form-control"><%= (categoria != null ? categoria.getDescripcion() : "")%></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <input id="tabla" name="tabla" type="hidden" value="<%= tabla%>">
                                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                        </div>
                                    </div>
                                </form>                                
                                <% } %>

                                <% 
                                    if (tabla.equals("productos")) {
                                        Producto producto = ProductoJDBC.instancia().consultarProducto(numeroId);
                                %>
                                <form>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="id">ID</label>
                                                <input type="number" class="form-control" id="id" name="id" aria-describedby="id" value="<%= (producto != null ? producto.getId() : "")%>" <%= (producto != null ? (producto.getId() > 0 ? "disabled=\"disabled\"" : "") : "")%>>
                                                <small id="id" name="id" class="form-text text-muted">Número de producto</small>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label for="nombre">Nombre del producto</label>
                                                <input type="text" id="nombre" name="nombre" class="form-control" value="<%= (producto != null ? producto.getNombre() : "")%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="descripcion">Descripción del producto</label>
                                                <textarea id="descripcion" name="descripcion" class="form-control"><%= (producto != null ? producto.getDescripcion() : "")%></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="precio">Precio</label>
                                                <input type="number" class="form-control" id="precio" name="precio" aria-describedby="precio" value="<%= (producto != null ? producto.getPrecio() : "")%>">
                                                <small id="precio" name="precio" class="form-text text-muted">Precio del producto</small>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <div class="row">
                                        <div class="col">
                                            <input id="tabla" name="tabla" type="hidden" value="<%= tabla%>">
                                            <button type="submit" class="btn btn-primary">Guardar cambios</button>
                                        </div>
                                    </div>
                                </form>                                
                                <% } %> 


                                <% if (tabla.equals("usuarios")) {%>
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="usuario">Usuario</label>
                                                <input type="text" class="form-control" id="usuario" name="usuario" aria-describedby="usuario">
                                                <small id="usuario" name="usuario" class="form-text text-muted">Usuario</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="clave">Clave</label>
                                                <input type="text" id="clave" name="clave" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <input id="tabla" name="tabla" type="hidden" value="<%= tabla%>">
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                </form>                                
                                <% } %>    

                                <% if (tabla.equals("clientes")) {%>
                                <form>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="id">ID</label>
                                                <input type="number" class="form-control" id="id" name="id" aria-describedby="id">
                                                <small id="id" name="id" class="form-text text-muted">Numero Cliente</small>
                                            </div>
                                        </div>                                    
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label for="nombre">nombre</label>
                                                <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombre">
                                                <small id="nombre" name="nombre" class="form-text text-muted">nombre</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="direccion">direccion</label>
                                                <input type="text" id="direccion" name="direccion" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="telefono">telefono</label>
                                                <input type="text" id="telefono" name="telefono" class="form-control">
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <input id="tabla" name="tabla" type="hidden" value="<%= tabla%>">
                                            <button type="submit" class="btn btn-primary">Guardar cambios</button>
                                        </div>
                                    </div>
                                </form>                                
                                <% } %>                                    
                            </div>
                        </div>
                        <!-- end -->
                    </div>
                </div>
            </div>
        </main>
        <%
        } else {
        %>
        <jsp:include page="/WEB-INF/includes/pageNavbarAdminInc.jsp"></jsp:include>
            <main role="main" class="inner cover m-3">
                <div class="alert alert-danger" role="alert">
                    <h4 class="alert-heading">Error!</h4>
                    <p>No se ha definido la tabla de consulta.</p>
                    <hr>
                    <p class="mb-0">Por favor contacte al adminsitrador.</p>
                </div> 
            </main>
        <%
                }
            }
        %>
    </body>
</html>