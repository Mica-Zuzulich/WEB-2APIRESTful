<?php
class profesionalesModel {
    private $db;
   
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=hospital;charset=utf8', 'root', '');
    }

    public function getAll($limit, $offset) {
        $query = $this->db->prepare("SELECT * FROM profesionales LIMIT :limit OFFSET :offset");
        $query->bindValue(':limit', $limit, PDO::PARAM_INT);
        $query->bindValue(':offset', $offset, PDO::PARAM_INT);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function sortbyorder($sortby, $order) {
        $query = $this->db->prepare("SELECT * FROM profesionales ORDER BY $sortby $order");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getTotalCount() {
        $query = $this->db->prepare("SELECT COUNT(*) as count FROM profesionales");
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['count'];
    }

    public function getById($id) {
        $query = $this->db->prepare("SELECT * FROM profesionales WHERE id = :id");
        $query->bindValue(':id', $id, PDO::PARAM_INT);
        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    public function insert($nombre, $apellido, $especialidad, $incorporacion) {
        $query = $this->db->prepare("INSERT INTO profesionales (nombre, apellido, especialidad, incorporacion) VALUES (:nombre, :apellido, :especialidad, :incorporacion)");
        $query->bindValue(':nombre', $nombre);
        $query->bindValue(':apellido', $apellido);
        $query->bindValue(':especialidad', $especialidad);
        $query->bindValue(':incorporacion',$incorporacion);
        $query->execute();
        return $this->db->lastInsertId();
    }

    public function deleteById($id) {
        $query = $this->db->prepare("DELETE FROM profesionales WHERE id = :id");
        $query->bindValue(':id', $id, PDO::PARAM_INT);
        $query->execute();
        return $query->rowCount();
    }

    public function updateById($id, $nombre, $apellido, $especialidad, $incorporacion) {
        $query = $this->db->prepare("UPDATE profesionales SET nombre = :nombre, apellido = :apellido, especialidad = :especialidad, incorporacion = :incorporacion WHERE id = :id");
        $query->bindValue(':nombre', $nombre);
        $query->bindValue(':apellido', $apellido);
        $query->bindValue(':especialidad', $especialidad);
        $query->bindValue(':incorporacion', $incorporacion);
        $query->bindValue(':id', $id, PDO::PARAM_INT);
        $query->execute();
        return $query->rowCount();
    }
    public function filterByYear($year) {
        $query = $this->db->prepare("SELECT * FROM profesionales WHERE YEAR(incorporacion) = :year");
        $query->bindValue(':year', $year, PDO::PARAM_INT);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

 
}
