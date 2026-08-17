package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaBtcDocente;

import java.io.IOException;
import java.util.List;

@WebServlet (name="AdminRegistrosDocenteServlet", value="/admin-registrosDocente-servlet")

public class AdminRegistrosDocenteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaBtcDocente service = new ServiceTablaBtcDocente();
        List<BeanTablaBtcDocente> listaRegistrosBtcDocentes = service.consultarRegistrosBtcDocentes();

        req.setAttribute("listaRegistrosBtcDocentes", listaRegistrosBtcDocentes);
        req.getRequestDispatcher("WEB-INF/vistas-admin/registrodocente.jsp").forward(req, resp);
    }
}
