<?php

class AuthHelper
{
    public function __construct()
    {
    }

    static private function start()
    {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start(); // Inicia la sesión si no está activa
        }
    }

    static public function login($user)
    {
        self::start(); // Inicia la sesión
        $_SESSION['IS_LOGGED'] = true; // Establece la variable de sesión para indicar que el usuario ha iniciado sesión
        $_SESSION['ID_USER'] = $user->id_user; // Almacena el ID del usuario en la variable de sesión
        $_SESSION['USERNAME'] = $user->username; // Almacena el nombre de usuario en la variable de sesión
    }

    public static function logout()
    {
        self::start(); // Inicia la sesión
        session_destroy(); // Destruye la sesión, eliminando todas las variables de sesión y cerrando la sesión actual
    }

    public static function checkLoggedIn()
    {
        self::start(); // Inicia la sesión
        if (!isset($_SESSION['ID_USER'])) {
            return false;
            header("Location: " . BASE_URL . "login");
        } else {
            return true; // Retorna true si el usuario está logueado
        }
    }

    public static function getLoggedUserName()
    {
        self::start(); // Inicia la sesión
        if (isset($_SESSION['USERNAME'])) {
            return $_SESSION['USERNAME']; // Retorna el nombre de usuario almacenado en la variable de sesión
        } else {
            return false; // Retorna false si el nombre de usuario no está almacenado en la variable de sesión
        }
    }
}
