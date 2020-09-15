/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Cidades;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class CidadeDao {
    Session session;
    Transaction transaction;
    List<Cidades> lista = new ArrayList<>();
    
    public void salvar(Cidades cidade){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(cidade);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Cidades> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Cidades.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Cidades consultarId(long id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from cidades where id = "+id+"").addEntity(Cidades.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
       
    public void alterar(Cidades cidade){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(cidade);                         //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Cidades cidade){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(cidade);                         //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }         
}
