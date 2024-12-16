<?php
require_once './libs/Smarty/Smarty.class.php';

class AseguradoView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty(); // inicializo Smarty
    }

    function showAseguradoHome($asegurado, $username) {
        $this->smarty->assign('asegurado', $asegurado);
        $this->smarty->assign('username', $username);
        $this->smarty->display('home.tpl'); 
    }

    function showAsegurado($asegurado, $logged)
    {
        $this->smarty->assign('asegurado', $asegurado);
        $this->smarty->assign('logged', $logged);
        $this->smarty->display('listAsegurado.tpl');
    }

    function showAseguradoSearch($asegurado) {
        $this->smarty->assign('asegurado', $asegurado);
        $this->smarty->display('searchByAsegurado.tpl');
    }

    function showAseguradoId($asegurado, $logged) {
        $this->smarty->assign('asegurado', $asegurado);
        $this->smarty->assign('logged', $logged);
        $this->smarty->display('detailsAsegurado.tpl');
    }
    
    function showEditAsegurado($asegurado) {
        $this->smarty->assign('asegurado', $asegurado);
        $this->smarty->display('detailsAsegurado.tpl');
    }

    function renderAddAsegurado() {
        require_once("templates/header.tpl");
        require_once("templates/addAsegurado.tpl");
    }
    
}