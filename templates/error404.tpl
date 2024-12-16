<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AereoExpress - Página no encontrada</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-container {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-color: #e9ecef;
            color: #495057;
        }

        .error-code {
            font-size: 6rem;
            font-weight: 700;
            color: #6c757d;
        }

        .error-message {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }

        #btn-volver {
            padding: 0.8rem 1.5rem;
            font-size: 1.1rem;
        }

        .suggestions {
            margin-top: 2rem;
            font-size: 1rem;
            color: #6c757d;
        }

        .suggestions ul {
            list-style-type: none;
            padding: 0;
        }

        .suggestions li {
            margin: 0.5rem 0;
        }
    </style>
</head>

<body>
    <div class="error-container">
        <div class="error-code">404</div>
        <p class="error-message">Lo sentimos, la página que estás buscando no existe o ha sido movida.</p>
        <a id="btn-volver" href="home" class="btn btn-primary">Volver al Inicio</a>
        <div class="suggestions">
            <p>Quizás quieras intentar lo siguiente:</p>
            <ul>
                <li><a href="about" class="text-decoration-none">Conoce más sobre nosotros</a></li>
                <li><a href="services" class="text-decoration-none">Explora nuestros servicios</a></li>
                <li><a href="contact" class="text-decoration-none">Contáctanos para obtener ayuda</a></li>
            </ul>
        </div>
    </div>

    <!-- Bootstrap JS (Opcional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
