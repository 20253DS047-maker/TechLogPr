<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Exa&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #CBCABE;
            font-family: 'Lexend Exa', sans-serif;
            margin: 0;
            padding: 20px 0;
            min-height: 100vh;
        }
        .btn-primary-custom {
            background-color: #183052;
            color: white;
            border-radius: 4px;
            border: 1px solid #183052;
            height: 40px;
            width: 100%;
            transition: background-color 0.2s ease;
        }
        .btn-primary-custom:hover {
            background-color: #20477E;
            border-color: #20477E;
            color: white;
        }
        .text-title {
            color: #534646;
            text-align: center;
            font-weight: bold;
        }
        .card-custom {
            background-color: #EFE6E6;
            width: 100%;
            max-width: 750px;
            border-radius: 8px;
            border: none;
        }
        .logo-img {
            max-height: 90px;
            object-fit: contain;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">

<div class="container d-flex flex-column align-items-center my-auto">
    <!-- Logotipo con margen inferior ajustado -->
    <img src="imagenes/Logotipo-UTEZ-scaled.png" alt="Logo UTEZ" class="img-fluid logo-img mb-3">

    <!-- Card Principal -->
    <div class="card card-custom p-4 shadow">
        <div class="text-center mb-3">
            <h2 class="text-title fs-3">REGISTRO DOCENTES</h2>
        </div>

        <form action="check-docente-servlet" method="post">
            <div class="col-sm-10 col-md-8 mx-auto mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
                </div>
            </div>

            <div class="col-sm-10 col-md-8 mx-auto mb-3">
                <label for="usuario" class="form-label">Usuario:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese el usuario" required>
                </div>
            </div>

            <div class="col-sm-10 col-md-8 mx-auto mb-3">
                <label for="apellido" class="form-label">Apellido:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingrese su apellido" required>
                </div>
            </div>

            <div class="col-sm-10 col-md-8 mx-auto mb-3">
                <label for="area" class="form-label">Área:</label>
                <select class="form-select" id="area" name="area" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="1">DATID</option>
                    <option value="2">DAMI</option>
                    <option value="3">DACEA</option>
                    <option value="4">DATEFI</option>
                </select>
            </div>

            <div class="col-sm-10 col-md-8 mx-auto mb-3">
                <label for="contrasena" class="form-label">Contraseña:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Max. 5 caracteres" maxlength="5" required>
                </div>
                <div class="mt-2 text-start">
                    <a href="registro-alumno-servlet" class="text-decoration-none small">¿Quieres registrar a un alumno?</a>
                </div>
            </div>

            <div class="d-grid gap-20 col-8 mx-auto mb-3">
                <button type="button" onclick="window.location.href=''" class="btn-primary">Iniciar</button>
            </div>
        </form>

        <!-- Botón de Regresar alineado con los inputs -->
        <div class="col-sm-10 col-md-8 mx-auto">
            <button type="button" onclick="window.location.href='vista-admin-servlet'" class="btn-primary-custom" style="width: auto; padding: 0 25px;">Regresar</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
