package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoAccionesAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;

public class ServiceAccionesAlumno {
    private DaoAccionesAlumno daoAccionesAlumno = new DaoAccionesAlumno();

    public boolean eliminarAlumno(int id) {
        if (id <= 0) {
            return false;
        }
        return daoAccionesAlumno.eliminar(id);
    }

    public boolean editarAlumno(BeanTablaBtcAlumnos alumno, int idOriginal) {
        if (idOriginal <= 0) {
            return false;
        }
        if (alumno.getMatricula() == null || alumno.getMatricula().trim().isEmpty() ||
                alumno.getNombre() == null || alumno.getNombre().trim().isEmpty() ||
                alumno.getNombreDocente() == null || alumno.getNombreDocente().trim().isEmpty()) {
            return false;
        }
        return daoAccionesAlumno.actualizar(alumno, idOriginal);
    }
}
