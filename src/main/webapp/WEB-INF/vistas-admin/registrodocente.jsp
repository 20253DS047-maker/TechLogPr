<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Tabla que muestra los registros de los docentes en la bitacora -->

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
      overflow: hidden;
    }
    body {
      background-color: #cbc8be;
      color: #333333;
      font-family: Arial, Helvetica, sans-serif;
      padding: 20px 40px 70px 40px; /* Espacio reservado para la barra inferior fija */
      display: flex;
      flex-direction: column;
    }

    .main-wrapper {
      display: flex;
      flex-direction: column;
      height: 100%;
      width: 100%;
      position: relative;
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
      overflow-y: auto; /* Muestra desplazamiento interno si hay muchos registros */
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      flex-grow: 1; /* Ocupa el espacio vertical restante */
      margin-bottom: 10px;
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

    .custom-table tbody tr {
      height: 45px;
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

    /* Footer FIJO únicamente con los radio buttons */
    .footer-controls {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 60px;
      background-color: #cbc8be;
      padding: 0 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      z-index: 10;
    }
    .radio-group {
      display: flex;
      gap: 15px;
      align-items: center;
    }
    .radio-group-right {
      display: flex;
      gap: 15px;
      align-items: center;
    }
    .radio-group .form-check-input,
    .radio-group-right .form-check-input {
      width: 18px;
      height: 18px;
      cursor: pointer;
      border: 1.5px solid #333;
    }
    .radio-group .form-check-input:checked,
    .radio-group-right .form-check-input:checked {
      background-color: #000;
      border-color: #000;
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

    <h1 class="main-title">Registros Docentes</h1>

    <div class="d-flex flex-column gap-2 align-items-end">
      <button type="button" class="btn-custom-dark" onclick="abrirModal('modalCerrarSesion')">Cerrar Sesión</button>
      <button type="button" class="btn-custom-dark" onclick="abrirModal('modalAgregar')"><i class="fa-solid fa-square-plus"></i> Agregar</button>
    </div>
  </div>

  <!-- Buscador por Nombre -->
  <div class="search-bar-container">
    <button class="btn btn-custom-dark px-4" onclick="window.location.href='registro-docente-servlet'">Registrar Usuarios</button>
    <div class="search-input-group">
      <input type="text" id="buscarNombre" class="form-control" placeholder="Introduzca el nombre para buscar en el registro....">
      <i class="fa-solid fa-magnifying-glass search-icon"></i>
    </div>
  </div>

  <!-- Tabla -->
  <div class="table-container">
    <table class="custom-table text-center">
      <thead>
      <tr>
        <th style="width: 8%;">ID</th>
        <th style="width: 17%;">NOMBRE</th>
        <th style="width: 17%;">APELLIDO PATERNO</th>
        <th style="width: 17%;">APELLIDO MATERNO</th>
        <th style="width: 13%;">ÁREA</th>
        <th style="width: 14%;">FECHA REGISTRO</th>
        <th style="width: 8%;">ESTADO</th>
        <th style="width: 12%;">ACCIONES</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${listaRegistrosBtcDocentes}" var="registroBtcDocente" varStatus="estado">
        <tr>
          <td>${registroBtcDocente.id}</td>
          <td>${registroBtcDocente.nombre}</td>
          <td>${registroBtcDocente.apellidoPaterno}</td>
          <td>${registroBtcDocente.apellidoMaterno}</td>
          <td>${registroBtcDocente.area}</td>
          <td>${registroBtcDocente.fechaRegistro}</td>
          <td id="estadoTexto-${estado.index}" class="badge-activo">Activo</td>

          <td>
            <button type="button" class="icon-btn" id="estadoBtn-${estado.index}" title="Activar/Desactivar" onclick="cambiarEstado('${estado.index}', this)">
              <i class="fa-solid fa-toggle-on"></i>
            </button>
            <button type="button" class="icon-btn" title="Ver detalles"
                    onclick="verMas({
                            id: '${registroBtcDocente.id}',
                            nombre: '${registroBtcDocente.nombre}',
                            paterno: '${registroBtcDocente.apellidoPaterno}',
                            materno: '${registroBtcDocente.apellidoMaterno}',
                            area: '${registroBtcDocente.area}'
                            })">
              <i class="fa-regular fa-eye"></i>
            </button>
            <button type="button" class="icon-btn" title="Editar"
                    onclick="editar('${registroBtcDocente.id}', {
                            nombre: '${registroBtcDocente.nombre}',
                            apellidoPaterno: '${registroBtcDocente.apellidoPaterno}',
                            apellidoMaterno: '${registroBtcDocente.apellidoMaterno}',
                            area: '${registroBtcDocente.area}'
                            })">
              <i class="fa-regular fa-pen-to-square"></i>
            </button>
            <button type="button" class="icon-btn" title="Eliminar" onclick="eliminar('${registroBtcDocente.id}', this)">
              <i class="fa-regular fa-trash-can"></i>
            </button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Footer Fijo abajo sólo con Radios -->
  <div class="footer-controls">
    <!-- Esquina Izquierda: Filtros de Bitácora -->
    <div class="radio-group">
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtroBitacora" id="optBitacoraAlumno" value="PC" onchange="window.location.href='admin-pc-servlet'">
        <label class="form-check-label fw-bold ms-1" for="optBitacoraAlumno">Bitácora(PC)</label>
      </div>
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtroBitacora" id="optBitacoraDocente" value="D" checked onchange="window.location.href='admin-registrosDocente-servlet'" disabled>
        <label class="form-check-label fw-bold ms-1" for="optBitacoraDocente">Bitácora(Docente)</label>
      </div>
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtroBitacora" id="optBitacoraPC" value="A" onchange="window.location.href='admin-alumno-servlet'">
        <label class="form-check-label fw-bold ms-1" for="optBitacoraPC">Bitácora(Alumno)</label>
      </div>
    </div>

    <!-- Esquina Derecha: Filtros de Usuarios -->
    <div class="radio-group-right">
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtroUsuarios" id="optUsuarioAlumno" value="UA" onchange="window.location.href='usuarios-alumnos-servlet'">
        <label class="form-check-label fw-bold ms-1" for="optUsuarioAlumno">Usuarios Alumnos</label>
      </div>
      <div class="form-check form-check-inline m-0">
        <input class="form-check-input" type="radio" name="filtroUsuarios" id="optUsuarioDocente" value="UD" onchange="window.location.href='usuarios-docentes-servlet'">
        <label class="form-check-label fw-bold ms-1" for="optUsuarioDocente">Usuarios Docentes</label>
      </div>
    </div>
  </div>
