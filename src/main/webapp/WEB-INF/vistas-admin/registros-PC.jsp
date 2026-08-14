<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12/08/2026
  Time: 08:56 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros PC - UTEZ</title>

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

        /* Filas con altura fija */
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
            gap: 15px;
            align-items: center;
        }
        .radio-group-right {
            justify-self: end;
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

        <h1 class="main-title">Registros Equipos / PC</h1>

        <!-- Únicamente botón para cerrar sesión (Sin botón agregar) -->
        <div class="d-flex flex-column gap-2 align-items-end">
            <button type="button" class="btn-custom-dark" onclick="abrirModal('modalCerrarSesion')">Cerrar Sesion</button>
        </div>
    </div>

    <!-- Buscador -->
    <div class="search-bar-container">
        <button class="btn btn-custom-dark px-4" onclick="window.location.href='registro-docente-servlet'">Usuarios</button>
        <div class="search-input-group">
            <input type="text" id="buscarPC" class="form-control" placeholder="Introduzca el número de PC o salón para buscar....">
            <i class="fa-solid fa-magnifying-glass search-icon"></i>
        </div>
    </div>

    <!-- Tabla de Equipos PC -->
    <div class="table-container">
        <table class="custom-table text-center">
            <thead>
            <tr>
                <th style="width: 10%;">ID_PC</th>
                <th style="width: 15%;">MESA / ISLA</th>
                <th style="width: 15%;">SALÓN</th>
                <th style="width: 15%;">DOCENCIA</th>
                <th style="width: 20%;">MODELO</th>
                <th style="width: 10%;">ESTADO</th>
                <th style="width: 15%;">ACCIONES</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listaRegistrosPC}" var="pc" varStatus="estado">
                <tr>
                    <th scope="row">${pc.id_pc}</th>
                    <td>${pc.mesa}</td>
                    <td>${pc.salon_computo}</td>
                    <td>${pc.docencia}</td>
                    <td>${pc.modelo}</td>
                    <td id="estadoTexto-${estado.index}" class="${pc.estado == 'activo' ? 'badge-activo' : 'badge-inactivo'}">
                            ${pc.estado}
                    </td>
                    <td>
                        <button type="button" class="icon-btn" id="estadoBtn-${estado.index}" title="Activar/Desactivar" onclick="cambiarEstado('${estado.index}', this)">
                            <i class="fa-solid ${pc.estado == 'activo' ? 'fa-toggle-on' : 'fa-toggle-off'}"></i>
                        </button>
                        <button type="button" class="icon-btn" title="Ver detalles"
                                onclick="verMas({
                                        id_pc: '${pc.id_pc}',
                                        mesa: '${pc.mesa}',
                                        salon: '${pc.salon_computo}',
                                        docencia: '${pc.docencia}',
                                        modelo: '${pc.modelo}',
                                        estado: '${pc.estado}'
                                        })">
                            <i class="fa-regular fa-eye"></i>
                        </button>
                        <button type="button" class="icon-btn" title="Editar"
                                onclick="editar('${estado.index}', {
                                        id_pc: '${pc.id_pc}',
                                        mesa: '${pc.mesa}',
                                        salon: '${pc.salon_computo}',
                                        docencia: '${pc.docencia}',
                                        modelo: '${pc.modelo}',
                                        estado: '${pc.estado}'
                                        })">
                            <i class="fa-regular fa-pen-to-square"></i>
                        </button>
                        <button type="button" class="icon-btn" title="Eliminar" onclick="eliminar('${pc.numero_pc}', this)">
                            <i class="fa-regular fa-trash-can"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>

            <!-- Filas vacías por defecto en caso de no haber iteraciones Java -->
            <tr>
                <th scope="row">15</th>
                <td>Mesa 2</td>
                <td>CC7</td>
                <td>D4</td>
                <td>HP EliteDesk</td>
                <td id="estadoTexto-0" class="badge-activo">Activo</td>
                <td>
                    <button type="button" class="icon-btn" id="estadoBtn-0" title="Activar/Desactivar" onclick="cambiarEstado(0, this)">
                        <i class="fa-solid fa-toggle-on"></i>
                    </button>
                    <button type="button" class="icon-btn" title="Ver detalles"
                            onclick="verMas({
                  id_pc: '15',
                  mesa: 'Mesa 2',
                  salon: 'CC7',
                  docencia: 'D4',
                  modelo: 'HP EliteDesk',
                  estado: 'Activo'
                })">
                        <i class="fa-regular fa-eye"></i>
                    </button>
                    <button type="button" class="icon-btn" title="Editar"
                            onclick="editar(0, {
                  id_pc: '15',
                  mesa: 'Mesa 2',
                  salon: 'CC7',
                  docencia: 'D4',
                  modelo: 'HP EliteDesk',
                  estado: 'Activo'
                })">
                        <i class="fa-regular fa-pen-to-square"></i>
                    </button>
                    <button type="button" class="icon-btn" title="Eliminar" onclick="eliminar(0)">
                        <i class="fa-regular fa-trash-can"></i>
                    </button>
                </td>
            </tr>

            </tbody>
        </table>
    </div>

    <div class="footer-controls">
        <!-- Esquina Izquierda: Filtros de Bitácora -->
        <div class="radio-group">
            <div class="form-check form-check-inline m-0">
                <input class="form-check-input" type="radio" name="filtroBitacora" id="optBitacoraAlumno" value="PC" checked onchange="window.location.href='admin-pc-servlet'">
                <label class="form-check-label fw-bold ms-1" for="optBitacoraAlumno">Bitácora(PC)</label>
            </div>
            <div class="form-check form-check-inline m-0">
                <input class="form-check-input" type="radio" name="filtroBitacora" id="optBitacoraDocente" value="D" onchange="window.location.href='admin-registrosDocente-servlet'">
                <label class="form-check-label fw-bold ms-1" for="optBitacoraDocente">Bitácora(Docente)</label>
            </div>
            <div class="form-check form-check-inline m-0">
                <input class="form-check-input" type="radio" name="filtroBitacora" id="optBitacoraPC" value="A"  onchange="window.location.href='admin-alumno-servlet'">
                <label class="form-check-label fw-bold ms-1" for="optBitacoraPC">Bitácora(Alumno)</label>
            </div>
        </div>

        <!-- Centro: Paginación -->
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

