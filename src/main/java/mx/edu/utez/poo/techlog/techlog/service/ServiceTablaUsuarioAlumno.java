package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioAlumno;

import java.util.List;

public class ServiceTablaUsuarioAlumno {
    public List<BeanTablaUsuarioAlumno> consultarUsuariosAlumnos() {
        DaoTablaUsuarioAlumno miDao = new DaoTablaUsuarioAlumno();
        List<BeanTablaUsuarioAlumno> listaUsuariosAlumnos = miDao.consultarUsuariosAlumnos();
        return listaUsuariosAlumnos;
    }
}
