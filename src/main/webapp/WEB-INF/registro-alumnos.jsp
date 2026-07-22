<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro Bitácora - UTEZ</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #C2C3BC;
      min-height: 100vh;
      margin: 0;
      overflow-x: hidden;
      position: relative;
      font-family: Arial, sans-serif;
    }

    .decoracion-verde {
      position: absolute;
      left: 0;
      top: 0;
      bottom: 0;
      width: 30%;
      background-color: #008767;
      border-top-right-radius: 65% 65%;
      border-bottom-right-radius: 65% 65%;
      z-index: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 40px;
    }

    .logo-utez {
      max-width: 180px;
      filter: brightness(0) invert(1);
    }

    .texto-bienvenidos {
      color: white;
      font-size: 2.2rem;
      font-weight: 500;
      align-self: center;
      margin-bottom: auto;
      margin-top: auto;
    }

    .card-formulario {
      background-color: #E2DDD9;
      border-radius: 25px;
      padding: 35px 30px;
      border: none;
      box-shadow: 0 10px 25px rgba(0,0,0,0.15);
      max-width: 480px;
      width: 100%;
    }

    .form-label-custom {
      color: #7A7878;
      font-weight: 700;
      margin-bottom: 4px;
    }

    .form-control-custom {
      border-radius: 10px;
      border: 1px solid #ddd;
      padding: 10px 15px;
      box-shadow: inset 0 2px 4px rgba(0,0,0,0.05);
    }

    .form-control-custom::placeholder {
      color: #A9A8A8;
    }

    .btn-cancelar {
      background-color: #FF3333;
      color: white;
      border-radius: 50px;
      padding: 8px 25px;
      font-weight: 600;
      border: none;
    }

    .btn-cancelar:hover {
      background-color: #d62828;
      color: white;
    }

    .btn-registrar {
      background-color: #03205B;
      border-radius: 50px;
      padding: 8px 25px;
      font-weight: 600;
      border: none;
    }

    .btn-registrar:hover {
      background-color: #02163d;
      color: white;
    }
  </style>
</head>
<body>

<div class="decoracion-verde">
  <img src="img/logo-utez.png" alt="UTEZ Logo" class="logo-utez">
  <h1 class="texto-bienvenidos">Bienvenidos</h1>
</div>

<div class="container min-vh-100 d-flex flex-column justify-content-center align-items-center position-relative" style="z-index: 2;">

  <div class="text-center mb-4">
    <h2 class="fw-bold mb-1" style="color: #000;">Registro Bitacora</h2>
    <h5 class="fw-normal" style="color: #000;">(ALUMNOS)</h5>
  </div>

  <div class="card-formulario">
    <form action="RegistrarBitacoraServlet" method="POST">

      <div class="mb-3">
        <label for="nombre" class="form-label form-label-custom">Nombre:</label>
        <input type="text" class="form-control form-control-custom" id="nombre" placeholder="Ej: Santiago" required>
      </div>

      <div class="mb-3">
        <label for="apellido" class="form-label form-label-custom">Apellido Paterno:</label>
        <input type="text" class="form-control form-control-custom" id="apellido" placeholder="Ej: Perez" required>
      </div>

      <div class="mb-3">
        <label for="matricula" class="form-label form-label-custom">Matricula</label>
        <input type="text" class="form-control form-control-custom" id="matricula" placeholder="Ej: 20253ds046" required>
      </div>

      <div class="mb-3">
        <label for="docente" class="form-label form-label-custom">Docente:</label>
        <input type="text" class="form-control form-control-custom" id="docente" placeholder="Ej: Pedro Urieta" required>
      </div>

      <div class="mb-4">
        <label for="observaciones" class="form-label form-label-custom">Observaciones:</label>
        <input type="text" class="form-control form-control-custom" id="observaciones" placeholder="Ej: Manchas en la pantalla">
      </div>

      <div class="d-flex justify-content-end gap-3 mt-4">
        <button type="button" class="btn btn-cancelar">Cancelar</button>
        <button type="submit" class="btn btn-registrar">Registrar</button>
      </div>

    </form>
  </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
