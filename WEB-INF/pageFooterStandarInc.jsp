<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="info"></div>
<footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
        <div class="col-12 col-md">
            <small class="d-block mb-3 text-success"><i class="fas fa-shopping-cart"></i> <%= session.getAttribute("WEBSITE-TITLE")%> © 1981-2022</small>
        </div>
        <div class="col-6 col-md">
            <h5></h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Ullamcorper senectus</a></li>
                <li><a class="text-muted" href="#">Suspendisse penatibus!</a></li>
                <li><a class="text-muted" href="#">Vitae mattis</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Resource</a></li>
                <li><a class="text-muted" href="#">Resource name</a></li>
                <li><a class="text-muted" href="#">Another resource</a></li>
                <li><a class="text-muted" href="#">Final resource</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Acera de</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Fabian Andrés Zabaleta Cruz</a></li> 
            </ul>
        </div>
    </div>
</footer>

<div id="carrito" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Carrito</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Continuar comprado</button>
                <button type="button" class="btn btn-primary">Pagar</button>
            </div>
        </div>
    </div>
</div>   
<a id="back-to-top" href="#" class="btn btn-success btn-lg back-to-top" role="button" data-placement="left"><i class="fas fa-arrow-up"></i> | Productos en el carrito <span class="conteo">0</span></a>
<script>
    $(document).on('click', '.carritoPagar', function () {
        goToURL('pagar');
    });

    $(document).on('click', '.shopping-add-car', function () {
        loadCarritoAjax("carrito", "GET", {accion: 'agregar', idProducto: $(this).data('id')}, '#carrito .modal-body', '.conteo');
        $('#carrito').modal('show');
    });


    $(function () {
        loadPageAjax("carrito", "GET", {accion: 'conteo'}, '.conteo', '');
        //animateCSS('.news-panel', 'fadeInDown');	

        $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('#back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });

        $('#back-to-top').tooltip('show');
    });
</script>