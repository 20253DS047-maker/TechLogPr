package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocentes;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaBtcDocentes {
    public List<BeanTablaBtcDocentes> consultarBtcDocentes() {
        List <BeanTablaBtcDocentes> listaRegistroBtcDocentes = new ArrayList<>();

        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM REGISTRO_DOCENTE");
            while(rs.next()){
                BeanTablaBtcDocentes btcDocente = new BeanTablaBtcDocentes();
                btcDocente.setId(rs.getInt("id"));
                btcDocente.setNombre(rs.getString("nombre"));
                btcDocente.setApellidoPaterno(rs.getString("apellido_paterno"));
                btcDocente.setApellidoMaterno(rs.getString("apellido_materno"));
                btcDocente.setArea(rs.getString("area"));

                listaRegistroBtcDocentes.add(btcDocente);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return listaRegistroBtcDocentes;
    }
}
