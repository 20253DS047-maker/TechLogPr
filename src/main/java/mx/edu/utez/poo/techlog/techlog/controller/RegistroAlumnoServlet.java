package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroAlumno;
import mx.edu.utez.poo.techlog.techlog.service.ServiceRegistroAlumno;

import java.io.IOException;

@WebServlet(name = "RegistroAlumnoServlet", value = "/registro-alumno-servlet")
public class RegistroAlumnoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/registro-alumno.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String matricula = req.getParameter("matricula");
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String contrasena = req.getParameter("contrasena");
        String username = req.getParameter("username");

        BeanRegistroAlumno nuevoAlumno = new BeanRegistroAlumno(matricula, nombre, apellido, contrasena, username);
        ServiceRegistroAlumno serviceRegistroAlumno = new ServiceRegistroAlumno();

        // El servicio aplica HashUtils.sha256() a la contraseña en texto plano
        boolean guardado = serviceRegistroAlumno.registrarRegistroAlumno(nuevoAlumno);

        if (guardado) {
            req.setAttribute("alumno", nuevoAlumno);
            req.getRequestDispatcher("WEB-INF/check-alumno.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "No se pudo registrar el alumno. Revisa los campos.");
            req.getRequestDispatcher("WEB-INF/registro-alumno.jsp").forward(req, resp);
        }
    }
}
