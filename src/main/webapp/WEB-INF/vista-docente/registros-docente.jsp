<!-- Muestra la tabla de los registros alumnos en la bitacora -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registros Alumnos</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
    }
    html, body {
      min-height: 100vh;
      margin: 0;
      padding: 0;
      overflow-y: auto;
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
      width: 100%;
      min-height: 100vh;
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
    .btn-cerrar-sesion, .btn-bitacora-docente {
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
    .btn-cerrar-sesion:hover, .btn-bitacora-docente:hover {
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

    /* Buscador */
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
      overflow-x: auto;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      margin-bottom: 10px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      table-layout: fixed;
    }
    thead th {
      font-size: 0.85rem;
      text-transform: uppercase;
      color: #0d8065;
      padding: 12px 8px;
      border-bottom: 2px solid #444444;
      letter-spacing: 0.5px;
      font-weight: 700;
    }
    tbody tr {
      height: 48px; /* Altura compacta fija por fila */
    }
    tbody td {
      padding: 8px 12px;
      font-size: 0.95rem;
      color: #222222;
      border-bottom: 1px solid #777777;
      white-space: nowrap;
      vertical-align: middle;
    }
    .badge-activo { color: #0d8065; font-weight: 700; }
    .badge-inactivo { color: #b03a3a; font-weight: 700; }
    .icon-btn {
      border: none;
      background: none;
      color: #222222;
      margin-right: 6px;
      cursor: pointer;
      font-size: 1.1rem;
      padding: 0;
    }

    /* Paginación */
    .pagination-bar {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 6px;
      padding: 10px 0;
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
      padding: 10px 0;
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

    /* Modales */
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
    .modal-box input, .modal-box select {
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
    <table class="custom-table text-center">
      <thead>
      <tr>
        <th style="width: 7%;">ID</th>
        <th style="width: 12%;">MATRÍCULA</th>
        <th style="width: 18%;">NOMBRE ALUMNO</th>
        <th style="width: 18%;">NOMBRE DOCENTE</th>
        <th style="width: 8%;">ID PC</th>
        <th style="width: 19%;">OBSERVACIONES</th>
        <th style="width: 8%;">ESTADO</th>
        <th style="width: 10%;">ACCIONES</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${listaRegistroBtcAlumnos}" var="registroBtcAlumno" varStatus="estado">
        <tr>
          <td>${registroBtcAlumno.id}</td>
          <td>${registroBtcAlumno.matricula}</td>
          <td>${registroBtcAlumno.nombre} ${registroBtcAlumno.apellidoPaterno} ${registroBtcAlumno.apellidoMaterno}</td>
          <td>${registroBtcAlumno.nombreDocente}</td>
          <td>${registroBtcAlumno.idPc}</td>
          <td>${registroBtcAlumno.observaciones}</td>
          <td>
            <span id="estadoTexto-${estado.index}" class="badge-activo">Activo</span>
          </td>
          <td>
            <button type="button" class="icon-btn" id="estadoBtn-${estado.index}" title="Activar/Desactivar" onclick="cambiarEstado(${estado.index}, this)">
              <i class="fa-solid fa-toggle-on"></i>
            </button>
            <button type="button" class="icon-btn" title="Ver detalles"
                    onclick="verMas({
                            id: '${registroBtcAlumno.id}',
                            matricula: '${registroBtcAlumno.matricula}',
                            nombre: '${registroBtcAlumno.nombre}',
                            paterno: '${registroBtcAlumno.apellidoPaterno}',
                            materno: '${registroBtcAlumno.apellidoMaterno}',
                            docente: '${registroBtcAlumno.nombreDocente}',
                            observaciones: '${registroBtcAlumno.observaciones}'
                            })">
              <i class="fa-regular fa-eye"></i>
            </button>
            <button type="button" class="icon-btn" title="Editar"
                    onclick="editar(${estado.index}, {
                            matricula: '${registroBtcAlumno.matricula}',
                            nombre: '${registroBtcAlumno.nombre}',
                            fecha: '11/11/2026',
                            pc: '${registroBtcAlumno.idPc}',
                            horaEntrada: '11:00 AM',
                            salon: 'MAC9',
                            horaSalida: '13:00 PM',
                            docencia: 'D4',
                            estado: 'activo'
                            })">
              <i class="fa-regular fa-pen-to-square"></i>
            </button>
            <button type="button" class="icon-btn" title="Eliminar" onclick="eliminar(${estado.index})">
              <i class="fa-regular fa-trash-can"></i>
            </button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Paginadores -->
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
  <div class="modal-box modal-white">
    <h2>Detalle del registro</h2>

    <label>ID:</label>
    <input type="text" id="vm-id" disabled>
    <label>Matrícula:</label>
    <input type="text" id="vm-matricula" disabled>
    <label>Nombre:</label>
    <input type="text" id="vm-nombre" disabled>
    <div class="row-2">
      <div>
        <label>Apellido Paterno:</label>
        <input type="text" id="vm-paterno" disabled>
      </div>
      <div>
        <label>Apellido Materno:</label>
        <input type="text" id="vm-materno" disabled>
      </div>
    </div>
    <label>Docente:</label>
    <input type="text" id="vm-docente" disabled>
    <label>Observaciones:</label>
    <input type="text" id="vm-observaciones" disabled>
    <div class="modal-actions">
      <button type="button" class="btn-salir" style="max-width:100%" onclick="cerrarModal('modalVerMas')">Salir</button>
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

  function verMas(datos) {
    document.getElementById('vm-id').value = datos.id || '';
    document.getElementById('vm-matricula').value = datos.matricula || '';
    document.getElementById('vm-nombre').value = datos.nombre || '';
    document.getElementById('vm-paterno').value = datos.paterno || '';
    document.getElementById('vm-materno').value = datos.materno || '';
    document.getElementById('vm-docente').value = datos.docente || '';
    document.getElementById('vm-observaciones').value = datos.observaciones || '';
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