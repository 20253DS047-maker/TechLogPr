package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;

public class ServiceLoginAlumno {

    public DaoLoginAlumno daoLoginAlumno = new DaoLoginAlumno();

    public BeanLoginAlumno autenticar(String nombre, String apellido, String matricula, String contrasena) {

        if (nombre.trim().isEmpty() || nombre == null || apellido.trim().isEmpty() || apellido == null){
            return null;
        }
        String regexMatricula = "^[0-9]{5}[a-zA-Z]{2}[0-9]{3}$";
        if (contrasena.length() > 5 || contrasena.trim().isEmpty() || contrasena == null || matricula == null || matricula.trim().isEmpty() ||
           !matricula.matches(regexMatricula)){
            return null;
        }

        return daoLoginAlumno.login(nombre.trim(), apellido.trim(), matricula.trim(), contrasena.trim());
    }
}
