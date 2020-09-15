<%-- 
    Document   : enderecos
    Created on : 08/09/2020, 19:28:47
    Author     : Thiago Lins
--%>

<%@page import="model.beans.Cidades"%>
<%@page import="model.dao.CidadeDao"%>
<%@page import="model.beans.Medidores"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.MedidorDao"%>
<%@page import="model.beans.Enderecos"%>
<%@page import="model.dao.EnderecoDao"%>
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
    <body >
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
                            <li class="nav-item">
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
                                <a href="clientes.jsp">
                                    <i class="fas fa-id-card-alt"></i>
                                    <p>Clientes</p>
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a href="enderecos.jsp">
                                    <i class="fas fa-map-marked-alt"></i>
                                    <p>Endereços</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="cidades.jsp">
                                    <i class="fas fa-globe-americas"></i>
                                    <p>Cidades</p>
                                </a>
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
                    <div class="panel-header bg-success-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Endereços</h2>
                                    <h5 class="text-white op-7 mb-2">Gerenciamento de endereços</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <h4 class="card-title">Lista de endereços</h4>
                                            <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                                <i class="fa fa-plus"></i>
                                                Cadastrar
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <!-- Modal -->
                                        <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header no-bd">
                                                        <h5 class="modal-title">
                                                            <span class="fw-mediumbold">
                                                                Endereços</span>
                                                        </h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p class="small">Cadastre um novo endereço</p>
                                                        <form action="EnderecoController?operacao=cadastrar" method="POST">                                                       
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtCep">CEP</label>
                                                                    <input type="text" class="form-control" id="txtCep" name="txtCep" maxlength="8" required placeholder="Informe o cep do endereço">
                                                                    <small id="cepHelp" class="form-text text-muted">*campo cep é obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtLogradouro">Logradouro</label>
                                                                    <input type="text" class="form-control" id="txtLogradouro" name="txtLogradouro" maxlength="80" required placeholder="Informe o logradouro do endereço">
                                                                    <small id="logradouroHelpHelp" class="form-text text-muted">*campo logradouro é obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtNumero">Número</label>
                                                                    <input type="text" class="form-control" id="txtNumero" name="txtNumero" maxlength="10" required placeholder="Informe o número da casa">
                                                                    <small id="numeroHelp" class="form-text text-muted">*campo número é obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtBairro">Bairro</label>
                                                                    <input type="text" class="form-control" id="txtBairro" name="txtBairro" maxlength="30" required placeholder="Informe o bairro do endereço">
                                                                    <small id="bairroHelp" class="form-text text-muted">*campo bairro é obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtComplemento">Complemento</label>
                                                                    <input type="text" class="form-control" id="txtComplemento" name="txtComplemento" maxlength="80" required placeholder="Informe o complemento do endereço">
                                                                    <small id="complementoHelpHelp" class="form-text text-muted">*campo complemento é obrigatório</small>
                                                                </div>
                                                            </div>                                                            
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="selectUF">Estado</label>
                                                                    <select class="form-control form-control" id="selectUF" name="selectUF" required>
                                                                        <option value="AC">Acre</option>
                                                                        <option value="AL">Alagoas</option>
                                                                        <option value="AP">Amapá</option>
                                                                        <option value="AM">Amazonas</option>
                                                                        <option value="BA">Bahia</option>
                                                                        <option value="CE">Ceará</option>
                                                                        <option value="DF">Distrito Federal</option>
                                                                        <option value="ES">Espírito Santo</option>
                                                                        <option value="GO">Goiás</option>
                                                                        <option value="MA">Maranhão</option>
                                                                        <option value="MT">Mato Grosso</option>
                                                                        <option value="MS">Mato Grosso do Sul</option>
                                                                        <option value="MG">Minas Gerais</option>
                                                                        <option value="PA">Pará</option>
                                                                        <option value="PB">Paraíba</option>
                                                                        <option value="PR">Paraná</option>
                                                                        <option value="PE">Pernambuco</option>
                                                                        <option value="PI">Piauí</option>
                                                                        <option value="RJ">Rio de Janeiro</option>
                                                                        <option value="RN">Rio Grande do Norte</option>
                                                                        <option value="RS">Rio Grande do Sul</option>
                                                                        <option value="RO">Rondônia</option>
                                                                        <option value="RR">Roraima</option>
                                                                        <option value="SC">Santa Catarina</option>
                                                                        <option value="SP">São Paulo</option>
                                                                        <option value="SE">Sergipe</option>
                                                                        <option value="TO">Tocantins</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="selectCidade">Cidade</label>
                                                                    <select class="form-control form-control" id="selectCidade" name="selectCidade" required>
                                                                        <%
                                                                            CidadeDao cidadeDao = new CidadeDao();
                                                                            for (Cidades cidade : cidadeDao.listar()) {
                                                                        %>
                                                                        <option value="<%=cidade.getId()%>"><%=cidade.getNome()%></option>
                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="selectMedidor">Número do medidor</label>
                                                                    <select class="form-control form-control" id="selectMedidor" name="selectMedidor" required>
                                                                        <%
                                                                            MedidorDao medidorDao = new MedidorDao();
                                                                            for (Medidores medidor : medidorDao.listar()) {
                                                                        %>
                                                                        <option value="<%=medidor.getId()%>"><%=medidor.getNumero()%></option>
                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer no-bd">
                                                                <button type="submit" id="addRowButton" class="btn btn-primary">Enviar</button>
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- fim modal add -->
                                        <div class="table-responsive">
                                            <table id="add-row" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>                                                      
                                                        <th>Id</th>
                                                        <th>CEP</th>
                                                        <th>Logradouro</th>
                                                        <th>Número</th>
                                                        <th>Complemento</th> 
                                                        <th>Bairro</th>                                                       
                                                        <th>UF</th>
                                                        <th class="text-center" style="width: 10%">Ações</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>  
                                                        <th>Id</th>
                                                        <th>CEP</th>
                                                        <th>Logradouro</th>
                                                        <th>Número</th>
                                                        <th>Complemento</th>                                                        
                                                        <th>Bairro</th>
                                                        <th>UF</th>
                                                        <th class="text-center" style="width: 10% ">Ações</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%ArrayList< Enderecos> listaEnderecos = (ArrayList<Enderecos>) session.getAttribute("enderecoes");
                                                        if (listaEnderecos != null) {
                                                            //faz mais nada
                                                        } else {
                                                            EnderecoDao enderecoDao = new EnderecoDao();
                                                            listaEnderecos = (ArrayList<Enderecos>) enderecoDao.listar();
                                                        }

                                                        for (Enderecos endereco : listaEnderecos) {
                                                    %>
                                                    <tr> 
                                                        <td><%=endereco.getId()%></td>
                                                        <td><%=endereco.getCep()%></td>
                                                        <td><%=endereco.getLogradouro()%></td>
                                                        <td><%=endereco.getNumero()%></td>
                                                        <td><%=endereco.getComplemento()%></td>
                                                        <td><%=endereco.getBairro()%></td>
                                                        <td><%=endereco.getUf()%></td>

                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="alterarEndereco.jsp?id=<%=endereco.getId()%>" 
                                                                   data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Editar">
                                                                    <i class="fa fa-edit"></i>
                                                                </a>

                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <a href="EnderecoController?operacao=excluir&id=<%=endereco.getId()%>" 
                                                                   data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Excluir">
                                                                    <i class="fa fa-times"></i>
                                                                </a>  
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
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
                                        Thiago Lins
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
                content.title = 'Endereco';
                if (style == "withicon") {
                    content.icon = 'fa fa-check';
                } else {
                    content.icon = 'none';
                }
                content.url = 'enderecoes.jsp';
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