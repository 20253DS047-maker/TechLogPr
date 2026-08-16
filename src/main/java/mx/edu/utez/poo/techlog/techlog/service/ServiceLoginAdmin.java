package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginAdmin;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAdmin;
import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

public class ServiceLoginAdmin {
    public DaoLoginAdmin daoLoginAdmin = new DaoLoginAdmin();
    public BeanLoginAdmin autenticar(String username, String contrasena) {
        if (username == null || username.trim().isEmpty() || contrasena == null || contrasena.trim().isEmpty()){
            return null;
        }
        BeanLoginAdmin admin = daoLoginAdmin.findByUsuario(username.trim());


        if (admin != null) {
            String hashIngresado = HashUtils.sha256(contrasena.trim());

            if (hashIngresado.equalsIgnoreCase(admin.getContrasena())) {
                return admin;
            }
        }
        return null;
    }
}
