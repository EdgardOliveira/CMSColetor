/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Clientes;
import model.beans.Leituras;
import model.beans.Medidores;
import model.dao.ClienteDao;
import model.dao.LeituraDao;
import model.dao.MedidorDao;

/**
 *
 * @author Marinho Alencar
 */
@WebServlet(name = "Leitura", urlPatterns = {"/LeituraController"})
public class LeituraController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/leitura.jsp";
    private static String LISTAR = "/leituras.jsp";
    private LeituraDao leituraDao;
    private static String encaminhar = "";

    public LeituraController() {
        super();
        leituraDao = new LeituraDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirLeitura(request, response);
                break;
            case "listar":
                listarLeituras(request, response);
                break;
            case "atualizar":
                atualizarLeitura(request, response);
                break;
            case "excluir":
                excluirLeitura(request, response);
                break;
            default:
                listarLeituras(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirLeitura(HttpServletRequest request, HttpServletResponse response) {
        Date mesAno = null;        
        try {
            SimpleDateFormat formatarMesAno = new SimpleDateFormat("yyyy-MM-01");
            mesAno = formatarMesAno.parse(request.getParameter("txtMesAno"));
        } catch (ParseException ex) {
            Logger.getLogger(LeituraController.class.getName()).log(Level.SEVERE, null, ex);
        }
        long clienteId = Long.parseLong(request.getParameter("selectCliente"));
        long medidorId = Long.parseLong(request.getParameter("selectMedidor"));
        long anterior = Long.parseLong(request.getParameter("txtAnterior"));
        double constante = VariaveisGlobais.CONSTANTE;
        double residuo = Long.parseLong(request.getParameter("txtResiduo"));        
        double tarifaSemTributos = VariaveisGlobais.TARIFA_SEM_TRIBUTOS;
        double tarifaComTributos = VariaveisGlobais.TARIFA_COM_TRIBUTOS;
        long media12Meses = 0L; //leituraDao.CalcularMedia12Meses();
        
        SimpleDateFormat formatarData = new SimpleDateFormat("yyyy-MM-dd");
        Date dataAnterior = null;
        try {    
            dataAnterior = formatarData.parse(request.getParameter("txtDataAnterior"));
        } catch (ParseException ex) {
            Logger.getLogger(LeituraController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ClienteDao clienteDao = new ClienteDao();
        Clientes cliente = clienteDao.consultarId(clienteId);

        MedidorDao medidorDao = new MedidorDao();
        Medidores medidor = medidorDao.consultarId(medidorId);
       
 
        Leituras leitura = new Leituras(cliente, medidor, mesAno, anterior, constante, residuo, tarifaSemTributos, tarifaComTributos, media12Meses, dataAnterior);

        leituraDao.salvar(leitura);

        encaminhar = LISTAR;
    }

    private void listarLeituras(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("leituras", leituraDao.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarLeitura(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("txtId"));

//        leitura.setId(id);
        
       // leituraDao.alterar(leitura);
        
        encaminhar = LISTAR;

        request.setAttribute("leituras", leituraDao.listar());
    }

    private void excluirLeitura(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("id"));

        Leituras leitura = leituraDao.consultarId(id);

        leituraDao.excluir(leitura);

        encaminhar = LISTAR;
    }
    

    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}