package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesUsuarioAlumno;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EliminarUsuarioAlumnoServlet", value = "/eliminar-usuario-alumno-servlet")
public class EliminarUsuarioAlumnoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String matricula = req.getParameter("matricula");

        ServiceAccionesUsuarioAlumno service = new ServiceAccionesUsuarioAlumno();
        boolean eliminado = service.eliminarUsuario(matricula);

        if (eliminado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo eliminar el usuario\"}");
        }
    }
}
