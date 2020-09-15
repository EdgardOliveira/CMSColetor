/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Clientes;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class ClienteDao {
    Session session;
    Transaction transaction;
    List<Clientes> lista = new ArrayList<>();
    
    public void salvar(Clientes cliente){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(cliente);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Clientes> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Clientes.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Clientes consultarId(long id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from clientes where id = "+id+"").addEntity(Clientes.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
       
    public void alterar(Clientes cliente){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(cliente);                        //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Clientes cliente){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(cliente);                        //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }     
}
