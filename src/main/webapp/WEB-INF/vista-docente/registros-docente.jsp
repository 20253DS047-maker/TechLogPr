<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vista Docente - Registros</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
    }
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden; /* Evita barras de desplazamiento innecesarias */
    }
    body {
      background-color: #cbc8be;
      color: #333333;
      font-family: Arial, Helvetica, sans-serif;
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

    /* Header con Logo y Botones */
    .header-section {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 15px;
      flex-shrink: 0;
    }
    .logo-img {
      max-height: 80px;
      width: auto;
      object-fit: contain;
    }

    .top-bar {
      display: flex;
      flex-direction: column;
      align-items: flex-end;
      gap: 8px;
    }
    .btn-cerrar-sesion {
      background-color: #172c45;
      color: #ffffff;
      border-radius: 8px;
      font-weight: 500;
      padding: 6px 20px;
      border: none;
      font-size: 0.95rem;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }
    .btn-cerrar-sesion:hover {
      background-color: #0f1e30;
      color: #ffffff;
    }

    .btn-bitacora-docente {
      background-color: #172c45;
      color: #ffffff;
      border-radius: 8px;
      font-weight: 500;
      padding: 6px 20px;
      border: none;
      font-size: 0.95rem;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }
    .btn-bitacora-docente:hover {
      background-color: #0f1e30;
      color: #ffffff;
    }

    .page-title {
      color: #0d8065;
      font-size: 2.5rem;
      font-weight: 700;
      margin: 0;
      letter-spacing: 1px;
    }

    /* Buscador estilo diseño 2 */
    .search-bar {
      width: 100%;
      margin: 0 auto 16px;
      position: relative;
      flex-shrink: 0;
    }
    .search-bar input {
      width: 100%;
      padding: 10px 45px 10px 18px;
      border-radius: 20px;
      border: 1px solid #777777;
      background-color: #ffffff;
      font-size: 0.95rem;
      color: #555555;
      height: 42px;
    }
    .search-bar input:focus { outline: none; }
    .search-bar i {
      position: absolute;
      right: 18px;
      top: 50%;
      transform: translateY(-50%);
      color: #333333;
      font-size: 1.1rem;
    }

    /* Tabla adaptable basada en el diseño 2 */
    .table-container {
      width: 100%;
      background-color: #e5ded8;
      border-radius: 2px;
      overflow: hidden;
      padding: 0;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      flex: 1;
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
      height: 50px;
    }
    thead th {
      font-size: 0.85rem;
      text-transform: uppercase;
      color: #0d8065;
      padding: 12px 8px;
      text-align: left;
      border-bottom: 2px solid #444444;
      letter-spacing: 0.5px;
      font-weight: 700;
    }
    tbody {
      height: calc(100% - 100px);
    }
    tbody tr {
      height: 14.28%; /* Distribución idéntica para 7 filas */
    }
    tbody td {
      padding: 8px 12px;
      font-size: 0.95rem;
      color: #222222;
      border-bottom: 1px solid #777777;
      white-space: nowrap;
      vertical-align: middle;
    }
    .badge-activo { color: #0d8065; font-weight: 600; }
    .badge-inactivo { color: #b03a3a; font-weight: 600; }
    .icon-btn {
      border: none;
      background: none;
      color: #222222;
      margin-right: 6px;
      cursor: pointer;
      font-size: 1.1rem;
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

    /* Paginación estilo diseño 2 */
    .pagination-bar {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 6px;
      height: 50px;
      flex-shrink: 0;
    }
    .pagination-bar button {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      border: 1.5px solid #333333;
      background-color: #ffffff;
      font-size: 0.85rem;
      font-weight: bold;
      color: #333333;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .pagination-bar button.active {
      background-color: #0d8065;
      color: #ffffff;
      border-color: #0d8065;
    }

    /* Filtros inferiores */
    .filters {
      display: flex;
      gap: 20px;
      padding: 16px 0 0;
      flex-shrink: 0;
      align-items: center;
    }
    .filters label {
      display: flex;
      align-items: center;
      gap: 6px;
      font-size: 0.9rem;
      font-weight: bold;
      color: #333;
      cursor: pointer;
    }
    .filters input[type="radio"] {
      width: 18px;
      height: 18px;
      cursor: pointer;
      border: 1.5px solid #333;
    }

    /* Modales rediseñados según vista 2 */
    .modal-overlay {
      position: fixed;
      inset: 0;
      background: rgba(0, 0, 0, 0.25);
      display: none;
      align-items: center;
      justify-content: center;
      z-index: 1050;
      padding: 20px;
    }
    .modal-overlay.activo { display: flex; }
    .modal-box {
      background-color: #ffffff;
      padding: 28px 32px;
      border-radius: 6px;
      width: 100%;
      max-width: 440px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    }
    .modal-box h2 {
      font-size: 1.1rem;
      margin: 0 0 20px;
      color: #2c2c2c;
      text-align: center;
      font-weight: 700;
    }
    .modal-box label {
      font-weight: 600;
      font-size: 0.8rem;
      color: #333;
      display: block;
      margin-bottom: 4px;
    }
    .modal-box input,
    .modal-box select {
      width: 100%;
      padding: 9px 10px;
      border: none;
      border-radius: 3px;
      background-color: #f0f0f0;
      margin-bottom: 16px;
      font-size: 0.85rem;
      color: #2c2c2c;
    }
    .row-2 { display: flex; gap: 14px; }
    .row-2 > div { flex: 1; }
    .modal-actions { display: flex; gap: 14px; margin-top: 8px; }
    .btn-salir {
      background-color: #c0392b;
      color: #fff;
      border: none;
      padding: 11px;
      border-radius: 4px;
      font-weight: 700;
      flex: 1;
      font-size: 0.95rem;
      cursor: pointer;
    }

    /* Confirm box */
    .confirm-box {
      background-color: #ffffff;
      border-radius: 6px;
      overflow: hidden;
      max-width: 360px;
      width: 100%;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    }
    .confirm-header {
      background-color: #0d8065;
      color: #fff;
      padding: 16px 20px;
      font-weight: 700;
      font-size: 1rem;
    }
    .confirm-actions { display: flex; gap: 14px; padding: 20px; }
    .confirm-actions button {
      flex: 1;
      border: none;
      border-radius: 4px;
      padding: 11px;
      font-weight: 700;
      font-size: 0.95rem;
      cursor: pointer;
    }
    .confirm-actions .btn-no { background-color: #c0392b; color: #fff; }
    .confirm-actions .btn-si { background-color: #172c45; color: #fff; }
  </style>
</head>
<body>

<div class="main-wrapper">
  <!-- Encabezado con Logo y Botones -->
  <div class="header-section">
    <div>
      <img src="imagenes/Logotipo-UTEZ-scaled.png" alt="UTEZ" class="logo-img">
    </div>

    <h1 class="page-title">Bitacora Alumnos</h1>

    <div class="top-bar">
      <button type="button" class="btn-cerrar-sesion" onclick="abrirModal('modalCerrarSesion')">Cerrar Sesion</button>
      <button type="button" class="btn-bitacora-docente" onclick="window.location.href='DocenteBitacoraServlet'">Bitacora</button>
    </div>
  </div>

  <div class="search-bar">
    <input type="text" id="buscarMatricula" placeholder="Introduzca la matricula para buscar en el registro....">
    <i class="fa-solid fa-magnifying-glass"></i>
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
            <i class="fa-regular fa-eye"></i>
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
            <i class="fa-regular fa-eye"></i>
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
      <button type="button"><i class="fa-solid fa-angles-left"></i></button>
      <button type="button"><i class="fa-solid fa-angle-left"></i></button>
      <button type="button" class="active">5</button>
      <button type="button">6</button>
      <button type="button">7</button>
      <button type="button">8</button>
      <button type="button"><i class="fa-solid fa-angle-right"></i></button>
      <button type="button"><i class="fa-solid fa-angles-right"></i></button>
    </div>
  </div>

  <!-- Filtros -->
  <div class="filters">
    <label>
      <input type="radio" name="filtro" checked
             onchange="window.location.href='usuarios-Alumno-servlet'"> Usuarios-Alumnos
    </label>
    <label>
      <input type="radio" name="filtro"
             onchange="window.location.href='registros-alumnos-servlet'" checked disabled> Bitacora Alumnos
    </label>
  </div>
</div>

<!-- ===================== MODAL: VER MAS ===================== -->
<div class="modal-overlay" id="modalVerMas">
  <div class="modal-box">
    <h2>Detalle del registro</h2>
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