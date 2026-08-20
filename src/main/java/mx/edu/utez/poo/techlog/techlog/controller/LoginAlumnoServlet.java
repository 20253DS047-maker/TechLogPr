package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceLoginAlumno;

import java.io.IOException;

@WebServlet (name="LoginAlumnoServlet", value="/login-alumno-servlet")

public class LoginAlumnoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/login-alumno.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usuario = req.getParameter("usuario");
        String contrasena = req.getParameter("contrasena");

        ServiceLoginAlumno serviceLoginAlumno = new ServiceLoginAlumno();
        BeanLoginAlumno alumno = serviceLoginAlumno.autenticar(usuario,contrasena);

        if (alumno != null) {
            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            HttpSession newSession = req.getSession(true);
            newSession.setAttribute("alumnoLogueado", alumno);

            req.getRequestDispatcher("WEB-INF/bitacora-alumno.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "Credenciales incorrectas.");
            req.getRequestDispatcher("WEB-INF/login-alumno.jsp").forward(req, resp);
        }
    }
}
