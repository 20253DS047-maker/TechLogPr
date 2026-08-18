package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoAccionesAlumno {

    public boolean eliminar(int id) {
        String sql = "DELETE FROM REGISTRO_ALUMNO WHERE ID_REGISTRO = ?";
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

    // Actualiza solo los campos que existen en REGISTRO_ALUMNO (matricula, nombre, apellidos, docente, observaciones)
    public boolean actualizar(BeanTablaBtcAlumnos alumno, int idOriginal) {
        String sql = "UPDATE REGISTRO_ALUMNO SET MATRICULA_USUARIO = ?, PRIMER_NOMBRE_ALU = ?, APELLIDO_PATERNO_ALU = ?, APELLIDO_MATERNO_ALU = ?, NOMBRE_DOCENTE = ?, OBSERVACIONES = ? WHERE ID_REGISTRO = ?";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, alumno.getMatricula());
            ps.setString(2, alumno.getNombre());
            ps.setString(3, alumno.getApellidoPaterno());
            ps.setString(4, alumno.getApellidoMaterno());
            ps.setString(5, alumno.getNombreDocente());
            ps.setString(6, alumno.getObservaciones());
            ps.setInt(7, idOriginal);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
