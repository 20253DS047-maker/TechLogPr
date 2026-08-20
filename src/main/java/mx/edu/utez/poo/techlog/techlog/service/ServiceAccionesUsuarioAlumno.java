package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoAccionesUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

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

    // NUEVO: hashea la nueva contraseña con el mismo algoritmo que usa el login (SHA-256)
    // y la guarda. El admin nunca puede ver la contraseña actual, solo asignar una nueva.
    public boolean cambiarPassword(String matricula, String nuevaContrasenaPlano) {
        if (matricula == null || matricula.trim().isEmpty() ||
                nuevaContrasenaPlano == null || nuevaContrasenaPlano.trim().isEmpty()) {
            return false;
        }
        String hash = HashUtils.sha256(nuevaContrasenaPlano.trim());
        return daoAccionesUsuarioAlumno.cambiarPassword(matricula, hash);
    }
}
