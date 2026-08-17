package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaUsuarioDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioDocente;

import java.util.List;

public class ServiceTablaUsuarioDocente {
    public List<BeanTablaUsuarioDocente> consultarUsuarioDocente() {
        DaoTablaUsuarioDocente miDao = new DaoTablaUsuarioDocente();
        List<BeanTablaUsuarioDocente> listaUsuariosDocentes = miDao.consultarUsuarioDocente();
        return listaUsuariosDocentes;
    }
}
