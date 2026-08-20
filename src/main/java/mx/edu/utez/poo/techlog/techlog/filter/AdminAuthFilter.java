package mx.edu.utez.poo.techlog.techlog.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// Agrega AQUÍ todas las URLs de admin que quieres proteger
@WebFilter(filterName = "AdminAuthFilter", urlPatterns = {
        "/vista-admin-servlet",
        "/registro-docente-servlet",
        "/admin-alumno-servlet",
        "/admin-pc-servlet",
        "/admin-registrosDocente-servlet",
        "/usuarios-alumnos-servlet",
        "/usuarios-docentes-servlet"
})
public class AdminAuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Bloquea el almacenamiento en caché para que no funcionen las flechas del navegador
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        boolean esAdmin = (session != null && session.getAttribute("adminLogueado") != null);

        if (esAdmin) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }
    }

    @Override
    public void destroy() {}
}