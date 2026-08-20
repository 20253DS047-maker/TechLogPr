    package mx.edu.utez.poo.techlog.techlog.service;

    import mx.edu.utez.poo.techlog.techlog.dao.DaoLoginDocente;
    import mx.edu.utez.poo.techlog.techlog.model.BeanLoginAdmin;
    import mx.edu.utez.poo.techlog.techlog.model.BeanLoginDocente;
    import mx.edu.utez.poo.techlog.techlog.util.HashUtils;

    public class ServiceLoginDocente {
        private DaoLoginDocente daoLoginDocente = new DaoLoginDocente();
        public BeanLoginDocente autenticar(String username, String password){
            if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()){
                return null;
            }
            BeanLoginDocente docente = daoLoginDocente.findByUsuario(username.trim());

            if (docente != null){
                String hashIngresado = HashUtils.sha256(password.trim());

                if (hashIngresado.equalsIgnoreCase(docente.getPassword())) {
                    return docente;
                }
            }
            return null;
        }
    }