package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesUsuarioDocente;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditarUsuarioDocenteServlet", value = "/editar-usuario-docente-servlet")
public class EditarUsuarioDocenteServlet extends HttpServlet {
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

        BeanTablaUsuarioDocente usuario = new BeanTablaUsuarioDocente();
        usuario.setUsername(req.getParameter("username"));
        usuario.setNombre(req.getParameter("nombre"));
        usuario.setApellidoPaterno(req.getParameter("apellido_paterno"));
        usuario.setApellidoMaterno(req.getParameter("apellido_materno"));
        usuario.setArea(req.getParameter("area"));

        ServiceAccionesUsuarioDocente service = new ServiceAccionesUsuarioDocente();
        boolean editado = service.editarUsuario(usuario, idOriginal);

        if (editado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo editar el usuario\"}");
        }
    }
}
