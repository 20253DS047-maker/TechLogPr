package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaPc;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoAccionesPc {

    public boolean eliminar(int id) {
        String sql = "DELETE FROM REGISTRO_PC WHERE ID = ?";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setInt(1, id);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(BeanTablaPc registroPc, int idOriginal) {
        String sql = "UPDATE REGISTRO_PC SET SALON_COMPUTO = ?, DOCENCIA = ?, NUMERO_PC = ?, MODELO = ?, ISLA_MESA = ?, ESTADO = ? WHERE ID = ?";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, registroPc.getSalonComputo());
            ps.setString(2, registroPc.getDocencia());
            ps.setString(3, registroPc.getNumeroPc());
            ps.setString(4, registroPc.getModelo());
            ps.setString(5, registroPc.getIslaMesa());
            ps.setString(6, registroPc.getEstado());
            ps.setInt(7, idOriginal);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean cambiarEstado(int id, String nuevoEstado) {
        String sql = "UPDATE REGISTRO_PC SET ESTADO = ? WHERE ID = ?";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, nuevoEstado);
            ps.setInt(2, id);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
