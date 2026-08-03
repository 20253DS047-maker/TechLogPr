package mx.edu.utez.poo.techlog.techlog.model;

public class BeanBitacoraPc {
    private String salon_computo;
    private  String docencia;
    private String numero_pc;
    private String modelo;
    private String isla_mesa;
    private String estado;

    public BeanBitacoraPc(String salonComputo, String docencia, String numeroPc, String modelo, String islaMesa, String estado) {
        this.salon_computo = salonComputo;
        this.docencia = docencia;
        this.numero_pc = numeroPc;
        this.modelo = modelo;
        this.isla_mesa = islaMesa;
        this.estado = estado;

    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getSalon_computo() {
        return salon_computo;
    }

    public void setSalon_computo(String salon_computo) {
        this.salon_computo = salon_computo;
    }

    public String getDocencia() {
        return docencia;
    }

    public void setDocencia(String docencia) {
        this.docencia = docencia;
    }

    public String getNumero_pc() {
        return numero_pc;
    }

    public void setNumero_pc(String numero_pc) {
        this.numero_pc = numero_pc;
    }

    public String getIsla_mesa() {
        return isla_mesa;
    }

    public void setIsla_mesa(String isla_mesa) {
        this.isla_mesa = isla_mesa;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


}
