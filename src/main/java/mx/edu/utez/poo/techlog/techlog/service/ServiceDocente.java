package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanDocente;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceDocente {

    private DaoDocente daoDocente = new DaoDocente();

    public boolean registrarDocente(BeanDocente nuevoDocente) {
        if (nuevoDocente.getNombre() == null || nuevoDocente.getNombre().trim().isEmpty() ||
                nuevoDocente.getApellido_paterno() == null || nuevoDocente.getApellido_paterno().trim().isEmpty() ||
                nuevoDocente.getUsername() == null || nuevoDocente.getUsername().trim().isEmpty()) {
            return false;
        }

        if (nuevoDocente.getPassword() == null || nuevoDocente.getPassword().trim().isEmpty()) {
            return false;
        }

        // Aplica HashUtils SHA-256 en Java antes de enviar al DAO
        String contrasenaEncriptada = HashUtils.sha256(nuevoDocente.getPassword().trim());
        nuevoDocente.setPassword(contrasenaEncriptada);

        return daoDocente.insertar(nuevoDocente);
    }
}
