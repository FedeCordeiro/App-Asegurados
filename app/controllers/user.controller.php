<?php

require_once ("./app/views/user.view.php");
require_once ("./app/models/user.model.php");
require_once ("./Helpers/AuthHelper.php");
class UserController
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    public function showLogin()
    {

        $logged = AuthHelper::checkLoggedIn();
        $this->view->showLogin($error = null, $logged);
    }

    public function register()
    {
        $logged = AuthHelper::checkLoggedIn();
        if (!empty($_POST['usernameRegister']) && !empty($_POST['passwordRegister'])) {
            $user = $_POST['usernameRegister'];
            $pass = $_POST['passwordRegister'];

            $existingUser = $this->model->getUserByUsername($user);

            if ($existingUser) {
                $error = "El nombre de usuario ya está en uso. Por favor, elija otro nombre de usuario.";
                $this->view->showLogin($error, $logged);
            } else {
                $this->model->add($user, $pass);
                $error = "El usuario se registró correctamente";
                $this->view->showLogin($error, $logged);
            }
        } else {
            $error = "Completar todos los campos";
            $this->view->showLogin($error, $logged);
        }
    }

    public function verify()
    {
        $logged = AuthHelper::checkLoggedIn();
        if (!empty($_POST['usernameLogin']) && !empty($_POST['passwordLogin'])) {
            $user = $_POST['usernameLogin'];
            $pass = $_POST['passwordLogin'];
            $userDb = $this->model->getUserByUsername($user);

            if (!empty($userDb) && password_verify($pass, $userDb->password)) {
                AuthHelper::login($userDb);
                header('Location: ' . BASE_URL . "home");
                exit;
            } else {
                $error = "Login incorrecto, password o usuario incorrecto";
                $this->view->showLogin($error, $logged);
                exit;
            }
        } else {
            $error = "Completar todos los campos";
            $$this->view->showLogin($error, $logged);
            exit;
        }
    }

    public function logout()
    {
        AuthHelper::logout();
        header("Location: " . BASE_URL . 'login');
    }

    public function CheckLoggedIn()
    {
        if (isset($_SESSION['USERNAME'])) {
            $logged = true;
        } else {
            $logged = false;
        }
        return $logged;
    }
}
