<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Bitácora</title>
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

        .decoracion {
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
            color: white;
            border-radius: 50px;
            padding: 8px 25px;
            font-weight: 600;
            border: none;
        }

        .btn-registrar:hover {
            background-color: #02163d;
            color: white;
        }

        .modal-overlay {
            display: none; /* Inicia oculto */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            z-index: 1050; /* Por encima de todo */
            justify-content: center;
            align-items: center;
        }

        .modal-card {
            background-color: #E2DDD9;
            width: 320px;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            text-align: center;
        }

        .modal-header-custom {
            background-color: #008767;
            color: black;
            padding: 12px;
            font-weight: bold;
            font-size: 18px;
        }

        .modal-body-custom {
            padding: 20px 15px;
        }

        .icon-question {
            width: 60px;
            height: 60px;
            background-color: black;
            color: white;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 32px;
            font-weight: bold;
            margin: 0 auto 15px auto;
        }

        .modal-text {
            color: #1A1A1A;
            font-size: 14px;
            font-weight: bold;
            line-height: 1.3;
            margin-bottom: 20px;
        }

        .modal-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn-modal-cancelar {
            background-color: #FF3333;
            color: white;
            border: none;
            padding: 6px 18px;
            border-radius: 50px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-modal-confirmar {
            background-color: #03205B;
            color: white;
            border: none;
            padding: 6px 18px;
            border-radius: 50px;
            font-weight: bold;
            cursor: pointer;
        }
        .overlay-exito {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            z-index: 2000;
            justify-content: center;
            align-items: center;
        }

        .card-exito {
            background-color: #ECE8E5;
            width: 320px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .header-verde {
            background-color: #008767;
            height: 50px;
            width: 100%;
        }

        .body-exito {
            padding: 25px 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .circulo-check {
            background-color: #10B981;
            color: white;
            width: 65px;
            height: 65px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 32px;
            margin-bottom: 15px;
        }

        .texto-exito {
            color: #000;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 20px;
            line-height: 1.3;
        }

        .btn-volver {
            background-color: #1C3152;
            color: white;
            border: none;
            padding: 8px 30px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-volver:hover {
            background-color: #122138;
        }
    </style>
</head>
<body>

<div class="decoracion">
    <img src="imagenes/logo-utez.png" alt="UTEZ Logo" class="logo-utez">
    <h1 class="texto-bienvenidos text-white fw-bold" style="position: absolute; top: 420px; left: 50%; transform: translateX(-50%);">Bienvenidos</h1>
</div>

<div class="container min-vh-100 d-flex flex-column justify-content-center align-items-center position-relative" style="z-index: 2;">

    <div class="text-center mb-4">
        <h2 class="fw-bold mb-1" style="color: #000;">Registro Bitacora</h2>
        <h5 class="fw-normal" style="color: #000;">(Docentes)</h5>
    </div>

    <div class="card-formulario">
        <form action="RegistrarBitacoraServlet" method="POST">

            <div class="mb-3">
                <label for="nombre" class="form-label form-label-custom">Nombre:</label>
                <input type="text" class="form-control form-control-custom" id="nombre" name="nombre" placeholder="Ej: Santiago" required>
            </div>

            <div class="mb-3">
                <label for="apellido" class="form-label form-label-custom">Apellido Paterno:</label>
                <input type="text" class="form-control form-control-custom" id="apellido" name="apellidoP" placeholder="Ej: Perez" required>
            </div>

            <div class="mb-3">
                <label for="apellidoM" class="form-label form-label-custom">Apellido materno:</label>
                <input type="text" class="form-control form-control-custom" id="apellidoM" name="apellidoM" placeholder="Ej: Solano" required>
            </div>

            <div class="mb-3">
                <label for="salon" class="form-label form-label-custom">Salon:</label>
                <input type="text" class="form-control form-control-custom" id="salon" name="salon" placeholder="Ej: CC7" required>
            </div>

            <div class="mb-4">
                <label for="area" class="form-label form-label-custom">Area:</label>
                <select id="area" name="area" class="form-select">
                    <option selected>Selecciona una opcion</option>
                    <option value="DATID">DATID</option>
                    <option value="DACEA">DACEA</option>
                    <option value="DAMI">DAMI</option>
                    <option value="DATEFI">DATEFI</option>
                </select>
            </div>

            <div class="d-flex justify-content-end gap-3 mt-4">
                <button type="button" onclick="mostrarModalCancelar()" class="btn btn-cancelar">Cancelar</button>
                <button type="button" onclick="mostrarModalCheck()" class="btn btn-registrar">Registrar</button>
            </div>
        </form>
    </div>
</div>

<div id="modalCancelar" class="modal-overlay">
    <div class="modal-card">

        <div class="modal-header-custom">
            Cancelar Registro
        </div>

        <div class="modal-body-custom">
            <div class="icon-question">?</div>

            <div class="modal-text">
                ¿Estas seguro que quieres<br>cancelar este registro?
            </div>

            <div class="modal-actions">
                <button type="button" class="btn-modal-cancelar" onclick="cerrarModalCancelar()">Cancelar</button>
                <button type="button" class="btn-modal-confirmar" onclick="confirmarCancelacion()">Confirmar</button>
            </div>
        </div>
    </div>
</div>
<div id="modalExito" class="overlay-exito">
    <div class="card-exito">
        <!-- Franja superior verde -->
        <div class="header-verde"></div>

        <!-- Cuerpo del mensaje -->
        <div class="body-exito">
            <!-- Círculo con Checkmark -->
            <div class="circulo-check">
                &#10004;
            </div>

            <p class="texto-exito">El registro se guardó<br>exitosamente</p>

            <button type="button" class="btn-volver" onclick="volverModalCheck()">Volver</button>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function mostrarModalCancelar() {
        document.getElementById('modalCancelar').style.display = 'flex';
    }

    function cerrarModalCancelar() {
        document.getElementById('modalCancelar').style.display = 'none';
    }

    function confirmarCancelacion() {
        window.location.href = "index.jsp";
    }
</script>
<script>
    function mostrarModalCheck() {
        document.getElementById('modalExito').style.display = 'flex';
    }
    function volverModalCheck() {
        window.location.href = "index.jsp";
    }
</script>
</body>
</html>