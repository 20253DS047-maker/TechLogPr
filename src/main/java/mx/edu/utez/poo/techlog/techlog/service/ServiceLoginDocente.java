package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;

public class ServiceLoginDocente {
    private DaoLoginDocente daoLoginDocente = new DaoLoginDocente();
    public BeanLoginDocente autenticar(String username, String password){
        if (username.trim().isEmpty() || username == null || password.trim().isEmpty() || password == null){
            return null;
        }
        return daoLoginDocente.login(username.trim(), password.trim());
    }
}
