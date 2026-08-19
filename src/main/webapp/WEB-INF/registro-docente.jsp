<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar sesión</title>
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
            color: white;
        }

        /* Estilo específico para el botón enlace de la esquina */
        .btn-corner {
            background-color: #183052;
            color: white;
            border-radius: 4px;
            border: 1px solid #183052;
            text-decoration: none;
            padding: 6px 12px;
            font-size: 0.8rem;
        }
        .btn-corner:hover {
            background-color: #20477E;
            border-color: #20477E;
            color: white;
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
    <img src="imagenes/Logotipo-UTEZ-scaled.png" alt="Logo UTEZ" class="img-fluid mb-4" style="margin-top: 30px">

    <div class="card p-4 shadow position-relative" style="width: auto">

        <!-- Botón en la esquina superior derecha con la clase .btn-corner -->
        <a href="registro-alumno-servlet" class="btn-corner position-absolute top-0 end-0 m-3 d-flex align-items-center gap-1">
            <i class="bi bi-person-plus"></i> Registrar alumno
        </a>

        <div class="col-sm-6 col-md-8 mx-auto text-center mb-4 mt-2">
            <h2 class="text-title">REGISTRO DOCENTES</h2>
        </div>

        <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger">${requestScope.error}</div>
        </c:if>

        <form action="registro-docente-servlet" method="post">
            <div class="row mb-4 g-4">
                <div class="col-md-4">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ej: Santiago" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="apellido_paterno" class="form-label">Apellido Paterno:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="apellido_paterno" name="apellido_paterno" placeholder="Ej: Flores" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="apellido_materno" class="form-label">Apellido Materno:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="apellido_materno" name="apellido_materno" placeholder="Ej: Solano" required>
                    </div>
                </div>
            </div>

            <div class="row mb-4 g-4">
                <div class="col-md-4">
                    <label for="area" class="form-label">Área:</label>
                    <select class="form-select" id="area" name="area" aria-label="Default select example" required>
                        <option selected disabled value="">Seleccione una opción</option>
                        <option value="DATID">DATID</option>
                        <option value="DAMI">DAMI</option>
                        <option value="DACEA">DACEA</option>
                        <option value="DATEFI">DATEFI</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="password" class="form-label">Contraseña:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Max. 5 caracteres" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="username" class="form-label">Username:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" name="username" id="username" placeholder="Ej: SantiDatid" required>
                    </div>
                </div>
            </div>

            <div class="d-grid gap-20 col-8 mx-auto mb-4">
                <button type="submit" class="btn-primary">Iniciar</button>
            </div>
        </form>

        <div class="d-grid gap-20 col-3 mb-3">
            <button type="button" onclick="window.location.href='admin-alumno-servlet'" class="btn-primary">Regresar</button>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>