package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraAlumno;

public class ServiceBitacoraAlumno {
    private DaoBitacoraAlumno DaoBitacoraAlumno = new DaoBitacoraAlumno();
    public boolean guardarRegistro(BeanBitacoraAlumno registroAlumno){

        if (registroAlumno.getNombre_docente() == null || registroAlumno.getNombre_docente().trim().isEmpty() ||
                registroAlumno.getMatricula_usuario() == null || registroAlumno.getMatricula_usuario().trim().isEmpty()){
            return false;
        }
        String regex = "^[0-9]{5}[a-zA-Z]{2}[0-9]{3}$";
        if(registroAlumno.getMatricula_usuario() == null || registroAlumno.getMatricula_usuario().trim().isEmpty() || !registroAlumno.getMatricula_usuario().matches(regex)){
            return false;
        }
        return DaoBitacoraAlumno.insertar(registroAlumno);
    }

}
