package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaUsuarioDocente {
    public List<BeanTablaUsuarioDocente> consultarUsuarioDocente() {
        List<BeanTablaUsuarioDocente> listaUsuariosDocentes = new ArrayList<>();
        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM USUARIO_DOCENTE ORDER BY id_docente");
            while(rs.next()){
                BeanTablaUsuarioDocente usuarioDocente = new BeanTablaUsuarioDocente();
                usuarioDocente.setId(rs.getInt("ID_DOCENTE"));
                usuarioDocente.setNombre(rs.getString("NOMBRE"));
                usuarioDocente.setApellidoPaterno(rs.getString("APELLIDO_PATERNO"));
                usuarioDocente.setApellidoMaterno(rs.getString("APELLIDO_MATERNO"));
                usuarioDocente.setArea(rs.getString("AREA"));
                usuarioDocente.setUsername(rs.getString("USERNAME"));
                listaUsuariosDocentes.add(usuarioDocente);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return listaUsuariosDocentes;
    }
}
