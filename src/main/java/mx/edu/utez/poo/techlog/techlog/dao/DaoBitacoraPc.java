package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraPc;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoBitacoraPc {
    public boolean insertar(BeanBitacoraPc registroPc){
        String sql = "INSERT INTO REGISTRO_PC (salon_computo, docencia, numero_pc, modelo, isla_mesa, estado) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)){

            ps.setString(1, registroPc.getSalon_computo());
            ps.setString(2, registroPc.getDocencia());
            ps.setString(3, registroPc.getNumero_pc());
            ps.setString(4, registroPc.getModelo());
            ps.setString(5, registroPc.getIsla_mesa());
            ps.setString(6, registroPc.getEstado());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // AGREGADO: lista todos los registros para la tabla
    public List<BeanBitacoraPc> listar() {
        List<BeanBitacoraPc> lista = new ArrayList<>();
        String sql = "SELECT salon_computo, docencia, numero_pc, modelo, isla_mesa, estado FROM REGISTRO_PC";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BeanBitacoraPc pc = new BeanBitacoraPc(
                        rs.getString("salon_computo"),
                        rs.getString("docencia"),
                        rs.getString("numero_pc"),
                        rs.getString("modelo"),
                        rs.getString("isla_mesa"),
                        rs.getString("estado")
                );
                lista.add(pc);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // AGREGADO: elimina un registro por numero_pc
    public boolean eliminar(String numeroPc) {
        String sql = "DELETE FROM REGISTRO_PC WHERE numero_pc = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, numeroPc);

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // AGREGADO: actualiza un registro. numeroPcOriginal identifica la fila a modificar
    // (por si el usuario cambia el numero_pc en el propio formulario de edicion)
    public boolean actualizar(BeanBitacoraPc registroPc, String numeroPcOriginal) {
        String sql = "UPDATE REGISTRO_PC SET salon_computo = ?, docencia = ?, numero_pc = ?, modelo = ?, isla_mesa = ?, estado = ? WHERE numero_pc = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, registroPc.getSalon_computo());
            ps.setString(2, registroPc.getDocencia());
            ps.setString(3, registroPc.getNumero_pc());
            ps.setString(4, registroPc.getModelo());
            ps.setString(5, registroPc.getIsla_mesa());
            ps.setString(6, registroPc.getEstado());
            ps.setString(7, numeroPcOriginal);

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // AGREGADO: cambia unicamente el estado (activo/inactivo) de un PC
    public boolean cambiarEstado(String numeroPc, String nuevoEstado) {
        String sql = "UPDATE REGISTRO_PC SET estado = ? WHERE numero_pc = ?";

        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, nuevoEstado);
            ps.setString(2, numeroPc);

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
