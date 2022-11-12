<%@page import="model.CarritoItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.Carrito"%>
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
            <div class="container mt-5">
                <div class="row"><div class="col">
                        <h4>Productos en el carrito de compras</h4>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Producto</th>
                                    <th scope="col" class="text-right">Cantidad</th>
                                    <th scope="col" class="text-right">Precio</th>
                                </tr>
                            </thead>
                            <tbody>    
                            <%
                                Carrito carrito = (Carrito) session.getAttribute("carrito");
                                List<CarritoItem> items = carrito.getItems();

                                for (CarritoItem item : items) {
                            %>
                            <tr>
                                <th scope="row"><%= item.getProducto().getId()%></th>
                                <td><%= item.getProducto().getNombre()%></td>
                                <td class="text-right"><%= item.getCantidad()%></td>
                                <td class="text-right">$<%= String.format("%,.2f", item.getProducto().getPrecio())%><small class="text-muted">COP</small></td>
                            </tr>         
                            <%  }%>

                        </tbody>
                    </table>
                </div></div>

            <div class="container mt-5">
                <jsp:include page="/WEB-INF/includes/pageFooterStandarInc.jsp"></jsp:include>
            </div>
    </body>
</html>