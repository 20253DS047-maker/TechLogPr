<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Docentes</title>
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
    .btn-cerrar-sesion, .btn-agregar {
      font-weight: 600;
      border: none;
      border-radius: 4px;
      padding: 8px 16px;
      font-size: 0.85rem;
      cursor: pointer;
    }
    .btn-cerrar-sesion { background-color: #1c2b4a; color: #fff; }
    .btn-cerrar-sesion:hover { background-color: #142038; color: #fff; }
    .btn-agregar { background-color: #1c8a6c; color: #fff; }
    .btn-agregar:hover { background-color: #146b53; color: #fff; }
    .page-title {
      text-align: center;
      color: #1c8a6c;
      font-weight: 700;
      margin: 0 0 24px;
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
      font-size: 0.75rem;
      text-transform: uppercase;
      color: #333;
      padding: 10px 8px;
      text-align: left;
      border-bottom: 2px solid #cfc7ba;
      letter-spacing: 0.4px;
    }
    tbody td {
      padding: 10px 8px;
      font-size: 0.82rem;
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
      cursor: pointer;
    }
    .pagination-bar button.active { background-color: #1c8a6c; color: #fff; }
    .filters {
      display: flex;
      gap: 20px;
      padding: 16px 30px 24px;
    }
    .filters label {
      display: flex;
      align-items: center;
      gap: 6px;
      font-size: 0.85rem;
      color: #333;
      cursor: pointer;
    }
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
      background-color: #e9e2d8;
      padding: 28px 32px;
      border-radius: 6px;
      width: 100%;
      max-width: 440px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    }
    .modal-box.modal-white { background-color: #ffffff; }
    .modal-box h2 {
      font-size: 1.1rem;
      margin: 0 0 20px;
      color: #2c2c2c;
      text-align: center;
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
      background-color: #efe9e2;
      margin-bottom: 16px;
      font-size: 0.85rem;
      color: #2c2c2c;
    }
    .modal-box.modal-white input,
    .modal-box.modal-white select { background-color: #f0f0f0; }
    .modal-box input::placeholder { color: #9a9a9a; }
    .modal-box input:disabled,
    .modal-box select:disabled { color: #8a8a8a; }
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
    .btn-confirmar {
      background-color: #1c2b4a;
      color: #fff;
      border: none;
      padding: 11px;
      border-radius: 4px;
      font-weight: 700;
      flex: 1;
      font-size: 0.95rem;
      cursor: pointer;
    }
    .btn-confirmar:disabled { background-color: #8a94a6; cursor: default; }
    /* ===== Confirmación (cerrar sesión) ===== */
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
    .confirm-actions .btn-no { background-color: #c0392b; color: #fff; }
    .confirm-actions .btn-si { background-color: #1c2b4a; color: #fff; }
  </style>
</head>
<body>

<div class="top-bar">
  <button type="button" class="btn-cerrar-sesion" onclick="abrirModal('modalCerrarSesion')">Cerrar Sesión</button>
  <button type="button" class="btn-agregar" onclick="abrirModal('modalAgregar')"><i class="bi bi-file-earmark-plus"></i> Agregar</button>
</div>

<h1 class="page-title">Docentes</h1>

<div class="search-bar">
  <input type="text" id="buscarMatricula" placeholder="Introduzca la matrícula para buscar en el registro...">
  <i class="bi bi-search"></i>
</div>

<div class="table-container">
  <table>
    <thead>
    <tr>
      <th>#</th>
      <th>Nombre completo</th>
      <th>Usuario</th>
      <th>Contraseña</th>
      <th>Área</th>
      <th>Estado</th>
      <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>0</td>
      <td>Jonathan Alejandro...</td>
      <td>jalb2025</td>
      <td>2025jalb5b</td>
      <td>DATID</td>
      <td id="estadoTexto-0" class="badge-activo">Activo</td>
      <td>
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" role="switch"
                 id="estadoSwitch-0" checked
                 onchange="cambiarEstado(0, this)">
        </div>
        <button type="button" class="icon-btn" title="Ver más"
                onclick="verMas('Jonathan AlejandroLopez Benitez','jalb2025','2025jalb5b','DATID','Activo')">
          <i class="bi bi-eye"></i>
        </button>
        <button type="button" class="icon-btn" title="Editar"
                onclick="editar(0,'Jonathan AlejandroLopez Benitez','jalb2025','2025jalb5b','DATID','activo')">
          <i class="bi bi-pencil-square"></i>
        </button>
        <button type="button" class="icon-btn" title="Eliminar"
                onclick="eliminar(0)">
          <i class="bi bi-trash"></i>
        </button>
      </td>
    </tr>
    <tr>
      <td>1</td>
      <td>Jose Juan</td>
      <td>sonff2026</td>
      <td>25.2025sonff5b</td>
      <td>DAT3D</td>
      <td id="estadoTexto-1" class="badge-inactivo">Inactivo</td>
      <td>
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" role="switch"
                 id="estadoSwitch-1"
                 onchange="cambiarEstado(1, this)">
        </div>
        <button type="button" class="icon-btn" title="Ver más"
                onclick="verMas('Santiago Flores','sonff2026','25.2025sonff5b','DAT3D','Inactivo')">
          <i class="bi bi-eye"></i>
        </button>
        <button type="button" class="icon-btn" title="Editar"
                onclick="editar(1,'Santiago Flores','sonff2026','25.2025sonff5b','DAT3D','inactivo')">
          <i class="bi bi-pencil-square"></i>
        </button>
        <button type="button" class="icon-btn" title="Eliminar"
                onclick="eliminar(1)">
          <i class="bi bi-trash"></i>
        </button>
      </td>
    </tr>
    <tr class="empty-row"><td colspan="7">&nbsp;</td></tr>
    <tr class="empty-row"><td colspan="7">&nbsp;</td></tr>
    <tr class="empty-row"><td colspan="7">&nbsp;</td></tr>
    <tr class="empty-row"><td colspan="7">&nbsp;</td></tr>
    <tr class="empty-row"><td colspan="7">&nbsp;</td></tr>
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

<!-- Filtros: A = Alumno, RA = registroalumno, D = docente RD = registrodocente. -->
<div class="filters">
  <label>
    <input type="radio" name="filtro" checked
           onchange="window.location.href='admin-Alumno-servlet?tipo=A'"> A
  </label>
  <label>
    <input type="radio" name="filtro"
           onchange="window.location.href='admin-registroAlumno-servlet'"> RA
  </label>
  <label>
    <input type="radio" name="filtro"
           onchange="window.location.href='admin-Docente-servlet'"> T
  </label>
  <label>
    <input type="radio" name="filtro"
           onchange="window.location.href='admin-registrosDocente-servlet'"> T
  </label>
</div>

<!-- ===================== MODAL: VER MAS ===================== -->
<div class="modal-overlay" id="modalVerMas">
  <div class="modal-box modal-white">
    <h2>Detalle del docente</h2>

    <label>Nombre Completo:</label>
    <input type="text" id="vm-nombre" disabled>

    <label>Usuario:</label>
    <input type="text" id="vm-usuario" disabled>

    <label>Contraseña:</label>
    <input type="text" id="vm-contrasena" disabled>

    <label>Área:</label>
    <input type="text" id="vm-area" disabled>

    <label>Estado:</label>
    <input type="text" id="vm-estado" disabled>

    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalVerMas')">Salir</button>
      <button type="button" class="btn-confirmar" disabled>Confirmar</button>
    </div>
  </div>
</div>

<!-- ===================== MODAL: EDITAR ===================== -->
<div class="modal-overlay" id="modalEditar">
  <form class="modal-box modal-white" onsubmit="return false;">
    <h2>Editar docente</h2>
    <input type="hidden" id="ed-id">

    <label>Nombre Completo:</label>
    <input type="text" id="ed-nombre">

    <label>Usuario:</label>
    <input type="text" id="ed-usuario">

    <label>Contraseña:</label>
    <input type="password" id="ed-contrasena">

    <label>Área:</label>
    <input type="text" id="ed-area">

    <label>Estado:</label>
    <select id="ed-estado">
      <option value="activo">Activo</option>
      <option value="inactivo">Inactivo</option>
    </select>

    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalEditar')">Salir</button>
      <button type="button" class="btn-confirmar" onclick="guardarEdicion()">Confirmar</button>
    </div>
  </form>
</div>

<!-- ===================== MODAL: AGREGAR ===================== -->
<div class="modal-overlay" id="modalAgregar">
  <form class="modal-box modal-white" onsubmit="return false;">
    <h2>Agregar docente</h2>

    <label>Nombre Completo:</label>
    <input type="text" id="ag-nombre" placeholder="Ingrese su nombre completo...">

    <label>Usuario:</label>
    <input type="text" id="ag-usuario" placeholder="Ingrese su usuario...">

    <label>Contraseña:</label>
    <input type="password" id="ag-contrasena" placeholder="Ingrese su contraseña...">

    <label>Área:</label>
    <input type="text" id="ag-area" placeholder="Ingrese su área...">

    <label>Estado:</label>
    <select id="ag-estado">
      <option value="activo" selected>Activo</option>
      <option value="inactivo">Inactivo</option>
    </select>

    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalAgregar')">Salir</button>
      <button type="button" class="btn-confirmar" onclick="guardarNuevo()">Confirmar</button>
    </div>
  </form>
</div>

<!-- ===================== MODAL: ELIMINAR (confirmación) ===================== -->
<div class="modal-overlay" id="modalEliminar">
  <div class="confirm-box">
    <div class="confirm-header">¿Estás seguro que quieres eliminar este registro?</div>
    <input type="hidden" id="el-id">
    <div class="confirm-actions">
      <button type="button" class="btn-no" onclick="cerrarModal('modalEliminar')">No</button>
      <button type="button" class="btn-si" onclick="confirmarEliminar()">Sí</button>
    </div>
  </div>
</div>

<!-- ===================== MODAL: CERRAR SESION ===================== -->
<div class="modal-overlay" id="modalCerrarSesion">
  <div class="confirm-box">
    <div class="confirm-header">¿Estás seguro de cerrar sesión?</div>
    <div class="confirm-actions">
      <button type="button" class="btn-no" onclick="cerrarModal('modalCerrarSesion')">No</button>
      <button type="button" class="btn-si" onclick="confirmarCerrarSesion()">Sí</button>
    </div>
  </div>
</div>

<script>
  // ---------- Utilidades genéricas para abrir/cerrar cualquier modal ----------
  function abrirModal(idModal) {
    document.getElementById(idModal).classList.add('activo');
  }
  function cerrarModal(idModal) {
    document.getElementById(idModal).classList.remove('activo');
  }

  // ---------- Ver más: llena el modal de solo lectura con los datos de la fila ----------
  function verMas(nombre, usuario, contrasena, area, estado) {
    document.getElementById('vm-nombre').value = nombre;
    document.getElementById('vm-usuario').value = usuario;
    document.getElementById('vm-contrasena').value = contrasena;
    document.getElementById('vm-area').value = area;
    document.getElementById('vm-estado').value = estado;
    abrirModal('modalVerMas');
  }

  // ---------- Editar: precarga el modal editable con los datos de la fila ----------
  function editar(id, nombre, usuario, contrasena, area, estado) {
    document.getElementById('ed-id').value = id;
    document.getElementById('ed-nombre').value = nombre;
    document.getElementById('ed-usuario').value = usuario;
    document.getElementById('ed-contrasena').value = contrasena;
    document.getElementById('ed-area').value = area;
    document.getElementById('ed-estado').value = estado;
    abrirModal('modalEditar');
  }

  // Cuando conectes la base de datos, agrega aquí tu llamada (fetch/AJAX)
  // hacia tu Servlet, enviando los valores de los campos ed-*.
  function guardarEdicion() {
    // TODO: peticion real al backend con los datos del formulario de edicion
    // Ejemplo:
    // fetch('editarDocenteServlet', { method: 'POST', body: new FormData(...) })
    //   .then(() => window.location.reload());
    cerrarModal('modalEditar');
  }

  // Cuando conectes la base de datos, agrega aquí tu llamada (fetch/AJAX)
  // hacia tu Servlet, enviando los valores de los campos ag-*.
  function guardarNuevo() {
    // TODO: peticion real al backend con los datos del formulario de alta
    cerrarModal('modalAgregar');
  }

  // ---------- Activo / Inactivo: refleja el cambio visualmente ----------
  function cambiarEstado(id, checkbox) {
    var celda = document.getElementById('estadoTexto-' + id);
    if (checkbox.checked) {
      celda.textContent = 'Activo';
      celda.classList.remove('badge-inactivo');
      celda.classList.add('badge-activo');
      // TODO: peticion al backend para marcar id=" + id + " como activo
    } else {
      celda.textContent = 'Inactivo';
      celda.classList.remove('badge-activo');
      celda.classList.add('badge-inactivo');
      // TODO: peticion al backend para marcar id=" + id + " como inactivo
    }
  }

  // ---------- Eliminar: pide confirmación con modal antes de borrar ----------
  function eliminar(id) {
    document.getElementById('el-id').value = id;
    abrirModal('modalEliminar');
  }
  function confirmarEliminar() {
    var id = document.getElementById('el-id').value;
    // TODO: peticion real al backend para eliminar el id=" + id
    cerrarModal('modalEliminar');
  }

  // ---------- Cerrar sesion confirmado ----------
  function confirmarCerrarSesion() {
    // TODO: aqui rediriges a tu Servlet/endpoint real de logout, por ejemplo:
    // window.location.href = 'cerrarSesion';
    cerrarModal('modalCerrarSesion');
  }
</script>

</body>
</html>
