/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Enderecos;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class EnderecoDao {

    Session session;
    Transaction transaction;
    List<Enderecos> lista = new ArrayList<>();

    public void salvar(Enderecos enderecos) {
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(enderecos);                           //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }

    public List<Enderecos> listar() {
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Enderecos.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }

    public Enderecos consultarId(long id) {
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from enderecos where id = " + id + "").addEntity(Enderecos.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }

    public void alterar(Enderecos enderecos) {
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(enderecos);                        //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }

    public void excluir(Enderecos enderecos) {
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(enderecos);                         //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }

    public Enderecos consultarPorMedidorId(long id) {
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from enderecos where medidor_id  = " + id + "").addEntity(Enderecos.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
}
