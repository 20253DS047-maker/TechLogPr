package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaBtcAlumnos;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "VistaAdminServlet", value = "/vista-admin-servlet")
public class VistaAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // Previene guardar la vista en caché (útil si presionan 'Atrás' en el navegador)
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        // 1. Validar que la sesión exista y tenga al admin autenticado
        if (session == null || session.getAttribute("adminLogueado") == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        // 2. Si la sesión es válida, carga la información
        ServiceTablaBtcAlumnos service = new ServiceTablaBtcAlumnos();
        List<BeanTablaBtcAlumnos> listaRegistroBtcAlumno = service.consultarRegistrosBtcAlumnos();

        req.setAttribute("listaRegistroBtcAlumnos", listaRegistroBtcAlumno);
        req.getRequestDispatcher("WEB-INF/vistas-admin/registros.jsp").forward(req, resp);
    }
}