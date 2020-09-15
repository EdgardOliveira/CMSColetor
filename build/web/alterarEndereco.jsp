<%-- 
    Document   : alterarEndereco
    Created on : 05/09/2020, 20:21:25
    Author     : Thiago Lins
--%>

<%@page import="model.beans.Cidades"%>
<%@page import="model.dao.CidadeDao"%>
<%@page import="model.beans.Medidores"%>
<%@page import="model.dao.MedidorDao"%>
<%@page import="model.beans.Enderecos"%>
<%@page import="model.dao.EnderecoDao"%>
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
        <h1>Endereço</h1>
        <h3>Alteração de endereço</h3>
        <div class="col-md-3">
            <%
                EnderecoDao enderecoDao = new EnderecoDao();
                long id = Long.parseLong(request.getParameter("id"));
                Enderecos endereco = enderecoDao.consultarId(id);
            %>
            <form action="EnderecoController?operacao=atualizar&id=<%=endereco.getId()%>" method="POST">                    
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=endereco.getId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do endereço">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtCep">CEP</label>
                    <input type="text" class="form-control" id="txtCep" name="txtCep" maxlength="8" value="<%=endereco.getCep()%> "required placeholder="Informe o cep">
                    <small id="cepHelp" class="form-text text-muted">*campo cep é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtLogradouro">Logradouro</label>
                    <input type="text" class="form-control" id="txtLogradouro" name="txtLogradouro" maxlength="80" value="<%=endereco.getLogradouro()%> "required placeholder="Informe o logradouro">
                    <small id="logradouroHelp" class="form-text text-muted">*campo logradouro é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtNumero">Número</label>
                    <input type="text" class="form-control" id="txtNumero" name="txtNumero" maxlength="10" value="<%=endereco.getNumero()%> "required placeholder="Informe o número">
                    <small id="numeroHelp" class="form-text text-muted">*campo número é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtComplemento">Complemento</label>
                    <input type="text" class="form-control" id="txtComplemento" name="txtComplemento" maxlength="80" value="<%=endereco.getComplemento()%> "required placeholder="Informe o complemento">
                    <small id="complementoHelp" class="form-text text-muted">*campo complemento é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtBairro">Bairro</label>
                    <input type="text" class="form-control" id="txtBairro" name="txtBairro" maxlength="30" value="<%=endereco.getBairro()%> "required placeholder="Informe o bairro">
                    <small id="bairroHelp" class="form-text text-muted">*campo bairro é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="selectUF">Estado</label>
                    <select class="form-control form-control" id="selectUF" name="selectUF" required>
                        <option value="AC" <%=endereco.getUf().equals("AC") ? "selected" : ""%>>AC</option>
                        <option value="AL" <%=endereco.getUf().equals("AL") ? "selected" : ""%>>AL</option>
                        <option value="AP" <%=endereco.getUf().equals("AP") ? "selected" : ""%>>AP</option>
                        <option value="AM" <%=endereco.getUf().equals("AM") ? "selected" : ""%>>AM</option>
                        <option value="BA" <%=endereco.getUf().equals("BA") ? "selected" : ""%>>BA</option>
                        <option value="CE" <%=endereco.getUf().equals("CE") ? "selected" : ""%>>CE</option>
                        <option value="DF" <%=endereco.getUf().equals("DF") ? "selected" : ""%>>DF</option>
                        <option value="ES" <%=endereco.getUf().equals("ES") ? "selected" : ""%>>ES</option>
                        <option value="GO" <%=endereco.getUf().equals("GO") ? "selected" : ""%>>GO</option>
                        <option value="MA" <%=endereco.getUf().equals("MA") ? "selected" : ""%>>MA</option>
                        <option value="MT" <%=endereco.getUf().equals("MT") ? "selected" : ""%>>MT</option>
                        <option value="MS" <%=endereco.getUf().equals("MS") ? "selected" : ""%>>MS</option>
                        <option value="MG" <%=endereco.getUf().equals("MG") ? "selected" : ""%>>MG</option>
                        <option value="PA" <%=endereco.getUf().equals("PA") ? "selected" : ""%>>PA</option>
                        <option value="PB" <%=endereco.getUf().equals("PB") ? "selected" : ""%>>PB</option>
                        <option value="PR" <%=endereco.getUf().equals("PR") ? "selected" : ""%>>PR</option>
                        <option value="PE" <%=endereco.getUf().equals("PE") ? "selected" : ""%>>PE</option>
                        <option value="PI" <%=endereco.getUf().equals("PI") ? "selected" : ""%>>PI</option>
                        <option value="RJ" <%=endereco.getUf().equals("RJ") ? "selected" : ""%>>RJ</option>
                        <option value="RN" <%=endereco.getUf().equals("RN") ? "selected" : ""%>>RN</option>
                        <option value="RS" <%=endereco.getUf().equals("RS") ? "selected" : ""%>>RS</option>
                        <option value="RO" <%=endereco.getUf().equals("RO") ? "selected" : ""%>>RO</option>
                        <option value="RR" <%=endereco.getUf().equals("RR") ? "selected" : ""%>>RR</option>
                        <option value="SC" <%=endereco.getUf().equals("SC") ? "selected" : ""%>>SC</option>
                        <option value="SP" <%=endereco.getUf().equals("SP") ? "selected" : ""%>>SP</option>
                        <option value="SE" <%=endereco.getUf().equals("SE") ? "selected" : ""%>>SE</option>
                        <option value="TO" <%=endereco.getUf().equals("TO") ? "selected" : ""%>>TO</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectCidade">Cidade</label>
                    <select class="form-control form-control" id="selectCidade" name="selectCidade" required>
                        <%
                            CidadeDao cidadeDao = new CidadeDao();
                            for (Cidades cidade : cidadeDao.listar()) {
                        %>
                                <option value="<%=cidade.getId()%>" <%=endereco.getCidades().getId() == cidade.getId() ? "selected" : ""%>><%=cidade.getNome()%></option>
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
                                <option value="<%=medidor.getId()%>" <%=endereco.getMedidores().getId() == medidor.getId() ? "selected" : ""%>><%=medidor.getNumero()%></option>
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
