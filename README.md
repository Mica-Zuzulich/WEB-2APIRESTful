
Sistema de Gestión de Hospital

Este proyecto es un sistema de gestión de datos hospitalarios que permite la administración de citas, pacientes, profesionales, y usuarios. Está desarrollado en PHP y utiliza una base de datos MySQL para almacenar la información.


http://localhost/WEB-2APIRESTful/api/profesionales


Características del Proyecto

    Gestión de Profesionales: CRUD (Crear, Leer, Actualizar, Eliminar) de profesionales médicos, con opción de filtrado por año de incorporación.

Estructura del Proyecto

    Database.php: Clase para la conexión a la base de datos.
    Router.php: Archivo de enrutamiento que permite definir y gestionar rutas para la API.
    ProfesionalesController.php: Controlador que maneja las operaciones CRUD de los profesionales.
    APIView.php: Clase que gestiona las respuestas en formato JSON.

Rutas de la API
Profesionales

    GET /profesionales - Muestra todos los profesionales.
    GET /profesionales/:ID - Muestra un profesional por ID.
    POST /profesionales - Agrega un nuevo profesional.
    DELETE /profesionales/:ID - Elimina un profesional por ID.
    PUT /profesionales/:ID - Actualiza un profesional por ID.
    GET /profesionales/filter/:year - Filtra profesionales por año de incorporación.

Ejemplo de uso

#Obtener todos los profesionales (GET /profesionales):

curl -X GET http://localhost/hospital_api/profesionales

#Obtener un profesional por ID (GET /profesionales/:ID):

curl -X GET http://localhost/hospital_api/profesionales/1

#Agregar un nuevo profesional (POST /profesionales):

curl -X POST -H "Content-Type: application/json" \
-d '{"nombre":"Carlos", "apellido":"Gómez", "especialidad":"Cardiología", "incorporacion":"2023-05-01"}' \
http://localhost/hospital_api/profesionales

#Eliminar un profesional por ID (DELETE /profesionales/:ID):

curl -X DELETE http://localhost/hospital_api/profesionales

#Actualizar un profesional por ID (PUT /profesionales/:ID):

curl -X PUT -H "Content-Type: application/json" \
-d '{"nombre":"Carlos", "apellido":"Gómez", "especialidad":"Neurología", "incorporacion":"2023-05-01"}' \
http://localhost/hospital_api/profesionales/1


#Filtrar profesionales por año de incorporación (GET /profesionales/filter/:year):

curl -X GET http://localhost/hospital_api/profesionales/filter/2023


Consideraciones

Este proyecto se realizó como parte de un ejercicio de desarrollo de una API REST en PHP, por lo cual es ideal para entornos de desarrollo o pruebas y no está optimizado para entornos de producción.