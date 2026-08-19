package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceLoginAlumno {

    public DaoLoginAlumno daoLoginAlumno = new DaoLoginAlumno();

    public BeanLoginAlumno autenticar(String usuario, String contrasena) {

        // CORREGIDO: Se remueve la validacion obligatoria de nombre y apellido para el Login.
        // Solo se valida que matricula y contrasena contengan datos.
        if (usuario == null || usuario.trim().isEmpty() ||
                contrasena == null || contrasena.trim().isEmpty()) {
            return null;
        }

        BeanLoginAlumno alumno = daoLoginAlumno.findByUsuario(usuario.trim());

        if (alumno == null) {
            System.out.println("No se encontró ningún alumno con el usuario: " + usuario);
            return null;
        }

        String hashIngresado = HashUtils.sha256(contrasena.trim());

        System.out.println("Hash ingresado: " + hashIngresado);
        System.out.println("Hash en BD:        " + alumno.getContrasena());

        // Comparación segura ignorando mayúsculas/minúsculas y eliminando espacios en blanco (.trim())
        if (hashIngresado != null && alumno.getContrasena() != null
                && hashIngresado.equalsIgnoreCase(alumno.getContrasena().trim())) {
            return alumno;
        }

        return null;
    }
}
