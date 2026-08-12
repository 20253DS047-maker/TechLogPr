<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registros - UTEZ</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

    /* Header */
    .header-section {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 15px;
      flex-shrink: 0;
    }
    .logo-img {
      max-height: 90px;
      width: auto;
      object-fit: contain;
    }
    .main-title {
      color: #0d8065;
      font-size: 3rem;
      font-weight: 500;
      margin: 0;
      letter-spacing: 1px;
    }
    .btn-custom-dark {
      background-color: #172c45;
      color: #ffffff;
      border-radius: 8px;
      font-weight: 500;
      padding: 6px 20px;
      border: none;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-size: 0.95rem;
      cursor: pointer;
    }
    .btn-custom-dark:hover {
      background-color: #0f1e30;
      color: #ffffff;
    }

    /* Buscador */
    .search-bar-container {
      display: flex;
      gap: 15px;
      margin-bottom: 15px;
      flex-shrink: 0;
    }
    .search-input-group {
      position: relative;
      flex-grow: 1;
    }
    .search-input-group input {
      border-radius: 20px;
      padding-right: 45px;
      border: 1px solid #777777;
      height: 42px;
      background-color: #ffffff;
      font-size: 0.95rem;
      color: #555555;
      width: 100%;
      padding-left: 15px;
    }
    .search-input-group .search-icon {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #333333;
      font-size: 1.1rem;
      cursor: pointer;
    }

    /* Tabla flexible que ocupa todo el alto restante */
    .table-container {
      background-color: #e5ded8;
      border-radius: 2px;
      padding: 0;
      overflow: hidden;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      display: block;
      flex-direction: column;
    }
    .custom-table {
      width: 100%;
      border-collapse: collapse;
      table-layout: fixed;
    }
    .custom-table thead {
      height: 50px;
    }
    .custom-table th {
      color: #0d8065;
      font-weight: 700;
      font-size: 0.95rem;
      padding: 12px;
      border-bottom: 2px solid #444444;
      letter-spacing: 0.5px;
    }
    .custom-table td {
      padding: 8px 12px;
      border-bottom: 1px solid #777777;
      font-size: 0.95rem;
      color: #222222;
      vertical-align: middle;
    }

    /* El cuerpo distribuye de manera uniforme las filas para llenar la pantalla */
    .custom-table tbody {}
    .custom-table tbody tr {
      height: 45px; /* Hace que las 8 filas ocupen exactamente el 100% del alto disponible */
    }

    .badge-activo { color: #0d8065; font-weight: 600; }
    .badge-inactivo { color: #b03a3a; font-weight: 600; }

    /* Iconos de acciones */
    .icon-btn {
      border: none;
      background: none;
      color: #222222;
      margin: 0 4px;
      cursor: pointer;
      font-size: 1.2rem;
      padding: 0;
    }

    /* Footer y paginación al final */
    .footer-controls {
      display: grid;
      grid-template-columns: 1fr auto 1fr;
      align-items: center;
      margin-top: 15px;
      flex-shrink: 0;
    }
    .radio-group {
      justify-self: start;
      display: flex;
      gap: 20px;
      align-items: center;
    }
    .radio-group .form-check-input {
      width: 18px;
      height: 18px;
      cursor: pointer;
      border: 1.5px solid #333;
    }
    .radio-group .form-check-input:checked {
      background-color: #000;
      border-color: #000;
    }
    .pagination-custom {
      grid-column: 2;
      justify-self: center;
      display: flex;
      gap: 6px;
      align-items: center;
    }
    .pagination-custom .page-btn {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      border: 1.5px solid #333333;
      background: #ffffff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 0.85rem;
      font-weight: bold;
      color: #333333;
      text-decoration: none;
      cursor: pointer;
    }
    .pagination-custom .page-btn.active {
      background-color: #0d8065;
      color: #ffffff;
      border-color: #0d8065;
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
    .btn-confirmar {
      background-color: #172c45;
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
    }
    .confirm-header {
      background-color: #0d8065;
      color: #fff;
      padding: 14px;
      font-weight: 700;
    }
    .confirm-icon {
      width: 56px;
      height: 56px;
      border-radius: 50%;
      background-color: #2c2c2c;
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.6rem;
      margin: 24px auto 12px;
    }
    .confirm-text { padding: 0 24px 20px; color: #333; font-size: 0.9rem; }
    .confirm-actions { display: flex; gap: 14px; padding: 0 24px 24px; }
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
  <!-- Encabezado -->
  <div class="header-section">
    <div>
      <img src="imagenes/Logotipo-UTEZ-scaled.png" alt="UTEZ" class="logo-img">
    </div>

    <h1 class="main-title">Registros</h1>

    <div class="d-flex flex-column gap-2 align-items-end">
      <button type="button" class="btn-custom-dark" onclick="abrirModal('modalCerrarSesion')">Cerrar Sesion</button>
      <button type="button" class="btn-custom-dark" onclick="abrirModal('modalAgregar')"><i class="fa-solid fa-square-plus"></i> Agregar</button>
    </div>
  </div>

  <!-- Buscador -->
  <div class="search-bar-container">
    <button class="btn btn-custom-dark px-4" onclick="window.location.href='registro-docente-servlet'">Usuarios</button>
    <div class="search-input-group">
      <input type="text" id="buscarMatricula" class="form-control" placeholder="Introduzca la matricula para buscar en el registro....">
      <i class="fa-solid fa-magnifying-glass search-icon"></i>
    </div>
  </div>

  <!-- Tabla Agrandada dinámicamente -->
  <div class="table-container">
    <table class="custom-table text-center">
      <thead>
      <tr>
        <th style="width: 10%;">ID_REGISTRO</th>
        <th style="width: 15%;">MATRÍCULA</th>
        <th style="width: 20%;">NOMBRE DOCENTE</th>
        <th style="width: 20%;">OBSERVACIONES</th>
        <th style="width: 15%">ESTADO</th>
        <th style="width: 20%;">ACCIONES</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${listaRegistroBtcAlumnos}" var="registroAlumnos" varStatus="estado">
        <tr>
          <th scope="row">${estado.count}</th>
          <td>${registroAlumnos.matricula_usuario}</td>
          <td>${registroAlumnos.nombreDocente}</td>
          <td>${registroAlumnos.observaciones}</td>

          <td id="estadoTexto-0" class="badge-activo">Activo</td>
          <td>
            <button type="button" class="icon-btn" id="estadoBtn-0" title="Activar/Desactivar" onclick="cambiarEstado(0, this)">
              <i class="fa-solid fa-toggle-on"></i>
            </button>
            <button type="button" class="icon-btn" title="Ver detalles"
                    onclick="verMas({
                    matricula: '20253DS196',
                    nombre: 'Jonathan AlejandroLopez Benitez',
                    fecha: '11/11/2026',
                    pc: '15',
                    horaEntrada: '11:00 AM',
                    salon: 'MAC9',
                    horaSalida: '13:00 PM',
                    docencia: 'D4',
                    estado: 'Activo',
                    docente: ''
                  })">
              <i class="fa-regular fa-eye"></i>
            </button>
            <button type="button" class="icon-btn" title="Editar"
                    onclick="editar(0, {
                    matricula: '20253DS196',
                    nombre: 'Jonathan AlejandroLopez Benitez',
                    fecha: '11/11/2026',
                    pc: '15',
                    horaEntrada: '11:00 AM',
                    salon: 'MAC9',
                    horaSalida: '13:00 PM',
                    docencia: 'D4',
                    estado: 'activo',
                    docente: ''
                  })">
              <i class="fa-regular fa-pen-to-square"></i>
            </button>
            <button type="button" class="icon-btn" title="Eliminar" onclick="eliminar(0)">
              <i class="fa-regular fa-trash-can"></i>
            </button>
          </td>
        </tr>

        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>
        <tr class="empty-row"><td colspan="8">&nbsp;</td></tr>


      </c:forEach>

      </tbody>
    </table>
  </div>

  <div class="footer-controls">
    <div class="radio-group">
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtro" id="optA" value="A" onchange="window.location.href='admin-alumno-servlet'">
        <label class="form-check-label fw-bold ms-1" for="optA">A</label>
      </div>
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtro" id="optD" value="D" onchange="window.location.href='admin-registrosDocente-servlet'">
        <label class="form-check-label fw-bold ms-1" for="optD">D</label>
      </div>
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtro" id="optA" value="A" onchange="window.location.href='vista-admin-servlet'" disabled>
        <label class="form-check-label fw-bold ms-1" for="optA">T</label>
      </div>
    </div>

    <div class="pagination-custom">
      <a class="page-btn"><i class="fa-solid fa-angles-left"></i></a>
      <a class="page-btn"><i class="fa-solid fa-angle-left"></i></a>
      <a class="page-btn active">1</a>
      <a class="page-btn">2</a>
      <a class="page-btn">3</a>
      <a class="page-btn">4</a>
      <a class="page-btn"><i class="fa-solid fa-angle-right"></i></a>
      <a class="page-btn"><i class="fa-solid fa-angles-right"></i></a>
    </div>

    <div></div>
  </div>
