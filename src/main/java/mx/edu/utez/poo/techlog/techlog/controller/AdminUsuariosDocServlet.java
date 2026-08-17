package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaUsuarioDocente;

import java.io.IOException;
import java.util.List;

@WebServlet (name="AdminUsuariosDocServlet", value = "/usuarios-docentes-servlet")

public class AdminUsuariosDocServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaUsuarioDocente service = new ServiceTablaUsuarioDocente();
        List<BeanTablaUsuarioDocente> listaUsuariosDocentes = service.consultarUsuarioDocente();

        req.setAttribute("listaUsuariosDocentes", listaUsuariosDocentes);
        req.getRequestDispatcher("WEB-INF/vistas-admin/docente.jsp").forward(req, resp);
    }
}
