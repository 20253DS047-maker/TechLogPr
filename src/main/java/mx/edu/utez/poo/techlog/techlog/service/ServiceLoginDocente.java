package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;

public class ServiceLoginDocente {
    private DaoLoginDocente daoLoginDocente = new DaoLoginDocente();
    public BeanLoginDocente autenticar(String username, String password){
        if (username.trim().isEmpty() || username == null){
            return null;
        }
        if (password.trim().isEmpty() || password == null || password.length() > 5){
            return null;
        }
        return daoLoginDocente.login(username.trim(), password.trim());
    }
}