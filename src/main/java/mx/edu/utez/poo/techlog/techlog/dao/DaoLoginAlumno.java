package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoLoginAlumno {
    public BeanLoginAlumno findByUsuario(String usuario) {
        BeanLoginAlumno alumno = null;
        String sql = "SELECT * FROM USUARIO_ALUMNO WHERE USERNAME = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, usuario);

            try (ResultSet rs = ps.executeQuery()){
                if (rs.next()){
                    alumno = new BeanLoginAlumno();
                    alumno.setUsuario(rs.getString("USERNAME"));
                    alumno.setContrasena(rs.getString("CONTRASENA"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alumno;
        }
    }

