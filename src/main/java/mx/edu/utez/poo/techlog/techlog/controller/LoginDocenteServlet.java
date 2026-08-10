package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceLoginDocente;

import java.io.IOException;

@WebServlet (name="LoginDocenteServlet", value="/login-docente-servlet")
public class LoginDocenteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/login-docente.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        ServiceLoginDocente serviceLoginDocente = new ServiceLoginDocente();
        BeanLoginDocente docente = serviceLoginDocente.autenticar(username, password);

        if (docente != null) {
            // 1. Prevenir Session Fixation
            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            // 2. Crear sesión limpia y guardar el Bean
            HttpSession newSession = req.getSession(true);
            newSession.setAttribute("docenteLogueado", docente);

            req.getRequestDispatcher("WEB-INF/vista-docente/registros-docente.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "Credenciales incorrectas.");
            req.getRequestDispatcher("WEB-INF/login-docente.jsp").forward(req, resp);
        }
    }
}