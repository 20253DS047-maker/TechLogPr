package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesAlumno;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditarAlumnoServlet", value = "/editar-alumno-servlet")
public class EditarAlumnoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        int idOriginal;
        try {
            idOriginal = Integer.parseInt(req.getParameter("id_original"));
        } catch (NumberFormatException | NullPointerException e) {
            out.print("{\"success\": false, \"message\": \"ID invalido\"}");
            return;
        }

        BeanTablaBtcAlumnos alumno = new BeanTablaBtcAlumnos();
        alumno.setMatricula(req.getParameter("matricula"));
        alumno.setNombre(req.getParameter("nombre"));
        alumno.setApellidoPaterno(req.getParameter("apellido_paterno"));
        alumno.setApellidoMaterno(req.getParameter("apellido_materno"));
        alumno.setNombreDocente(req.getParameter("nombre_docente"));
        alumno.setObservaciones(req.getParameter("observaciones"));

        ServiceAccionesAlumno service = new ServiceAccionesAlumno();
        boolean editado = service.editarAlumno(alumno, idOriginal);

        if (editado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo editar el registro\"}");
        }
    }
}
