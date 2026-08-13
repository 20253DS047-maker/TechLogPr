package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroPC;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoRegistroPC {
    public boolean insertar(BeanRegistroPC registroPC) {
        String sql = "INSERT INTO REGISTRO_PC (salon_computo, docencia, numero_pc, modelo, isla_mesa, estado) VALUES (?, ?, ?, 'pendiente', '1', ?)";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, registroPC.getSalon_computo());
            ps.setString(2, registroPC.getDocencia());
            ps.setString(3, registroPC.getNumero_pc());
            ps.setString(4, registroPC.getEstado());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
