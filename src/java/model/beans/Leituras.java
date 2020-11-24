package model.beans;
// Generated 23/11/2020 16:41:25 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Leituras generated by hbm2java
 */
public class Leituras  implements java.io.Serializable {


     private Long id;
     private Clientes clientes;
     private Medidores medidores;
     private Date mesAno;
     private long anterior;
     private Long atual;
     private double constante;
     private Double residuo;
     private Long medido;
     private Long faturado;
     private double tarifaSemTributos;
     private double tarifaComTributos;
     private long media12meses;
     private Date dataVencimento;
     private Date dataAnterior;
     private Date dataAtual;
     private Date dataEmissao;
     private Date dataApresentacao;
     private Date dataProxima;
     private Integer diasConsumo;
     private Double total;
     private Long consumo;
     private Date createdAt;
     private Date updatedAt;

    public Leituras() {
    }

	
    public Leituras(Clientes clientes, Medidores medidores, Date mesAno, long anterior, double constante, double tarifaSemTributos, double tarifaComTributos, long media12meses, Date dataAnterior) {
        this.clientes = clientes;
        this.medidores = medidores;
        this.mesAno = mesAno;
        this.anterior = anterior;
        this.constante = constante;
        this.tarifaSemTributos = tarifaSemTributos;
        this.tarifaComTributos = tarifaComTributos;
        this.media12meses = media12meses;
        this.dataAnterior = dataAnterior;
    }
    public Leituras(Clientes clientes, Medidores medidores, Date mesAno, long anterior, Long atual, double constante, Double residuo, Long medido, Long faturado, double tarifaSemTributos, double tarifaComTributos, long media12meses, Date dataVencimento, Date dataAnterior, Date dataAtual, Date dataEmissao, Date dataApresentacao, Date dataProxima, Integer diasConsumo, Double total, Long consumo, Date createdAt, Date updatedAt) {
       this.clientes = clientes;
       this.medidores = medidores;
       this.mesAno = mesAno;
       this.anterior = anterior;
       this.atual = atual;
       this.constante = constante;
       this.residuo = residuo;
       this.medido = medido;
       this.faturado = faturado;
       this.tarifaSemTributos = tarifaSemTributos;
       this.tarifaComTributos = tarifaComTributos;
       this.media12meses = media12meses;
       this.dataVencimento = dataVencimento;
       this.dataAnterior = dataAnterior;
       this.dataAtual = dataAtual;
       this.dataEmissao = dataEmissao;
       this.dataApresentacao = dataApresentacao;
       this.dataProxima = dataProxima;
       this.diasConsumo = diasConsumo;
       this.total = total;
       this.consumo = consumo;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
    }
    public Leituras(Clientes cliente, Medidores medidor, Date mesAno, long anterior, double constante, double residuo, double tarifaSemTributos, double tarifaComTributos, long media12Meses, Date dataAnterior) {
        this.clientes = cliente;
        this.medidores = medidor;
        this.mesAno = mesAno;
        this.anterior = anterior;
        this.constante = constante;
        this.residuo = residuo;
        this.tarifaSemTributos = tarifaSemTributos;
        this.tarifaComTributos = tarifaComTributos;
        this.media12meses= media12Meses;
        this.dataAnterior = dataAnterior;
    }

   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public Clientes getClientes() {
        return this.clientes;
    }
    
    public void setClientes(Clientes clientes) {
        this.clientes = clientes;
    }
    public Medidores getMedidores() {
        return this.medidores;
    }
    
    public void setMedidores(Medidores medidores) {
        this.medidores = medidores;
    }
    public Date getMesAno() {
        return this.mesAno;
    }
    
    public void setMesAno(Date mesAno) {
        this.mesAno = mesAno;
    }
    public long getAnterior() {
        return this.anterior;
    }
    
    public void setAnterior(long anterior) {
        this.anterior = anterior;
    }
    public Long getAtual() {
        return this.atual;
    }
    
    public void setAtual(Long atual) {
        this.atual = atual;
    }
    public double getConstante() {
        return this.constante;
    }
    
    public void setConstante(double constante) {
        this.constante = constante;
    }
    public Double getResiduo() {
        return this.residuo;
    }
    
    public void setResiduo(Double residuo) {
        this.residuo = residuo;
    }
    public Long getMedido() {
        return this.medido;
    }
    
    public void setMedido(Long medido) {
        this.medido = medido;
    }
    public Long getFaturado() {
        return this.faturado;
    }
    
    public void setFaturado(Long faturado) {
        this.faturado = faturado;
    }
    public double getTarifaSemTributos() {
        return this.tarifaSemTributos;
    }
    
    public void setTarifaSemTributos(double tarifaSemTributos) {
        this.tarifaSemTributos = tarifaSemTributos;
    }
    public double getTarifaComTributos() {
        return this.tarifaComTributos;
    }
    
    public void setTarifaComTributos(double tarifaComTributos) {
        this.tarifaComTributos = tarifaComTributos;
    }
    public long getMedia12meses() {
        return this.media12meses;
    }
    
    public void setMedia12meses(long media12meses) {
        this.media12meses = media12meses;
    }
    public Date getDataVencimento() {
        return this.dataVencimento;
    }
    
    public void setDataVencimento(Date dataVencimento) {
        this.dataVencimento = dataVencimento;
    }
    public Date getDataAnterior() {
        return this.dataAnterior;
    }
    
    public void setDataAnterior(Date dataAnterior) {
        this.dataAnterior = dataAnterior;
    }
    public Date getDataAtual() {
        return this.dataAtual;
    }
    
    public void setDataAtual(Date dataAtual) {
        this.dataAtual = dataAtual;
    }
    public Date getDataEmissao() {
        return this.dataEmissao;
    }
    
    public void setDataEmissao(Date dataEmissao) {
        this.dataEmissao = dataEmissao;
    }
    public Date getDataApresentacao() {
        return this.dataApresentacao;
    }
    
    public void setDataApresentacao(Date dataApresentacao) {
        this.dataApresentacao = dataApresentacao;
    }
    public Date getDataProxima() {
        return this.dataProxima;
    }
    
    public void setDataProxima(Date dataProxima) {
        this.dataProxima = dataProxima;
    }
    public Integer getDiasConsumo() {
        return this.diasConsumo;
    }
    
    public void setDiasConsumo(Integer diasConsumo) {
        this.diasConsumo = diasConsumo;
    }
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }
    public Long getConsumo() {
        return this.consumo;
    }
    
    public void setConsumo(Long consumo) {
        this.consumo = consumo;
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


