package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaBtcAlumnos {
    public List<BeanTablaBtcAlumnos> consultarRegistrosBtcAlumnos() {
        List<BeanTablaBtcAlumnos> listaRegistroBtcAlumnos = new ArrayList<>();
        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM REGISTRO_ALUMNO ORDER BY id_registro");
            while(rs.next()){
                BeanTablaBtcAlumnos registroBtcAlumno = new BeanTablaBtcAlumnos();
                registroBtcAlumno.setId(rs.getInt("ID_REGISTRO"));
                registroBtcAlumno.setMatricula(rs.getString("MATRICULA_USUARIO"));
                registroBtcAlumno.setNombre(rs.getString("PRIMER_NOMBRE_ALU"));
                registroBtcAlumno.setApellidoPaterno(rs.getString("APELLIDO_PATERNO_ALU"));
                registroBtcAlumno.setApellidoMaterno(rs.getString("APELLIDO_MATERNO_ALU"));
                registroBtcAlumno.setNombreDocente(rs.getString("NOMBRE_DOCENTE"));
                registroBtcAlumno.setFechaRegistro(rs.getDate("FECHA_REGISTRO"));
                registroBtcAlumno.setObservaciones(rs.getString("OBSERVACIONES"));

                listaRegistroBtcAlumnos.add(registroBtcAlumno);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return listaRegistroBtcAlumnos;
    }


}

