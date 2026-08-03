package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroAlumno;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoRegistroAlumno {
    public boolean insertar(BeanRegistroAlumno nuevoAlumno){
        System.out.println("--> Entrando al DAO a insertar alumno: " + nuevoAlumno.getMatricula());
        String sql = "INSERT INTO USUARIO_ALUMNO (matricula, nombre, apellido, contrasena, username) VALUES (?, ?, ?, ?, ?) ";
        try (Connection conexion = Conexion.getConexion();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, nuevoAlumno.getMatricula());
            ps.setString(2, nuevoAlumno.getNombre());
            ps.setString(3, nuevoAlumno.getApellido());
            ps.setString(4, nuevoAlumno.getContrasena());
            ps.setString(5, nuevoAlumno.getUsername());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
