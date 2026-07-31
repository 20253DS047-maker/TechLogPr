package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanDocente;

public class ServiceDocente {

    private DaoDocente DaoDocente = new DaoDocente();

    public boolean registrarDocente(BeanDocente nuevoDocente){

        if (nuevoDocente.getNombre() == null || nuevoDocente.getNombre().trim().isEmpty() ||
                nuevoDocente.getApellido_paterno() == null || nuevoDocente.getApellido_paterno().trim().isEmpty() ||
                nuevoDocente.getApellido_materno() == null || nuevoDocente.getApellido_materno().trim().isEmpty() ||
                nuevoDocente.getArea() == null || nuevoDocente.getArea().trim().isEmpty()){
            return false;
        }

        if (nuevoDocente.getPassword() == null || nuevoDocente.getPassword().trim().isEmpty() ||
                nuevoDocente.getPassword().length() > 10 ){
                return false;
        }

        return DaoDocente.insertar(nuevoDocente);
    }
}
