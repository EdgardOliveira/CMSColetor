package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Grupos;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class GrupoDao {
    Session session;
    Transaction transaction;
    List<Grupos> lista = new ArrayList<>();
    
    public void salvar(Grupos grupo){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(grupo);                            //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Grupos> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Grupos.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Grupos consultarId(long id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from grupos where id = "+id+"").addEntity(Grupos.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
       
    public void alterar(Grupos grupo){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(grupo);                          //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Grupos grupo){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(grupo);                          //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }   
}
