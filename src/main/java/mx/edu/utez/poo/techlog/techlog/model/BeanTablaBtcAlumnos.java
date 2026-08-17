package mx.edu.utez.poo.techlog.techlog.model;

import java.util.Date;

public class BeanTablaBtcAlumnos {
    private int id;
    private String matricula;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String nombreDocente;
    private Date fechaRegistro;
    private String observaciones;
    private int idPc;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getMatricula() { return matricula; }

    public void setMatricula(String matricula) { this.matricula = matricula; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellidoPaterno() { return apellidoPaterno; }

    public void setApellidoPaterno(String apellidoPaterno) { this.apellidoPaterno = apellidoPaterno; }

    public String getApellidoMaterno() { return apellidoMaterno; }

    public void setApellidoMaterno(String apellidoMaterno) { this.apellidoMaterno = apellidoMaterno; }

    public String getNombreDocente() { return nombreDocente; }

    public void setNombreDocente(String nombreDocente) { this.nombreDocente = nombreDocente; }

    public Date getFechaRegistro() { return fechaRegistro; }

    public void setFechaRegistro(Date fechaRegistro) { this.fechaRegistro = fechaRegistro; }

    public String getObservaciones() { return observaciones; }

    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }

    public int getIdPc() { return idPc; }

    public void setIdPc(int idPc) { this.idPc = idPc; }
}