</div>

<!-- MODALES -->

<!-- Modal Ver Más -->
<div class="modal-overlay" id="modalVerMas">
  <div class="modal-box modal-white">
    <h2>Detalle del registro</h2>
    <label>Matrícula:</label>
    <input type="text" id="vm-matricula" disabled>
    <label>Nombre Completo:</label>
    <input type="text" id="vm-nombre" disabled>
    <div class="row-2">
      <div>
        <label>Fecha:</label>
        <input type="text" id="vm-fecha" disabled>
      </div>
      <div>
        <label>PC:</label>
        <input type="text" id="vm-pc" disabled>
      </div>
    </div>
    <div class="row-2">
      <div>
        <label>Hora Entrada:</label>
        <input type="text" id="vm-horaEntrada" disabled>
      </div>
      <div>
        <label>Salón:</label>
        <input type="text" id="vm-salon" disabled>
      </div>
    </div>
    <div class="row-2">
      <div>
        <label>Hora Salida:</label>
        <input type="text" id="vm-horaSalida" disabled>
      </div>
      <div>
        <label>Docencia:</label>
        <input type="text" id="vm-docencia" disabled>
      </div>
    </div>
    <label>Estado:</label>
    <input type="text" id="vm-estado" disabled>
    <label>Docente:</label>
    <input type="text" id="vm-docente" disabled>
    <div class="modal-actions">
      <button type="button" class="btn-salir" style="max-width:100%" onclick="cerrarModal('modalVerMas')">Salir</button>
    </div>
  </div>
