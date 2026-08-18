package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.dao.DaoRegistroPC;
import mx.edu.utez.poo.techlog.techlog.dao.DaoRegistros;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraAlumno;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistro;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroPC;
import mx.edu.utez.poo.techlog.techlog.service.ServiceBitacoraAlumno;

import java.io.IOException;

@WebServlet("/registro-agregar-servlet")
public class RegistroAgregarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            ServiceBitacoraAlumno serviceBitacoraAlumno = new ServiceBitacoraAlumno();
            String nombre = req.getParameter("nombre");
            String apellido = req.getParameter("apellido");
            String matricula_usuario = req.getParameter("matricula_usuario");
            String nombre_docente = req.getParameter("nombre_docente");
            String observaciones = req.getParameter("observaciones");

            BeanBitacoraAlumno registroAlumno = new BeanBitacoraAlumno(matricula_usuario, nombre, apellido, nombre_docente, observaciones);
            DaoBitacoraAlumno dao = new DaoBitacoraAlumno();
            boolean guardado = serviceBitacoraAlumno.guardarRegistro(registroAlumno);

            if (guardado){
                req.setAttribute("bitacoraAlumno", registroAlumno);
                req.getRequestDispatcher("WEB-INF/check-alumno.jsp").forward(req, resp);
            }else {
                req.setAttribute("error", "No se pudo registrar en la bitacora");
                req.getRequestDispatcher("WEB-INF/vistas-admin/registros.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "No se pudo registrar en la bitacora");
            req.getRequestDispatcher("WEB-INF/vistas-admin/registros.jsp").forward(req, resp);
        }
    }
}
