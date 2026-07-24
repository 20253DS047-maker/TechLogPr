package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="LoginAdminServlet", value ="/login-admin-servlet")

public class LoginAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getParameter("opcion_usuario");

        if("soyAdmin".equals(opcion)){
            req.getRequestDispatcher("WEB-INF/login-admin.jsp").forward(req, resp);
        } else if ("registrarUsuario".equals(opcion)){
            req.getRequestDispatcher("WEB-INF/login-docente.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
