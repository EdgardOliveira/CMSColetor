package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Leituras;
import model.beans.Medidores;
import model.dao.ClienteDao;
import model.dao.LeituraDao;
import model.dao.MedidorDao;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "IdentificarClienteController", urlPatterns = {"/IdentificarClienteController"})
public class IdentificarClienteController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String encaminhar = "identificarCliente.jsp";
        
        String cpfCnpj = request.getParameter("txtCpfCnpj");
        long numero = Long.parseLong(request.getParameter("txtMedidor"));

        ClienteDao clienteDao = new ClienteDao();
        boolean validacao = clienteDao.validarCredenciais(cpfCnpj, numero);
        
        if (validacao){
            
            MedidorDao medidorDao = new MedidorDao();
            Medidores medidor = medidorDao.consultarPorMedidor(numero);            
            
            LeituraDao leituraDao = new LeituraDao();            
            List<Leituras> listaFaturas = leituraDao.consultarPorMedidorId(medidor.getId());
            
            //conseguiu se autenticar vai pra página de faturas...
            
            //envia o objeto venda como atributo na requisição
            request.setAttribute("faturas", listaFaturas);
            
            encaminhar = "faturas.jsp";
        }else{
            //não conseguiu se autenticar... volta pra página de login
        }        

        //encaminha para a página de pré-venda
        request.getRequestDispatcher(encaminhar).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
