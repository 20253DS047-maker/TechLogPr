<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantalla Principal</title>
    <link rel="stylesheet" href="styles.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Exa:wght@100..900&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, button, input, select {
            font-family: 'Lexend Exa', sans-serif;
        }

        body {
            background-color: #CBCABE;
            color: black;
        }

        header {
            background-color: #128970;
            color: white;
            padding: 10px 10px;
            text-align: center;
            width: 100%;
            margin-bottom: 15px;
        }

        .boton {
            background-color: #71785B;
            border-radius: 5px;
            color: #FFFFFF;
            border: 1px solid #71785B;
            padding: 8px 24px;
            transition: all 0.2s ease-in-out;
        }

        .boton:hover {
            background-color: #505540;
            color: #FFFFFF;
            border-color: #505540;
        }

        #div_card {
            background-color: #EFE6E6;
        }

        .logoImg {
            width: 160px;
            height: 70px;
            object-fit: contain;
            margin: 10px;
        }
    </style>
</head>
<body>

<img src="imagenes/Logotipo-UTEZ-scaled.png" class="logoImg" alt="UTEZ logo">

<header>
    <h1 class="fw-bold">BITÁCORA DIGITAL</h1>
</header>

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="text-center mb-3">¡Bienvenido/a!</h2>
                <p class="justify-content-center text-center mb-4">
                    Este sistema ha sido diseñado para que tu registro al utilizar un equipo sea más fácil, seguro y no tan tardado.
                </p>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-10 col-md-8">
                <div class="card border-0 shadow-lg p-4 text-center position-relative mb-5" id="div_card">
                    <div class="card-body">
                        <h5 class="mb-4">¿Quién eres?</h5>
                        <div class="d-flex flex-wrap justify-content-center gap-3">
                            <button type="button" onclick="window.location.href='login-admin-servlet'" class="boton fw-bold" name="admin">Admin</button>
                            <button type="button" onclick="window.location.href='login-docente-servlet'" class="boton fw-bold" name="docente">Docente</button>
                            <button type="button" onclick="window.location.href='login-alumno-servlet'" class="boton fw-bold" name="alumno">Alumno</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>