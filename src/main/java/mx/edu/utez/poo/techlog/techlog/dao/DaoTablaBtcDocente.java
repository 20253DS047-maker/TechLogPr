package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaBtcDocente {

    public List<BeanTablaBtcDocente> consultarRegistrosBtcDocentes(){
        List<BeanTablaBtcDocente> listaRegistrosBtcDocentes = new ArrayList<>();
        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM REGISTRO_DOCENTE ORDER BY id ASC");
            while(rs.next()){
                BeanTablaBtcDocente registroDocente = new BeanTablaBtcDocente();
                registroDocente.setId(rs.getInt("ID"));
                registroDocente.setNombre(rs.getString("NOMBRE"));
                registroDocente.setApellidoPaterno(rs.getString("APELLIDO_PATERNO"));
                registroDocente.setApellidoMaterno(rs.getString("APELLIDO_MATERNO"));
                registroDocente.setArea(rs.getString("AREA"));
                registroDocente.setFechaRegistro(rs.getDate("FECHA_REGISTRO"));
                listaRegistrosBtcDocentes.add(registroDocente);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return listaRegistrosBtcDocentes;
    }
}
