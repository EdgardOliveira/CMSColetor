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
    
    public boolean validarCredenciais(String cpf_cnpj, long medidor) {
        boolean status = false;                                    //false = não existe/não autenticado        
        session = FabricaConexao.getSessionFactory();    //conexão
        Query query = session.createSQLQuery(
        "select C.nome_empresa as Cliente, C.cpf_cnpj as 'CPF/CNPJ', M.numero as Medidor from leituras as L "+
        "inner join clientes as C on L.cliente_id = C.id " +
        "inner join medidores as M on L.medidor_id = M.id " +
        "where C.cpf_cnpj = '" + cpf_cnpj + "' and M.numero = '" + medidor + "'");
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        if ((lista.size() > 0))
            status = true;
        
        return status;
    }
}
