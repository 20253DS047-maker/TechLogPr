<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácora Digital - Usuario</title>
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
            width: 170px;
            height: 70px;
        }
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
    </style>

</head>
<body>
<img src="imagenes/logo-utez.png" class="logoImg" alt="UTEZ logo">
<header>
    <h1 class="fw-bold">BITÁCORA DIGITAL</h1>
</header>

<main>
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="text-center">Identificación de rol para su registro</h2>
                <p class="justify-content-center text-center">
                    Seleccione uno para continuar...
                </p>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-8">
                <div class="card border-0 shadow-lg p-4 text-center position-relative mb-5" id="div_card">
                    <div class="card-body">
                        <h5 class="mb-3">¿Que tipo de cuenta eres?</h5>

                        <div class="d-flex justify-content-center gap-3 mb-4">
                            <button type="button" onclick="window.location.href='login-alumno-servlet'" class="boton px-5 fw-bold" name="alumno">Alumno</button>
                            <button type="button" onclick="window.location.href='login-docente-servlet'" class="boton px-5 fw-bold" name="docente">Docente</button>
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-20 col-3 mb-3">
                    <button type="button" onclick="window.location.href='index.jsp'" class="btn-primary">Regresar</button>
                </div>

            </div>
        </div>

    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>
