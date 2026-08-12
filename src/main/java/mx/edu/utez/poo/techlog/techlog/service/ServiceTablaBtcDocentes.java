package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcDocentes;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocentes;

import java.util.List;

public class ServiceTablaBtcDocentes {
    public List<BeanTablaBtcDocentes> consultarBtcDocentes() {
        DaoTablaBtcDocentes miDao = new DaoTablaBtcDocentes();
        List<BeanTablaBtcDocentes> listaRegistroBtcDocentes = miDao.consultarBtcDocentes();
        return listaRegistroBtcDocentes;
    }
}
