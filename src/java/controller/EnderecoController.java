package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Cidades;
import model.beans.Enderecos;
import model.beans.Medidores;
import model.dao.CidadeDao;
import model.dao.EnderecoDao;
import model.dao.MedidorDao;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "Endereco", urlPatterns = {"/EnderecoController"})
public class EnderecoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/endereco.jsp";
    private static String LISTAR = "/enderecos.jsp";
    private EnderecoDao enderecoDao;
    private static String encaminhar = "";

    public EnderecoController() {
        super();
        enderecoDao = new EnderecoDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirEndereco(request, response);
                break;
            case "listar":
                listarEnderecos(request, response);
                break;
            case "atualizar":
                atualizarEndereco(request, response);
                break;
            case "excluir":
                excluirEndereco(request, response);
                break;
            default:
                listarEnderecos(request, response);
        }

        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirEndereco(HttpServletRequest request, HttpServletResponse response) {

        String cep = request.getParameter("txtCep");
        String logradouro = request.getParameter("txtLogradouro");
        String numero = request.getParameter("txtNumero");
        String complemento = request.getParameter("txtComplemento");
        String bairro = request.getParameter("txtBairro");
        String uf = request.getParameter("selectUF");
        long cidadeId = Long.parseLong(request.getParameter("selectCidade"));
        long medidorId = Long.parseLong(request.getParameter("selectMedidor"));
        
        CidadeDao cidadeDao = new CidadeDao();
        Cidades cidade = cidadeDao.consultarId(cidadeId);
        
        MedidorDao medidorDao = new MedidorDao();
        Medidores medidor = medidorDao.consultarId(medidorId);
        
        
        Enderecos endereco = new Enderecos(cidade, medidor, cep, logradouro, numero, complemento, bairro, uf);

        enderecoDao.salvar(endereco);

        encaminhar = LISTAR;
    }

    private void listarEnderecos(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("enderecos", enderecoDao.listar());

        encaminhar = LISTAR;
    }

    private void atualizarEndereco(HttpServletRequest request, HttpServletResponse response) {

        long id = Long.parseLong(request.getParameter("txtId"));
        String cep = request.getParameter("txtCep");
        String logradouro = request.getParameter("txtLogradouro");
        String numero = request.getParameter("txtNumero");
        String complemento = request.getParameter("txtComplemento");
        String bairro = request.getParameter("txtBairro");
        String uf = request.getParameter("selectUF");
        long cidadeId = Long.parseLong(request.getParameter("selectCidade"));
        long medidorId = Long.parseLong(request.getParameter("selectMedidor"));
        
        CidadeDao cidadeDao = new CidadeDao();
        Cidades cidade = cidadeDao.consultarId(cidadeId);
        
        MedidorDao medidorDao = new MedidorDao();
        Medidores medidor = medidorDao.consultarId(medidorId);
        
        
        Enderecos endereco = new Enderecos(cidade, medidor, cep, logradouro, numero, complemento, bairro, uf);
        endereco.setId(id);

        enderecoDao.alterar(endereco);

        encaminhar = LISTAR;

        request.setAttribute("enderecos", enderecoDao.listar());
    }

    private void excluirEndereco(HttpServletRequest request, HttpServletResponse response) {

        long id = Long.parseLong(request.getParameter("id"));

        Enderecos endereco = enderecoDao.consultarId(id);

        enderecoDao.excluir(endereco);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
