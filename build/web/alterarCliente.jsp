<%-- 
    Document   : AlterarCliente
    Created on : 01/09/2020, 19:15:37
    Author     : Edgard Oliveira
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.beans.Medidores"%>
<%@page import="model.beans.Medidores"%>
<%@page import="model.dao.MedidorDao"%>
<%@page import="model.beans.Clientes"%>
<%@page import="model.dao.ClienteDao"%>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html">
        <title>CMS</title>

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Cliente</h1>
        <h3>Alteração de cadastro</h3>
        <div class="col-md-3">
            <%
                ClienteDao clienteDao = new ClienteDao();
                long id = Long.parseLong(request.getParameter("id"));
                Clientes cliente = clienteDao.consultarId(id);
            %>
            <form action="ClienteController?operacao=atualizar&id=<%=cliente.getId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=cliente.getId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do cliente">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtNome">Nome/Empresa</label>
                    <input type="text" class="form-control" id="txtNomeEmpresa" name="txtNomeEmpresa"  maxlength="60" value="<%=cliente.getNomeEmpresa()%>" required placeholder="Informe o nome/empresa do cliente">
                    <small id="nomeHelp" class="form-text text-muted">*campo nome é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtCpf">CPF/CNPJ</label>
                    <input type="text" class="form-control" id="txtCpfCnpj" name="txtCpfCnpj" maxlength="11" value="<%=cliente.getCpfCnpj()%>" required placeholder="Informe o cpf/cnpj do cliente">
                    <small id="cpfHelp" class="form-text text-muted">*campo cpf/cnpj é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="selectDiaVencimento">Selecione uma data para vencimento</label>
                    <select class="form-control form-control" id="selectDiaVencimento" name="selectDiaVencimento">
                        <option <%=cliente.getDiaVencimento() == 1 ? "selected" : ""%>>01</option>
                        <option <%=cliente.getDiaVencimento() == 5 ? "selected" : ""%>>05</option>
                        <option <%=cliente.getDiaVencimento() == 10 ? "selected" : ""%>>10</option>
                        <option <%=cliente.getDiaVencimento() == 15 ? "selected" : ""%>>15</option>
                        <option <%=cliente.getDiaVencimento() == 20 ? "selected" : ""%>>20</option>
                        <option <%=cliente.getDiaVencimento() == 25 ? "selected" : ""%>>25</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectMedidor">Medidor</label>
                    <select class="form-control form-control" id="selectMedidor" name="selectMedidor" required>
                        <%
                            MedidorDao medidorDao = new MedidorDao();
                            for (Medidores medidor : medidorDao.listar()) {
                        %>
                                <option value="<%=medidor.getId()%>" <%=cliente.getMedidores().getId() == medidor.getId() ? "selected" : ""%>><%=medidor.getNumero()%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Alterar</button>
                </div>
            </form>
        </div>
    </body>
</html>
