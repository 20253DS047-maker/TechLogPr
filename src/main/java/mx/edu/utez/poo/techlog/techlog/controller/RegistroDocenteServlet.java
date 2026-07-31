package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.dao.DaoDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanDocente;
import mx.edu.utez.poo.techlog.techlog.service.ServiceDocente;

import java.io.IOException;

@WebServlet(name = "RegistroDocenteServlet", value="/registro-docente-servlet")
public class RegistroDocenteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("WEB-INF/registro-docente.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServiceDocente serviceDocente = new ServiceDocente();
        String nombre = req.getParameter("nombre");
        String apellidoPaterno = req.getParameter("apellido_paterno");
        String apellidoMaterno = req.getParameter("apellido_materno");
        String area = req.getParameter("area");
        String password = req.getParameter("password");


        BeanDocente nuevoDocente = new BeanDocente(nombre, apellidoPaterno, apellidoMaterno, area, password);
        DaoDocente dao = new DaoDocente();
        boolean guardado = serviceDocente.registrarDocente(nuevoDocente);
        if (guardado){

            req.setAttribute("docente", nuevoDocente);
            req.getRequestDispatcher("WEB-INF/check-docente.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "No se pudo registrar el docente");
            req.getRequestDispatcher("WEB-INF/bitacora-pc.jsp").forward(req, resp);
        }

    }
}
