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
    * {
      box-sizing: border-box;
    }
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden; /* Evita barras de desplazamiento externas innecesarias */
    }
    body {
      background-color: #c6c4a8;
      font-family: 'Segoe UI', Arial, sans-serif;
      padding: 20px 40px;
      display: flex;
      flex-direction: column;
    }

    .main-wrapper {
      display: flex;
      flex-direction: column;
      height: 100%;
      width: 100%;
    }

    .top-bar {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-bottom: 10px;
      flex-shrink: 0;
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
      margin: 0 0 16px;
      font-size: 2.2rem;
      flex-shrink: 0;
    }
    .search-bar {
      width: 100%;
      margin: 0 auto 16px;
      position: relative;
      flex-shrink: 0;
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
      right: 18px;
      top: 50%;
      transform: translateY(-50%);
      color: #555;
    }

    /* Tabla flexible que se ajusta a la pantalla */
    .table-container {
      width: 100%;
      background-color: #efe9e2;
      border-radius: 4px;
      overflow: hidden;
      padding: 0 24px;
      flex: 1; /* Ocupa dinámicamente el alto vertical sobrante */
      display: flex;
      flex-direction: column;
    }
    table {
      width: 100%;
      height: 100%;
      border-collapse: collapse;
      table-layout: fixed;
    }
    thead {
      height: 45px;
    }
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
    tbody {
      height: calc(100% - 95px); /* Descuenta encabezado y paginación */
    }
    tbody tr {
      height: 14.28%; /* Distribución pareja de las 7 filas */
    }
    tbody td {
      padding: 8px;
      font-size: 0.85rem;
      color: #333;
      border-bottom: 1px solid #d8d1c5;
      white-space: nowrap;
      vertical-align: middle;
    }
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
      align-items: center;
      gap: 6px;
      height: 50px;
      flex-shrink: 0;
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

    /* Filtros al pie */
    .filters {
      display: flex;
      gap: 20px;
      padding: 16px 0 0;
      flex-shrink: 0;
    }
    .filters label {
      display: flex;
      align-items: center;
      gap: 6px;
      font-size: 0.85rem;
      color: #333;
      cursor: pointer;
    }

    /* Modales */
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

    /* Modal confirmación */
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

<div class="main-wrapper">
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
        <th style="width: 5%;">#</th>
        <th style="width: 15%;">Matricula:</th>
        <th style="width: 25%;">Nombre completo:</th>
        <th style="width: 12%;">Fecha:</th>
        <th style="width: 8%;">P.C.</th>
        <th style="width: 15%;">Salon/Docencia</th>
        <th style="width: 10%;">Estado:</th>
        <th style="width: 10%;">Acciones:</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>0</td>
        <td>20253DS196</td>
        <td>Jonathan Alejandro...</td>
        <td>11/11/2026</td>
        <td>15</td>
        <td>D4</td>
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
        <td>25</td>
        <td>D2</td>
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
      <button type="button">&laquo;</button>
      <button type="button">&lsaquo;</button>
      <button type="button" class="active">5</button>
      <button type="button">6</button>
      <button type="button">7</button>
      <button type="button">8</button>
      <button type="button">&rsaquo;</button>
      <button type="button">&raquo;</button>
    </div>
  </div>

  <!-- Filtros -->
  <div class="filters">
    <label>
      <input type="radio" name="filtro" checked
             onchange="window.location.href='docente-Alumno-servlet?tipo=A'"> UA
    </label>
    <label>
      <input type="radio" name="filtro"
             onchange="window.location.href='docente-registro-servlet'"> RA
    </label>
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
      <button type="button" class="btn-si" onclick="window.location.href='login-docente-servlet'">Si</button>
    </div>
  </div>
</div>

<script>
  function abrirModal(idModal) {
    document.getElementById(idModal).classList.add('activo');
  }
  function cerrarModal(idModal) {
    document.getElementById(idModal).classList.remove('activo');
  }

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

  function cambiarEstado(id, checkbox) {
    var celda = document.getElementById('estadoTexto-' + id);
    if (checkbox.checked) {
      celda.textContent = 'Activo';
      celda.classList.remove('badge-inactivo');
      celda.classList.add('badge-activo');
    } else {
      celda.textContent = 'Inactivo';
      celda.classList.remove('badge-activo');
      celda.classList.add('badge-inactivo');
    }
  }

</script>

</body>
</html>
