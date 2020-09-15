<%-- 
    Document   : alterarCidade
    Created on : 05/09/2020, 12:27:44
    Author     : Thiago Lins
--%>

<%@page import="model.beans.Cidades"%>
<%@page import="model.dao.CidadeDao"%>
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
        <h1>Cidade</h1>
        <h3>Alteração de cidade</h3>
        <div class="col-md-3">
            <%
                CidadeDao cidadeDao = new CidadeDao();
                long id = Long.parseLong(request.getParameter("id"));
                Cidades cidade = cidadeDao.consultarId(id);
            %>
            <form action="CidadeController?operacao=atualizar&id=<%=cidade.getId()%>" method="POST">
                 <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=cidade.getId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id da cidade">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtNome">Nome</label>
                    <input type="text" class="form-control" id="txtNome" name="txtNome"  maxlength="40" value="<%=cidade.getNome()%>" required placeholder="Informe o nome da cidade">
                    <small id="nomeHelp" class="form-text text-muted">*campo nome é obrigatório</small>
                </div>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Salvar</button>
                </div>
            </form>
        </div>
    </body>
</html>
