<%--
  Created by IntelliJ IDEA.
  User: galil
  Date: 23/07/2026
  Time: 07:05 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registro exitoso</title>
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
    .card {
      background-color: #EFE6E6;
      width: 471px;
      height: auto;
    }
    .card-header {
      background-color: #128970;
      text-align: center;
      color: white;
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

<div class="container d-flex flex-column justify-content-start align-items-center vh-100">
  <img src="imagenes/Logotipo-UTEZ-scaled.png" alt="Logo UTEZ" class="img-fluid mb-3" style="max-height: 100px; margin-top: 50px">
  <div class="card shadow">
    <div class="card-header">
      <h3 class="mb-0">LOGIN EXITOSO</h3>
    </div>
    <div class="card-body text-center">
      <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
      <p class="mt-3">¡Login Exitoso! Bienvenido de nuevo</p>

      <div class="text-start mt-4">
        <p><strong>Actividad:</strong> Login</p>
        <p><strong>Matrícula:</strong> 20253ds047</p>
        <p><strong>Nombre:</strong> Pedro</p>
        <p><strong>Hora:</strong> 10:35 a.m.</p>
      </div>

      <div class="d-grid gap-20 col-8 mx-auto mb-3">
        <button type="button" class="btn btn-primary">Ir al panel de control</button>
      </div>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
