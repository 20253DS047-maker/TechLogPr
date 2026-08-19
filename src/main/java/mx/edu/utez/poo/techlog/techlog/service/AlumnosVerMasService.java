package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoDocentesVerMas;
import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;

import java.util.List;

public class AlumnosVerMasService {
    private final DaoDocentesVerMas dao = new DaoDocentesVerMas();
    private final DaoTablaBtcAlumnos daoTablaBtcAlumnos = new DaoTablaBtcAlumnos();


    public List<BeanTablaBtcAlumnos> consultarBtcAlumnos() {
        return daoTablaBtcAlumnos.consultarRegistrosBtcAlumnos();
    }

    public BeanTablaBtcDocente consultarPorId(int id) {
        return dao.findById(id);
    }

    public List<BeanTablaBtcAlumnos> consultarBtcDocentes() {
        return null;
    }
}


