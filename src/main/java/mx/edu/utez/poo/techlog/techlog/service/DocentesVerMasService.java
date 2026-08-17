package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoDocentesVerMas;
import mx.edu.utez.poo.techlog.techlog.dao.DaoTablaBtcDocentes;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocentes;
import java.util.List;

public class DocentesVerMasService {
    private final DaoDocentesVerMas dao = new DaoDocentesVerMas();
    private final DaoTablaBtcDocentes daoTablaBtcDocentes = new DaoTablaBtcDocentes();

    // Método para obtener todos los registros (Tabla)
    public List<BeanTablaBtcDocentes> consultarBtcDocentes() {
        return daoTablaBtcDocentes.consultarBtcDocentes();
    }

    // Método nuevo para obtener un solo registro por ID (Modal)
    public BeanTablaBtcDocentes consultarPorId(int id) {
        return dao.findById(id);
    }
}
