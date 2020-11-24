package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Clientes;
import model.beans.Medidores;
import model.dao.ClienteDao;
import model.dao.MedidorDao;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "Cliente", urlPatterns = {"/ClienteController"})
public class ClienteController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/cliente.jsp";
    private static String LISTAR = "/clientes.jsp";
    private ClienteDao clienteDao;
    private static String encaminhar = "";

    public ClienteController() {
        super();
        clienteDao = new ClienteDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirCliente(request, response);
                break;
            case "listar":
                listarClientes(request, response);
                break;
            case "atualizar":
                atualizarCliente(request, response);
                break;
            case "excluir":
                excluirCliente(request, response);
                break;
            default:
                listarClientes(request, response);
        }

        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirCliente(HttpServletRequest request, HttpServletResponse response) {

        String nomeEmpresa = request.getParameter("txtNomeEmpresa");
        String cpfCnpj = request.getParameter("txtCpfCnpj");
        int diaVencimento = Integer.parseInt(request.getParameter("selectDiaVencimento"));
        long medidorId = Long.parseLong(request.getParameter("selectMedidor"));

        MedidorDao medidorDao = new MedidorDao();
        Medidores medidor = medidorDao.consultarId(medidorId);

        Clientes cliente = new Clientes(medidor, nomeEmpresa, cpfCnpj, diaVencimento);

        clienteDao.salvar(cliente);

        encaminhar = LISTAR;
    }

    private void listarClientes(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("clientes", clienteDao.listar());

        encaminhar = LISTAR;
    }

    private void atualizarCliente(HttpServletRequest request, HttpServletResponse response) {

        long id = Long.parseLong(request.getParameter("txtId"));
        String nomeEmpresa = request.getParameter("txtNomeEmpresa");
        String cpfCnpj = request.getParameter("txtCpfCnpj");
        int diaVencimento = Integer.parseInt(request.getParameter("selectDiaVencimento"));
        long medidorId = Long.parseLong(request.getParameter("selectMedidor"));

        MedidorDao medidorDao = new MedidorDao();
        Medidores medidor = medidorDao.consultarId(medidorId);

        Clientes cliente = new Clientes(medidor, nomeEmpresa, cpfCnpj, diaVencimento);
        cliente.setId(id);

        clienteDao.alterar(cliente);

        encaminhar = LISTAR;

        request.setAttribute("clientes", clienteDao.listar());
    }

    private void excluirCliente(HttpServletRequest request, HttpServletResponse response) {

        long id = Long.parseLong(request.getParameter("id"));

        Clientes cliente = clienteDao.consultarId(id);

        clienteDao.excluir(cliente);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
