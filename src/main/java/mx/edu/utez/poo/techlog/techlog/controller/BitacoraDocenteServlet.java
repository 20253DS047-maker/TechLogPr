package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraDocente;

import java.io.IOException;

@WebServlet(name = "BitacoraDocenteServlet", value = "/bitacora-docente-servlet")
public class BitacoraDocenteServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServiceBitacoraDocente serviceBitacoraDocente = new ServiceBitacoraDocente();

        String nombre = req.getParameter("nombre");
        String apellidoPaterno = req.getParameter("apellido_paterno");
        String apellidoMaterno = req.getParameter("apellido_materno");
        String area = req.getParameter("area");

        BeanBitacoraDocente nuevoDocenteBitacora  = new BeanBitacoraDocente(nombre, apellidoPaterno, apellidoMaterno, area);
        DaoBitacoraDocente daoDocenteBitacora = new DaoBitacoraDocente();
        boolean registrar = serviceBitacoraDocente.registrarDocenteBitacora(nuevoDocenteBitacora);

        if (registrar) {
            req.setAttribute("docenteBitacora", nuevoDocenteBitacora);
            req.getRequestDispatcher("WEB-INF/check-bitacoraDocente.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "No se pudo registrar al docente en la bitácora");
            req.getRequestDispatcher("WEB-INF/bitacora-docente.jsp").forward(req, resp);
        }

    }

}
