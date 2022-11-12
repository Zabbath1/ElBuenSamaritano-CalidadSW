<%@page import="controllerDAO.ProductoJDBC"%>
<%@page import="model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="UTF-8">
    <head>
        <jsp:include page="/WEB-INF/includes/pageHeaderMetaInc.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/includes/pageHeaderStandarInc.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="/WEB-INF/includes/pageNavbarInc.jsp"></jsp:include>
        <%
            Producto producto = null;
            if (request.getParameter("idProducto") != null) {
                Integer idProducto = 0;
                try {
                    idProducto = Integer.parseInt(request.getParameter("idProducto"));
                } catch (Exception excepcion) {
                }
                producto = ProductoJDBC.instancia().consultarProducto(idProducto);
            }

            if (producto != null) {
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-12">
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                            <strong class="d-inline-block mb-2 text-primary"><a class="text-success text-decoration-none" href="index.jsp?idCategoria=<%= producto.getCategoria().getId()%>"><i class="fas fa-search"></i> <%= producto.getCategoria().getNombre()%></a></strong>
                            <h3 class="mb-4"><%= producto.getNombre()%></h3>
                            <p class="card-text mb-auto"><%= producto.getDescripcion()%></p>
                        </div>
                        <div class="col-auto d-none d-sm-block align-self-center">
                            <img src="<%= request.getContextPath()%>/resources/imagenes/productos/<%= producto.getId()%>.jpg" style="max-height: 150px;">
                        </div>
                    </div>
                </div>
                <div class="col-12 align-self-end">
                    <div class="btn-toolbar  justify-content-between" role="toolbar" >
                        <div class="btn-group mr-2" role="group">
                            <h2 class="mb-1"><script>document.write(formatCurrency(<%= producto.getPrecio()%>))</script> <small class="text-muted"> COP</small></h2>
                        </div>
                        <div class="btn-group mr-2" role="group">
                            <button data-id="<%= producto.getId()%>" type="button" class="btn btn-outline-secondary shopping-add-car"><i class="fas fa-cart-plus"></i></button>
                            <button data-id="<%= producto.getId()%>" type="button" class="btn btn-outline-secondary"><i class="fas fa-dollar-sign"></i></button>
                        </div>    
                    </div>
                </div>                        
            </div>
        </div>
        <%
        } else {
        %>
        <main role="main" class="container mt-5 p-0">
            <h1 class="display-2 mb-2"><i class="fas fa-bomb"></i> Sorry nuestra culpa!</h1>
            <p>No se encontraron resultados... <a href="index.jsp" class="text-danger text-decoration-none font-weight-bold"> clic aquí; para volver al inicio</a></p>
        </main>         
        <%
            }s
        %>

        <div class="container">
            <jsp:include page="/WEB-INF/includes/pageFooterStandarInc.jsp"></jsp:include>
        </div>
    </body>
</html>