</div>

<!-- MODALES -->

<!-- Modal Ver Más -->
<div class="modal-overlay" id="modalVerMas">
  <div class="modal-box modal-white">
    <h2>Detalle del Docente</h2>

    <label>ID:</label>
    <input type="text" id="vm-id" disabled>

    <label>Nombre(s):</label>
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

    <label>Área:</label>
    <input type="text" id="vm-area" disabled>

    <div class="modal-actions">
      <button type="button" class="btn-salir" style="max-width:100%" onclick="cerrarModal('modalVerMas')">Salir</button>
    </div>
  </div>
</div>

<!-- Modal Editar -->
<div class="modal-overlay" id="modalEditar">
  <form class="modal-box modal-white" onsubmit="return false;">
    <h2>Editar docente</h2>
    <input type="hidden" id="ed-id">
    <label>Nombre:</label>
    <input type="text" id="ed-nombre">
    <div class="row-2">
      <div>
        <label>Apellido Paterno:</label>
        <input type="text" id="ed-apellidoPaterno">
      </div>
      <div>
        <label>Apellido Materno:</label>
        <input type="text" id="ed-apellidoMaterno">
      </div>
    </div>
    <label>Área:</label>
    <input type="text" id="ed-area">
    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalEditar')">Salir</button>
      <button type="button" class="btn-confirmar" onclick="guardarEdicion()">Confirmar</button>
    </div>
  </form>
</div>

