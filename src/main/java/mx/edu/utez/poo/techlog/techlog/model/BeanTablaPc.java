package mx.edu.utez.poo.techlog.techlog.model;

import java.sql.Date;

public class BeanTablaPc {
    private int id;
    private int idRegistroAlumno;
    private String salonComputo;
    private String docencia;
    private String numeroPc;
    private String modelo;
    private String islaMesa;
    private  String estado;
    private Date fechaRegistro;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public int getIdRegistroAlumno() { return idRegistroAlumno; }

    public void setIdRegistroAlumno(int idRegistroAlumno) { this.idRegistroAlumno = idRegistroAlumno; }

    public String getSalonComputo() { return salonComputo; }

    public void setSalonComputo(String salonComputo) { this.salonComputo = salonComputo; }

    public String getDocencia() { return docencia; }

    public void setDocencia(String docencia) { this.docencia = docencia; }

    public String getNumeroPc() { return numeroPc; }

    public void setNumeroPc(String numeroPc) { this.numeroPc = numeroPc; }

    public String getModelo() { return modelo; }

    public void setModelo(String modelo) { this.modelo = modelo; }

    public String getIslaMesa() { return islaMesa; }

    public void setIslaMesa(String islaMesa) { this.islaMesa = islaMesa; }

    public String getEstado() { return estado; }

    public void setEstado(String estado) { this.estado = estado; }

    public Date getFechaRegistro() { return fechaRegistro; }

    public void setFechaRegistro(Date fechaRegistro) { this.fechaRegistro = fechaRegistro; }
}
