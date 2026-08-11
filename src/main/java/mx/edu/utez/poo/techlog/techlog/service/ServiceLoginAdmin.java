package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAdmin;

public class ServiceLoginAdmin {
    public DaoLoginAdmin daoLoginAdmin = new DaoLoginAdmin();
    public String autenticar(String nombre, String contrasena) {
        if (nombre == null || nombre.trim().isEmpty() || contrasena == null || contrasena.trim().isEmpty() ||
                contrasena.length() > 5){
            return null;
        }
        return daoLoginAdmin.login(nombre.trim(), contrasena.trim());
    }
}
