package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceLoginAlumno {

    public DaoLoginAlumno daoLoginAlumno = new DaoLoginAlumno();

    public BeanLoginAlumno autenticar(String nombre, String apellido, String matricula, String contrasena) {

        if (nombre == null || nombre.trim().isEmpty() || apellido == null || apellido.trim().isEmpty() || matricula == null || matricula.trim().isEmpty() ||
                contrasena == null || contrasena.trim().isEmpty()) {
            return null;
        }
        String regexMatricula = "^[0-9]{5}[a-zA-Z]{2}[0-9]{3}$";
        if (!matricula.trim().matches(regexMatricula)) {
            return null;
        }

        BeanLoginAlumno alumno = daoLoginAlumno.findByMatricula(matricula.trim());

        if (alumno != null) {
            String hashIngresado = HashUtils.sha256(contrasena.trim());

            if (hashIngresado.equalsIgnoreCase(alumno.getContrasena())) {

                if (alumno.getNombre().equalsIgnoreCase(nombre.trim()) &&
                        alumno.getApellido().equalsIgnoreCase(apellido.trim())) {
                    return alumno;
                }
            }
        }

        return null;
    }
}
