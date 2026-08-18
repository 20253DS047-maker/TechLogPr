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

        // CORREGIDO: Cancela sólo si la contraseña es menor a 5 caracteres
        if (nuevoAlumno.getContrasena() == null || nuevoAlumno.getContrasena().trim().isEmpty() ||
                nuevoAlumno.getContrasena().trim().length() < 5 ){
            return false;
        }

        // ENCRIPTACIÓN: Se guarda el hash en el bean antes de llamar al DAO
        String contrasenaEncriptada = HashUtils.sha256(nuevoAlumno.getContrasena().trim());
        nuevoAlumno.setContrasena(contrasenaEncriptada);

        return daoRegistroAlumno.insertar(nuevoAlumno);
    }
}