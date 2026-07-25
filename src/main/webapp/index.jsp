<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantalla Principal</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

    <style>
        body {
            background-color: #CBCABE;
            color: black;
            font-family: Lexend Exa;
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
            border-color: #71785B;
            padding: 5px 5px 10px 10px;
        }
        .boton:hover {
            background-color: #505540;
            border-radius: 5px;
            color: #FFFFFF;
            border-color: #71785B;
            padding: 5px 5px 5px 5px;
        }

        #div_card {
            background-color: #EFE6E6;
        }

        .logoImg{
            width: 200px;
            height: 70px;
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
                <h2 class="text-center">¡Bienvenido/a!</h2>
                <p class="justify-content-center text-center">
                    Este sistema ha sido diseñado para que tu registro al utilizar un equipo sea más fácil, seguro y no tan tardado.
                </p>
            </div>
        </div>

            <div class="row justify-content-center">
                <div class="col-8">
                    <div class="card border-0 shadow-lg p-4 text-center position-relative mb-5" id="div_card">
                        <div class="card-body">
                            <h5 class="mb-3">¿Quien eres?</h5>

                            <div class="d-flex justify-content-center gap-3 mb-4">
                                <button type="button" onclick="window.location.href='login-admin-servlet'" class="boton px-5 fw-bold" name="admin">Admin</button>
                                <button type="button" onclick="window.location.href='tipo-user-servlet'" class="boton px-5 fw-bold" name="usuario">Usuario</button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>

    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>