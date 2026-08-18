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
        String sql = "SELECT * FROM REGISTRO_ALUMNO WHERE id_registro = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    registro = new BeanTablaBtcAlumnos();
                    registro.setId(rs.getInt("id"));
                    registro.setNombre(rs.getString("nombre"));
                    registro.setNombreDocente(rs.getString("nombre_docente"));
                    registro.setObservaciones(rs.getString("observaciones"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return registro;
    }
}
