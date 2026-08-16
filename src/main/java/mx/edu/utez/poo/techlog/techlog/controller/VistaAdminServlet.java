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

@WebServlet (name="VIstaAdminServlet", value="/vista-admin-servlet")

public class VistaAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaBtcAlumnos servicio = new ServiceTablaBtcAlumnos();
        List<BeanTablaBtcAlumnos> listaRegistroBtcAlumno = servicio.consultarRegistroBtcAlum();

        req.setAttribute("listaRegistroBtcAlumnos", listaRegistroBtcAlumno);
        req.getRequestDispatcher("WEB-INF/vistas-admin/registros.jsp").forward(req,resp);
    }
}

