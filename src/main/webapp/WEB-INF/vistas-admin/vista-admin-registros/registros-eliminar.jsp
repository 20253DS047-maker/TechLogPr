<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Registros</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
 
</head>
<body>

  <div class="top-bar">
    <button class="btn-cerrar-sesion">Cerrar Sesion</button>
    <button class="btn-agregar"><i class="bi bi-file-earmark-plus"></i> Agregar</button>
  </div>

  <h1 class="page-title">Registros</h1>

  <div class="search-bar">
    <input type="text" placeholder="Introduzca la matricula para buscar en el registro...">
    <i class="bi bi-search"></i>
  </div>

  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Matricula</th>
          <th>Nombre completo</th>
          <th>Fecha</th>
          <th>P.C.</th>
          <th>Salon/Docencia</th>
          <th>Estado</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>0</td>
          <td>20253DS196</td>
          <td>Jonathan Alejandro...</td>
          <td>11/11/2026</td>
          <td>15.</td>
          <td>MAC9 / D4</td>
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
          <td>20253DS034</td>
          <td>Santiago Flores</td>
          <td>20/02/2026</td>
          <td>25.D4</td>
          <td>44 / D3</td>
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
    <div class="confirm-box">
      <div class="confirm-header">Eliminar Registro</div>
      <div class="confirm-icon"><i class="bi bi-question-lg"></i></div>
      <div class="confirm-text">¿Estas seguro que quieres eliminar este registro?</div>
      <div class="confirm-actions">
        <button class="btn-salir">Volver</button>
        <button class="btn-confirmar">Cancelar</button>
      </div>
    </div>
  </div>

</body>
</html>
