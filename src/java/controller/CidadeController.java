package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Cidades;
import model.dao.CidadeDao;

/**
 *
 * @author Thiago Lins
 */
@WebServlet(name = "Cidade", urlPatterns = {"/CidadeController"})
public class CidadeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/cidade.jsp";
    private static String LISTAR = "/cidades.jsp";
    private CidadeDao cidadeDao;
    private static String encaminhar = "";

    public CidadeController() {
        super();
        cidadeDao = new CidadeDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirCidade(request, response);
                break;
            case "listar":
                listarCidades(request, response);
                break;
            case "atualizar":
                atualizarCidade(request, response);
                break;
            case "excluir":
                excluirCidade(request, response);
                break;
            default:
                listarCidades(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirCidade(HttpServletRequest request, HttpServletResponse response) {
        
        String nome = request.getParameter("txtNome");

        Cidades cidade = new Cidades(nome);

        cidadeDao.salvar(cidade);

        encaminhar = LISTAR;
    }

    private void listarCidades(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("cidades", cidadeDao.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarCidade(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("txtId"));
        String nome = request.getParameter("txtNome");
        
        Cidades cidade = new Cidades(nome);
        cidade.setId(id);
        
        cidadeDao.alterar(cidade);
        
        encaminhar = LISTAR;

        request.setAttribute("cidades", cidadeDao.listar());
    }

    private void excluirCidade(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("id"));

        Cidades cidade = cidadeDao.consultarId(id);

        cidadeDao.excluir(cidade);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}