</div>

<!-- Modal Editar -->
<div class="modal-overlay" id="modalEditar">
  <form class="modal-box modal-white" onsubmit="return false;">
    <h2>Editar registro</h2>
    <input type="hidden" id="ed-id">
    <label>Matrícula:</label>
    <input type="text" id="ed-matricula">
    <label>Nombre Completo:</label>
    <input type="text" id="ed-nombre">
    <div class="row-2">
      <div>
        <label>Fecha:</label>
        <input type="text" id="ed-fecha">
      </div>
      <div>
        <label>PC:</label>
        <input type="text" id="ed-pc">
      </div>
    </div>
    <div class="row-2">
      <div>
        <label>Hora Entrada:</label>
        <input type="text" id="ed-horaEntrada">
      </div>
      <div>
        <label>Salón:</label>
        <input type="text" id="ed-salon">
      </div>
    </div>
    <div class="row-2">
      <div>
        <label>Hora Salida:</label>
        <input type="text" id="ed-horaSalida">
      </div>
      <div>
        <label>Docencia:</label>
        <select id="ed-docencia">
          <option value="D4">D4</option>
          <option value="D3">D3</option>
        </select>
      </div>
    </div>
    <label>Estado:</label>
    <select id="ed-estado">
      <option value="activo">Activo</option>
      <option value="inactivo">Inactivo</option>
    </select>
    <label>Docente:</label>
    <input type="text" id="ed-docente" placeholder="Ingrese su Docente">
    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalEditar')">Salir</button>
      <button type="button" class="btn-confirmar" onclick="guardarEdicion()">Confirmar</button>
    </div>
  </form>
</div>

<!-- Modal Agregar -->
<div class="modal-overlay" id="modalAgregar">
  <form class="modal-box modal-white" onsubmit="return false;">
    <h2>Agregar registro</h2>
    <label>Matrícula:</label>
    <input type="text" id="ag-matricula" placeholder="Introduzca su matrícula">
    <label>Nombre Completo:</label>
    <input type="text" id="ag-nombre" placeholder="Introduzca su nombre completo">
    <div class="row-2">
      <div>
        <label>Fecha:</label>
        <input type="text" id="ag-fecha" placeholder="Seleccione...">
      </div>
      <div>
        <label>PC:</label>
        <input type="text" id="ag-pc" placeholder="Introduzca N. de PC">
      </div>
    </div>
    <label>Salón:</label>
    <input type="text" id="ag-salon" placeholder="Introduzca su salón">
    <label>Docencia:</label>
    <select id="ag-docencia">
      <option value="" disabled selected hidden>Seleccione su Docencia</option>
      <option value="D2">D2</option>
      <option value="D4">D4</option>
      <option value="CECADEC">CECADEC</option>
    </select>
    <label>Estado:</label>
    <select id="ag-estado">
      <option value="" disabled selected hidden>Seleccione su estado</option>
      <option value="activo">Activo</option>
      <option value="inactivo">Inactivo</option>
    </select>
    <label>Docente:</label>
    <input type="text" id="ag-docente" placeholder="Ingrese su Docente">
    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalAgregar')">Salir</button>
      <button type="button" class="btn-confirmar" onclick="guardarNuevo()">Confirmar</button>
    </div>
  </form>
