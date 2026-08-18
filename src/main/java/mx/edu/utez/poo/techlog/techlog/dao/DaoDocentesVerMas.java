package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoDocentesVerMas {
    public BeanTablaBtcDocente findById(int id) {
        BeanTablaBtcDocente registro = null;
        String sql = "SELECT * FROM REGISTRO_DOCENTE WHERE id = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    registro = new BeanTablaBtcDocente();
                    registro.setId(rs.getInt("id"));
                    registro.setNombre(rs.getString("nombre"));
                    registro.setApellidoPaterno(rs.getString("apellido_paterno"));
                    registro.setApellidoMaterno(rs.getString("apellido_materno"));
                    registro.setArea(rs.getString("area"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return registro;
    }
}