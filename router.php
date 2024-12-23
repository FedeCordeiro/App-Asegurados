<?php

require_once './app/controllers/asegurado.controller.php';
require_once './app/controllers/user.controller.php';

// Instancias de las clases
$aseguradoController = new AseguradoController();
$userController = new UserController();

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$action = 'login'; // Acción por defecto
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

$params = explode('/', $action);

// Tabla de ruteo
switch ($params[0]) {
    case 'home':
        $aseguradoController->showAseguradoHome();
        break;
    case 'asegurado':
        $aseguradoController->showAsegurado();
        break;
    case 'aseguradodetail':
        if (isset($params[1])) {
            $aseguradoController->showAseguradoId($params[1]);
        }
        break;
    case 'editAsegurado':
        $aseguradoController->editAsegurado($_POST);
        header("Location: " . BASE_URL . "asegurado");
        exit;
    case 'deleteAsegurado':
        $id = $params[1];
        $aseguradoController->deleteAsegurado($id);
        exit;
    case 'addAsegurado':
        $aseguradoView = new AseguradoView();
        $aseguradoView->renderAddAsegurado();
        break;
    case 'processAddAsegurado':
        $aseguradoController->addAsegurado();
        header("Location: " . BASE_URL . "asegurado");
        exit;
    case 'login':
        $userController->showLogin();
        break;
    case 'verifyLogin':
        $userController->verify();
        break;
    case 'verifyRegister':
        $userController->register();
        break;
    case 'logout':
        $userController->logout();
        break;
    case 'exportar':
        $aseguradoController->exportDatabase();
        break;
    default:
        require("templates/error404.tpl");
        break;
}
