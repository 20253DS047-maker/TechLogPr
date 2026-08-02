<%--
  Created by IntelliJ IDEA.
  User: Yadi
  Date: 01/08/2026
  Time: 06:41 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0;
      padding: 0;
      width: 100vw;
      height: 100vh;
      background-color: #FFFFFF;
    }
    .overlay-exito {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: rgba(0, 0, 0, 0.4);
      z-index: 9999;
    }

    .card-exito {
      background-color: #ECE8E5;
      width: 420px;
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
      height: 300px;
    }

    .circulo-check {
      background-color: #10B981;
      color: white;
      width: 80px;
      height: 80px;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 32px;
      margin-bottom: 15px;
    }

    .texto-exito {
      color: #000;
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
      line-height: 1.3;
    }

    .btn-volver {
      background-color: #1C3152;
      color: white;
      border: none;
      padding: 16px 70px;
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
<div id="modalExito" class="overlay-exito">
  <div class="card-exito">

    <div class="header-verde"></div>


    <div class="body-exito">

      <div class="circulo-check">
        &#10004;
      </div>

      <p class="texto-exito">El registro se guardó<br>exitosamente</p>
      <button type="button" class="btn-volver">Continuar</button>
    </div>
  </div>
</div>
</body>
</html>
