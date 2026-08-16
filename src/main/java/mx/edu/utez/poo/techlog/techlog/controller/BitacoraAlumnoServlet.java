package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraAlumno;

import java.io.IOException;

@WebServlet (name="BitacoraAlumnoServlet", value="/bitacora-alumno-servlet")

public class BitacoraAlumnoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/bitacora-alumno.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServiceBitacoraAlumno serviceBitacoraAlumno = new ServiceBitacoraAlumno();
        String nombre_completo = req.getParameter("nombre_completo");
        String matricula_usuario = req.getParameter("matricula_usuario");
        String nombre_docente = req.getParameter("nombre_docente");
        String observaciones = req.getParameter("observaciones");

        BeanBitacoraAlumno registroAlumno = new BeanBitacoraAlumno(nombre_completo, matricula_usuario, nombre_docente, observaciones);

        DaoBitacoraAlumno dao = new DaoBitacoraAlumno();

        boolean guardado = serviceBitacoraAlumno.guardarRegistro(registroAlumno);
        if (guardado){
            req.setAttribute("bitacoraAlumno", registroAlumno);
            req.getRequestDispatcher("WEB-INF/vistas-admin/vistas-admin-registros/registros.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "No se pudo registrar en la bitacora");
            req.getRequestDispatcher("WEB-INF/vistas-admin/vistas-admin-registros/registros.jsp").forward(req, resp);
        }

    }
}

