package mx.edu.utez.poo.techlog.techlog.model;

public class BeanDocente {
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private String area;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String username;

    public BeanDocente(String nombre, String apellidoPaterno, String apellidoMaterno, String area, String password, String username) {
        this.nombre = nombre;
        this.apellido_paterno = apellidoPaterno;
        this.apellido_materno = apellidoMaterno;
        this.area = area;
        this.password = password;
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }


}
