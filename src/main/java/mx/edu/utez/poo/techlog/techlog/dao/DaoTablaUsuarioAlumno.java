package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaUsuarioAlumno {
    public List<BeanTablaUsuarioAlumno> consultarUsuariosAlumnos() {
        List<BeanTablaUsuarioAlumno> listaUsuariosAlumnos = new ArrayList<>();
        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM USUARIO_ALUMNO");
            while(rs.next()){
                BeanTablaUsuarioAlumno usuarioAlumno = new BeanTablaUsuarioAlumno();
                usuarioAlumno.setMatricula(rs.getString("MATRICULA"));
                usuarioAlumno.setNombre(rs.getString("NOMBRE"));
                usuarioAlumno.setApellido(rs.getString("APELLIDO"));
                usuarioAlumno.setUsername(rs.getString("USERNAME"));
                listaUsuariosAlumnos.add(usuarioAlumno);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return listaUsuariosAlumnos;
    }
}
