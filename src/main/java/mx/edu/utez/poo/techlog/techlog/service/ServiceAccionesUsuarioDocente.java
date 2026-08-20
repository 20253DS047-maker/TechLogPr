package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoAccionesUsuarioDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioDocente;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceAccionesUsuarioDocente {
    private DaoAccionesUsuarioDocente daoAccionesUsuarioDocente = new DaoAccionesUsuarioDocente();

    public boolean eliminarUsuario(int id) {
        if (id <= 0) {
            return false;
        }
        return daoAccionesUsuarioDocente.eliminar(id);
    }

    public boolean editarUsuario(BeanTablaUsuarioDocente usuario, int idOriginal) {
        if (idOriginal <= 0) {
            return false;
        }
        if (usuario.getUsername() == null || usuario.getUsername().trim().isEmpty() ||
                usuario.getNombre() == null || usuario.getNombre().trim().isEmpty() ||
                usuario.getApellidoPaterno() == null || usuario.getApellidoPaterno().trim().isEmpty() ||
                usuario.getApellidoMaterno() == null || usuario.getApellidoMaterno().trim().isEmpty() ||
                usuario.getArea() == null || usuario.getArea().trim().isEmpty()) {
            return false;
        }
        return daoAccionesUsuarioDocente.actualizar(usuario, idOriginal);
    }

    // NUEVO: hashea la nueva contraseña (SHA-256, mismo algoritmo que el login) y la guarda
    public boolean cambiarPassword(int id, String nuevaContrasenaPlano) {
        if (id <= 0 || nuevaContrasenaPlano == null || nuevaContrasenaPlano.trim().isEmpty()) {
            return false;
        }
        String hash = HashUtils.sha256(nuevaContrasenaPlano.trim());
        return daoAccionesUsuarioDocente.cambiarPassword(id, hash);
    }
}
