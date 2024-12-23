<?php

class AseguradoModel
{
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;dbname=db_asegurados;charset=utf8', 'root', '');
    }

    // Obtener todos los asegurados
    public function getAllAsegurados()
    {
        $query = $this->db->prepare("SELECT * FROM asegurado");
        $query->execute();

        $asegurados = $query->fetchAll(PDO::FETCH_OBJ);

        return $asegurados;
    }

    // Obtener asegurado por ID
    public function getAseguradosById($id_cliente)
    {
        $query = $this->db->prepare("SELECT * FROM asegurado WHERE id_cliente = :id_cliente");
        $query->bindParam(":id_cliente", $id_cliente);
        $query->execute();

        $asegurado = $query->fetch(PDO::FETCH_OBJ);

        return $asegurado;
    }

    // Editar asegurado
    public function editAsegurado($asegurado)
    {
        $query = $this->db->prepare('UPDATE asegurado SET nombre=?, dni=?, fecha_nac=?, calle=?, numero=?, piso=?, localidad=?, marca=?, anio=?, patente=?, motor=?, chasis=?, referente=? WHERE id_cliente=?');
        $query->execute([
            $asegurado['nombre'],
            $asegurado['dni'],
            $asegurado['fecha_nac'],
            $asegurado['calle'],
            $asegurado['numero'],
            $asegurado['piso'],
            $asegurado['localidad'],
            $asegurado['marca'],
            $asegurado['anio'],
            $asegurado['patente'],
            $asegurado['motor'],
            $asegurado['chasis'],
            $asegurado['referente'],
            $asegurado['id_cliente']
        ]);

        return true;
    }

    // Eliminar asegurado por ID
    public function deleteAseguradoById($id)
    {
        $query = $this->db->prepare('DELETE FROM asegurado WHERE id_cliente = ?');
        $query->execute([$id]);
    }

    // Insertar un nuevo asegurado
    public function insertAsegurado($id_cliente, $nombre, $dni, $fecha_nac, $calle, $numero, $piso, $localidad, $marca, $anio, $patente, $motor, $chasis, $referente)
    {
        // Insertamos el nuevo asegurado sin verificar duplicación de DNI
        $query = $this->db->prepare("INSERT INTO asegurado (id_cliente, nombre, dni, fecha_nac, calle, numero, piso, localidad, marca, anio, patente, motor, chasis, referente) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $query->execute([$id_cliente, $nombre, $dni, $fecha_nac, $calle, $numero, $piso, $localidad, $marca, $anio, $patente, $motor, $chasis, $referente]);

        return $this->db->lastInsertId();
    }

    // Obtener asegurado por DNI
    public function getAseguradoByDni($dni)
    {
        // Preparamos la consulta para buscar un asegurado por el DNI
        $query = $this->db->prepare("SELECT * FROM asegurado WHERE dni = :dni");
        $query->bindParam(":dni", $dni);
        $query->execute();

        // Obtenemos el resultado de la consulta
        $asegurado = $query->fetch(PDO::FETCH_OBJ);

        // Retornamos el asegurado si se encuentra, o null si no
        return $asegurado ? $asegurado : null;
    }
}