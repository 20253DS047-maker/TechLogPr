package mx.edu.utez.poo.techlog.techlog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.poo.techlog.techlog.dao.DaoRegistroPC;
import mx.edu.utez.poo.techlog.techlog.dao.DaoRegistros;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistro;
import mx.edu.utez.poo.techlog.techlog.model.BeanRegistroPC;

import java.io.IOException;

@WebServlet("/registro-agregar-servlet")
public class RegistroAgregarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
        String matricula = req.getParameter("matricula_usuario");
        String fecha_hora_entrada = req.getParameter("fecha");
        String nombre_docente = req.getParameter("nombre_docente");
        String numero_pc = req.getParameter("numero_pc");
        String salon_computo = req.getParameter("salon_computo");
        String docencia = req.getParameter("docencia");
        String estado = req.getParameter("estado");
        String nombre = req.getParameter("nombre_completo");

        BeanRegistro registro = new BeanRegistro();
        registro.setMatricula_usuario(matricula);
        registro.setFecha_hora_entrada(fecha_hora_entrada);
        registro.setNombre_docente(nombre_docente);

        DaoRegistros daoRegistros = new DaoRegistros();

        BeanRegistroPC registroPC = new BeanRegistroPC();
        registroPC.setSalon_computo(salon_computo);
        registroPC.setDocencia(docencia);
        registroPC.setNumero_pc(numero_pc);
        registroPC.setEstado(estado);
        DaoRegistroPC daoRegistroPC = new DaoRegistroPC();

        daoRegistros.insertar(registro);
        daoRegistroPC.insertar(registroPC);

        /*if (resultado){
            req.setAttribute("registro", registro);
            req.getRequestDispatcher("WEB-INF/vistas-admin/vista-admin/registros/registros.jsp").forward(req, resp);
        }else {
            req.setAttribute("error", "No se pudo registrar en la bitacora");
            req.getRequestDispatcher("WEB-INF/vistas-admin/vista-admin/registros/registros.jsp").forward(req, resp);
        }*/
            req.setAttribute("registro", registro);
            req.getRequestDispatcher("WEB-INF/vistas-admin/vista-admin-registros/registros.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "No se pudo registrar en la bitacora");
            req.getRequestDispatcher("WEB-INF/vistas-admin/vista-admin-registros/registros.jsp").forward(req, resp);
        }
    }
}
