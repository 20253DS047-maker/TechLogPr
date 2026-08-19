package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoAccionesUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioAlumno;

public class ServiceAccionesUsuarioAlumno {
    private DaoAccionesUsuarioAlumno daoAccionesUsuarioAlumno = new DaoAccionesUsuarioAlumno();

    public boolean eliminarUsuario(String matricula) {
        if (matricula == null || matricula.trim().isEmpty()) {
            return false;
        }
        return daoAccionesUsuarioAlumno.eliminar(matricula);
    }

    public boolean editarUsuario(BeanTablaUsuarioAlumno usuario, String matriculaOriginal) {
        if (matriculaOriginal == null || matriculaOriginal.trim().isEmpty()) {
            return false;
        }
        if (usuario.getNombre() == null || usuario.getNombre().trim().isEmpty() ||
                usuario.getApellido() == null || usuario.getApellido().trim().isEmpty() ||
                usuario.getUsername() == null || usuario.getUsername().trim().isEmpty()) {
            return false;
        }
        return daoAccionesUsuarioAlumno.actualizar(usuario, matriculaOriginal);
    }
}
