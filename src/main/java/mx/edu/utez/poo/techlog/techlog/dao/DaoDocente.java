package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class DaoDocente {
    public boolean insertar(BeanDocente nuevoDocente){
        String sql = "INSERT INTO DOCENTE (nombre, apellido_paterno, apellido_materno, area) VALUES (?, ?, ?, ?) ";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, nuevoDocente.getNombre());
            ps.setString(2, nuevoDocente.getApellido_paterno());
            ps.setString(3, nuevoDocente.getApellido_materno());
            ps.setString(4, nuevoDocente.getArea());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
