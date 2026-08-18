package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesDocente;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditarDocenteServlet", value = "/editar-docente-servlet")
public class EditarDocenteServlet extends HttpServlet {
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

        BeanTablaBtcDocente docente = new BeanTablaBtcDocente();
        docente.setNombre(req.getParameter("nombre"));
        docente.setApellidoPaterno(req.getParameter("apellido_paterno"));
        docente.setApellidoMaterno(req.getParameter("apellido_materno"));
        docente.setArea(req.getParameter("area"));

        ServiceAccionesDocente service = new ServiceAccionesDocente();
        boolean editado = service.editarDocente(docente, idOriginal);

        if (editado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo editar el registro\"}");
        }
    }
}
