<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro Docentes</title>
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
    }
    /* ===== Modal genérico ===== */
    .modal-overlay {
      position: fixed;
      inset: 0;
      background: rgba(0, 0, 0, 0.15);
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 10;
      padding: 20px;
    }
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
    }
    .btn-confirmar:disabled { background-color: #8a94a6; }
    /* ===== Confirmación (eliminar / cerrar sesión) ===== */
    .confirm-box {
      background-color: #ffffff;
      border-radius: 6px;
      overflow: hidden;
      max-width: 360px;
      width: 100%;
      text-align: center;
    }
    .confirm-header {
      background-color: #1c8a6c;
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
  </style>
</head>
<body>

<div class="top-bar">
  <button class="btn-cerrar-sesion">Cerrar Sesion</button>
  <button class="btn-agregar"><i class="bi bi-file-earmark-plus"></i> Agregar</button>
</div>

<h1 class="page-title">Registro Docentes</h1>

<div class="search-bar">
  <input type="text" placeholder="Introduzca la matricula para buscar en el registro...">
  <i class="bi bi-search"></i>
</div>

<div class="table-container">
  <table>
    <thead>
    <tr>
      <th>#</th>
      <th>Nombre completo</th>
      <th>Fecha</th>
      <th>P.C.</th>
      <th>Docencia</th>
      <th>Area</th>
      <th>Estado</th>
      <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>0</td>
      <td>Jonathan Alejandro...</td>
      <td>11/11/2026</td>
      <td>15.</td>
      <td>D4</td>
      <td>DATID</td>
      <td class="badge-activo">Activo</td>
      <td>
        <button class="icon-btn" title="Activar/Desactivar"><i class="bi bi-toggle2-on"></i></button>
        <button class="icon-btn" title="Ver mas"><i class="bi bi-eye"></i></button>
        <button class="icon-btn" title="Editar"><i class="bi bi-pencil-square"></i></button>
        <button class="icon-btn" title="Eliminar"><i class="bi bi-trash"></i></button>
      </td>
    </tr>
    <tr>
      <td>1</td>
      <td>Santiago Flores</td>
      <td>20/02/2026</td>
      <td>25.D4</td>
      <td>D3</td>
      <td>DATID</td>
      <td class="badge-inactivo">Inactivo</td>
      <td>
        <button class="icon-btn" title="Activar/Desactivar"><i class="bi bi-toggle2-off"></i></button>
        <button class="icon-btn" title="Ver mas"><i class="bi bi-eye"></i></button>
        <button class="icon-btn" title="Editar"><i class="bi bi-pencil-square"></i></button>
        <button class="icon-btn" title="Eliminar"><i class="bi bi-trash"></i></button>
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

<div class="filters">
  <label><input type="radio" name="filtro" checked> A</label>
  <label><input type="radio" name="filtro"> D</label>
  <label><input type="radio" name="filtro"> T</label>
</div>

<div class="modal-overlay">
  <div class="modal-box modal-white">
    <label>Nombre Completo:</label>
    <input type="text" value="Jonathan AlejandroLopez Benitez" disabled>

    <div class="row-2">
      <div><label>Hora Salida:</label><input type="text" value="13:00 PM" disabled></div>
      <div><label>Docencia:</label><input type="text" value="D4" disabled></div>
    </div>

    <div class="row-2">
      <div><label>Fecha:</label><input type="text" value="11/11/2026" disabled></div>
      <div><label>PC:</label><input type="text" value="15" disabled></div>
    </div>

    <div class="row-2">
      <div><label>Hora Entrada:</label><input type="text" value="11:00 AM" disabled></div>
      <div><label>Salon:</label><input type="text" value="MAC9" disabled></div>
    </div>

    <label>Area:</label>
    <input type="text" value="datid" disabled>

    <label>Estado:</label>
    <input type="text" value="Activo" disabled>

    <div class="modal-actions">
      <button class="btn-salir" style="max-width:100%">Salir</button>
    </div>
  </div>
</div>

</body>
</html>
