<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Iniciar sesion</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Lexend+Exa&display=swap" rel="stylesheet">

  <style>
    .btn-primary {
      background-color: #183052;
      color: white;
      border-radius: 4px;
      border: #183052;
      height: 40px;
    }
    .btn-primary:hover{
      background-color: #20477E;
      border: #20477E;
    }
    .text-title{
      color: #534646;
      text-align: center;
    }
    .card{
      background-color: #EFE6E6;
    }
    body{
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      background-color: #CBCABE;
      font-family: 'Lexend Exa', sans-serif;
    }
  </style>
</head>
<body>
<div class="d-flex flex-column justify-content-start align-items-center vh-100">
  <img src="imagenes/Logotipo-UTEZ-scaled.png" alt="Logo UTEZ" class="img-fluid mb-4" style="margin-top: 50px">
  <div class="card p-4 shadow" style="width: 798px">
    <div class="col-sm-6 col-md-8 mx-auto text-center mb-4">
      <h2 class="text-title">LOGIN ADMIN</h2>
    </div>
    <form>
      <div class="col-sm-6 col-md-8 mx-auto mb-3">
        <label for="nombre" class="form-label">Nombre:</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-person"></i></span>
          <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre">
        </div>
      </div>
      <div class="col-sm-6 col-md-8 mx-auto mb-3">
        <label for="password" class="form-label">Contraseña: </label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-lock"></i></span>
          <input type="password" class="form-control" placeholder="Ingrese su contraseña" id="password">
        </div>
      </div>

      <div class="d-grid gap-20 col-8 mx-auto mb-3">
        <button type="submit" class="btn-primary">Iniciar</button>
      </div>
    </form>
    <div class="d-grid gap-20 col-3 mb-3">
      <button type="button" onclick="window.location.href='index.jsp'" class="btn-primary">Regresar</button>
    </div>

  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
