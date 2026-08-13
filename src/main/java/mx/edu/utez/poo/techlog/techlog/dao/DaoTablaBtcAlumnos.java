package mx.edu.utez.poo.techlog.techlog.dao;

import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.util.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoTablaBtcAlumnos {
    public List<BeanTablaBtcAlumnos> consultarRegistroBtcAlum() {
        List <BeanTablaBtcAlumnos> listaRegistroBtcAlumno = new ArrayList<>();
        try(Connection conexion = Conexion.getConexion()){
            Statement statement = conexion.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM Registro_alumno");
            while(rs.next()){
                BeanTablaBtcAlumnos btcAlumnos = new BeanTablaBtcAlumnos();
                btcAlumnos.setId(rs.getInt("id_registro"));
                btcAlumnos.setMatricula_usuario(rs.getString("matricula_usuario"));
                btcAlumnos.setFechaEntrada(rs.getDate("fecha_hora_entrada"));
                btcAlumnos.setFechaSalida(rs.getDate("fecha_hora_salida"));
                btcAlumnos.setNombreDocente(rs.getString("nombre_docente"));
                btcAlumnos.setObservaciones(rs.getString("observaciones"));
                listaRegistroBtcAlumno.add(btcAlumnos);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return listaRegistroBtcAlumno;
    }
}
