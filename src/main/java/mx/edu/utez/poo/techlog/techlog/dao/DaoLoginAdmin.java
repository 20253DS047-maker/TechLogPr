package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAdmin;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoLoginAdmin {
    public BeanLoginAdmin findByUsuario(String usuario) {

        BeanLoginAdmin admin = null;
        String sql = "SELECT * FROM ADMIN WHERE UPPER(USUARIO) = UPPER(?)";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, usuario);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = new BeanLoginAdmin();
                    admin.setUsuario(rs.getString("USUARIO"));
                    admin.setContrasena(rs.getString("CONTRASENA"));
                    admin.setNombre(rs.getString("NOMBRE"));
                    admin.setApellido(rs.getString("APELLIDO"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
    }
}