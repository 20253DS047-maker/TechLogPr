package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoAccionesDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;

public class ServiceAccionesDocente {
    private DaoAccionesDocente daoAccionesDocente = new DaoAccionesDocente();

    public boolean eliminarDocente(int id) {
        if (id <= 0) {
            return false;
        }
        return daoAccionesDocente.eliminar(id);
    }

    public boolean editarDocente(BeanTablaBtcDocente docente, int idOriginal) {
        if (idOriginal <= 0) {
            return false;
        }
        if (docente.getNombre() == null || docente.getNombre().trim().isEmpty() ||
                docente.getApellidoPaterno() == null || docente.getApellidoPaterno().trim().isEmpty() ||
                docente.getApellidoMaterno() == null || docente.getApellidoMaterno().trim().isEmpty() ||
                docente.getArea() == null || docente.getArea().trim().isEmpty()) {
            return false;
        }
        return daoAccionesDocente.actualizar(docente, idOriginal);
    }
}
