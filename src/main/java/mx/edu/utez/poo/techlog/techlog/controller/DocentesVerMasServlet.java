package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcDocentes;
import mx.edu.utez.poo.techlog.techlog.service.DocentesVerMasService;
import com.google.gson.Gson;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/DocentesVerMasServlet")
public class DocentesVerMasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        DocentesVerMasService servicio = new DocentesVerMasService();

        if ("getDetalle".equals(action)) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            try {
                String idParam = req.getParameter("id");

                // Validar que el parámetro ID no venga nulo ni vacío
                if (idParam != null && !idParam.trim().isEmpty()) {
                    int id = Integer.parseInt(idParam);
                    BeanTablaBtcDocentes registro = servicio.consultarPorId(id);

                    if (registro != null) {
                        // Armamos el JSON directamente para evitar problemas de librería
                        String json = "{"
                                + "\"id\":" + registro.getId() + ","
                                + "\"nombre\":\"" + (registro.getNombre() != null ? registro.getNombre() : "") + "\","
                                + "\"apellidoPaterno\":\"" + (registro.getApellidoPaterno() != null ? registro.getApellidoPaterno() : "") + "\","
                                + "\"apellidoMaterno\":\"" + (registro.getApellidoMaterno() != null ? registro.getApellidoMaterno() : "") + "\","
                                + "\"area\":\"" + (registro.getArea() != null ? registro.getArea() : "") + "\""
                                + "}";
                        resp.getWriter().write(json);
                    } else {
                        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                        resp.getWriter().write("{\"error\": \"Docente no encontrado\"}");
                    }
                } else {
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    resp.getWriter().write("{\"error\": \"ID no proporcionado\"}");
                }
            } catch (Exception e) {
                e.printStackTrace(); // Revisa la consola de Tomcat en IntelliJ para ver el stacktrace exacto
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }

        } else {
            List<BeanTablaBtcDocentes> listaRegistroBtcDocentes = servicio.consultarBtcDocentes();
            req.setAttribute("listaRegistroBtcDocente", listaRegistroBtcDocentes);
            req.getRequestDispatcher("/WEB-INF/vistas-admin/registrodocente.jsp").forward(req, resp);
        }
    }
}
