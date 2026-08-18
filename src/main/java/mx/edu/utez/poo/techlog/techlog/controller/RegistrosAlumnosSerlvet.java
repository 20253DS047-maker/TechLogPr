package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaBtcAlumnos;

import java.io.IOException;
import java.util.List;

@WebServlet (name="RegistrosAlumnosServlet", value="/registros-alumnos-servlet")
public class RegistrosAlumnosSerlvet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaBtcAlumnos service = new ServiceTablaBtcAlumnos();
        List<BeanTablaBtcAlumnos> listaRegistroBtcAlumnos = service.consultarRegistrosBtcAlumnos();

        req.setAttribute("listaRegistroBtcAlumnos", listaRegistroBtcAlumnos);
        req.getRequestDispatcher("WEB-INF/vista-docente/registros-docente.jsp").forward(req, resp);
    }
}
