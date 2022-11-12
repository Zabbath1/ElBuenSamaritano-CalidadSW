<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="info"></div>
<footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
      <div class="col-12 col-md">
        <small class="d-block mb-3 text-primary"><i class="fas fa-shopping-cart"></i> <%= session.getAttribute("WEBSITE-TITLE") %> |  Calidad de Software 2022-2  |</small>
      </div>
      <div class="col-6 col-md">
        <h5>El buen samaritano</h5>
      </div>
      <div class="col-6 col-md">
        <h5>Acerca de</h5>
        <ul class="list-unstyled text-small">
          <li><a class="text-muted" href="#">Fabian Andrés Zabaleta </a></li> 
          <li><a class="text-muted" href="#">Karen Montaño </a></li> 
          <li><a class="text-muted" href="#">David Rojas</a></li> 
        </ul>
      </div>
    </div>
  </footer>
      
<div id="carrito" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Carrito</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Seguir comprando</button>
        <button type="button" class="btn btn-primary">Pagar</button>
      </div>
    </div>
  </div>
</div>    
<script>
	$(document).on('click', '.shopping-add-car', function () {
            loadPageAjax("carrito", "GET",{ accion:'agregar', idProducto: $(this).data('id') }, '#carrito .modal-body', '#carrito .modal-body');
            loadPageAjax("carrito", "GET",{ accion:'conteo' }, '#carritoPagar .conteo', '');
            $('#carrito').modal('show');
	});	
		
	$(function () {
		//animateCSS('.news-panel', 'fadeInDown');	
	});
</script>