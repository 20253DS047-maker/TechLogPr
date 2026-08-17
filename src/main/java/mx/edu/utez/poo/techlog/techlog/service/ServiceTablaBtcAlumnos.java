package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;

import java.util.List;

public class ServiceTablaBtcAlumnos {
    public List<BeanTablaBtcAlumnos> consultarRegistrosBtcAlumnos() {
        DaoTablaBtcAlumnos miDao = new DaoTablaBtcAlumnos();
        List<BeanTablaBtcAlumnos> listaRegistroBtcAlumnos = miDao.consultarRegistrosBtcAlumnos();
        return listaRegistroBtcAlumnos;
    }

}
