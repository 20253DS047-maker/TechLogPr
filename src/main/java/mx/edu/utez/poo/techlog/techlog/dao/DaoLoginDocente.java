
package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoLoginDocente {

    public BeanLoginDocente login(String username, String password) {
        BeanLoginDocente docente = null;
        String sql = "SELECT * FROM USUARIO_DOCENTE WHERE USERNAME = ?  AND PASSWORD = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    docente = new BeanLoginDocente();
                    docente.setUsername(rs.getString("USERNAME"));
                    docente.setPassword(rs.getString("PASSWORD"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return docente;
    }
}