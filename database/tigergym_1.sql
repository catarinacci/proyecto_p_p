-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-02-2020 a las 00:30:43
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tigergym_1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `nombre_actividad` varchar(20) NOT NULL,
  `precio_actividad` float(12,2) NOT NULL,
  `ID_USUARIO_INSTRUCTOR` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`ID_ACTIVIDAD`, `nombre_actividad`, `precio_actividad`, `ID_USUARIO_INSTRUCTOR`) VALUES
(1, 'aparatos', 1000.00, 11),
(2, 'zumba', 400.00, 4),
(3, 'step', 400.00, NULL),
(4, 'pilates', 400.00, NULL),
(5, 'yoga', 400.00, NULL),
(7, 'jump_fit', 500.00, NULL),
(8, 'funcional', 500.00, NULL),
(9, 'vale todo', 500.00, 10),
(10, 'aikido', 500.00, 12),
(11, 'bike', 400.00, NULL),
(12, 'run', 400.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_usuario`
--

CREATE TABLE `actividad_usuario` (
  `ID_ACTIVIDAD_USUARIO` int(11) NOT NULL,
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `ID_USUARIO` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividad_usuario`
--

INSERT INTO `actividad_usuario` (`ID_ACTIVIDAD_USUARIO`, `ID_ACTIVIDAD`, `ID_USUARIO`) VALUES
(1, 2, 9),
(2, 1, 9),
(3, 10, 3),
(4, 1, 3),
(5, 5, 9);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consultas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `consultas` (
`nombre` varchar(15)
,`apellido` varchar(15)
,`DNI` int(8)
,`fecha` date
,`hora_entrada` time
,`hora_salida` time
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `ID_DIA` int(4) NOT NULL,
  `nombre_dia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dia`
--

INSERT INTO `dia` (`ID_DIA`, `nombre_dia`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miércoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sábado'),
(7, 'Lunes / Vi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `ID_HORARIO` int(10) NOT NULL,
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `ID_DIA` int(4) NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`ID_HORARIO`, `ID_ACTIVIDAD`, `ID_DIA`, `hora_entrada`, `hora_salida`) VALUES
(1, 10, 1, '09:30:00', '10:30:00'),
(2, 10, 1, '17:30:00', '18:30:00'),
(3, 10, 3, '09:30:00', '10:30:00'),
(4, 10, 3, '17:30:00', '18:30:00'),
(5, 10, 5, '09:30:00', '10:30:00'),
(6, 10, 5, '17:30:00', '18:30:00'),
(7, 2, 1, '10:30:00', '11:30:00'),
(8, 2, 1, '16:30:00', '17:30:00'),
(9, 2, 3, '10:30:00', '11:30:00'),
(10, 2, 3, '16:30:00', '17:30:00'),
(11, 2, 5, '10:30:00', '11:30:00'),
(12, 2, 5, '17:30:00', '18:30:00'),
(13, 1, 7, '08:00:00', '22:00:00'),
(14, 1, 6, '08:00:00', '12:00:00'),
(15, 5, 2, '09:00:00', '10:30:00'),
(16, 5, 4, '09:00:00', '10:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_PAGO` int(12) NOT NULL,
  `ID_USUARIO` int(6) NOT NULL,
  `fecha_pago` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `monto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_PAGO`, `ID_USUARIO`, `fecha_pago`, `fecha_vencimiento`, `monto`) VALUES
(1, 3, '2019-09-21', '2020-02-04', 1500),
(2, 9, '2019-09-21', '2019-10-23', 1800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_e_s`
--

CREATE TABLE `registro_e_s` (
  `ID_REGISTRO_E_S` int(255) NOT NULL,
  `ID_USUARIO` int(6) NOT NULL,
  `ID_PAGO` int(255) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `fechavenc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_e_s`
--

INSERT INTO `registro_e_s` (`ID_REGISTRO_E_S`, `ID_USUARIO`, `ID_PAGO`, `fecha`, `hora_entrada`, `hora_salida`, `estado`, `fechavenc`) VALUES
(3, 9, NULL, '2019-10-20', '17:00:00', '17:48:00', 1, NULL),
(4, 9, NULL, '2019-10-20', '17:00:00', '17:48:00', 0, NULL),
(5, 3, NULL, '2019-10-20', '17:00:00', '11:30:00', 0, NULL),
(6, 3, NULL, '2019-10-20', '17:00:00', '22:59:24', 0, NULL),
(13, 1, NULL, '2019-10-20', '22:54:36', '22:58:41', 0, NULL),
(14, 1, NULL, '2019-10-20', '23:00:01', '23:00:54', 0, NULL),
(15, 1, NULL, '2019-10-20', '23:20:13', '23:23:39', 0, NULL),
(16, 1, NULL, '2019-10-20', '23:25:09', '23:25:15', 0, NULL),
(17, 1, NULL, '2019-10-20', '23:28:36', '23:28:43', 0, NULL),
(18, 1, NULL, '2019-10-20', '23:40:16', '23:40:21', 0, NULL),
(19, 1, NULL, '2019-10-20', '23:40:26', '23:40:31', 0, NULL),
(20, 1, NULL, '2019-10-20', '23:40:36', '23:40:49', 0, NULL),
(21, 1, NULL, '2019-10-20', '23:40:57', '23:41:04', 0, NULL),
(22, 1, NULL, '2019-10-20', '23:45:15', '23:48:21', 0, NULL),
(23, 3, NULL, '2019-10-20', '23:48:42', '23:51:13', 0, NULL),
(24, 1, NULL, '2019-10-20', '23:52:40', '23:57:07', 0, NULL),
(25, 3, NULL, '2019-10-20', '23:54:54', '23:55:07', 0, NULL),
(26, 3, NULL, '2019-10-20', '23:56:30', '23:56:46', 0, NULL),
(27, 1, NULL, '2019-10-20', '23:57:13', '00:01:06', 0, NULL),
(28, 3, NULL, '2019-10-21', '00:01:56', '01:00:30', 0, NULL),
(29, 1, NULL, '2019-10-21', '01:00:38', '17:16:38', 0, NULL),
(30, 3, NULL, '2019-10-21', '18:55:04', '21:51:22', 0, NULL),
(31, 3, NULL, '2019-10-22', '21:51:29', '17:23:48', 0, NULL),
(32, 3, NULL, '2019-10-23', '17:26:20', '17:28:20', 0, NULL),
(33, 3, NULL, '2019-10-23', '17:28:40', '17:29:34', 0, NULL),
(34, 3, NULL, '2019-10-23', '17:30:06', '17:32:28', 0, NULL),
(35, 3, NULL, '2019-10-23', '17:33:14', '17:34:36', 0, NULL),
(36, 3, NULL, '2019-10-23', '17:35:22', '17:36:28', 0, NULL),
(37, 3, NULL, '2019-10-23', '17:36:49', '17:39:20', 0, NULL),
(38, 3, NULL, '2019-10-23', '17:42:45', NULL, 0, NULL),
(39, 3, NULL, '2019-10-23', '17:43:21', NULL, 0, NULL),
(40, 3, NULL, '2019-10-23', '17:44:22', '17:45:25', 0, NULL),
(41, 3, NULL, '2019-10-23', '17:45:58', '17:46:13', 0, NULL),
(42, 3, NULL, '2019-10-23', '17:53:28', '17:52:58', 0, NULL),
(43, 3, NULL, '2019-10-23', '17:54:43', '17:54:03', 0, NULL),
(44, 3, NULL, '2019-10-23', NULL, '17:55:08', 1, NULL),
(45, 3, NULL, '2019-10-23', NULL, '17:56:13', 1, NULL),
(46, 3, NULL, '2019-10-23', NULL, '17:56:31', 1, NULL),
(47, 3, NULL, '2019-10-23', NULL, '17:57:11', 1, NULL),
(48, 3, NULL, '2019-10-23', '17:58:15', NULL, 1, NULL),
(49, 3, NULL, '2019-10-23', '17:58:32', NULL, 1, NULL),
(50, 3, NULL, '2019-10-23', '18:00:37', NULL, 1, NULL),
(51, 3, NULL, '2019-10-23', '18:01:07', '18:03:59', 0, NULL),
(52, 3, NULL, '2019-10-23', '18:04:30', '18:04:47', 0, NULL),
(53, 3, NULL, '2019-10-23', '18:05:15', '18:08:46', 0, NULL),
(54, 1, NULL, '2019-10-23', '18:07:59', '18:16:05', 0, NULL),
(55, 3, NULL, '2019-10-23', '18:09:50', '18:12:34', 0, NULL),
(56, 3, NULL, '2019-10-23', '18:12:54', '18:14:39', 0, NULL),
(57, 1, NULL, '2019-10-23', '18:17:13', '18:18:05', 0, NULL),
(58, 3, NULL, '2019-10-23', '18:17:32', '18:21:23', 0, NULL),
(59, 1, NULL, '2019-10-23', '18:18:36', '18:20:24', 0, NULL),
(60, 3, NULL, '2019-10-23', '18:21:39', '20:28:07', 0, NULL),
(61, 9, NULL, '2019-10-23', '18:25:01', '18:59:44', 0, NULL),
(62, 1, NULL, '2019-10-23', '18:59:21', '21:18:28', 0, NULL),
(63, 3, NULL, '2019-10-23', '20:29:52', '20:30:07', 0, NULL),
(64, 3, NULL, '2019-10-23', '20:32:49', '21:17:34', 0, NULL),
(65, 3, NULL, '2019-11-04', '20:30:53', '20:37:37', 0, NULL),
(66, 6, NULL, '2019-11-04', '20:34:40', '20:34:51', 0, NULL),
(67, 6, NULL, '2019-11-04', '20:35:32', '20:35:38', 0, NULL),
(68, 9, NULL, '2019-11-04', '20:35:49', '20:36:18', 0, NULL),
(69, 3, NULL, '2019-11-04', '20:52:48', '20:52:56', 0, NULL),
(70, 3, NULL, '2019-11-04', '20:57:30', '20:57:49', 0, NULL),
(71, 3, NULL, '2019-11-04', '21:00:05', '21:14:14', 0, NULL),
(72, 9, NULL, '2019-11-04', '21:13:14', '13:32:35', 0, NULL),
(73, 3, NULL, '2019-11-05', '20:19:43', '20:19:49', 0, NULL),
(74, 1, NULL, '2019-12-05', '10:45:04', '10:45:25', 0, NULL),
(75, 3, NULL, '2019-12-05', '12:05:13', '12:22:30', 0, NULL),
(76, 3, NULL, '2019-12-05', '12:36:47', '12:38:22', 0, NULL),
(77, 3, NULL, '2019-12-05', '12:39:37', '12:59:31', 0, NULL),
(78, 3, NULL, '2019-12-05', '13:00:17', '13:01:26', 0, NULL),
(79, 3, NULL, '2019-12-05', '13:02:42', '13:03:27', 0, NULL),
(80, 3, NULL, '2019-12-05', '13:04:44', '13:05:54', 0, NULL),
(81, 3, NULL, '2019-12-05', '13:06:30', '13:08:41', 0, NULL),
(82, 3, NULL, '2019-12-05', '13:09:04', '13:10:20', 0, NULL),
(83, 3, NULL, '2019-12-05', '13:11:28', '13:12:34', 0, NULL),
(84, 3, NULL, '2019-12-05', '13:22:18', '13:23:37', 0, NULL),
(85, 3, NULL, '2019-12-05', '13:23:56', '13:30:37', 0, NULL),
(86, 3, NULL, '2019-12-05', '13:31:17', '13:32:10', 0, NULL),
(87, 3, NULL, '2019-12-05', '13:36:42', '13:37:58', 0, NULL),
(88, 3, NULL, '2019-12-05', '13:40:51', '13:41:31', 0, NULL),
(89, 3, NULL, '2019-12-05', '13:48:02', '13:49:43', 0, NULL),
(90, 9, NULL, '2019-12-05', '13:50:02', '13:53:26', 0, NULL),
(91, 3, NULL, '2019-12-05', '13:54:15', '13:55:53', 0, NULL),
(92, 9, NULL, '2019-12-05', '13:55:09', '13:56:27', 0, NULL),
(93, 3, NULL, '2019-12-05', '13:57:35', '14:03:20', 0, NULL),
(94, 3, NULL, '2019-12-05', '14:05:00', '14:06:15', 0, NULL),
(95, 3, NULL, '2019-12-05', '14:08:14', '14:12:44', 0, NULL),
(96, 3, NULL, '2019-12-05', '14:21:21', '14:21:44', 0, NULL),
(97, 3, NULL, '2019-12-05', '14:23:57', '14:27:08', 0, NULL),
(98, 9, NULL, '2019-12-05', '14:27:18', '14:39:26', 0, NULL),
(99, 3, NULL, '2019-12-05', '14:29:52', '14:34:25', 0, NULL),
(100, 3, NULL, '2019-12-05', '14:35:03', '14:41:30', 0, NULL),
(101, 3, NULL, '2019-12-05', '14:43:41', '14:44:26', 0, NULL),
(102, 3, NULL, '2019-12-05', '15:00:34', '15:03:09', 0, NULL),
(103, 1, NULL, '2019-12-05', '15:00:43', '15:03:44', 0, NULL),
(104, 1, NULL, '2020-01-27', '20:44:20', NULL, 1, NULL),
(105, 3, NULL, '2020-01-28', '17:26:12', '18:18:23', 0, NULL),
(106, 3, NULL, '2020-01-28', '18:18:36', '18:24:27', 0, NULL),
(107, 3, NULL, '2020-01-28', '18:24:32', '18:29:28', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `ID_TIPO` int(4) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`ID_TIPO`, `nombre`) VALUES
(1, 'admin'),
(2, 'recepcionista'),
(3, 'rrhh'),
(4, 'instructor'),
(5, 'tesoreria'),
(6, 'marketing'),
(7, 'cliente'),
(8, 'mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(6) NOT NULL,
  `ID_TIPO` int(4) NOT NULL,
  `DNI` int(8) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `fecha_alta` date NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `ID_TIPO`, `DNI`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `sexo`, `fecha_alta`, `pass`) VALUES
(1, 1, 31340423, 'admin', 'admin', 'admin@admin.com', '341-3183130', 'santiago 844', 'h', '2019-09-19', '1234'),
(2, 2, 33333333, 'Nicholas', 'Danelón', 'nicholas@gmail.com', '341-33333333', 'santiago 844', 'h', '2019-09-19', '1234'),
(3, 7, 20984653, 'Daniel', 'Rodriguez', 'rodriguez@gmail.com', '341-9876543', 'callao 1743', 'h', '2019-09-21', '1234'),
(4, 4, 22345897, 'Daniela', 'Vega', 'vega@gmail.com', '341-5678876', 'salta 2234', 'm', '2019-09-21', '1234'),
(5, 8, 22456876, 'Roberto', 'Sánchez', 'sanchez@gmail.com', '341- 3465785', 'rioja 6700', 'h', '2019-09-21', '1234'),
(6, 6, 33456879, 'Javier', 'Luiseli', 'luiseli@gmail.com', '341-6789876', 'cordoba 8900', 'h', '2019-09-21', '1234'),
(7, 3, 33789987, 'Estevan', 'Alvarado', 'alvarado@gmail.com', '341-5786543', 'esmeralda 3457', 'h', '2019-09-21', '1234'),
(8, 5, 21340987, 'Romina', 'Rosales', 'rosales@gmail.com', '341-890098', 'santa fe 756', 'm', '2019-09-21', '1234'),
(9, 7, 31340888, 'Jimena', 'Andrada', 'baron@gmail.com', '341-2222222', 'rioja 4385', 'm', '2019-09-21', '1234'),
(10, 4, 30546534, 'Ezequiel', 'Gutierrez', 'gutierrez@gmail.com', '341-3654543', 'italia 890', 'h', '2019-09-21', '1234'),
(11, 4, 1111111, 'Roberto', 'Carrillo', 'carrillo@gmail.com', '341-3183130', 'santiago 844', 'h', '2019-10-16', '1234'),
(12, 4, 22987373, 'Roberto', 'Gomez', 'gomez@gmail.com', '341-3344556', 'santiago 844', 'h', '2019-10-17', '1234');

-- --------------------------------------------------------

--
-- Estructura para la vista `consultas`
--
DROP TABLE IF EXISTS `consultas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consultas`  AS  select `u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,`u`.`DNI` AS `DNI`,`r`.`fecha` AS `fecha`,`r`.`hora_entrada` AS `hora_entrada`,`r`.`hora_salida` AS `hora_salida` from (`registro_e_s` `r` join `usuario` `u` on((`r`.`ID_USUARIO` = `u`.`ID_USUARIO`))) order by `r`.`ID_REGISTRO_E_S` desc ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`ID_ACTIVIDAD`),
  ADD UNIQUE KEY `uq_nombre_actividad` (`nombre_actividad`),
  ADD KEY `fk_usuario_actividad_instructor` (`ID_USUARIO_INSTRUCTOR`);

--
-- Indices de la tabla `actividad_usuario`
--
ALTER TABLE `actividad_usuario`
  ADD PRIMARY KEY (`ID_ACTIVIDAD_USUARIO`),
  ADD KEY `fk_actividad_usuario_actividad` (`ID_ACTIVIDAD`),
  ADD KEY `fk_usuario_actividad_usuario` (`ID_USUARIO`);

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`ID_DIA`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`ID_HORARIO`),
  ADD KEY `fk_horario_actividad` (`ID_ACTIVIDAD`),
  ADD KEY `fk_horario_dia` (`ID_DIA`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_PAGO`),
  ADD KEY `fk_PAGO_usuario` (`ID_USUARIO`);

--
-- Indices de la tabla `registro_e_s`
--
ALTER TABLE `registro_e_s`
  ADD PRIMARY KEY (`ID_REGISTRO_E_S`),
  ADD KEY `fk_registroES_usuario` (`ID_USUARIO`),
  ADD KEY `fk_registroES_pago` (`ID_PAGO`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`ID_TIPO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `uq_usuarios` (`DNI`),
  ADD UNIQUE KEY `uq_email` (`email`),
  ADD KEY `fk_usuario_actividad` (`ID_TIPO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `actividad_usuario`
--
ALTER TABLE `actividad_usuario`
  MODIFY `ID_ACTIVIDAD_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `dia`
--
ALTER TABLE `dia`
  MODIFY `ID_DIA` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `ID_HORARIO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_PAGO` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registro_e_s`
--
ALTER TABLE `registro_e_s`
  MODIFY `ID_REGISTRO_E_S` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID_TIPO` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_usuario_actividad_instructor` FOREIGN KEY (`ID_USUARIO_INSTRUCTOR`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `actividad_usuario`
--
ALTER TABLE `actividad_usuario`
  ADD CONSTRAINT `fk_actividad_usuario_actividad` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividad` (`ID_ACTIVIDAD`),
  ADD CONSTRAINT `fk_usuario_actividad_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_actividad` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividad` (`ID_ACTIVIDAD`),
  ADD CONSTRAINT `fk_horario_dia` FOREIGN KEY (`ID_DIA`) REFERENCES `dia` (`ID_DIA`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_PAGO_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `registro_e_s`
--
ALTER TABLE `registro_e_s`
  ADD CONSTRAINT `fk_registroES_pago` FOREIGN KEY (`ID_PAGO`) REFERENCES `pago` (`ID_PAGO`),
  ADD CONSTRAINT `fk_registroES_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_actividad` FOREIGN KEY (`ID_TIPO`) REFERENCES `tipo` (`ID_TIPO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
