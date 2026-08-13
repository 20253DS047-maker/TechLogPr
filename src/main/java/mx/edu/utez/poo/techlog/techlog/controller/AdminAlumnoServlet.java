package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaUsuarioAlumno;

import java.io.IOException;
import java.util.List;

@WebServlet (name="AdminAlumnoServlet", value="/admin-alumno-servlet")

public class AdminAlumnoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaUsuarioAlumno servicio = new ServiceTablaUsuarioAlumno();
        List<BeanTablaUsuarioAlumno> listaUsuariosAlumnos = servicio.consultarUsuariosAlumnos();

        req.setAttribute("listaUsuariosAlumnos", listaUsuariosAlumnos);
        req.getRequestDispatcher("WEB-INF/vistas-admin/registros.jsp").forward(req, resp);
    }
}