<!-- Modal Ver Más (Datos del Equipo PC) -->
<div class="modal-overlay" id="modalVerMas">
    <div class="modal-box modal-white">
        <h2>Detalle del Equipo PC</h2>
        <div class="row-2">
            <div>
                <label>Número PC:</label>
                <input type="text" id="vm-id-pc" disabled>
            </div>
            <div>
                <label>Mesa / Isla:</label>
                <input type="text" id="vm-mesa" disabled>
            </div>
        </div>
        <div class="row-2">
            <div>
                <label>Salón:</label>
                <input type="text" id="vm-salon" disabled>
            </div>
            <div>
                <label>Docencia:</label>
                <input type="text" id="vm-docencia" disabled>
            </div>
        </div>
        <label>Modelo del equipo:</label>
        <input type="text" id="vm-modelo" disabled>
        <label>Estado:</label>
        <input type="text" id="vm-estado" disabled>
        <div class="modal-actions">
            <button type="button" class="btn-salir" style="max-width:100%" onclick="cerrarModal('modalVerMas')">Salir</button>
        </div>
    </div>
</div>

<!-- Modal Editar (Datos del Equipo PC) -->
<div class="modal-overlay" id="modalEditar">
    <form class="modal-box modal-white" onsubmit="return false;">
        <h2>Editar Equipo PC</h2>
        <input type="hidden" id="ed-id">
        <div class="row-2">
            <div>
                <label>Número PC:</label>
                <input type="text" name="numero_pc" id="ed-id-pc">
            </div>
            <div>
                <label>Mesa / Isla:</label>
                <input type="text" name="mesa" id="ed-mesa">
            </div>
        </div>
        <div class="row-2">
            <div>
                <label>Salón:</label>
                <input type="text" name="salon_computo" id="ed-salon">
            </div>
            <div>
                <label>Docencia:</label>
                <select name="docencia" id="ed-docencia">
                    <option value="D4">D4</option>
                    <option value="D3">D3</option>

                    <option value="D2">D2</option>
                    <option value="CECADEC">CECADEC</option>
                </select>
            </div>
        </div>
        <label>Modelo:</label>
        <input type="text" name="modelo" id="ed-modelo">
        <label>Estado:</label>
        <select name="estado" id="ed-estado">
            <option value="Activo">Activo</option>
            <option value="Inactivo">Inactivo</option>
        </select>
        <div class="modal-actions">
            <button type="button" class="btn-salir" onclick="cerrarModal('modalEditar')">Salir</button>
            <button type="button" class="btn-confirmar" onclick="guardarEdicion()">Confirmar</button>
        </div>
    </form>
</div>

<!-- Modal Eliminar -->
<div class="modal-overlay" id="modalEliminar">
    <div class="confirm-box">
        <div class="confirm-header">Eliminar PC</div>
        <div class="confirm-icon"><i class="bi bi-question-lg"></i></div>
        <div class="confirm-text">¿Estás seguro que quieres eliminar este equipo del registro?</div>
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
            <button type="button" class="btn-si" onclick="window.location.href='logout-admin-servlet'">Sí</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var filaAEliminar = null;

    function abrirModal(idModal) {
        document.getElementById(idModal).classList.add('activo');
    }
    function cerrarModal(idModal) {
        document.getElementById(idModal).classList.remove('activo');
    }

    function verMas(datos) {
        document.getElementById('vm-id-pc').value = datos.id_pc;
        document.getElementById('vm-mesa').value = datos.mesa;
        document.getElementById('vm-salon').value = datos.salon;
        document.getElementById('vm-docencia').value = datos.docencia;
        document.getElementById('vm-modelo').value = datos.modelo;
        document.getElementById('vm-estado').value = datos.estado;
        abrirModal('modalVerMas');
    }

    function editar(id, datos) {
        document.getElementById('ed-id').value = id;
        document.getElementById('ed-id-pc').value = datos.id_pc;
        document.getElementById('ed-mesa').value = datos.mesa;
        document.getElementById('ed-salon').value = datos.salon;
        document.getElementById('ed-docencia').value = datos.docencia;
        document.getElementById('ed-modelo').value = datos.modelo;
        document.getElementById('ed-estado').value = datos.estado;
        abrirModal('modalEditar');
    }

    function guardarEdicion() {
        cerrarModal('modalEditar');
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

    function eliminar(numeroPc, boton) {
        document.getElementById('el-id').value = numeroPc;
        filaAEliminar = boton ? boton.closest('tr') : null;
        abrirModal('modalEliminar');
    }

    function confirmarEliminar() {
        var numeroPc = document.getElementById('el-id').value;

        fetch('eliminar-pc-servlet', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'numero_pc=' + encodeURIComponent(numeroPc)
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
                alert('Error de conexión al eliminar el equipo.');
                cerrarModal('modalEliminar');
            });
    }
</script>

</body>
</html>
