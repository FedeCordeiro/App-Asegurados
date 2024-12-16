<?php

class UserModel
{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;dbname=db_asegurados;charset=utf8', 'root', '');
    }

    public function getUserByUsername($username)
    {
        $query = $this->db->prepare('SELECT * FROM `usuario` WHERE username = ?');
        $query->execute(array(($username)));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function add($user, $pass)
    {
        $passEnc = password_hash($pass, PASSWORD_DEFAULT);
        $query = $this->db->prepare('INSERT INTO `usuario` (username, password) VALUES (?, ?)');
        $query->execute([$user, $passEnc]);
    }
}
