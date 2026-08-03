package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraPc;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraPc;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraPc;

import java.io.IOException;

@WebServlet(name="BitacoraPcServlet", value = "/bitacora-pc-servlet")

public class BitacoraPcServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServiceBitacoraPc serviceBitacoraPc = new ServiceBitacoraPc();
        String salon_computo = req.getParameter("salon_computo");
        String docencia = req.getParameter("docencia");
        String numero_pc = req.getParameter("numero_pc");
        String modelo = req.getParameter("modelo");
        String isla_mesa = req.getParameter("isla_mesa");
        String estado = req.getParameter("estado");

        BeanBitacoraPc registroPc = new BeanBitacoraPc(salon_computo, docencia,numero_pc, modelo, isla_mesa, estado);
        DaoBitacoraPc dao = new DaoBitacoraPc();
        boolean guardado = serviceBitacoraPc.registrarPc(registroPc);
        if (guardado){
            req.setAttribute("Pc", registroPc);
            req.getRequestDispatcher("WEB-INF/check-bitacora.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "No se pudo registrar en la bitacora");
            req.getRequestDispatcher("WEB-INF/tipo-user.jsp").forward(req, resp);
        }

    }
}
