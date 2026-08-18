package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoRegistroAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroAlumno;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceRegistroAlumno {

    private DaoRegistroAlumno daoRegistroAlumno = new DaoRegistroAlumno();

    public boolean registrarRegistroAlumno(BeanRegistroAlumno nuevoAlumno){

        if (nuevoAlumno.getMatricula() == null || nuevoAlumno.getMatricula().trim().isEmpty() ||
                nuevoAlumno.getNombre() == null || nuevoAlumno.getNombre().trim().isEmpty() ||
                nuevoAlumno.getApellido() == null || nuevoAlumno.getApellido().trim().isEmpty() ||
                nuevoAlumno.getUsername() == null || nuevoAlumno.getUsername().trim().isEmpty()){
            return false;
        }

        if (nuevoAlumno.getContrasena() == null || nuevoAlumno.getContrasena().trim().isEmpty() ||
                nuevoAlumno.getContrasena().trim().length() < 5 ){
            return false;
        }

        // Genera el Hash SHA-256 oficial (64 caracteres en minúsculas) en Java
        String contrasenaEncriptada = HashUtils.sha256(nuevoAlumno.getContrasena().trim());
        nuevoAlumno.setContrasena(contrasenaEncriptada);

        return daoRegistroAlumno.insertar(nuevoAlumno);
    }
}