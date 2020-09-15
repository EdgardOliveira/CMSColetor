/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Users;
import model.dao.UserDao;

/**
 *
 * @author Thiago Lins
 */
@WebServlet(name = "User", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/user.jsp";
    private static String LISTAR = "/users.jsp";
    private UserDao userDao;
    private static String encaminhar = "";

    public UserController() {
        super();
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirUser(request, response);
                break;
            case "listar":
                listarUsers(request, response);
                break;
            case "atualizar":
                atualizarUser(request, response);
                break;
            case "excluir":
                excluirUser(request, response);
                break;
            default:
                listarUsers(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirUser(HttpServletRequest request, HttpServletResponse response) {
        
        String nome = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtPassword");

        Users user = new Users(nome, email, senha);

        userDao.salvar(user);

        encaminhar = LISTAR;
    }

    private void listarUsers(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("users", userDao.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarUser(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("txtId"));
        String nome = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        Users user = new Users(nome, email, password);
        user.setId(id);
        
        userDao.alterar(user);
        
        encaminhar = LISTAR;

        request.setAttribute("users", userDao.listar());
    }

    private void excluirUser(HttpServletRequest request, HttpServletResponse response) {
        
        long id = Long.parseLong(request.getParameter("id"));

        Users user = userDao.consultarId(id);

        userDao.excluir(user);

        encaminhar = LISTAR;
    }
    

    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}