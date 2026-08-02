package mx.edu.utez.poo.techlog.techlog.model;

public class BeanRegistroAlumno {
    private String matricula;
    private String nombre;
    private String apellido;
    private String contraseña;
    private String username;

    public BeanRegistroAlumno(String matricula, String nombre, String apellido, String contraseña, String username) {
       this.matricula = matricula;
       this.nombre = nombre;
       this.apellido = apellido;
       this.contraseña = contraseña;
       this.username = username;
    }

    public String getMatricula() { return matricula; }

    public void setMatricula(String matricula) { this.matricula = matricula; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellido() { return apellido; }

    public void setApellido(String apellido) { this.apellido = apellido; }

    public String getContraseña() { return contraseña; }

    public void setContraseña(String contraseña) { this.contraseña = contraseña; }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }
}
