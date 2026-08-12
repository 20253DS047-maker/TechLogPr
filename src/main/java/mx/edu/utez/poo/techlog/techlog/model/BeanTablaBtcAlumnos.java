package mx.edu.utez.poo.techlog.techlog.model;

import java.util.Date;

public class BeanTablaBtcAlumnos {
    private int id;
    private String matricula_usuario;
    //falta el de date_fecha_entrada y date_fecha_Salida
    private String nombreDocente;
    private String observaciones;
    private Date fechaEntrada;
    private Date fechaSalida;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getMatricula_usuario() { return matricula_usuario; }

    public void setMatricula_usuario(String matricula_usuario) { this.matricula_usuario = matricula_usuario; }

    public Date getFechaEntrada() { return fechaEntrada; }

    public void setFechaEntrada(Date fechaEntrada) { this.fechaEntrada = fechaEntrada; }

    public Date getFechaSalida() { return fechaSalida; }

    public void setFechaSalida(Date fechaSalida) { this.fechaSalida = fechaSalida; }

    public String getNombreDocente() { return nombreDocente; }

    public void setNombreDocente(String nombreDocente) { this.nombreDocente = nombreDocente; }

    public String getObservaciones() { return observaciones; }

    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
}
