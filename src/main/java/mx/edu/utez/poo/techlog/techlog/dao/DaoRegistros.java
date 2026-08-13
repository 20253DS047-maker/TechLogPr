package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanRegistro;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoRegistros {
    public boolean insertar(BeanRegistro registro){
        String sql = "INSERT INTO REGISTRO_ALUMNO (matricula_usuario, fecha_hora_entrada, " +
                "nombre_docente) VALUES (?, ?, ?)";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, registro.getMatricula_usuario());
            ps.setString(2, registro.getFecha_hora_entrada());
            ps.setString(3, registro.getNombre_docente());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
