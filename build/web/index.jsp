<%-- 
    Document   : index.jsp
    Created on : 09/09/2020, 17:41:58
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Medidores"%>
<%@page import="model.dao.MedidorDao"%>
<%@page import="model.beans.Clientes"%>
<%@page import="model.dao.ClienteDao"%>
<%@page import="model.beans.Leituras"%>
<%@page import="model.dao.LeituraDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>CMS</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/logo.ico" type="image/x-ico"/>

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {"families": ["Lato:300,400,700,900"]},
                custom: {"families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <div class="main-header">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="index.jsp" class="logo">
                        <img src="assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
                    </a>
                    <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon">
                            <i class="icon-menu"></i>
                        </span>
                    </button>
                    <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="icon-menu"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->

                <!-- Navbar Header -->
                <nav class="navbar navbar-header navbar-expand-lg" data-background-color="dark">

                </nav>
                <!-- End Navbar -->
            </div>

            <!-- Sidebar -->
            <div class="sidebar sidebar-style-2" data-background-color="dark" >
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-primary">
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Opções</h4>
                            </li>
                            <li class="nav-item active">
                                <a href="index.jsp">
                                    <i class="fas fa-home"></i>
                                    <p>Início</p>
                                </a>
                            <li class="nav-item">
                                <a href="users.jsp">
                                    <i class="fas fa-users"></i>
                                    <p>Usuários</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="leituras.jsp">
                                    <i class="fas fa-id-card-alt"></i>
                                    <p>Clientes</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="enderecos.jsp">
                                    <i class="fas fa-map-marked-alt"></i>
                                    <p>Endereços</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="leituras.jsp">
                                    <i class="fas fa-globe-americas"></i>
                                    <p>Cidades</p>
                                </a>
                            </li>
                            </li>

                            <li class="nav-item">
                                <a href="medidores.jsp">
                                    <i class="fas fa-tachometer-alt"></i>
                                    <p>Medidores</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="leituras.jsp">
                                    <i class="fas fa-barcode"></i>
                                    <p>Leituras</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Sidebar -->


            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-secondary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Inicial</h2>
                                    <h5 class="text-white op-7 mb-2">Página inicial</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Customized Card -->
                        <div class="col-md-4">
                            <div class="card card-post card-round">
                                <img class="card-img-top" src="assets/img/conta.jpg" alt="conta">
                                <div class="card-body">
                                    <h3 class="card-title">
                                        <a href="#">
                                            Consulte sua fatura
                                        </a>
                                    </h3>
                                    <p class="card-text">Você que é nosso cliente cadastrado, pode consultar as suas faturas.
                                        Basta entrar com seu cpf se for pessoa física ou cnpj se for pessoa jurídica.</p>
                                    <a href="identificarCliente.jsp" class="btn btn-primary btn-rounded btn-sm">Saiba mais</a>
                                </div>
                            </div>
                        </div>
                        <!-- Customized Card -->
                        <!-- Customized Card -->
                        <div class="col-md-4">
                            <div class="card card-post card-round">
                                <img class="card-img-top" src="assets/img/dicas.jpg" alt="dicas">
                                <div class="card-body">
                                    <h3 class="card-title">
                                        <a href="#">
                                            Dicas para economizar
                                        </a>
                                    </h3>
                                    <p class="card-text">Você que é nosso cliente cadastrado, pode consultar as suas faturas.
                                        Basta entrar com seu cpf se for pessoa física ou cnpj se for pessoa jurídica.</p>
                                    <a href="identificarCliente.jsp" class="btn btn-primary btn-rounded btn-sm">Saiba mais</a>
                                </div>
                            </div>
                        </div>
                        <!-- Customized Card -->                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        Edgard Oliveira
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </footer>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery.3.2.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery UI -->
        <script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Bootstrap Notify -->
        <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

        <!-- jQuery Vector Maps -->
        <script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
        <script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Atlantis JS -->
        <script src="assets/js/atlantis.min.js"></script>

        <script >
        $(document).ready(function () {
            $('#basic-datatables').DataTable({
            });

            $('#multi-filter-select').DataTable({
                "pageLength": 10,
                initComplete: function () {
                    this.api().columns().every(function () {
                        var column = this;
                        var select = $('<select class="form-control"><option value=""></option></select>')
                                .appendTo($(column.footer()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                            $(this).val()
                                            );

                                    column
                                            .search(val ? '^' + val + '$' : '', true, false)
                                            .draw();
                                });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
                }
            });

            // Add Row
            $('#add-row').DataTable({
                "pageLength": 10,
            });

            var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Editar"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Excluir"> <i class="fa fa-times"></i> </button> </div> </td>';

            $('#addRowButton').click(function () {
                $('#addRowModal').modal('hide');
                $('displayNotify').click();
            });
        });

        $('#displayNotif').on('click', function () {

            var placementFrom = 'top';
            var placementAlign = 'right';
            var state = 'sucess';
            var style = 'withicon';
            var content = {};

            content.message = 'Cadastrado com sucesso';
            content.title = 'Index';
            if (style == "withicon") {
                content.icon = 'fa fa-check';
            } else {
                content.icon = 'none';
            }
            content.url = 'leituras.jsp';
            content.target = '_blank';

            $.notify(content, {
                type: state,
                placement: {
                    from: placementFrom,
                    align: placementAlign
                },
                time: 1000,
                delay: 0,
            });
        });
        </script>
    </body>
</html>
