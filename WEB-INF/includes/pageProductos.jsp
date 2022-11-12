<%@page import="java.util.ArrayList"%>
<%@page import="controllerDAO.CategoriaJDBC"%>
<%@page import="model.Categoria"%>
<%@page import="model.Categoria"%>
<%@page import="controllerDAO.ProductoJDBC"%>
<%@page import="java.util.List"%>
<%@page import="model.Producto"%>
<%@page import="model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String titulo = "";
    String subtitulo = "";
    String descripcion = "";
    List<Producto> productos = new ArrayList();

    if (request.getParameter("idCategoria") == null) {
        if (request.getParameter("buscar") == null) {
            productos = ProductoJDBC.instancia().listarProductosDestacados();
        } else {
            String buscar = "";
            try{
                buscar = (String) request.getParameter("buscar");
            } catch (Exception excepcion){ }
            productos = ProductoJDBC.instancia().listarProductos(buscar);
            
            titulo="Se busco: "+buscar;
            subtitulo = Integer.toString(productos.size());
            descripcion = "Se encontraron "+subtitulo+" producto(s). No encuentras los que buscas? Intenta de nuevo con palabra clave como marca o modelo.";
            
        }
    } else {
        Integer idCategoria = 0;
        try{
            idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        } catch (Exception excepcion){ }
        Categoria categoria = CategoriaJDBC.instancia().consultarCategoria(idCategoria);
        
        if(categoria != null){
            titulo = categoria.getNombre();
            subtitulo = Integer.toString(categoria.getId());
            descripcion = categoria.getDescripcion();
            productos = ProductoJDBC.instancia().listarProductos(idCategoria);
        }
    }

    if (productos.size() > 0) {
%>
<h1><%= titulo%>  <span class="badge badge-secondary"><%= subtitulo%></span></h1>
<p><small><%= descripcion%></small></p>
<div class="row card-deck mb-3 text-center">          
    <% for (Producto producto : productos) {%>
    <div class="col-sm-6 col-md-4 p-0 m-0 mb-3">
        <div class="card h-100 p-0 m-1 mb-2 shadow-sm border border-primary">
            <div class="card-header border-0 bg-transparent">
                <h5 class="my-0 font-weight-normal"><%= producto.getNombre()%></h5>
                <span class="badge badge-primary font-weight-light rounded-0"><a class="text-white text-decoration-none" href="index?idCategoria=<%= producto.getCategoria().getId()%>"><%= producto.getCategoria().getNombre()%></a></span>
            </div>
            <div class="card-body">
                <div class="row h-100">
                    <div class="col-12 align-self-start">
                        <h4 class="card-title pricing-card-title"><script>document.write(formatCurrency(<%= producto.getPrecio()%>))</script> <small class="text-muted"> COP</small></h4>
                        <p><img src="<%= request.getContextPath()%>/resources/imagenes/productos/<%= producto.getId()%>.jpg" style="max-height: 150px;"></p>
                    </div>
                    <div class="col-12 align-self-end">
                        <div class="btn-toolbar  justify-content-between" role="toolbar" >
                            <div class="btn-group w-50" role="group">
                                <a href="producto?idProducto=<%= producto.getId()%>" type="button" class="btn btn-outline-primary"><i class="fas fa-eye"></i> Ver</a>
                            </div>
                            <div class="btn-group" role="group">
                                <button data-id="<%= producto.getId()%>" type="button" class="btn btn-outline-primary w-50 shopping-add-car"><i class="fas fa-cart-plus"></i></button>
                                <button data-id="<%= producto.getId()%>" type="button" class="btn btn-outline-primary w-50"><i class="fas fa-dollar-sign"></i></button>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div>
<% } else {%>
<h1 class="display-2 mb-2"><i class="fas fa-bomb"></i> Ops! nuestra culpa</h1>
<p>No se encontraron resultados... <a href="index.jsp" class="text-danger text-decoration-none font-weight-bold"> clic aqu&iacute; para volver al inicio</a></p>
<% }%>
