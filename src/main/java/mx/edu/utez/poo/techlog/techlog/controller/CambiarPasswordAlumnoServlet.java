package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesUsuarioAlumno;

import java.io.IOException;
import java.io.PrintWriter;

// Servlet EXCLUSIVO para el docente: solo puede cambiar la contraseña de un alumno.
// A diferencia de EditarUsuarioAlumnoServlet (uso del admin), este NO recibe
// ni toca nombre, apellido ni username. Solo matricula + nueva_password.
@WebServlet(name = "CambiarPasswordAlumnoServlet", value = "/cambiar-password-alumno-servlet")
public class CambiarPasswordAlumnoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        // TODO (opcional): si tienes sesion de docente, valida aqui antes de continuar, ej:
        // if (req.getSession().getAttribute("docente") == null) {
        //     resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        //     out.print("{\"success\": false, \"message\": \"Sesion no valida\"}");
        //     return;
        // }

        String matricula = req.getParameter("matricula");
        String nuevaPassword = req.getParameter("nueva_password");

        if (matricula == null || matricula.trim().isEmpty()) {
            out.print("{\"success\": false, \"message\": \"Matricula invalida\"}");
            return;
        }
        if (nuevaPassword == null || nuevaPassword.trim().isEmpty()) {
            out.print("{\"success\": false, \"message\": \"La nueva contrasena no puede estar vacia\"}");
            return;
        }

        ServiceAccionesUsuarioAlumno service = new ServiceAccionesUsuarioAlumno();
        boolean cambiada = service.cambiarPassword(matricula, nuevaPassword);

        if (!cambiada) {
            out.print("{\"success\": false, \"message\": \"No se pudo cambiar la contrasena\"}");
            return;
        }

        out.print("{\"success\": true}");
    }
}
