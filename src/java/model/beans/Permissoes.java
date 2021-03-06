package model.beans;
// Generated 23/11/2020 16:41:25 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Permissoes generated by hbm2java
 */
public class Permissoes  implements java.io.Serializable {


     private Long id;
     private Recursos recursos;
     private Users users;
     private boolean consultar;
     private boolean cadastrar;
     private boolean atualizar;
     private boolean excluir;
     private Date createdAt;
     private Date updatedAt;

    public Permissoes() {
    }

	
    public Permissoes(Recursos recursos, Users users, boolean consultar, boolean cadastrar, boolean atualizar, boolean excluir) {
        this.recursos = recursos;
        this.users = users;
        this.consultar = consultar;
        this.cadastrar = cadastrar;
        this.atualizar = atualizar;
        this.excluir = excluir;
    }
    public Permissoes(Recursos recursos, Users users, boolean consultar, boolean cadastrar, boolean atualizar, boolean excluir, Date createdAt, Date updatedAt) {
       this.recursos = recursos;
       this.users = users;
       this.consultar = consultar;
       this.cadastrar = cadastrar;
       this.atualizar = atualizar;
       this.excluir = excluir;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public Recursos getRecursos() {
        return this.recursos;
    }
    
    public void setRecursos(Recursos recursos) {
        this.recursos = recursos;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public boolean isConsultar() {
        return this.consultar;
    }
    
    public void setConsultar(boolean consultar) {
        this.consultar = consultar;
    }
    public boolean isCadastrar() {
        return this.cadastrar;
    }
    
    public void setCadastrar(boolean cadastrar) {
        this.cadastrar = cadastrar;
    }
    public boolean isAtualizar() {
        return this.atualizar;
    }
    
    public void setAtualizar(boolean atualizar) {
        this.atualizar = atualizar;
    }
    public boolean isExcluir() {
        return this.excluir;
    }
    
    public void setExcluir(boolean excluir) {
        this.excluir = excluir;
    }
    public Date getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    public Date getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }




}


