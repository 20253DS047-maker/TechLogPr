package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAdmin;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAdmin;

public class ServiceLoginAdmin {
    public DaoLoginAdmin daoLoginAdmin = new DaoLoginAdmin();
    public BeanLoginAdmin autenticar(String username, String contrasena) {
        if (username == null || username.trim().isEmpty() || contrasena == null || contrasena.trim().isEmpty() ||
                contrasena.length() > 5){
            return null;
        }
        return daoLoginAdmin.login(username.trim(), contrasena.trim());
    }
}
