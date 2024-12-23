<?php
require_once("./app/models/asegurado.model.php");
require_once("./app/views/asegurado.view.php");
require_once("./app/controllers/user.controller.php");
require_once("./Helpers/AuthHelper.php");

class AseguradoController
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new AseguradoModel();
        $this->view = new AseguradoView();
    }

    public function showAseguradoHome()
    {
        $username = AuthHelper::getLoggedUserName();
        $asegurado = $this->model->getAllAsegurados();
        $this->view->showAseguradoHome($asegurado, $username);
    }

    public function showAsegurado()
    {
        $logged = AuthHelper::checkLoggedIn();
        $asegurado = $this->model->getAllAsegurados();
        $this->view->showAsegurado($asegurado, $logged);
    }

    public function showAseguradoSearch()
    {
        $asegurado = $this->model->getAllAsegurados();
        $this->view->showAseguradoSearch($asegurado);
    }

    public function showAseguradoId($id_cliente)
    {
        $logged = AuthHelper::checkLoggedIn();
        $asegurado = $this->model->getAseguradosById($id_cliente);
        $this->view->showAseguradoId($asegurado, $logged);
    }

    public function editAsegurado($datos)
    {
        AuthHelper::checkLoggedIn();
        if (isset($_POST['nombre'], $_POST['dni'], $_POST['fecha_nac'], $_POST['calle'], $_POST['numero'], $_POST['piso'], $_POST['localidad'], $_POST['marca'], $_POST['anio'], $_POST['patente'], $_POST['motor'], $_POST['chasis'], $_POST['referente'])) {
            $asegurado = [
                'id_cliente' => $datos['id_cliente'],
                'nombre' => $_POST['nombre'],
                'dni' => $_POST['dni'],
                'fecha_nac' => $_POST['fecha_nac'],
                'calle' => $_POST['calle'],
                'numero' => $_POST['numero'],
                'piso' => $_POST['piso'],
                'localidad' => $_POST['localidad'],
                'marca' => $_POST['marca'],
                'anio' => $_POST['anio'],
                'patente' => $_POST['patente'],
                'motor' => $_POST['motor'],
                'chasis' => $_POST['chasis'],
                'referente' => $_POST['referente']
            ];

            $this->model->editAsegurado($asegurado);

            // Redirigir a la página correspondiente después de editar el asegurado
            header("Location: " . BASE_URL . "asegurado");
            exit;
        } else {
            header("Location: " . BASE_URL . "asegurado");
            exit;
        }
    }

    public function deleteAsegurado($id_cliente) // Cambié de $id a $id_cliente
    {
        $logged = AuthHelper::checkLoggedIn();
        $this->model->deleteAseguradoById($id_cliente); // Cambié de $id a $id_cliente
        header("Location: " . BASE_URL . "asegurado");
        exit;
    }

    public function addAsegurado()
    {
        $logged = AuthHelper::checkLoggedIn();
        if ($logged) {
            if (isset($_POST['nombre'], $_POST['dni'], $_POST['fecha_nac'], $_POST['calle'], $_POST['numero'], $_POST['piso'], $_POST['localidad'], $_POST['marca'], $_POST['anio'], $_POST['patente'], $_POST['motor'], $_POST['chasis'], $_POST['referente'])) {
                $id_cliente = ''; // No es necesario asignar un valor aquí, ya que el modelo lo maneja automáticamente
                $nombre = $_POST['nombre'];
                $dni = $_POST['dni'];
                $fecha_nac = $_POST['fecha_nac'];
                $calle = $_POST['calle'];
                $numero = $_POST['numero'];
                $piso = $_POST['piso'];
                $localidad = $_POST['localidad'];
                $marca = $_POST['marca'];
                $anio = $_POST['anio'];
                $patente = $_POST['patente'];
                $motor = $_POST['motor'];
                $chasis = $_POST['chasis'];
                $referente = $_POST['referente'];


                $this->model->insertAsegurado($id_cliente, $nombre, $dni, $fecha_nac, $calle, $numero, $piso, $localidad, $marca, $anio, $patente, $motor, $chasis, $referente);

                header("Location: " . BASE_URL . "asegurado");
                exit;
            } else {
                // Datos de asegurado incompletos, redirigir a la página de error o mostrar un mensaje de error
                header("Location: " . BASE_URL . "error");
                exit;
            }
        } else {
            header("Location: " . BASE_URL . "login");
        }
    }

    public function exportDatabase()
    {
        // Verifica si el usuario está logueado
        AuthHelper::checkLoggedIn();

        // Configura los datos de la base de datos
        $host = 'localhost';
        $user = 'root';
        $password = '';
        $database = 'db_asegurados';
        $fileName = "backup_" . date("Y-m-d_H-i-s") . ".sql";

        try {
            // Conecta con la base de datos
            $dsn = "mysql:host=$host;dbname=$database;charset=utf8mb4";
            $pdo = new PDO($dsn, $user, $password);

            // Crea el archivo para el backup
            $backupFile = fopen($fileName, 'w');
            if (!$backupFile) {
                throw new Exception("No se pudo crear el archivo de backup.");
            }

            // Obtiene todas las tablas
            $tables = $pdo->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);

            foreach ($tables as $table) {
                // Obtiene la declaración para crear la tabla
                $createTable = $pdo->query("SHOW CREATE TABLE `$table`")->fetch(PDO::FETCH_ASSOC)['Create Table'] . ";\n\n";
                fwrite($backupFile, $createTable);

                // Obtiene los datos de la tabla y genera las declaraciones INSERT
                $rows = $pdo->query("SELECT * FROM `$table`");
                while ($row = $rows->fetch(PDO::FETCH_ASSOC)) {
                    // Escapa y comillas los valores correctamente
                    $values = array_map([$pdo, 'quote'], $row);
                    $insertQuery = "INSERT INTO `$table` (" . implode(', ', array_keys($row)) . ") VALUES (" . implode(', ', $values) . ");\n";
                    fwrite($backupFile, $insertQuery);
                }
                fwrite($backupFile, "\n");
            }

            // Cierra el archivo
            fclose($backupFile);

            // Descarga el archivo al navegador
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($fileName) . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($fileName));
            readfile($fileName);

            // Elimina el archivo después de la descarga
            unlink($fileName);

            exit;
        } catch (Exception $e) {
            echo "Error al exportar la base de datos: " . $e->getMessage();
        }
    }
}
