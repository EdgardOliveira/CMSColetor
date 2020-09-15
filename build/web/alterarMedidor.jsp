<%-- 
    Document   : alterarMedidor
    Created on : 06/09/2020, 20:48:41
    Author     : João Guilherme
--%>

<%@page import="model.beans.Medidores"%>
<%@page import="model.dao.MedidorDao"%>
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
        <h1>Medidor</h1>
        <h3>Alteração de medidor</h3>
        <div class="col-md-3">
            <%
                MedidorDao medidorDao = new MedidorDao();
                long id = Long.parseLong(request.getParameter("id"));
                Medidores medidor = medidorDao.consultarId(id);
            %>
            <form action="MedidorController?operacao=atualizar&id=<%=medidor.getId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=medidor.getId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do medidor">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtNumero">Número</label>
                    <input type="text" class="form-control" id="txtNumero" name="txtNumero"  maxlength="15" value="<%=medidor.getNumero()%>" required placeholder="Informe o número do medidor">
                    <small id="numeroHelp" class="form-text text-muted">*campo número é obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="selectGrupo">Grupo</label>
                    <select class="form-control form-control" id="selectGrupo" name="selectGrupo" required>
                        <option value="A" <%=medidor.getGrupo().equals("A") ? "selected" : ""%>>A</option>
                        <option value="B" <%=medidor.getGrupo().equals("B") ? "selected" : ""%>>B</option>
                        <option value="C" <%=medidor.getGrupo().equals("C") ? "selected" : ""%>>C</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectClasse">Classe</label>
                    <select class="form-control form-control" id="selectClasse" name="selectClasse" required>
                        <option value="RESIDENCIAL" <%=medidor.getClasse().equals("RESIDENCIAL") ? "selected" : ""%>>RESIDENCIAL</option>
                        <option value="INDUSTRIAL" <%=medidor.getClasse().equals("INDUSTRIAL") ? "selected" : ""%>>INDUSTRIAL</option>
                        <option value="COMERCIAL" <%=medidor.getClasse().equals("COMERCIAL") ? "selected" : ""%>>COMERCIAL</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectLigacao">Ligação</label>
                    <select class="form-control form-control" id="selectLigacao" name="selectLigacao" required>
                        <option value="MONOFÁSICA" <%=medidor.getLigacao().equals("MONOFÁSICA") ? "selected" : ""%>>MONOFÁSICA</option>
                        <option value="BIFÁSICA" <%=medidor.getLigacao().equals("BIFÁSICA") ? "selected" : ""%>>BIFÁSICA</option>
                        <option value="TRIFÁSICA" <%=medidor.getLigacao().equals("TRIFÁSICA") ? "selected" : ""%>>TRIFÁSICA</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectFaturamento">Faturamento</label>
                    <select class="form-control form-control" id="selectFaturamento" name="selectFaturamento" required>
                        <option value="NORMAL" <%=medidor.getFaturamento().equals("NORMAL") ? "selected" : ""%>>NORMAL</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectModalidade">Modalidade</label>
                    <select class="form-control form-control" id="selectModalidade" name="selectModalidade" required>
                        <option value="CONVENCIONAL" <%=medidor.getModalidade().equals("CONVENCIONAL") ? "selected" : ""%>>CONVENCIONAL</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selectStatus">Status</label>
                    <select class="form-control form-control" id="selectStatus" name="selectStatus" required>
                        <option value="ATIVA" <%=medidor.getStatus().equals("ATIVA") ? "selected" : ""%>>ATIVA</option>
                        <option value="INATIVA" <%=medidor.getStatus().equals("INATIVA") ? "selected" : ""%>>INATIVA</option>                                                
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
