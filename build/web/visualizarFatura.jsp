<%-- 
    Document   : fatura
    Created on : 10/09/2020, 09:52:04
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Enderecos"%>
<%@page import="model.dao.EnderecoDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
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

            <!-- Main panel -->
            <div class="main-panel">
                <br><br>
                <div class="container">
                    <div id="printableArea">
                    <div class="page-inner">
                        <div class="row justify-content-center">
                            <div class="col-12 col-lg-10 col-xl-9">
                                <%
                                    DateFormat formatarMesAno = new SimpleDateFormat("MMMM/yyyy");
                                    DateFormat formatarDiaMesAnoExtenso = new SimpleDateFormat("dd MMMM yyyy");
                                    DateFormat formatarDiaMesAno = new SimpleDateFormat("dd/MM/yyyy");
                                    LeituraDao leituraDao = new LeituraDao();
                                    long id = Long.parseLong(request.getParameter("id"));
                                    Leituras leitura = leituraDao.consultarId(id);
                                    ClienteDao clienteDao = new ClienteDao();
                                    Clientes cliente = clienteDao.consultarId(leitura.getClientes().getId());
                                    MedidorDao medidorDao = new MedidorDao();
                                    Medidores medidor = medidorDao.consultarId(leitura.getMedidores().getId());
                                    EnderecoDao enderecoDao = new EnderecoDao();
                                    Enderecos endereco = enderecoDao.consultarPorMedidorId(medidor.getId());
                                %>
                                <div class="row align-items-center">
                                    <div class="col">

                                        <h4 class="page-title">Fatura de <%=formatarMesAno.format(leitura.getMesAno())%></h4>
                                    </div>
                                    <div class="col-auto">
                                        <input type="button" class="btn btn-light btn-border" onclick="printDiv('printableArea')" value="Imprimir" />
                                    </div>
                                </div>
                                <div class="page-divider"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card card-invoice">
                                            <div class="card-header">
                                                <div class="invoice-header">
                                                    <h3 class="invoice-title">
                                                        Empresa de Energia Elétrica</br>
                                                        Endereço completo</br>
                                                        Bairro
                                                    </h3>
                                                    <div class="invoice-logo">
                                                        <img src="assets/img/logo.png" alt="logo">
                                                    </div>
                                                </div>
                                                <div class="invoice-desc">
                                                    Manaus, Amazonas, Brasil<br/>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-3 info-invoice">
                                                        <h5 class="sub"><strong>Conta Mês</strong></h5>
                                                        <p>
                                                            <%=formatarMesAno.format(leitura.getMesAno())%>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 info-invoice">
                                                        <h5 class="sub"><strong>Data de Vencimento</strong></h5>
                                                        <p><%=formatarDiaMesAno.format(leitura.getMesAno())%></p>
                                                    </div>
                                                    <div class="col-md-3 info-invoice">
                                                        <h5 class="sub"><strong>Consumo (kWh)</strong></h5>
                                                        <p><%=leitura.getConsumo().toString()%></p>
                                                    </div>
                                                    <div class="col-md-3 info-invoice">
                                                        <h5 class="sub"><strong>Total a pagar (R$)</strong></h5>
                                                        <p><%=leitura.getTotal().toString()%></p>
                                                    </div>
                                                </div>
                                                <div class="separator-solid"></div>
                                                <div class="row">
                                                    <div class="col-md-6 info-invoice">
                                                        <h5 class="sub"><strong>Cliente</strong></h5>
                                                        <p>
                                                            <%=cliente.getNomeEmpresa()%><br/>
                                                            <%=endereco.getLogradouro() + ", " + endereco.getNumero()%><br/>
                                                            <%=endereco.getComplemento() + ", "%><br/>
                                                            <%=endereco.getBairro() + ", " + endereco.getCep()%><br/>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="separator-solid">
                                                    <h3 class="invoice-title" align="center">
                                                        Datas de Leitura
                                                    </h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Atual</strong></h5>
                                                        <p>
                                                            <%=formatarDiaMesAno.format(leitura.getDataAtual())%>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Anterior</strong></h5>
                                                        <p><%=formatarDiaMesAno.format(leitura.getDataAnterior())%></p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Próxima</strong></h5>
                                                        <p><%=formatarDiaMesAno.format(leitura.getDataProxima())%></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Emissão</strong></h5>
                                                        <p>
                                                            <%=formatarDiaMesAno.format(leitura.getDataEmissao())%>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Apresentação</strong></h5>
                                                        <p><%=formatarDiaMesAno.format(leitura.getDataApresentacao())%></p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Dias de Consumo</strong></h5>
                                                        <p><%=leitura.getDiasConsumo().toString()%></p>
                                                    </div>
                                                </div>
                                                <div class="separator-solid">
                                                    <h3 class="invoice-title" align="center">
                                                        Dados da Unidade Consumidora
                                                    </h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Grupo/Subgrupo</strong></h5>
                                                        <p>
                                                            <%=medidor.getGrupo()%>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Classe/Subclasse</strong></h5>
                                                        <p><%=medidor.getClasse()%></p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Ligação</strong></h5>
                                                        <p><%=medidor.getLigacao()%></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Número do Medidor</strong></h5>
                                                        <p>
                                                            <%=medidor.getNumero()%>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Faturamento</strong></h5>
                                                        <p><%=medidor.getFaturamento()%></p>
                                                    </div>
                                                    <div class="col-md-4 info-invoice">
                                                        <h5 class="sub"><strong>Modalidade</strong></h5>
                                                        <p><%=medidor.getModalidade()%></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="separator-solid">
                                                <h3 class="invoice-title" align="center">
                                                    Dados da Leitura (kWh)
                                                </h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 info-invoice">
                                                    <h5 class="sub"><strong>Produto</strong></h5>
                                                    <p>
                                                        <%="Energia " + medidor.getStatus()%>
                                                    </p>
                                                </div>
                                                <div class="col-md-4 info-invoice">
                                                    <h5 class="sub"><strong>Leitura Atual</strong></h5>
                                                    <p><%=leitura.getAtual().toString()%></p>
                                                </div>
                                                <div class="col-md-4 info-invoice">
                                                    <h5 class="sub"><strong>Leitura Anterior</strong></h5>
                                                    <p><%=String.valueOf(leitura.getAnterior())%></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 info-invoice">
                                                    <h5 class="sub"><strong>Constante</strong></h5>
                                                    <p>
                                                        <%=String.valueOf(leitura.getConstante())%>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 info-invoice">
                                                    <h5 class="sub"><strong>Resíduo</strong></h5>
                                                    <p><%=leitura.getResiduo().toString()%></p>
                                                </div>
                                                <div class="col-md-3 info-invoice">
                                                    <h5 class="sub"><strong>Medido</strong></h5>
                                                    <p><%=leitura.getMedido().toString()%></p>
                                                </div>
                                                <div class="col-md-3 info-invoice">
                                                    <h5 class="sub"><strong>Faturado</strong></h5>
                                                    <p><%=leitura.getFaturado().toString()%></p>
                                                </div>
                                            </div>
                                            <div class="separator-solid">
                                                <h3 class="invoice-title" align="center">
                                                    Descrição da Conta
                                                </h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 info-invoice">
                                                    <h5 class="sub"><strong>Consumo</strong></h5>
                                                    <p> <%=leitura.getConsumo().toString()%></p>
                                                </div>
                                                <div class="col-md-4 info-invoice">
                                                    <h5 class="sub"><strong>Tarifa com Tributos</strong></h5>
                                                    <p><%=String.valueOf(leitura.getTarifaComTributos())%></p>
                                                </div>
                                                <div class="col-md-4 info-invoice">
                                                    <h5 class="sub"><strong> Subtotal</strong></h5>
                                                    <p><%=leitura.getConsumo() * leitura.getTarifaComTributos()%></p>                                                     
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 info-invoice">
                                                    <h5 class="sub"><strong>Contribuição iluminação pública (COSIP)</strong></h5>
                                                    <p> 25.05</p>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <div class="row">
                                                    <img src="assets/img/barcode.jpg" alt="barcode" align="center">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
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
            
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
            }            
            
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
