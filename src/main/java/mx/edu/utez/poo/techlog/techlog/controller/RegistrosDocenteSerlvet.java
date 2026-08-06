package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (name="RegistrosDocenteServlet", value="/registros-docente-servlet")

public class RegistrosDocenteSerlvet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/vista-docente/registros-docente.jsp").forward(req, resp);
    }
}