<!-- Modal Agregar -->
<div class="modal-overlay" id="modalAgregar">
  <form class="modal-box modal-white" action="AgregarRegistroDocenteServlet">
    <h2>Agregar registro</h2>
    <label>Nombre:</label>
    <input type="text" name="nombre" id="ag-nombre" placeholder="Introduzca su nombre">
    <label>Apellido Paterno:</label>
    <input type="text" name="apellido_paterno" id="ag-salon" placeholder="Introduzca su apellido paterno">
    <label>Apellido Materno:</label>
    <input type="text" name="apellido_materno" id="ag-docente" placeholder="Ingrese su apellido materno">
    <label for="area" class="form-label">Área:</label>
    <select class="form-select" id="area" name="area" aria-label="Default select example">
      <option selected disabled>Seleccione una opción</option>
      <option value="DATID">DATID</option>
      <option value="DAMI">DAMI</option>
      <option value="DACEA">DACEA</option>
      <option value="DATEFI">DATEFI</option>
    </select>
    <div class="modal-actions">
      <button type="button" class="btn-salir" onclick="cerrarModal('modalAgregar')">Salir</button>
      <button type="submit" class="btn-confirmar">Confirmar</button>
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
  var filaAEliminar = null;

  /* BUSCADOR POR NOMBRE */
  document.getElementById('buscarNombre').addEventListener('keyup', function() {
    let filtro = this.value.toLowerCase().trim();
    let filas = document.querySelectorAll('.custom-table tbody tr');

    filas.forEach(function(fila) {
      let celdaNombre = fila.getElementsByTagName('td')[1]; // Columna NOMBRE
      if (celdaNombre) {
        let textoNombre = celdaNombre.textContent || celdaNombre.innerText;
        if (textoNombre.toLowerCase().includes(filtro)) {
          fila.style.display = '';
        } else {
          fila.style.display = 'none';
        }
      }
    });
  });

  /* FUNCIONALIDADES DE MODALES Y ACCIONES */
  function abrirModal(idModal) {
    document.getElementById(idModal).classList.add('activo');
  }
  function cerrarModal(idModal) {
    document.getElementById(idModal).classList.remove('activo');
  }

  function verMas(datos) {
    document.getElementById('vm-id').value = datos.id || '';
    document.getElementById('vm-nombre').value = datos.nombre || '';
    document.getElementById('vm-paterno').value = datos.paterno || '';
    document.getElementById('vm-materno').value = datos.materno || '';
    document.getElementById('vm-area').value = datos.area || '';
    abrirModal('modalVerMas');
  }

  function editar(id, datos) {
    document.getElementById('ed-id').value = id;
    document.getElementById('ed-nombre').value = datos.nombre || '';
    document.getElementById('ed-apellidoPaterno').value = datos.apellidoPaterno || '';
    document.getElementById('ed-apellidoMaterno').value = datos.apellidoMaterno || '';
    document.getElementById('ed-area').value = datos.area || '';
    abrirModal('modalEditar');
  }

  function guardarEdicion() {
    var idOriginal = document.getElementById('ed-id').value;
    var body = 'id_original=' + encodeURIComponent(idOriginal) +
            '&nombre=' + encodeURIComponent(document.getElementById('ed-nombre').value) +
            '&apellido_paterno=' + encodeURIComponent(document.getElementById('ed-apellidoPaterno').value) +
            '&apellido_materno=' + encodeURIComponent(document.getElementById('ed-apellidoMaterno').value) +
            '&area=' + encodeURIComponent(document.getElementById('ed-area').value);

    fetch('editar-docente-servlet', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: body
    })
            .then(function (response) { return response.json(); })
            .then(function (data) {
              if (data.success) {
                location.reload();
              } else {
                alert('No se pudo editar: ' + (data.message || 'Error desconocido'));
                cerrarModal('modalEditar');
              }
            })
            .catch(function (error) {
              console.error(error);
              alert('Error de conexión al editar el registro.');
              cerrarModal('modalEditar');
            });
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

  function eliminar(id, boton) {
    document.getElementById('el-id').value = id;
    filaAEliminar = boton ? boton.closest('tr') : null;
    abrirModal('modalEliminar');
  }

  function confirmarEliminar() {
    var id = document.getElementById('el-id').value;

    fetch('eliminar-docente-servlet', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: 'id=' + encodeURIComponent(id)
    })
            .then(function (response) { return response.json(); })
            .then(function (data) {
              if (data.success) {
                if (filaAEliminar) {
                  filaAEliminar.remove();
                }
              } else {
                alert('No se pudo eliminar: ' + (data.message || 'Error desconocido'));
              }
              cerrarModal('modalEliminar');
            })
            .catch(function (error) {
              console.error(error);
              alert('Error de conexión al eliminar el registro.');
              cerrarModal('modalEliminar');
            });
  }
</script>

</body>
</html>
