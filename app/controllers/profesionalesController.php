<?php
require_once './app/models/profesionalesModel.php';
require_once './app/views/apiView.php';

class profesionalesController {
    private $model;
    private $apiView;
    private $data;

    public function __construct() {
        $this->model = new profesionalesModel();
        $this->apiView = new ApiView();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function showAll($params = NULL) {
        $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $offset = ($page - 1) * $limit;

        if (isset($_GET['sortby']) && isset($_GET['order'])) { 
            try {
                $sortby = $_GET['sortby'];
                $order = $_GET['order'];
                $profesionales = $this->model->sortbyorder($sortby, $order);
                return $this->apiView->response($profesionales, 200);
            } catch (InvalidArgumentException $e) {
                return $this->apiView->response($e->getMessage(), 400);
            }
        } else {
            $profesionales = $this->model->getAll($limit, $offset);
            $totalProfesionales = $this->model->getTotalCount(); 
            $totalPages = ceil($totalProfesionales / $limit); 

            $response = [
                'current_page' => $page,
                'total_pages' => $totalPages,
                'total_items' => $totalProfesionales,
                'items' => $profesionales,
            ];

            return $this->apiView->response($response, 200);
        } 
    }

    public function showProfesionalById($params = NULL) {
        $id = $params[':ID'];
        $profesional = $this->model->getById($id);

        if ($profesional) {
            return $this->apiView->response($profesional, 200);
        } else {
            return $this->apiView->response("Profesional no encontrado", 404);
        }
    }

    public function add() {
        $profesionalData = $this->getData();
    
        if (isset($profesionalData->nombre) && isset($profesionalData->apellido) && isset($profesionalData->especialidad) && isset($profesionalData->incorporacion)) {
            $id = $this->model->insert($profesionalData->nombre, $profesionalData->apellido, $profesionalData->especialidad, $profesionalData->incorporacion);
            if ($id) {
                return $this->apiView->response("Profesional agregado con ID $id", 201);
            } else {
                return $this->apiView->response("Error al agregar profesional", 500);
            }
        } else {
            return $this->apiView->response("Datos incompletos", 400);
        }
    }

    public function delete($params = NULL) {
        $id = $params[':ID'];
        $result = $this->model->deleteById($id);
    
        if ($result) {
            return $this->apiView->response("Profesional con ID $id eliminado", 200);
        } else {
            return $this->apiView->response("Profesional no encontrado", 404);
        }
    }

    public function update($params = NULL) {
        $id = $params[':ID'];
        $profesionalData = $this->getData();
    
        if (isset($profesionalData->nombre) && isset($profesionalData->apellido) && isset($profesionalData->especialidad) && isset($profesionalData->incorporacion)) {
            $result = $this->model->updateById($id, $profesionalData->nombre, $profesionalData->apellido, $profesionalData->especialidad, $profesionalData->incorporacion);
            if ($result) {
                return $this->apiView->response("Profesional con ID $id actualizado", 200);
            } else {
                return $this->apiView->response("Profesional no encontrado", 404);
            }
        } else {
            return $this->apiView->response("Datos incompletos", 400);
        }
    }
    public function filterByYear($params) {
        $year = $params[':year']; 

        // Validación del año
        if (is_numeric($year) && $year > 1900 && $year <= date("Y")) {
            $result = $this->model->filterByYear($year);
            if ($result) {
                $this->apiView->response($result);
            } else {
                $this->apiView->response("No se encontraron profesionales incorporados en el año especificado.", 404);
            }
        } else {
            $this->apiView->response("Año inválido. Por favor ingrese un año válido.", 400);
        }
    }
}