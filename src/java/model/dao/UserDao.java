/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Users;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class UserDao {

    Session session;
    Transaction transaction;
    List<Users> lista = new ArrayList<>();

    public void salvar(Users user) {
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(user);                             //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }

    public List<Users> listar() {
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Users.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }

    public Users consultarId(long id) {
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from users where id = " + id + "").addEntity(Users.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }

    public void alterar(Users user) {
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(user);                           //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }

    public void excluir(Users user) {
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(user);                           //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }

    public long efetuarLogin(String email, String senha) {
        long id = -1;                                    //-1 = não existe/não autenticado        
        session = FabricaConexao.getSessionFactory();    //conexão
        Query query = session.createSQLQuery("select * from users where email = '" + email + "' and password = '" + senha + "'").addEntity(Users.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 

        if ((lista.size() > 0) && (!lista.get(0).getName().isEmpty())) {
            id = lista.get(0).getId();
        }

        return id;
    }
}
