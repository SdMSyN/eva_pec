-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2021 a las 17:31:45
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eva_pec2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_materias`
--

CREATE TABLE `banco_materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `plan_estudio_id` int(11) NOT NULL,
  `nivel_grado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `banco_materias`
--

INSERT INTO `banco_materias` (`id`, `nombre`, `plan_estudio_id`, `nivel_grado_id`) VALUES
(1, 'Mat 1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_niveles_escolares`
--

CREATE TABLE `banco_niveles_escolares` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `banco_niveles_escolares`
--

INSERT INTO `banco_niveles_escolares` (`id`, `nombre`, `creado`) VALUES
(1, 'Primaria', '2020-07-26'),
(2, 'Secundaria', '2020-07-26'),
(3, 'Medio superior', '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_niveles_grados`
--

CREATE TABLE `banco_niveles_grados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `nivel_escolar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `banco_niveles_grados`
--

INSERT INTO `banco_niveles_grados` (`id`, `nombre`, `nivel_escolar_id`) VALUES
(1, '1', 2),
(2, '2', 2),
(3, '3', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_nivel_turnos`
--

CREATE TABLE `banco_nivel_turnos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `banco_nivel_turnos`
--

INSERT INTO `banco_nivel_turnos` (`id`, `nombre`, `creado`) VALUES
(1, 'Matutino', '2020-07-26'),
(2, 'Vespertino', '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Desactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_alumnos`
--

CREATE TABLE `grupos_alumnos` (
  `id` int(11) NOT NULL,
  `grupo_info_id` int(11) NOT NULL,
  `user_alumno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos_alumnos`
--

INSERT INTO `grupos_alumnos` (`id`, `grupo_info_id`, `user_alumno_id`) VALUES
(1, 1, 7),
(2, 1, 10),
(3, 1, 6),
(4, 1, 11),
(5, 1, 12),
(6, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_info`
--

CREATE TABLE `grupos_info` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `nivel_escolar_id` int(11) NOT NULL,
  `nivel_turno_id` int(11) NOT NULL,
  `nivel_grado_id` int(11) NOT NULL,
  `periodo_info_id` int(11) NOT NULL,
  `plan_estudios_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos_info`
--

INSERT INTO `grupos_info` (`id`, `nombre`, `nivel_escolar_id`, `nivel_turno_id`, `nivel_grado_id`, `periodo_info_id`, `plan_estudios_id`, `year`, `creado`) VALUES
(1, 'Grupo1', 1, 1, 1, 1, 1, 0, '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_mat_alum`
--

CREATE TABLE `grupos_mat_alum` (
  `id` int(11) NOT NULL,
  `grupo_mat_prof_id` int(11) NOT NULL,
  `user_alumno_id` int(11) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos_mat_alum`
--

INSERT INTO `grupos_mat_alum` (`id`, `grupo_mat_prof_id`, `user_alumno_id`, `creado`) VALUES
(1, 1, 10, '2020-07-26'),
(2, 1, 6, '2020-07-26'),
(3, 1, 11, '2020-07-26'),
(4, 1, 12, '2020-07-26'),
(5, 1, 13, '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_mat_prof`
--

CREATE TABLE `grupos_mat_prof` (
  `id` int(11) NOT NULL,
  `banco_materia_id` int(11) NOT NULL,
  `user_profesor_id` int(11) NOT NULL,
  `grupo_info_id` int(11) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos_mat_prof`
--

INSERT INTO `grupos_mat_prof` (`id`, `banco_materia_id`, `user_profesor_id`, `grupo_info_id`, `creado`) VALUES
(1, 1, 3, 1, '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `nombre`, `creado`) VALUES
(1, 'Director', '2017-11-10'),
(2, 'Administrativo', '2017-11-10'),
(3, 'Profesor', '2017-11-10'),
(4, 'Alumno', '2017-11-10'),
(5, 'Tutor', '2017-11-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_fecha`
--

CREATE TABLE `periodo_fecha` (
  `id` int(11) NOT NULL,
  `periodo_info_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo_fecha`
--

INSERT INTO `periodo_fecha` (`id`, `periodo_info_id`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 1, '2020-07-01', '2020-07-04'),
(2, 1, '2020-07-05', '2020-07-11'),
(3, 1, '2020-07-12', '2020-07-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_info`
--

CREATE TABLE `periodo_info` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `num_periodos` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo_info`
--

INSERT INTO `periodo_info` (`id`, `nombre`, `num_periodos`, `estado_id`, `creado`) VALUES
(1, 'Periodo 1', 3, 1, '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_estudios`
--

CREATE TABLE `planes_estudios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `planes_estudios`
--

INSERT INTO `planes_estudios` (`id`, `nombre`, `year`, `creado`) VALUES
(1, 'Test', 2018, '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubrica_detalles_calif`
--

CREATE TABLE `rubrica_detalles_calif` (
  `id` int(11) NOT NULL,
  `rubrica_info_calif_id` int(11) NOT NULL,
  `user_alumno_id` int(11) NOT NULL,
  `calificacion` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rubrica_detalles_calif`
--

INSERT INTO `rubrica_detalles_calif` (`id`, `rubrica_info_calif_id`, `user_alumno_id`, `calificacion`) VALUES
(1, 1, 6, 8),
(2, 1, 7, 10),
(3, 1, 10, 10),
(4, 1, 11, 10),
(5, 1, 12, 8),
(6, 1, 13, 8),
(7, 2, 6, 10),
(8, 2, 7, 8),
(9, 2, 10, 10),
(10, 2, 11, 8),
(11, 2, 12, 10),
(12, 2, 13, 10),
(13, 3, 6, 10),
(14, 3, 7, 10),
(15, 3, 10, 8),
(16, 3, 11, 10),
(17, 3, 12, 10),
(18, 3, 13, 10),
(19, 4, 6, 10),
(20, 4, 7, 9),
(21, 4, 10, 8),
(22, 4, 11, 8),
(23, 4, 12, 9),
(24, 4, 13, 10),
(25, 5, 6, 0),
(26, 5, 7, 10),
(27, 5, 10, 10),
(28, 5, 11, 10),
(29, 5, 12, 10),
(30, 5, 13, 0),
(31, 6, 6, 10),
(32, 6, 7, 10),
(33, 6, 10, 0),
(34, 6, 11, 0),
(35, 6, 12, 10),
(36, 6, 13, 10),
(37, 7, 6, 5),
(38, 7, 7, 6),
(39, 7, 10, 7),
(40, 7, 11, 7),
(41, 7, 12, 6),
(42, 7, 13, 5),
(43, 8, 6, 9),
(44, 8, 7, 8),
(45, 8, 10, 9),
(46, 8, 11, 10),
(47, 8, 12, 9),
(48, 8, 13, 8),
(49, 9, 6, 5),
(50, 9, 7, 5),
(51, 9, 10, 6),
(52, 9, 11, 7),
(53, 9, 12, 6),
(54, 9, 13, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubrica_info`
--

CREATE TABLE `rubrica_info` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `grupo_mat_prof_id` int(11) NOT NULL,
  `periodo_fecha_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `porcentaje` int(3) NOT NULL,
  `creado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rubrica_info`
--

INSERT INTO `rubrica_info` (`id`, `nombre`, `grupo_mat_prof_id`, `periodo_fecha_id`, `estado_id`, `porcentaje`, `creado`) VALUES
(1, 'Asistencia', 1, 1, 2, 50, '2020-07-26'),
(2, 'Tareas', 1, 1, 2, 20, '2020-07-26'),
(3, 'Examen', 1, 1, 2, 30, '2020-07-26'),
(4, 'Asistencias', 1, 2, 2, 10, '2020-07-26'),
(5, 'Tareas', 1, 2, 2, 30, '2020-07-26'),
(6, 'Examen', 1, 2, 2, 60, '2020-07-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubrica_info_calif`
--

CREATE TABLE `rubrica_info_calif` (
  `id` int(11) NOT NULL,
  `rubrica_info_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rubrica_info_calif`
--

INSERT INTO `rubrica_info_calif` (`id`, `rubrica_info_id`, `fecha`, `nombre`) VALUES
(1, 1, '2020-07-26', 'Lista'),
(2, 1, '2020-07-27', 'Lista2'),
(3, 1, '2020-07-28', 'Lista3'),
(4, 4, '2020-07-27', 'Lista'),
(5, 4, '2020-07-28', 'Lista2'),
(6, 4, '2020-07-29', 'Lista3'),
(7, 5, '2020-07-26', 'Tarea 1'),
(8, 5, '2020-07-31', 'Tarea2'),
(9, 6, '2020-08-01', 'Exa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `logo` varchar(25) DEFAULT NULL,
  `informacion_id` int(11) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `creado` date NOT NULL,
  `actualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `user`, `pass`, `clave`, `logo`, `informacion_id`, `perfil_id`, `estado_id`, `creado`, `actualizado`) VALUES
(6, 'AP1 AM1 Name1', 'aAP1M5', 'aAP1M5', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(7, 'AP2 AM2 Name2UPD', 'aAP2M7', 'aAP2M7', '', NULL, NULL, 4, 1, '2020-07-26', '2020-07-26 20:55:00'),
(8, 'AP2 AM2 Name2', 'aAP2M8', 'aAP2M8', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(9, 'AP2 AM2 Name2', 'aAP2M9', 'aAP2M9', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(10, 'AP3 AM3 Name3', 'aAP3M10', 'aAP3M10', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(13, 'Sarmiento Huerta Arturo', 'asarmientoh13', '', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(1, 'Luigi Perez Calzada', 'GianBros', '123', 'gianbros', 'gianbros.png', 1, 1, 1, '2017-11-10', NULL),
(12, 'Lima Valdez Ignacio', 'ilimav12', '', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(11, 'Briones Torres Marco', 'mbrionest11', '', '', NULL, NULL, 4, 1, '2020-07-26', NULL),
(2, 'Test Profesor 1', 'prof1', 'prof1', 'prof1', NULL, 2, 2, 1, '2017-11-18', '2017-11-20 14:44:00'),
(3, 'Test profesor 2', 'prof2', 'prof2', 'prof2', NULL, 3, 3, 1, '2017-11-19', NULL),
(4, 'Test profesor 3', 'prof3', 'prof3', 'prof3', NULL, 4, 3, 1, '2017-11-19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_informacion`
--

CREATE TABLE `usuarios_informacion` (
  `id` int(11) NOT NULL,
  `dir` varchar(150) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `creado` date NOT NULL,
  `actualizado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_informacion`
--

INSERT INTO `usuarios_informacion` (`id`, `dir`, `tel`, `mail`, `creado`, `actualizado`) VALUES
(1, 'Av. Revolucion No. 168, Acxotla del Río, Totolac, Tlaxcala.', '2461231894', 'gianbros260@gmail.com', '2017-11-10', NULL),
(2, '', '1515151515', '', '2017-11-18', '2017-11-20 14:44:00'),
(3, '', '0987654321', '', '2017-11-19', NULL),
(4, '', '', 'algo@hot.com', '2017-11-19', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco_materias`
--
ALTER TABLE `banco_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banco_niveles_escolares`
--
ALTER TABLE `banco_niveles_escolares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banco_niveles_grados`
--
ALTER TABLE `banco_niveles_grados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nivel_escolar_id` (`nivel_escolar_id`);

--
-- Indices de la tabla `banco_nivel_turnos`
--
ALTER TABLE `banco_nivel_turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `grupos_alumnos`
--
ALTER TABLE `grupos_alumnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupos_info`
--
ALTER TABLE `grupos_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupos_mat_alum`
--
ALTER TABLE `grupos_mat_alum`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupos_mat_prof`
--
ALTER TABLE `grupos_mat_prof`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `periodo_fecha`
--
ALTER TABLE `periodo_fecha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periodo_info_id` (`periodo_info_id`);

--
-- Indices de la tabla `periodo_info`
--
ALTER TABLE `periodo_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `planes_estudios`
--
ALTER TABLE `planes_estudios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rubrica_detalles_calif`
--
ALTER TABLE `rubrica_detalles_calif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rubrica_info_calif_id` (`rubrica_info_calif_id`,`user_alumno_id`),
  ADD KEY `user_alumno_id` (`user_alumno_id`);

--
-- Indices de la tabla `rubrica_info`
--
ALTER TABLE `rubrica_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_mat_prof_id` (`grupo_mat_prof_id`,`periodo_fecha_id`,`estado_id`),
  ADD KEY `periodo_fecha_id` (`periodo_fecha_id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `rubrica_info_calif`
--
ALTER TABLE `rubrica_info_calif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rubrica_info_id` (`rubrica_info_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD UNIQUE KEY `user` (`user`),
  ADD KEY `id` (`id`),
  ADD KEY `informacion_id` (`informacion_id`,`perfil_id`,`estado_id`),
  ADD KEY `perfil_id` (`perfil_id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `usuarios_informacion`
--
ALTER TABLE `usuarios_informacion`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banco_materias`
--
ALTER TABLE `banco_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `banco_niveles_escolares`
--
ALTER TABLE `banco_niveles_escolares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `banco_niveles_grados`
--
ALTER TABLE `banco_niveles_grados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `banco_nivel_turnos`
--
ALTER TABLE `banco_nivel_turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grupos_alumnos`
--
ALTER TABLE `grupos_alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grupos_info`
--
ALTER TABLE `grupos_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `grupos_mat_alum`
--
ALTER TABLE `grupos_mat_alum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `grupos_mat_prof`
--
ALTER TABLE `grupos_mat_prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `periodo_fecha`
--
ALTER TABLE `periodo_fecha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `periodo_info`
--
ALTER TABLE `periodo_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `planes_estudios`
--
ALTER TABLE `planes_estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rubrica_detalles_calif`
--
ALTER TABLE `rubrica_detalles_calif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `rubrica_info`
--
ALTER TABLE `rubrica_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rubrica_info_calif`
--
ALTER TABLE `rubrica_info_calif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios_informacion`
--
ALTER TABLE `usuarios_informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `banco_niveles_grados`
--
ALTER TABLE `banco_niveles_grados`
  ADD CONSTRAINT `banco_niveles_grados_ibfk_1` FOREIGN KEY (`nivel_escolar_id`) REFERENCES `banco_niveles_escolares` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `periodo_fecha`
--
ALTER TABLE `periodo_fecha`
  ADD CONSTRAINT `periodo_fecha_ibfk_1` FOREIGN KEY (`periodo_info_id`) REFERENCES `periodo_info` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `periodo_info`
--
ALTER TABLE `periodo_info`
  ADD CONSTRAINT `periodo_info_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rubrica_detalles_calif`
--
ALTER TABLE `rubrica_detalles_calif`
  ADD CONSTRAINT `rubrica_detalles_calif_ibfk_1` FOREIGN KEY (`rubrica_info_calif_id`) REFERENCES `rubrica_info_calif` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rubrica_detalles_calif_ibfk_2` FOREIGN KEY (`user_alumno_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rubrica_info`
--
ALTER TABLE `rubrica_info`
  ADD CONSTRAINT `rubrica_info_ibfk_1` FOREIGN KEY (`grupo_mat_prof_id`) REFERENCES `grupos_mat_prof` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rubrica_info_ibfk_2` FOREIGN KEY (`periodo_fecha_id`) REFERENCES `periodo_fecha` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rubrica_info_ibfk_3` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rubrica_info_calif`
--
ALTER TABLE `rubrica_info_calif`
  ADD CONSTRAINT `rubrica_info_calif_ibfk_1` FOREIGN KEY (`rubrica_info_id`) REFERENCES `rubrica_info` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`informacion_id`) REFERENCES `usuarios_informacion` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
