package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraPc;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CambiarEstadoPCServlet", value = "/cambiar-estado-pc-servlet")
public class CambiarEstadoPCServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String numeroPc = req.getParameter("numero_pc");
        String estado = req.getParameter("estado");

        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        ServiceBitacoraPc service = new ServiceBitacoraPc();
        boolean cambiado = service.cambiarEstadoPc(numeroPc, estado);

        if (cambiado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo cambiar el estado\"}");
        }
    }
}
