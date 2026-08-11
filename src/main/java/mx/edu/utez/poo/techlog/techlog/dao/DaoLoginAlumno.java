package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoLoginAlumno {
    public BeanLoginAlumno login(String nombre, String apellido, String matricula, String contrasena) {
        BeanLoginAlumno alumno = null;
        String sql = "SELECT * FROM USUARIO_ALUMNO WHERE UPPER(NOMBRE) = UPPER(?) AND UPPER(APELLIDO) = UPPER(?) AND MATRICULA = ? AND CONTRASENA = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, matricula);
            ps.setString(4, contrasena);

            try (ResultSet rs = ps.executeQuery()){
                if (rs.next()){
                    alumno = new BeanLoginAlumno();
                    alumno.setNombre(rs.getString("NOMBRE"));
                    alumno.setApellido(rs.getString("APELLIDO"));
                    alumno.setMatricula(rs.getString("MATRICULA"));
                    alumno.setContrasena(rs.getString("CONTRASENA"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alumno;
        }
    }

