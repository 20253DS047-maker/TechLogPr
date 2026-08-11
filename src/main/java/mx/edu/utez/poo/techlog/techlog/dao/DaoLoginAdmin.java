package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoLoginAdmin {
    public String login(String nombre, String contrasena) {

        String admin = null;
        String sql = "SELECT * FROM ADMIN WHERE UPPER(NOMBRE) = UPPER(?) AND CONTRASENA = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
                ps.setString(1, nombre);
                ps.setString(2, contrasena);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = rs.getString("NOMBRE");
                    admin = rs.getString("CONTRASENA");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;

    }
}
