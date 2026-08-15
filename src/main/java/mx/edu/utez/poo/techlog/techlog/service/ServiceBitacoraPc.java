package mx.edu.utez.poo.techlog.techlog.service;

import mx.edu.utez.poo.techlog.techlog.dao.DaoBitacoraPc;
import mx.edu.utez.poo.techlog.techlog.dao.DaoDocente;
import mx.edu.utez.poo.techlog.techlog.model.BeanBitacoraPc;

import java.util.List;

public class ServiceBitacoraPc {
    private DaoBitacoraPc DaoBitacoraPc = new DaoBitacoraPc();
    public boolean registrarPc(BeanBitacoraPc registroPc){
        if (registroPc.getSalon_computo() == null || registroPc.getSalon_computo().trim().isEmpty() || registroPc.getDocencia() == null ||
                registroPc.getDocencia().trim().isEmpty() || registroPc.getNumero_pc() == null || registroPc.getNumero_pc().trim().isEmpty() ||
                registroPc.getModelo() == null || registroPc.getModelo().trim().isEmpty() || registroPc.getIsla_mesa() == null || registroPc.getIsla_mesa().trim().isEmpty() ||
                registroPc.getEstado() == null || registroPc.getEstado().trim().isEmpty()){
            return false;
        }
        return DaoBitacoraPc.insertar(registroPc);
    }

    // AGREGADO: obtiene la lista de PCs
    public List<BeanBitacoraPc> listarPc(){
        return DaoBitacoraPc.listar();
    }

    // AGREGADO: elimina un PC validando que venga el numero_pc
    public boolean eliminarPc(String numeroPc){
        if (numeroPc == null || numeroPc.trim().isEmpty()){
            return false;
        }
        return DaoBitacoraPc.eliminar(numeroPc);
    }
}
