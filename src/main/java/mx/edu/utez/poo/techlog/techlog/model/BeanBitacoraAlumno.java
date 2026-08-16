package mx.edu.utez.poo.techlog.techlog.model;

public class BeanBitacoraAlumno {
    private String nombre;
    private String apellido;
    private String nombre_completo;
    private String matricula_usuario;
    private String nombre_docente;
    private String observaciones;


    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public BeanBitacoraAlumno(String matriculaUsuario, String nombreDocente, String observaciones, String nombre_completo) {
        this.matricula_usuario = matriculaUsuario;
        this.nombre_docente = nombreDocente;
        this.observaciones = observaciones;
        this.nombre_completo = nombre_completo;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getNombre_docente() {
        return nombre_docente;
    }

    public void setNombre_docente(String nombre_docente) {
        this.nombre_docente = nombre_docente;
    }

    public String getMatricula_usuario() {
        return matricula_usuario;
    }

    public void setMatricula_usuario(String matricula_usuario) {
        this.matricula_usuario = matricula_usuario;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
