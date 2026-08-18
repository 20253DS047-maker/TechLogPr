package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.model.BeanTablaBtcAlumnos;
import mx.edu.utez.poo.techlog.techlog.service.AlumnosVerMasService;

import java.io.IOException;
import java.util.List;

public class AlumnosVerMasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        AlumnosVerMasService servicio = new AlumnosVerMasService();

        if ("getDetalle".equals(action)) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            try {
                String idParam = req.getParameter("id");

                if (idParam != null && !idParam.trim().isEmpty()) {
                    int id = Integer.parseInt(idParam);
                    BeanTablaBtcAlumnos registro = servicio.consultarPorId(id);

                    if (registro != null) {
                        String json = "{"
                                + "\"id\":" + registro.getId() + ","
                                + "\"nombre\":\"" + (registro.getNombre() != null ? registro.getNombre() : "") + "\","
                                + "\"nombre_docente\":\"" + (registro.getNombreDocente() != null ? registro.getNombreDocente() : "") + "\","
                                + "\"observaciones\":\"" + (registro.getObservaciones() != null ? registro.getObservaciones() : "") + "\""
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
                e.printStackTrace();
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }

        } else {
            List<BeanTablaBtcAlumnos> listaRegistroBtcDocentes = servicio.consultarBtcAlumnos();
            req.setAttribute("listaRegistroBtcDocente", listaRegistroBtcDocentes);
            req.getRequestDispatcher("/WEB-INF/vistas-admin/registros.jsp").forward(req, resp);
        }
    }
}
