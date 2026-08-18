package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoBitacoraAlumno {
    public boolean insertar(BeanBitacoraAlumno registroAlumno){
        String sql = "INSERT INTO REGISTRO_ALUMNO (matricula_usuario, primer_nombre_alu, apellido_paterno_alu, fecha_registro, " +
                "nombre_docente, observaciones) VALUES (?, ?, ?, SYSDATE, ?, ?)";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, registroAlumno.getMatricula_usuario());
            ps.setString(2, registroAlumno.getNombre());
            ps.setString(3, registroAlumno.getApellido());
            ps.setString(4, registroAlumno.getNombre_docente());
            ps.setString(5, registroAlumno.getObservaciones());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
