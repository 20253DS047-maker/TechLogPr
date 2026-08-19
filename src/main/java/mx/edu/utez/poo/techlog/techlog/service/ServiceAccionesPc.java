package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoAccionesPc;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaPc;

public class ServiceAccionesPc {
    private DaoAccionesPc daoAccionesPc = new DaoAccionesPc();

    public boolean eliminarPc(int id) {
        if (id <= 0) {
            return false;
        }
        return daoAccionesPc.eliminar(id);
    }

    public boolean editarPc(BeanTablaPc registroPc, int idOriginal) {
        if (idOriginal <= 0) {
            return false;
        }
        if (registroPc.getSalonComputo() == null || registroPc.getSalonComputo().trim().isEmpty() ||
                registroPc.getDocencia() == null || registroPc.getDocencia().trim().isEmpty() ||
                registroPc.getNumeroPc() == null || registroPc.getNumeroPc().trim().isEmpty() ||
                registroPc.getModelo() == null || registroPc.getModelo().trim().isEmpty() ||
                registroPc.getIslaMesa() == null || registroPc.getIslaMesa().trim().isEmpty() ||
                registroPc.getEstado() == null || registroPc.getEstado().trim().isEmpty()) {
            return false;
        }
        return daoAccionesPc.actualizar(registroPc, idOriginal);
    }

    public boolean cambiarEstadoPc(int id, String nuevoEstado) {
        if (id <= 0 || nuevoEstado == null || nuevoEstado.trim().isEmpty()) {
            return false;
        }
        return daoAccionesPc.cambiarEstado(id, nuevoEstado);
    }
}
