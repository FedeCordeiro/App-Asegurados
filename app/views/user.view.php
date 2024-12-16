<?php

class UserView
{
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty(); // Inicializa la instancia de Smarty
    }

    public function showLogin($error = null, $logged)
    {
        $this->smarty->assign('error', $error);
        $this->smarty->assign('logged', $logged); // Cambia 'mensaje' a 'error'
        $this->smarty->display("login.tpl");
    }
}
