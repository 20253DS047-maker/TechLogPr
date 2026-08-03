package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoBitacoraDocente {
    public boolean insertar (BeanBitacoraDocente nuevoDocenteBitacora) {

        String sql = "INSERT INTO REGISTRO_DOCENTE (nombre, apellido_paterno, apellido_materno, area) VALUES (?, ?, ?, ?) ";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, nuevoDocenteBitacora.getNombre());
            ps.setString(2, nuevoDocenteBitacora.getApellido_paterno());
            ps.setString(3, nuevoDocenteBitacora.getApellido_materno());
            ps.setString(4, nuevoDocenteBitacora.getArea());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }
}
