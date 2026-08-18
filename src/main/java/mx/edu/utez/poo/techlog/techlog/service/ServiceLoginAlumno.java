package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceLoginAlumno {

    public DaoLoginAlumno daoLoginAlumno = new DaoLoginAlumno();

    public BeanLoginAlumno autenticar(String nombre, String apellido, String matricula, String contrasena) {

        // CORREGIDO: Se remueve la validacion obligatoria de nombre y apellido para el Login.
        // Solo se valida que matricula y contrasena contengan datos.
        if (matricula == null || matricula.trim().isEmpty() ||
                contrasena == null || contrasena.trim().isEmpty()) {
            return null;
        }

        String regexMatricula = "^[0-9]{5}[a-zA-Z]{2}[0-9]{3}$";
        if (!matricula.trim().matches(regexMatricula)) {
            System.out.println("La matrícula no cumple con el formato requerido: " + matricula);
            return null;
        }

        BeanLoginAlumno alumno = daoLoginAlumno.findByMatricula(matricula.trim());

        if (alumno == null) {
            System.out.println("No se encontró ningún alumno con la matrícula: " + matricula);
            return null;
        }

        String hashIngresado = HashUtils.sha256(contrasena.trim());

        System.out.println("Hash ingresado: " + hashIngresado);
        System.out.println("Hash en BD:        " + alumno.getContrasena());
        System.out.println("Matricula ingresada: " + matricula);
        System.out.println("Matricula en BD:        " + alumno.getMatricula());

        // Comparación segura ignorando mayúsculas/minúsculas y eliminando espacios en blanco (.trim())
        if (hashIngresado != null && alumno.getContrasena() != null
                && hashIngresado.equalsIgnoreCase(alumno.getContrasena().trim())) {
            return alumno;
        }

        return null;
    }
}
