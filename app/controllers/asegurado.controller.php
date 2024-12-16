<?php
require_once ("./app/models/asegurado.model.php");
require_once ("./app/views/asegurado.view.php");
require_once ("./app/controllers/user.controller.php");
require_once ("./Helpers/AuthHelper.php");

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
        if (isset($_POST['nombre'], $_POST['dni'], $_POST['fecha_nac'], $_POST['calle'], $_POST['numero'],$_POST['numero'], $_POST['localidad'],$_POST['marca'], $_POST['anio'],$_POST['patente'], $_POST['motor'], $_POST['chasis'])) {
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
                'chasis' => $_POST['chasis']
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
            if (isset($_POST['nombre'], $_POST['dni'], $_POST['fecha_nac'], $_POST['calle'], $_POST['numero'], $_POST['piso'], $_POST['localidad'], $_POST['marca'], $_POST['anio'], $_POST['patente'], $_POST['motor'], $_POST['chasis'])) {
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


                $this->model->insertAsegurado($id_cliente, $nombre, $dni, $fecha_nac, $calle, $numero, $piso, $localidad, $marca, $anio, $patente, $motor, $chasis);

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
}
