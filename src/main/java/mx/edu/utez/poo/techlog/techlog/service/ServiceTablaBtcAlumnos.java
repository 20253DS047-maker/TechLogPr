package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;

import java.util.List;

public class ServiceTablaBtcAlumnos {

    public List<BeanTablaBtcAlumnos> consultarRegistroBtcAlum() {
        DaoTablaBtcAlumnos miDao = new DaoTablaBtcAlumnos();
        List<BeanTablaBtcAlumnos> listaRegistroBtcAlumno = miDao.consultarRegistroBtcAlum();
        return listaRegistroBtcAlumno;
    }
}
