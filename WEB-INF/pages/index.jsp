<%@page import="java.util.ArrayList"%>
<%@page import="model.Producto"%>
<%@page import="model.Producto"%>
<%@page import="controllerDAO.CategoriaJDBC"%>
<%@page import="model.Categoria"%>
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
            if(request.getParameter("idCategoria")==null){  
                if(request.getParameter("buscar")==null){
        %>
        <main role="main" class="container-fluid p-0">
            <div class="jumbotron bg-img-store border-0 rounded-0" style="background: url('<%= request.getContextPath() %>/resources/imagenes/backgrounds/shopping.jpg'); ">
                <div class="row h-100">
                    <div class="col align-self-end">
                        <div class="text-light p-5">
                            <h1 class="display-4"><%= session.getAttribute("WEBSITE-TITLE") %></h1>
                            <p class="lead"><%= session.getAttribute("WEBSITE-DESCRIPTION") %></p>
                            <a class="btn btn-primary btn-lg" href="index" role="button">ALQUILAR</a>
                        </div>
                    </div>
                </div>
            </div>
        </main> 
        <div class="container">
            <jsp:include page="/WEB-INF/includes/pageProductos.jsp"></jsp:include>
        </div>                            
        <% 
                }else{
        %>
        <div class="container mt-5">
            <jsp:include page="/WEB-INF/includes/pageProductos.jsp"></jsp:include>
        </div>        
        <%
                }
            } else {
        %>
        <div class="container mt-5">
            <jsp:include page="/WEB-INF/includes/pageProductos.jsp"></jsp:include>
        </div>        
        <%
            }
        %>
        
        <div class="container mt-5">
            <jsp:include page="/WEB-INF/includes/pageFooterStandarInc.jsp"></jsp:include>
        </div>
    </body>
</html>