package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaPc;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesPc;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditarPCServlet", value = "/editar-pc-servlet")
public class EditarPCServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        int idOriginal;
        try {
            idOriginal = Integer.parseInt(req.getParameter("id_original"));
        } catch (NumberFormatException | NullPointerException e) {
            out.print("{\"success\": false, \"message\": \"ID invalido\"}");
            return;
        }

        BeanTablaPc registroPc = new BeanTablaPc();
        registroPc.setSalonComputo(req.getParameter("salon_computo"));
        registroPc.setDocencia(req.getParameter("docencia"));
        registroPc.setNumeroPc(req.getParameter("numero_pc"));
        registroPc.setModelo(req.getParameter("modelo"));
        registroPc.setIslaMesa(req.getParameter("isla_mesa"));
        registroPc.setEstado(req.getParameter("estado"));

        ServiceAccionesPc service = new ServiceAccionesPc();
        boolean editado = service.editarPc(registroPc, idOriginal);

        if (editado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo editar el registro\"}");
        }
    }
}
