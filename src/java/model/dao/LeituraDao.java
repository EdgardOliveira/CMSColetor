/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Leituras;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class LeituraDao {
    Session session;
    Transaction transaction;
    List<Leituras> lista = new ArrayList<>();
    
    public void salvar(Leituras leitura){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(leitura);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Leituras> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Leituras.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Leituras consultarId(long id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from leituras where id = "+id+"").addEntity(Leituras.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
       
    public void alterar(Leituras leitura){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(leitura);                        //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Leituras leitura){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(leitura);                        //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Leituras> consultarPorMedidorId(long medidor){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from leituras where medidor_id = '"+medidor+"'").addEntity(Leituras.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }

}
