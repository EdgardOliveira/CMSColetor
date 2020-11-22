package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Medidores;
import model.dao.MedidorDao;

/**
 *
 * @author JGuilherme
 */
@WebServlet(name = "Medidor", urlPatterns = {"/MedidorController"})
public class MedidorController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/medidor.jsp";
    private static String LISTAR = "/medidores.jsp";
    private MedidorDao medidorDao;
    private static String encaminhar = "";

    public MedidorController() {
        super();
        medidorDao = new MedidorDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirMedidor(request, response);
                break;
            case "listar":
                listarMedidores(request, response);
                break;
            case "atualizar":
                atualizarMedidor(request, response);
                break;
            case "excluir":
                excluirMedidor(request, response);
                break;
            default:
                listarMedidores(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirMedidor(HttpServletRequest request, HttpServletResponse response) {
        
        String numero = request.getParameter("txtNumero");
        String grupo = request.getParameter("selectGrupo");
        String classe = request.getParameter("selectClasse");
        String ligacao = request.getParameter("selectLigacao");
        String faturamento = request.getParameter("selectFaturamento");
        String modalidade = request.getParameter("selectModalidade");
        String status = request.getParameter("selectStatus");

        Medidores medidor = new Medidores(numero, grupo, classe, ligacao, faturamento, modalidade, status);

        medidorDao.salvar(medidor);

        encaminhar = LISTAR;
    }

    private void listarMedidores(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("medidores", medidorDao.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarMedidor(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("txtId"));
        String numero = request.getParameter("txtNumero");
        String grupo = request.getParameter("selectGrupo");
        String classe = request.getParameter("selectClasse");
        String ligacao = request.getParameter("selectLigacao");
        String faturamento = request.getParameter("selectFaturamento");
        String modalidade = request.getParameter("selectModalidade");
        String status = request.getParameter("selectStatus");
        Medidores medidor = new Medidores(numero, grupo, classe, ligacao, faturamento, modalidade, status);
        medidor.setId(id);
        
        medidorDao.alterar(medidor);
        
        encaminhar = LISTAR;

        request.setAttribute("medidores", medidorDao.listar());
    }

    private void excluirMedidor(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("id"));

        Medidores medidor = medidorDao.consultarId(id);

        medidorDao.excluir(medidor);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}