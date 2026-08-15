<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vista Docente - Alumnos</title>

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
    .btn-cerrar-sesion,
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
    .btn-cerrar-sesion:hover,
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

    /* Buscador estilo consistente */
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

    /* Tabla adaptable */
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
      height: 14.28%; /* Distribución uniforme de filas */
    }
    tbody td {
      padding: 8px 12px;
      font-size: 0.95rem;
      color: #222222;
      border-bottom: 1px solid #777777;
      white-space: nowrap;
      vertical-align: middle;
    }
    .icon-btn {
      border: none;
      background: none;
      color: #222222;
      margin-right: 6px;
      cursor: pointer;
      font-size: 1.1rem;
      padding: 0;
    }

    /* Paginación estilo consistente */
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

    /* Modales rediseñados */
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

    <h1 class="page-title">Alumnos</h1>

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
        <th style="width: 20%;">Matricula:</th>
        <th style="width: 20%;">Nombre:</th>
        <th style="width: 25%;">Apellido:</th>
        <th style="width: 18%;">Username:</th>
        <th style="width: 12%;">Acciones:</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>0</td>
        <td>20253DS196</td>
        <td>Jonathan</td>
        <td>Lopez Benites</td>
        <td>jlopezb</td>
        <td>
          <button type="button" class="icon-btn" title="Ver mas"
                  onclick="verMas('20253DS196','Jonathan','Lopez Benites','jlopezb')">
            <i class="fa-regular fa-eye"></i>
          </button>
          <button type="button" class="icon-btn" title="Editar">
            <i class="fa-solid fa-pen-to-square"></i>
          </button>
        </td>
      </tr>
      <tr>
        <td>1</td>
        <td>20253DS034</td>
        <td>Santiago</td>
        <td>Flores</td>
        <td>sfloresr</td>
        <td>
          <button type="button" class="icon-btn" title="Ver mas"
                  onclick="verMas('20253DS034','Santiago','Flores','sfloresr')">
            <i class="fa-regular fa-eye"></i>
          </button>
          <button type="button" class="icon-btn" title="Editar">
            <i class="fa-solid fa-pen-to-square"></i>
          </button>
        </td>
      </tr>
      <tr class="empty-row"><td colspan="6">&nbsp;</td></tr>
      <tr class="empty-row"><td colspan="6">&nbsp;</td></tr>
      <tr class="empty-row"><td colspan="6">&nbsp;</td></tr>
      <tr class="empty-row"><td colspan="6">&nbsp;</td></tr>
      <tr class="empty-row"><td colspan="6">&nbsp;</td></tr>
      </tbody>
    </table>

    <div class="pagination-bar">
      <button type="button"><i class="fa-solid fa-angles-left"></i></button>
      <button type="button"><i class="fa-solid fa-angle-left"></i></button>
      <button type="button" class="active">1</button>
      <button type="button">2</button>
      <button type="button">3</button>
      <button type="button">4</button>
      <button type="button"><i class="fa-solid fa-angle-right"></i></button>
      <button type="button"><i class="fa-solid fa-angles-right"></i></button>
    </div>
  </div>

  <!-- Filtros -->
  <div class="filters">
    <label>
      <input type="radio" name="filtro" checked
             onchange="window.location.href='usuarios-Alumno-servlet?tipo=A'"> Usuarios-Alumnos
    </label>
    <label>
      <input type="radio" name="filtro"
             onchange="window.location.href='registros-alumnos-servlet'"> Bitacora-Alumnos
    </label>
  </div>
</div>

<!-- ===================== MODAL: VER MAS ===================== -->
<div class="modal-overlay" id="modalVerMas">
  <div class="modal-box">
    <label>Matricula:</label>
    <input type="text" id="vm-matricula" disabled>

    <div class="row-2">
      <div><label>Nombre:</label><input type="text" id="vm-nombre" disabled></div>
      <div><label>Apellido:</label><input type="text" id="vm-apellido" disabled></div>
    </div>

    <label>Username:</label>
    <input type="text" id="vm-username" disabled>

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
  // ---------- abrir/cerrar cualquier modal ----------
  function abrirModal(idModal) {
    document.getElementById(idModal).classList.add('activo');
  }
  function cerrarModal(idModal) {
    document.getElementById(idModal).classList.remove('activo');
  }

  // ---------- Ver mas: muestra los datos del alumno en el modal ----------
  function verMas(matricula, nombre, apellido, username) {
    document.getElementById('vm-matricula').value = matricula;
    document.getElementById('vm-nombre').value = nombre;
    document.getElementById('vm-apellido').value = apellido;
    document.getElementById('vm-username').value = username;
    abrirModal('modalVerMas');
  }

  // ---------- Cerrar sesion confirmado ----------
  function confirmarCerrarSesion() {
    cerrarModal('modalCerrarSesion');
  }
</script>

</body>
</html>