package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraDocente;

public class ServiceBitacoraDocente {

    private DaoBitacoraDocente DaoBitacoraDocente = new DaoBitacoraDocente();

    public boolean registrarDocenteBitacora (BeanBitacoraDocente nuevoDocenteBitacora){

        if (nuevoDocenteBitacora.getNombre() == null || nuevoDocenteBitacora.getNombre().trim().isEmpty() ||
                nuevoDocenteBitacora.getApellido_paterno() == null || nuevoDocenteBitacora.getApellido_paterno().trim().isEmpty() ||
                nuevoDocenteBitacora.getApellido_materno() == null || nuevoDocenteBitacora.getApellido_materno().trim().isEmpty() ||
                nuevoDocenteBitacora.getArea() == null || nuevoDocenteBitacora.getArea().trim().isEmpty()) {
            return false;
        }

        return DaoBitacoraDocente.insertar(nuevoDocenteBitacora);
    }
}
