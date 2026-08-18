package mx.edu.utez.poo.techlog.techlog.model;

public class BeanRegistroAlumno {
    private String matricula;
    private String nombre;
    private String apellido;
    private String contrasena;
    private String username;

    public BeanRegistroAlumno() {}

    public BeanRegistroAlumno(String matricula, String nombre, String apellido, String contrasena, String username) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.contrasena = contrasena;
        this.username = username;
    }

    public String getMatricula() { return matricula; }

    public void setMatricula(String matricula) { this.matricula = matricula; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellido() { return apellido; }

    public void setApellido(String apellido) { this.apellido = apellido; }

    public String getContrasena() { return contrasena; }

    // CORREGIDO: El parámetro ahora coincide con la asignación
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }
}
