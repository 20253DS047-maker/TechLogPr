package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaPc;
import mx.edu.utez.poo.techlog.techlog.service.ServiceTablaPc;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegistrosPCServlet", value = "/admin-pc-servlet")

public class AdminPCServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceTablaPc service = new ServiceTablaPc();
        List<BeanTablaPc> listaRegistrosPC = service.consultarRegistrosPc();

        req.setAttribute("listaRegistrosPC", listaRegistrosPC);
        req.getRequestDispatcher("WEB-INF/vistas-admin/registros-PC.jsp").forward(req,resp);
    }
}
