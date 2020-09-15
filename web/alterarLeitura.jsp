<%-- 
    Document   : alterarLeitura
    Created on : 06/09/2020, 00:07:35
    Author     : Marinho Alencar
--%>

<%@page import="model.beans.Medidores"%>
<%@page import="model.dao.MedidorDao"%>
<%@page import="model.beans.Clientes"%>
<%@page import="model.dao.ClienteDao"%>
<%@page import="model.beans.Leituras"%>
<%@page import="model.dao.LeituraDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Leitura</h1>
        <h3>Alteração de Leitura</h3>
        <div class="col-md-3">
            <%
                LeituraDao leituraDao = new LeituraDao();
                long id = Long.parseLong(request.getParameter("id"));
                Leituras leitura = leituraDao.consultarId(id);
            %>
            <form action="LeituraController?operacao=atualizar&id=<%=leitura.getId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=leitura.getId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do cliente">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtMesAno">Mes/Ano</label>
                    <input type="date" class="form-control" id="txtMesAno" name="txtMesAno"  maxlength="60" value="<%=leitura.getMesAno()%>" required placeholder="Informe o mes/ano da leitura">
                    <small id="nomeHelp" class="form-text text-muted">*campo mes/ano é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="selectCliente">Cliente</label>
                    <select class="form-control form-control" id="selectCliente" name="selectCliente" required>
                        <%
                            ClienteDao clienteDao = new ClienteDao();
                            for (Clientes cliente : clienteDao.listar()) {
                        %>
                        <option value="<%=cliente.getId()%>" <%=cliente.getId()==leitura.getClientes().getId() ? "selected" : "" %>><%=cliente.getNomeEmpresa()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectMedidor">Número do medidor</label>
                    <select class="form-control form-control" id="selectMedidor" name="selectMedidor" required>
                        <%
                            MedidorDao medidorDao = new MedidorDao();
                            for (Medidores medidor : medidorDao.listar()) {
                        %>
                        <option value="<%=medidor.getId()%>" <%=medidor.getId()==leitura.getMedidores().getId() ? "selected" : "" %>><%=medidor.getNumero()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtAnterior">Anterior</label>
                    <input type="text" class="form-control" id="txtAnterior" name="txtAnterior" maxlength="20" value="<%=leitura.getAnterior()%>" required placeholder="Informe o valor anterior">
                    <small id="cpfHelp" class="form-text text-muted">*campo Anterior é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtAtual">Atual</label>
                    <input type="text" class="form-control" id="txtAtual" name="txtAtual" maxlength="20" value="<%=leitura.getAtual()%>" required placeholder="Informe o valor atual">
                    <small id="cpfHelp" class="form-text text-muted">*campo Atual é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtConstante">Constante</label>
                    <input type="text" class="form-control" id="txtConstante" name="txtConstante" maxlength="20" value="<%=leitura.getConstante()%>" required placeholder="Informe a constante">
                    <small id="cpfHelp" class="form-text text-muted">*campo Constante é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtResiduo">Residuo</label>
                    <input type="text" class="form-control" id="txtResiduo" name="txtResiduo" maxlength="20" value="<%=leitura.getResiduo()%>" required placeholder="Informe o residuo">
                    <small id="cpfHelp" class="form-text text-muted">*campo Residuo é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtMedido">Medido</label>
                    <input type="text" class="form-control" id="txtMedido" name="txtMedido" maxlength="20" value="<%=leitura.getMedido()%>" required placeholder="Informe o valor medido">
                    <small id="cpfHelp" class="form-text text-muted">*campo Medido é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtFaturado">Faturado</label>
                    <input type="text" class="form-control" id="txtFaturado" name="txtFaturado" maxlength="20" value="<%=leitura.getFaturado()%>" required placeholder="Informe o valor faturado">
                    <small id="cpfHelp" class="form-text text-muted">*campo Faturado é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtDataAnterior">Data Anterior</label>
                    <input type="date" class="form-control" id="txtDataAnterior" name="txtDataAnterior" maxlength="20" value="<%=leitura.getDataAnterior()%>" required placeholder="Informe a data anterior">
                    <small id="cpfHelp" class="form-text text-muted">*campo Data Anterior é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtDataAtual">Data Atual</label>
                    <input type="date" class="form-control" id="txtDataAtual" name="txtDataAtual" maxlength="20" value="<%=leitura.getDataAtual()%>" required placeholder="Informe a data atual">
                    <small id="cpfHelp" class="form-text text-muted">*campo Data Atual é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtDataEmissao">Data Emissao</label>
                    <input type="date" class="form-control" id="txtDataEmissao" name="txtDataEmissao" maxlength="20" value="<%=leitura.getDataEmissao()%>" required placeholder="Informe a data da emissao">
                    <small id="cpfHelp" class="form-text text-muted">*campo Data Emissao é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtDataApresentacao">Data Apresentacao</label>
                    <input type="date" class="form-control" id="txtDataApresentacao" name="txtDataApresentacao" maxlength="20" value="<%=leitura.getDataApresentacao()%>" required placeholder="Informe a data da emissao">
                    <small id="cpfHelp" class="form-text text-muted">*campo Data Emissao é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtDataProxima">Proxima Data</label>
                    <input type="date" class="form-control" id="txtDataProxima" name="txtDataProxima" maxlength="20" value="<%=leitura.getDataProxima()%>" required placeholder="Informe a proxima data">
                    <small id="cpfHelp" class="form-text text-muted">*campo Proxima Data é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtDiasConsumo">Dias Consumo</label>
                    <input type="txt" class="form-control" id="txtDiasConsumo" name="txtDiasConsumo" maxlength="11" value="<%=leitura.getDiasConsumo()%>" required placeholder="Informe os dias de consumo">
                    <small id="cpfHelp" class="form-text text-muted">*campo Dias Consumo é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtTotal">Total</label>
                    <input type="txt" class="form-control" id="txtTotal" name="txtTotal" maxlength="20" value="<%=leitura.getTotal()%>" required placeholder="Informe Total">
                    <small id="cpfHelp" class="form-text text-muted">*campo Total é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtConsumo">Consumo</label>
                    <input type="txt" class="form-control" id="txtConsumo" name="txtConsumo" maxlength="20" value="<%=leitura.getConsumo()%>" required placeholder="Informe Consumo">
                    <small id="cpfHelp" class="form-text text-muted">*campo Consumo é obrigatório</small>
                </div>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Alterar</button>
                </div>
            </form>
        </div>
    </body>
</html>
