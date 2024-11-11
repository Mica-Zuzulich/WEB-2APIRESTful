-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-11-2024 a las 17:13:33
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `paciente_id`, `fecha`, `hora`) VALUES
(10, 4, '2024-10-13', '14:30:00'),
(13, 7, '2024-10-16', '16:45:00'),
(14, 8, '2024-10-17', '12:00:00'),
(15, 9, '2024-10-18', '13:30:00'),
(16, 10, '2024-10-19', '15:00:00'),
(17, 6, '5545-04-05', '05:04:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `foto`) VALUES
(4, 'jose', 'martinez', 'https://st2.depositphotos.com/1054749/10664/i/450/depositphotos_106646028-stock-photo-young-latin-american-man-portrait.jpg'),
(6, 'laura', 'fernandez', 'https://previews.123rf.com/images/blueskyimage/blueskyimage1309/blueskyimage130900401/21964348-hermosas-mujeres-j%C3%B3venes-retrato-de-la-mujer-joven-alegre-sonriente.jpg'),
(7, 'carlos', 'torres', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDD8JAbgksWXT8npj9X1T-H0AurUtSvgjv9_HCAU01ocOQHxtNenR1aCfWUTFx9ZXxzPI&usqp=CAU'),
(8, 'juan', 'lopez', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLHAXvGmot0UI9CUAegANdXzUWf8tjMhW8vPcBzcCVdRQMQgHAH7CpyLQ_flB0cLdBb4&usqp=CAU'),
(9, 'martin', 'morales', 'https://static9.depositphotos.com/1642942/1174/i/450/depositphotos_11745653-stock-photo-cute-guy-leaning-on-chair.jpg'),
(10, 'sofia', 'diaz', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmPATj3LbshT_VfdB49BJGIjQdce7wZj4YQ&s'),
(13, 'micaela', 'zuzulich', 'https://media.istockphoto.com/id/625770194/es/foto/feliz-rizada-mujer-sudamericana-risa.jpg?s=612x612&w=0&k=20&c=ZDHOOJAxYQScawcMKFCEZcGE43so38PL0Q3CROeOhyM='),
(20, 'adasddfdsf', 'dsfsdfsdf', ''),
(21, 'sfsdffdssf', 'fsdfsddfsdfsf', ''),
(24, '<sxx<sxc', 'zczczc', 'czczxc'),
(25, 'giuli', 'polii', 'ksjsjjss');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id` int(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `especialidad` varchar(255) NOT NULL,
  `incorporacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesionales`
--

INSERT INTO `profesionales` (`id`, `nombre`, `apellido`, `especialidad`, `incorporacion`) VALUES
(1, 'Juan', 'Pérez', 'Cardiología', '1993-03-03'),
(2, 'María', 'Gómez', 'Dermatología', '1900-01-13'),
(3, 'Carlos', 'López', 'Neurología', '2000-06-04'),
(4, 'Ana', 'Martínez', 'Pediatría', '2000-06-20'),
(5, 'José', 'Fernández', 'Ginecología', '1900-01-11'),
(6, 'Lucía', 'Rodríguez', 'Oncología', '1900-01-06'),
(7, 'Pedro', 'Hernández', 'Oftalmología', '1900-01-16'),
(8, 'Laura', 'García', 'Psiquiatría', '1900-01-11'),
(9, 'Diego', 'Ramírez', 'Endocrinología', '2010-12-21'),
(10, 'Carmen', 'Sánchez', 'Nefrología', '2010-12-08'),
(11, 'Raúl', 'Ruiz', 'Otorrinolaringología', '1900-01-24'),
(12, 'Marta', 'Jiménez', 'Traumatología', '1900-01-18'),
(13, 'Luis', 'Morales', 'Gastroenterología', '1900-01-25'),
(14, 'Sofía', 'Ortega', 'Reumatología', '1900-01-10'),
(15, 'Andrés', 'Castro', 'Urología', '1900-01-26'),
(16, 'Paula', 'Vázquez', 'Neumología', '1900-01-13'),
(17, 'Alberto', 'Torres', 'Oncología', '1900-01-26'),
(18, 'Isabel', 'Luna', 'Dermatología', '1900-01-10'),
(19, 'Miguel', 'Díaz', 'Hematología', '1900-01-27'),
(20, 'Clara', 'Mendoza', 'Endocrinología', '1900-01-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(7) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `password`) VALUES
(1, 'admin@example.com', '$2y$10$ZzjnOLHBGV8Wfd8UssJLB.drcJj2BxtAN6eZzB5QxJ7TxQzFouknq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
