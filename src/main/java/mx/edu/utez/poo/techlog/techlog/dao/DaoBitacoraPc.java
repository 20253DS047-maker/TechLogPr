package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraPc;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
