package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroAlumno;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoRegistroAlumno {
    public boolean insertar(BeanRegistroAlumno nuevoAlumno){
        String sql = "INSERT INTO USUARIO_ALUMNO (matricula, nombre, apellido, contraseña, username) VALUES (?, ?, ?, ?, ?) ";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, nuevoAlumno.getMatricula());
            ps.setString(2, nuevoAlumno.getNombre());
            ps.setString(3, nuevoAlumno.getApellido());
            ps.setString(4, nuevoAlumno.getContraseña());
            ps.setString(5, nuevoAlumno.getUsername());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
