<?php

require_once 'libs/router.php';
require_once './app/controllers/profesionalesController.php';
require_once './app/models/profesionalesModel.php';
require_once './app/views/apiView.php';

$router= new Router();

/**
 *  SECCIÓN TABLA PROFESIONALES
 */

// Rutas para mostrar los profesionales
$router->addRoute('profesionales', 'GET', 'profesionalesController', 'showAll'); // Mostrar todos los profesionales
$router->addRoute('profesionales/:ID', 'GET', 'profesionalesController', 'showProfesionalById'); // Mostrar profesional por ID

// Rutas para agregar, eliminar y actualizar profesionales
$router->addRoute('profesionales', 'POST', 'profesionalesController', 'add'); // Agregar un nuevo profesional
$router->addRoute('profesionales/:ID', 'DELETE', 'profesionalesController', 'delete'); // Eliminar profesional por ID
$router->addRoute('profesionales/:ID', 'PUT', 'profesionalesController', 'update'); // Actualizar profesional por ID



// Ruta para filtrar por año
$router->addRoute('profesionales/filter/:year', 'GET', 'profesionalesController', 'filterByYear'); // Filtrar profesionales por año


$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
?>