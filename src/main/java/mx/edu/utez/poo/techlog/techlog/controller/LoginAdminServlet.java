package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAdmin;
import mx.edu.utez.poo.techlog.techlog.service.ServiceLoginAdmin;

import java.io.IOException;

@WebServlet(name = "LoginAdminServlet", value = "/login-admin-servlet")
public class LoginAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // Si ya tiene sesión abierta, lo redirige al panel directo
        if (session != null && session.getAttribute("adminLogueado") != null) {
            resp.sendRedirect(req.getContextPath() + "/vista-admin-servlet");
            return;
        }

        req.getRequestDispatcher("WEB-INF/login-admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usuario = req.getParameter("usuario");
        String contrasena = req.getParameter("contrasena");

        ServiceLoginAdmin serviceLoginAdmin = new ServiceLoginAdmin();
        BeanLoginAdmin admin = serviceLoginAdmin.autenticar(usuario, contrasena);

        if (admin != null) {
            // 1. Prevenir Session Fixation
            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            // 2. Crear sesión limpia y guardar el Bean
            HttpSession newSession = req.getSession(true);
            newSession.setAttribute("adminLogueado", admin);

            // Redirige directamente al Servlet que carga los registros de la tabla
            resp.sendRedirect(req.getContextPath() + "/vista-admin-servlet");
        } else {
            req.setAttribute("error", "Credenciales incorrectas.");
            req.getRequestDispatcher("WEB-INF/login-admin.jsp").forward(req, resp);
        }
    }
}