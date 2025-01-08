# Gestión de Asegurados

## Descripción

Este proyecto es una aplicación web para la gestión de asegurados y sus vehículos. Desarrollado utilizando **PHP** y **MySQL**, permite llevar a cabo operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre los datos de los asegurados y sus autos. Además, cuenta con un sistema de autenticación de usuarios para gestionar las funcionalidades de manera segura y un módulo de copia de seguridad de la base de datos completa.

## Características principales

### 1. Sistema de Autenticación

- Registro de usuarios
- Los usuarios deben iniciar sesión para acceder a las funcionalidades del sistema.

### 2. Gestión de Asegurados

- Crear nuevos asegurados.
- Modificar información existente de asegurados.
- Eliminar asegurados.
- Ver la lista completa de asegurados.

### 3. Gestión de Autos

- Asociar autos a un asegurado.
- Editar información de vehículos registrados.
- Eliminar autos de la base de datos.
- Consultar todos los autos asociados a un asegurado.

### 4. Copia de Seguridad

- Realizar una copia de seguridad completa de la base de datos directamente desde la aplicación.
- Guardar el archivo de respaldo en un lugar seguro para restauración futura.

## Tecnologías utilizadas

### Backend

- **PHP**: Para la lógica del servidor y manejo de solicitudes.

### Base de datos

- **MySQL**: Para el almacenamiento y gestión de datos de asegurados, vehículos y usuarios.

### Frontend

- **HTML/CSS**: Para la estructura y diseño de la interfaz.
- **JavaScript**: Para la interactividad del cliente.

## Requisitos previos

### Software necesario

- Servidor web como **XAMPP**, **WAMP**, o similar.
- PHP (versión compatible con el proyecto).
- MySQL o un servidor de base de datos compatible.

### Instalación

1. Clona este repositorio en tu servidor local:

   ```bash
   git clone https://github.com/FedeCordeiro/App-Asegurados.git
   ```

2. Configura la base de datos:

   - Crea una base de datos en MySQL.
   - Importa el archivo `database.sql` incluido en el repositorio para crear las tablas necesarias.

3. Configura el archivo de conexión a la base de datos:

   - Edita el archivo `config.php` y proporciona los detalles de tu servidor MySQL:
     ```php
     <?php
     define('DB_HOST', 'localhost');
     define('DB_USER', 'root');
     define('DB_PASS', 'tu_contraseña');
     define('DB_NAME', 'nombre_de_tu_base_de_datos');
     ?>
     ```

4. Inicia el servidor web y accede a la aplicación desde tu navegador:

   ```
   http://localhost/App-Asegurados
   ```

## Uso

### Iniciar sesión

1. Accede a la página de inicio de sesión.
2. Ingresa tus credenciales para acceder al sistema.

### Funcionalidades

- **Asegurados**: Navega al módulo de asegurados para realizar operaciones CRUD.
- **Copia de seguridad**: Dirígete a la sección de backup y haz clic en el botón para generar un respaldo.

## Estructura del proyecto

```
|-- app/
|   |-- controllers/
|       |-- asegurado.controller.php
|       |-- user.controller.php
|   |-- models/
|       |-- asegurado.model.php
|       |-- user.model.php
|   |-- views/
|       |-- asegurado.view.php
|       |-- user.view.php
|-- css/                 # Archivos de estilos CSS
|-- databases/           # Base de datos y respaldos
|-- Helpers/             # Archivos de ayuda y utilidades
|-- libs/                # Librerías utilizadas
|-- templates/           # Plantillas HTML
|-- templates_c/         # Plantillas compiladas (Smarty u otra tecnología)
|-- .gitignore           # Archivos y carpetas a ignorar en Git
|-- .htaccess            # Configuración del servidor Apache
|-- router.php           # Archivo principal para manejar rutas
```

---

© 2025 Federico Cordeiro
