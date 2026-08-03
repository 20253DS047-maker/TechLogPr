package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoRegistroAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroAlumno;

public class ServiceRegistroAlumno {

    private DaoRegistroAlumno DaoRegistroAlumno = new DaoRegistroAlumno();

    public boolean registrarRegistroAlumno(BeanRegistroAlumno nuevoAlumno){

        if (nuevoAlumno.getMatricula() == null || nuevoAlumno.getMatricula().trim().isEmpty() ||
                nuevoAlumno.getNombre() == null || nuevoAlumno.getNombre().trim().isEmpty() ||
                nuevoAlumno.getApellido() == null || nuevoAlumno.getApellido().trim().isEmpty() ||
                nuevoAlumno.getUsername() == null || nuevoAlumno.getUsername().trim().isEmpty()){
                return false;
        }

        if (nuevoAlumno.getContrasena() == null || nuevoAlumno.getContrasena().trim().isEmpty() ||
                nuevoAlumno.getContrasena().length() > 5 ){
                return false;
        }

        return DaoRegistroAlumno.insertar(nuevoAlumno);
    }

}
