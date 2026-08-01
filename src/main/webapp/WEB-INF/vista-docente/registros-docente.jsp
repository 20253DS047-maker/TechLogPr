<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vista Docente - Registros</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background-color: #c6c4a8;
      min-height: 100vh;
      font-family: 'Segoe UI', Arial, sans-serif;
      margin: 0;
    }
    .top-bar {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      padding: 20px 30px 0;
    }
    .btn-cerrar-sesion {
      font-weight: 600;
      border: none;
      border-radius: 4px;
      padding: 8px 16px;
      font-size: 0.85rem;
      background-color: #1c2b4a;
      color: #fff;
      cursor: pointer;
    }
    .btn-cerrar-sesion:hover { background-color: #142038; }
    .page-title {
      text-align: center;
      color: #1c8a6c;
      font-weight: 700;
      margin: 0 0 24px;
      font-size: 2.4rem;
    }
    .search-bar {
      max-width: 900px;
      margin: 0 auto 20px;
      position: relative;
      padding: 0 24px;
    }
    .search-bar input {
      width: 100%;
      padding: 10px 44px 10px 18px;
      border-radius: 20px;
      border: none;
      background-color: #efe9e2;
      font-size: 0.9rem;
    }
    .search-bar input:focus { outline: none; }
    .search-bar i {
      position: absolute;
      right: 40px;
      top: 50%;
      transform: translateY(-50%);
      color: #555;
    }
    .table-container {
      max-width: 1000px;
      margin: 0 auto;
      background-color: #efe9e2;
      border-radius: 4px;
      overflow: hidden;
      padding: 0 24px;
    }
    table { width: 100%; border-collapse: collapse; }
    thead th {
      font-size: 0.78rem;
      text-transform: uppercase;
      color: #1c8a6c;
      padding: 10px 8px;
      text-align: left;
      border-bottom: 2px solid #cfc7ba;
      letter-spacing: 0.4px;
      font-weight: 700;
    }
    tbody td {
      padding: 10px 8px;
      font-size: 0.85rem;
      color: #333;
      border-bottom: 1px solid #d8d1c5;
      white-space: nowrap;
    }
    tbody tr.empty-row td { padding: 16px 8px; border-bottom: 1px solid #d8d1c5; }
    .badge-activo { color: #1c8a6c; font-weight: 600; }
    .badge-inactivo { color: #b03a3a; font-weight: 600; }
    .icon-btn {
      border: none;
      background: none;
      color: #333;
      margin-right: 6px;
      cursor: pointer;
      font-size: 1rem;
      padding: 0;
    }
    .form-check.form-switch {
      display: inline-block;
      margin: 0 6px 0 0;
      min-height: auto;
      padding-left: 2.2em;
      vertical-align: middle;
    }
    .form-check.form-switch .form-check-input {
      width: 2em;
      height: 1.1em;
      cursor: pointer;
    }
    .pagination-bar {
      display: flex;
      justify-content: center;
      gap: 6px;
      padding: 18px 0 6px;
    }
    .pagination-bar button {
      width: 28px;
      height: 28px;
      border-radius: 50%;
      border: none;
      background-color: #c9c2b3;
      font-size: 0.75rem;
      color: #333;
    }
    .pagination-bar button.active { background-color: #1c8a6c; color: #fff; }
    /* ===== Modal genérico (oculto por defecto, JS lo muestra) ===== */
    .modal-overlay {
      position: fixed;
      inset: 0;
      background: rgba(0, 0, 0, 0.15);
      display: none;
      align-items: center;
      justify-content: center;
      z-index: 10;
      padding: 20px;
    }
    .modal-overlay.activo { display: flex; }
    .modal-box {
      background-color: #ffffff;
      padding: 28px 32px;
      border-radius: 4px;
      width: 100%;
      max-width: 440px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    }
    .modal-box label {
      font-weight: 700;
      font-size: 0.8rem;
      color: #1c8a6c;
      display: block;
      margin-bottom: 4px;
    }
    .modal-box input,
    .modal-box select {
      width: 100%;
      padding: 9px 10px;
      border: none;
      border-radius: 3px;
      background-color: #d9d9d9;
      margin-bottom: 16px;
      font-size: 0.85rem;
      color: #2c2c2c;
    }
    .row-2 { display: flex; gap: 14px; }
    .row-2 > div { flex: 1; }
    .modal-actions { display: flex; gap: 14px; margin-top: 8px; }
    .btn-salir {
      background-color: #e6392e;
      color: #fff;
      border: none;
      padding: 12px;
      border-radius: 4px;
      font-weight: 700;
      flex: 1;
      font-size: 1rem;
      cursor: pointer;
    }
    /* ===== Confirmación cerrar sesión ===== */
    .confirm-box {
      background-color: #ffffff;
      border-radius: 6px;
      overflow: hidden;
      max-width: 340px;
      width: 100%;
      text-align: center;
    }
    .confirm-header {
      background-color: #1c8a6c;
      color: #fff;
      padding: 16px 20px;
      font-weight: 700;
      font-size: 1rem;
    }
    .confirm-actions { display: flex; gap: 0; }
    .confirm-actions button {
      flex: 1;
      border: none;
      padding: 14px;
      font-weight: 700;
      font-size: 0.95rem;
      cursor: pointer;
    }
    .confirm-actions .btn-no { background-color: #e6392e; color: #fff; }
    .confirm-actions .btn-si { background-color: #1c2b4a; color: #fff; }
  </style>
</head>
<body>

  <div class="top-bar">
    <button type="button" class="btn-cerrar-sesion" onclick="abrirModal('modalCerrarSesion')">Cerrar Sesion</button>
  </div>

  <h1 class="page-title">Registros</h1>

  <div class="search-bar">
    <input type="text" id="buscarMatricula" placeholder="Introduzca la matricula para buscar en el registro....">
    <i class="bi bi-search"></i>
  </div>

  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Matricula:</th>
          <th>Nombre completo:</th>
          <th>Fecha:</th>
          <th>P.C.</th>
          <th>Salon/Docencia</th>
          <th>Estado:</th>
          <th>Acciones:</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>0</td>
          <td>20253DS196</td>
          <td>Jonathan Alejandro...</td>
          <td>11/11/2026</td>
          <td>15.</td>
          <td>MAC9.D4</td>
          <td id="estadoTexto-0" class="badge-activo">Activo</td>
          <td>
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" role="switch"
                     id="estadoSwitch-0" checked
                     onchange="cambiarEstado(0, this)">
            </div>
            <button type="button" class="icon-btn" title="Ver mas"
                    onclick="verMas('20253DS196','Jonathan AlejandroLopez Benites','11/11/2026','15','11:00 AM','MAC9','13:00 PM','D4','Activo')">
              <i class="bi bi-eye"></i>
            </button>
          </td>
        </tr>
        <tr>
          <td>1</td>
          <td>20253DS034</td>
          <td>Santiago Flores</td>
          <td>20/02/2026</td>
          <td>25.D4</td>
          <td>A9.D3</td>
          <td id="estadoTexto-1" class="badge-inactivo">Inactivo</td>
          <td>
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" role="switch"
                     id="estadoSwitch-1"
                     onchange="cambiarEstado(1, this)">
            </div>
            <button type="button" class="icon-btn" title="Ver mas"
                    onclick="verMas('20253DS034','Santiago Flores','20/02/2026','25.D4','—','A9','—','D3','Inactivo')">
              <i class="bi bi-eye"></i>
            </button>
          </td>
        </tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
      </tbody>
    </table>

    <div class="pagination-bar">
      <button>&laquo;</button>
      <button>&lsaquo;</button>
      <button class="active">5</button>
      <button>6</button>
      <button>7</button>
      <button>8</button>
      <button>&rsaquo;</button>
      <button>&raquo;</button>
    </div>
  </div>

  <!-- ===================== MODAL: VER MAS ===================== -->
  <div class="modal-overlay" id="modalVerMas">
    <div class="modal-box">
      <label>Matricula:</label>
      <input type="text" id="vm-matricula" disabled>

      <label>Nombre Completo:</label>
      <input type="text" id="vm-nombre" disabled>

      <div class="row-2">
        <div><label>Fecha:</label><input type="text" id="vm-fecha" disabled></div>
        <div><label>PC:</label><input type="text" id="vm-pc" disabled></div>
      </div>

      <div class="row-2">
        <div><label>Hora Entrada:</label><input type="text" id="vm-entrada" disabled></div>
        <div><label>Salon:</label><input type="text" id="vm-salon" disabled></div>
      </div>

      <div class="row-2">
        <div><label>Hora Salida:</label><input type="text" id="vm-salida" disabled></div>
        <div><label>Docencia:</label><input type="text" id="vm-docencia" disabled></div>
      </div>

      <label>Estado:</label>
      <input type="text" id="vm-estado" disabled>

      <div class="modal-actions">
        <button type="button" class="btn-salir" onclick="cerrarModal('modalVerMas')">Salir</button>
      </div>
    </div>
  </div>

  <!-- ===================== MODAL: CERRAR SESION ===================== -->
  <div class="modal-overlay" id="modalCerrarSesion">
    <div class="confirm-box">
      <div class="confirm-header">¿Estas seguro de cerrar sesion?</div>
      <div class="confirm-actions">
        <button type="button" class="btn-no" onclick="cerrarModal('modalCerrarSesion')">No</button>
        <button type="button" class="btn-si" onclick="confirmarCerrarSesion()">Si</button>
      </div>
    </div>
  </div>

  <script>
    // ----------  abrir/cerrar cualquier modal ----------
    function abrirModal(idModal) {
      document.getElementById(idModal).classList.add('activo');
    }
    function cerrarModal(idModal) {
      document.getElementById(idModal).classList.remove('activo');
    }

    // ---------- Ver mas:  ----------
    function verMas(matricula, nombre, fecha, pc, entrada, salon, salida, docencia, estado) {
      document.getElementById('vm-matricula').value = matricula;
      document.getElementById('vm-nombre').value = nombre;
      document.getElementById('vm-fecha').value = fecha;
      document.getElementById('vm-pc').value = pc;
      document.getElementById('vm-entrada').value = entrada;
      document.getElementById('vm-salon').value = salon;
      document.getElementById('vm-salida').value = salida;
      document.getElementById('vm-docencia').value = docencia;
      document.getElementById('vm-estado').value = estado;
      abrirModal('modalVerMas');
    }

    // ---------- Activo / Inactivo: refleja el cambio visualmente ----------
    // Cuando conectes con la base de datos, agrega aqui tu llamada
    // (fetch/AJAX o form.submit()) hacia tu Servlet, usando el id del registro.
    function cambiarEstado(id, checkbox) {
      var celda = document.getElementById('estadoTexto-' + id);
      if (checkbox.checked) {
        celda.textContent = 'Activo';
        celda.classList.remove('badge-inactivo');
        celda.classList.add('badge-activo');
        // TODO: aqui va la peticion al backend para marcar id=" + id + " como activo
      } else {
        celda.textContent = 'Inactivo';
        celda.classList.remove('badge-activo');
        celda.classList.add('badge-inactivo');
        // TODO: aqui va la peticion al backend para marcar id=" + id + " como inactivo
      }
    }

    // ---------- Cerrar sesion confirmado ----------
    function confirmarCerrarSesion() {
     
      cerrarModal('modalCerrarSesion');
    }
  </script>

</body>
</html>
