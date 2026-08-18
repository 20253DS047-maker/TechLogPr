package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoAlumnosVerMas {

    public BeanTablaBtcAlumnos findById(int id) {
        BeanTablaBtcAlumnos registro = null;
        String sql = "SELECT * FROM REGISTRO_DOCENTE WHERE id = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    registro = new BeanTablaBtcAlumnos();
                    registro.setId(rs.getInt("id"));
                    registro.setNombre(rs.getString("nombre"));
                    registro.setApellidoPaterno(rs.getString("apellido_paterno"));
                    registro.setApellidoMaterno(rs.getString("apellido_materno"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return registro;
    }
}
