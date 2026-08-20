package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaUsuarioAlumno;
import mx.edu.utez.poo.techlog.techlog.service.ServiceAccionesUsuarioAlumno;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditarUsuarioAlumnoServlet", value = "/editar-usuario-alumno-servlet")
public class EditarUsuarioAlumnoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String matriculaOriginal = req.getParameter("matricula_original");

        BeanTablaUsuarioAlumno usuario = new BeanTablaUsuarioAlumno();
        usuario.setNombre(req.getParameter("nombre"));
        usuario.setApellido(req.getParameter("apellido"));
        usuario.setUsername(req.getParameter("username"));

        ServiceAccionesUsuarioAlumno service = new ServiceAccionesUsuarioAlumno();
        boolean editado = service.editarUsuario(usuario, matriculaOriginal);

        if (!editado) {
            out.print("{\"success\": false, \"message\": \"No se pudo editar el usuario\"}");
            return;
        }

        // NUEVO: si el admin escribio una nueva contraseña, se hashea y reemplaza aparte.
        // Si el campo viene vacio, no se toca la contraseña actual.
        String nuevaPassword = req.getParameter("nueva_password");
        if (nuevaPassword != null && !nuevaPassword.trim().isEmpty()) {
            boolean passwordCambiada = service.cambiarPassword(matriculaOriginal, nuevaPassword);
            if (!passwordCambiada) {
                out.print("{\"success\": false, \"message\": \"Datos actualizados, pero no se pudo cambiar la contraseña\"}");
                return;
            }
        }

        out.print("{\"success\": true}");
    }
}
