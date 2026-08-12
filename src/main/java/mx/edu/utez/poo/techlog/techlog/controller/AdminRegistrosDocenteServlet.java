package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocentes;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaBtcDocentes;

import java.io.IOException;
import java.util.List;

@WebServlet (name="AdminRegistrosDocenteServlet", value="/admin-registrosDocente-servlet")

public class AdminRegistrosDocenteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServiceTablaBtcDocentes servicio = new ServiceTablaBtcDocentes();
        List<BeanTablaBtcDocentes> listaRegistroBtcDocentes = servicio.consultarBtcDocentes();

        req.setAttribute("listaRegistroBtcDocente", listaRegistroBtcDocentes);
        req.getRequestDispatcher("WEB-INF/vistas-admin/registrodocente.jsp").forward(req, resp);
    }
}
