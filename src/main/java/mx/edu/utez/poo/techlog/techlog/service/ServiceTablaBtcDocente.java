package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;

import java.util.List;

public class ServiceTablaBtcDocente {
    public List<BeanTablaBtcDocente> consultarRegistrosBtcDocentes(){
        DaoTablaBtcDocente miDao = new DaoTablaBtcDocente();
        List<BeanTablaBtcDocente> listaRegistrosBtcDocentes = miDao.consultarRegistrosBtcDocentes();
        return listaRegistrosBtcDocentes;
    }
}
