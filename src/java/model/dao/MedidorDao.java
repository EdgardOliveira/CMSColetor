package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Medidores;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class MedidorDao {
    Session session;
    Transaction transaction;
    List<Medidores> lista = new ArrayList<>();
    
    public void salvar(Medidores medidor){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(medidor);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Medidores> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Medidores.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Medidores consultarId(long id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from medidores where id = "+id+"").addEntity(Medidores.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
       
    public void alterar(Medidores medidor){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(medidor);                        //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Medidores medidor){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(medidor);                        //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public Medidores consultarPorMedidor(long numero){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from medidores where numero = "+String.valueOf(numero)+"").addEntity(Medidores.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
}
