package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesAlumno;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EliminarAlumnoServlet", value = "/eliminar-alumno-servlet")
public class EliminarAlumnoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        int id;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        } catch (NumberFormatException | NullPointerException e) {
            out.print("{\"success\": false, \"message\": \"ID invalido\"}");
            return;
        }

        ServiceAccionesAlumno service = new ServiceAccionesAlumno();
        boolean eliminado = service.eliminarAlumno(id);

        if (eliminado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo eliminar el registro\"}");
        }
    }
}
