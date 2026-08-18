package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoDocentesVerMas;
import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;
import java.util.List;

public class DocentesVerMasService {
    private final DaoDocentesVerMas dao = new DaoDocentesVerMas();
    private final DaoTablaBtcDocente daoTablaBtcDocente = new DaoTablaBtcDocente();


    public List<BeanTablaBtcDocente> consultarBtcDocentes() {
        return daoTablaBtcDocente.consultarRegistrosBtcDocentes();
    }

    public BeanTablaBtcDocente consultarPorId(int id) {
        return dao.findById(id);
    }
}