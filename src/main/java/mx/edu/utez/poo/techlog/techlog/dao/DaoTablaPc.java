package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaPc;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaPc {
    public List<BeanTablaPc> consultarRegistrosPc(){
        List<BeanTablaPc> listaRegistrosPC = new ArrayList<>();

        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM REGISTRO_PC ORDER BY id ASC");
            while(rs.next()){
                BeanTablaPc registroPc = new BeanTablaPc();
                registroPc.setId(rs.getInt("ID"));
                registroPc.setIdRegistroAlumno(rs.getInt("ID_REGISTRO"));
                registroPc.setSalonComputo(rs.getString("SALON_COMPUTO"));
                registroPc.setDocencia(rs.getString("DOCENCIA"));
                registroPc.setNumeroPc(rs.getString("NUMERO_PC"));
                registroPc.setModelo(rs.getString("MODELO"));
                registroPc.setIslaMesa(rs.getString("ISLA_MESA"));
                registroPc.setEstado(rs.getString("ESTADO"));
                registroPc.setFechaRegistro(rs.getDate("FECHA_REGISTRO"));

                listaRegistrosPC.add(registroPc);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return listaRegistrosPC;
    }
}
