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
                usuarioAlumno.setMatricula(rs.getString("matricula"));
                usuarioAlumno.setNombre(rs.getString("nombre"));
                usuarioAlumno.setApellido(rs.getString("apellido"));
                usuarioAlumno.setUsername(rs.getString("username"));
                usuarioAlumno.setContrasena(rs.getString("contrasena"));
                listaUsuariosAlumnos.add(usuarioAlumno);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return listaUsuariosAlumnos;
    }
}
