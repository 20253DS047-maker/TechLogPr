package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraPc;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraPc;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditarPCServlet", value = "/editar-pc-servlet")
public class EditarPCServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String numeroPcOriginal = req.getParameter("numero_pc_original");
        String salonComputo = req.getParameter("salon_computo");
        String docencia = req.getParameter("docencia");
        String numeroPc = req.getParameter("numero_pc");
        String modelo = req.getParameter("modelo");
        String islaMesa = req.getParameter("isla_mesa");
        String estado = req.getParameter("estado");

        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        BeanBitacoraPc registroPc = new BeanBitacoraPc(salonComputo, docencia, numeroPc, modelo, islaMesa, estado);

        ServiceBitacoraPc service = new ServiceBitacoraPc();
        boolean editado = service.editarPc(registroPc, numeroPcOriginal);

        if (editado) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"message\": \"No se pudo editar el registro\"}");
        }
    }
}
