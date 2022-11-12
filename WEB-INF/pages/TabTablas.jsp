<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    Boolean loginAdmin = (Boolean) session.getAttribute("loginAdmin");
    loginAdmin = (loginAdmin == null ? false : loginAdmin);

    String tabla = "";
    try {
        tabla = (String) request.getAttribute("tabla");
    } catch (Exception excepcion) {
        tabla = "";
    }
    tabla = (tabla == null ? "" : tabla);
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
            <p>No cuenta con el perfil para esta opci&oacute;n.</p>
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
                                <h5 class="card-header text-uppercase"><i class="fas fa-tag"></i> <%= tabla%></h5>
                                <div class="card-body">


                                    <div id="toolbar">
                                        <div class="btn-group" role="group" aria-label="toolbar">
                                            <button class="add btn btn-outline-secondary" data-toggle="tooltip" data-placement="bottom" title="Agregar"><i class="fas fa-plus-circle"></i></button>
                                            <button class="inactive btn btn-outline-secondary" data-toggle="tooltip" data-placement="bottom" title="Eliminar marcados" disabled><i class="fas fa-trash"></i></button>
                                        </div>
                                    </div>										
                                    <table
                                        id="tableData"
                                        data-toolbar="#toolbar"
                                        data-search="false"
                                        data-show-search-clear-button="true"
                                        data-show-refresh="true"
                                        data-click-to-select="true"
                                        data-show-export="false"
                                        data-minimum-count-columns="2"
                                        data-pagination="false"
                                        data-id-field="id"
                                        data-side-pagination="server"
                                        data-url="TablasPageCtrl?accion=listar&tabla=<%= tabla%>" class="mt-2">
                                </table>
                                <div class="mt-3 btn-group btn-block" role="group" aria-label="toolbar">
                                    <button class="add btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Agregar un id"><i class="fas fa-plus-circle"></i> Agregar</button>
                                    <button class="inactive btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Eliminar marcados" disabled><i class="fas fa-trash"></i> Eliminar</button>
                                </div>

                            </div>
                        </div>
                        <!-- end -->
                    </div>
                </div>
            </div>
        </main>
        <script type="text/javascript">
            var $R = $('.inactive');
            var $U = $('#tableData');
            var selections = [];

            function getIdSelections() {
                return $.map($U.bootstrapTable('getSelections'), function (row) {
                    return row.id;
                })
            }

            function operateFormatter(value, row, index) {
                return ['<a class="edit" href="javascript:void(0)" title="Editar"><i class="fas fa-edit"></i> Editar</a>'].join('');
            }

            window.operateEvents = {
                'click .edit': function (e, value, row, index) {
                    goToURL('tabEditar?tabla=<%= tabla%>&id=' + [row.id]);
                }
            }

            function initTable() {
                $U.bootstrapTable('destroy').bootstrapTable({
                    columns: [
            <%
                if (tabla.equals("categorias") == true) {
            %>
                        [
                                {field: 'sel', checkbox: true},
                                {field: 'id', title: 'Id'},
                                {field: 'nombre', title: 'Nombre'},
                                {field: 'descripcion', title: 'Descripcion'},
                                {field: 'operate', title: '', align: 'center', clickToSelect: false, events: window.operateEvents, formatter: operateFormatter}
                        ]
            <%
                }

                if (tabla.equals("productos") == true) {
            %>
                        [
                                {field: 'sel', checkbox: true},
                                {field: 'id', title: 'Id'},
                                {field: 'nombre', title: 'Nombre'},
                                {field: 'descripcion', title: 'Descripcion'},
                                {field: 'precio', title: 'Precio'},
                                {field: 'destacado', title: 'Destacado'},
                                {field: 'categoriaId', title: 'Categoria'},
                                {field: 'categoriaNombre', title: 'Categoria Nombre'},
                                {field: 'operate', title: '', align: 'center', clickToSelect: false, events: window.operateEvents, formatter: operateFormatter}
                        ]
            <%
                }

                if (tabla.equals("usuarios") == true) {
            %>
                        [
                                {field: 'sel', checkbox: true},
                                {field: 'usuario', title: 'Usuario'},
                                {field: 'clave', title: 'Clave'},
                                {field: 'operate', title: '', align: 'center', clickToSelect: false, events: window.operateEvents, formatter: operateFormatter}
                        ]
            <%
                }

                if (tabla.equals("clientes") == true) {
            %>
                        [
                                {field: 'sel', checkbox: true},
                                {field: 'id', title: 'id'},
                                {field: 'nombre', title: 'Nombre'},
                                {field: 'direccion', title: 'Direccion'},
                                {field: 'telefono', title: 'Telefono'},
                                {field: 'ciudad', title: 'Ciudad'},
                                {field: 'operate', title: '', align: 'center', clickToSelect: false, events: window.operateEvents, formatter: operateFormatter}
                        ]
            <%
                }
            %>
                    ]
                }).on('search.bs.table', function (e, text) {
                    $(this).data('search-text', text);
                }).on('page-change.bs.table', function (e, number, size) {
                    $(this).data('page-number', number);
                }).on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
                    $R.prop('disabled', !$U.bootstrapTable('getSelections').length);
                    selections = getIdSelections();
                });

                $R.click(function () {
                    var u = getIdSelections();
                    if (u.length > 0) {
                        if (confirm("¿Desea eliminar los registros " + u.toString() + "?") == true) {
                            $.post("TablasPageCtrl?accion=borrar&tabla=<%= tabla%>", {records: u}).done(function (v) {
                                $U.bootstrapTable('remove', {field: 'id', values: v});
                                $U.bootstrapTable('refresh');
                                $R.prop('disabled', true);
                            });
                        }
                    }
                });

                $('.add').click(function () {
                    goToURL('TabEditar?tabla=<%= tabla%>&id=0')
                });
            }

            $(function () {
                initTable();
            })

        </script>            
        <%
        } else {
        %>
        <jsp:include page="/WEB-INF/includes/pageNavbarAdminInc.jsp"></jsp:include>
        <main role="main" class="inner cover m-3">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">No autorizado!</h4>
                <p>No se ha definido la tabla de consulta.</p>
                <hr>
                <p class="mb-0">Contacte al administrador.</p>
            </div> 
        </main>  
        <%
                }
            }
        %>
    </body>
</html>