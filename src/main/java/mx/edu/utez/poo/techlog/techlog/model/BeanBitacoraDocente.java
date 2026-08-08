package mx.edu.utez.poo.techlog.techlog.model;

public class BeanBitacoraDocente {
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private String area;

    public BeanBitacoraDocente(String nombre, String apellidoPaterno, String apellidoMaterno, String area) {
        this.nombre = nombre;
        this.apellido_paterno = apellidoPaterno;
        this.apellido_materno = apellidoMaterno;
        this.area = area;
    }

    public String getArea() { return area; }

    public void setArea(String area) { this.area = area; }

    public String getApellido_materno() { return apellido_materno; }

    public void setApellido_materno(String apellido_materno) { this.apellido_materno = apellido_materno; }

    public String getApellido_paterno() { return apellido_paterno; }

    public void setApellido_paterno(String apellido_paterno) { this.apellido_paterno = apellido_paterno; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

}
