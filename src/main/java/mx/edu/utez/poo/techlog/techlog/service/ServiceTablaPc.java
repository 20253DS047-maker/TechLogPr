package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaPc;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaPc;

import java.util.List;

public class ServiceTablaPc {
    public List<BeanTablaPc> consultarRegistrosPc(){
        DaoTablaPc miDao = new DaoTablaPc();
        List<BeanTablaPc> listaRegistrosPC = miDao.consultarRegistrosPc();
        return listaRegistrosPC;
    }
}
