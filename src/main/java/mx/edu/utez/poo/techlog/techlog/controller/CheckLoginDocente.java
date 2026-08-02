package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.HelloServlet;

import java.io.IOException;

@WebServlet(name = "CheckLoginDocente", value = "/checkLogin-docente-servlet")
public class CheckLoginDocente extends HelloServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/checkLogin-docente.jsp").forward(req, resp);
    }
}
