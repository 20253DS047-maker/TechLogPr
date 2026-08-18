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

@WebServlet(name="UsuariosAlumnosServlet", value="/usuarios-Alumno-servlet" )
public class UsuariosAlumnosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaUsuarioAlumno service = new ServiceTablaUsuarioAlumno();
        List<BeanTablaUsuarioAlumno> listaUsuariosAlumnos = service.consultarUsuariosAlumnos();

        req.setAttribute("listaUsuariosAlumnos", listaUsuariosAlumnos);
        req.getRequestDispatcher("WEB-INF/vista-docente/vistaAlumnos.jsp").forward(req,resp);
    }
}