</div>

<!-- Modal Eliminar -->
<div class="modal-overlay" id="modalEliminar">
  <div class="confirm-box">
    <div class="confirm-header">Eliminar Registro</div>
    <div class="confirm-icon"><i class="bi bi-question-lg"></i></div>
    <div class="confirm-text">¿Estás seguro que quieres eliminar este registro?</div>
    <input type="hidden" id="el-id">
    <div class="confirm-actions">
      <button type="button" class="btn-no" onclick="cerrarModal('modalEliminar')">No</button>
      <button type="button" class="btn-si" onclick="confirmarEliminar()">Sí</button>
    </div>
  </div>
</div>

<!-- Modal Cerrar Sesión -->
<div class="modal-overlay" id="modalCerrarSesion">
  <div class="confirm-box">
    <div class="confirm-header">¿Estás seguro de cerrar sesión?</div>
    <div class="confirm-actions">
      <button type="button" class="btn-no" onclick="cerrarModal('modalCerrarSesion')">No</button>
      <button type="button" class="btn-si" onclick="window.location.href='login-admin-servlet'">Sí</button>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function abrirModal(idModal) {
    document.getElementById(idModal).classList.add('activo');
  }
  function cerrarModal(idModal) {
    document.getElementById(idModal).classList.remove('activo');
  }

  function verMas(datos) {
    document.getElementById('vm-matricula').value = datos.matricula;
    document.getElementById('vm-nombre').value = datos.nombre;
    document.getElementById('vm-fecha').value = datos.fecha;
    document.getElementById('vm-pc').value = datos.pc;
    document.getElementById('vm-horaEntrada').value = datos.horaEntrada;
    document.getElementById('vm-salon').value = datos.salon;
    document.getElementById('vm-horaSalida').value = datos.horaSalida;
    document.getElementById('vm-docencia').value = datos.docencia;
    document.getElementById('vm-estado').value = datos.estado;
    document.getElementById('vm-docente').value = datos.docente;
    abrirModal('modalVerMas');
  }

  function editar(id, datos) {
    document.getElementById('ed-id').value = id;
    document.getElementById('ed-matricula').value = datos.matricula;
    document.getElementById('ed-nombre').value = datos.nombre;
    document.getElementById('ed-fecha').value = datos.fecha;
    document.getElementById('ed-pc').value = datos.pc;
    document.getElementById('ed-horaEntrada').value = datos.horaEntrada;
    document.getElementById('ed-salon').value = datos.salon;
    document.getElementById('ed-horaSalida').value = datos.horaSalida;
    document.getElementById('ed-docencia').value = datos.docencia;
    document.getElementById('ed-estado').value = datos.estado;
    document.getElementById('ed-docente').value = datos.docente;
    abrirModal('modalEditar');
  }

  function guardarEdicion() {
    cerrarModal('modalEditar');
  }

  function guardarNuevo() {
    cerrarModal('modalAgregar');
  }

  function cambiarEstado(id, boton) {
    var celda = document.getElementById('estadoTexto-' + id);
    var icono = boton.querySelector('i');
    var activo = icono.classList.contains('fa-toggle-on');

    if (activo) {
      icono.classList.remove('fa-toggle-on');
      icono.classList.add('fa-toggle-off');
      celda.textContent = 'Inactivo';
      celda.classList.remove('badge-activo');
      celda.classList.add('badge-inactivo');
    } else {
      icono.classList.remove('fa-toggle-off');
      icono.classList.add('fa-toggle-on');
      celda.textContent = 'Activo';
      celda.classList.remove('badge-inactivo');
      celda.classList.add('badge-activo');
    }
  }

  function eliminar(id) {
    document.getElementById('el-id').value = id;
    abrirModal('modalEliminar');
  }
  function confirmarEliminar() {
    cerrarModal('modalEliminar');
  }
</script>

</body>
</html>
