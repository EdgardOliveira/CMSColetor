<%-- 
    Document   : alterarUser
    Created on : 05/09/2020, 12:27:44
    Author     : Thiago Lins
--%>

<%@page import="model.beans.Grupos"%>
<%@page import="model.dao.GrupoDao"%>
<%@page import="model.beans.Users"%>
<%@page import="model.dao.UserDao"%>
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
        <h1>Usuário</h1>
        <h3>Alteração de usuário</h3>
        <div class="col-md-3">
            <%
                UserDao userDao = new UserDao();
                long id = Long.parseLong(request.getParameter("id"));
                Users user = userDao.consultarId(id);
            %>
            <form action="UserController?operacao=atualizar&id=<%=user.getId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" hidden readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=user.getId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do usuário">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtName">Nome</label>
                    <input type="text" class="form-control" id="txtName" name="txtName"  maxlength="255" value="<%=user.getName()%>" required placeholder="Informe o nome do usuário">
                    <small id="nomeHelp" class="form-text text-muted">*campo nome é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtEmail">E-mail</label>
                    <input type="text" class="form-control" id="txtEmail" name="txtEmail"  maxlength="255" value="<%=user.getEmail()%>" required placeholder="Informe o e-mail do usuário">
                    <small id="emailHelp" class="form-text text-muted">*campo e-mail é obrigatório</small>
                </div>                    
                <div class="form-group">
                    <label for="txtPassword">Senha</label>
                    <input type="password" class="form-control" id="txtPassword" name="txtPassword"  maxlength="255" value="<%=user.getPassword()%>" required placeholder="Informe a senha do usuário">
                    <small id="emailHelp" class="form-text text-muted">*campo senha é obrigatório</small>
                </div> 
                <div class="form-group">
                    <label for="selectGrupo">Grupo</label>
                    <select class="form-control form-control" id="selectGrupo" name="selectGrupo" required>
                        <%
                            GrupoDao grupoDao = new GrupoDao();
                            for (Grupos grupo : grupoDao.listar()) {
                        %>
                                <option value="<%=grupo.getId()%>" <%=user.getGrupos().getId() == grupo.getId() ? "selected" : ""%>><%=grupo.getDescricao()%></option>
                        <%}%>
                    </select>
                </div>                
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Salvar</button>
                </div>
            </form>
        </div>
    </body>
</html>
