-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2019 a las 19:19:03
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
(1, 'uso_aparatos', 1000.00, NULL),
(2, 'zumba', 400.00, 4),
(3, 'step', 400.00, NULL),
(4, 'pilates', 400.00, NULL),
(5, 'yoga', 400.00, NULL),
(7, 'jump_fit', 500.00, NULL),
(8, 'funcional', 500.00, NULL),
(9, 'vale todo', 500.00, 10),
(10, 'aikido', 500.00, NULL),
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
(4, 1, 3);

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
(6, 'Sábado');

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
(12, 2, 5, '17:30:00', '18:30:00');

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
(1, 3, '2019-09-21', '2019-10-21', 1500),
(2, 9, '2019-09-21', '2019-10-21', 1400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_e_s`
--

CREATE TABLE `registro_e_s` (
  `ID_REGISTRO_E_S` int(255) NOT NULL,
  `ID_USUARIO` int(6) NOT NULL,
  `ID_PAGO` int(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(9, 7, 31340888, 'Jimena', 'Barón', 'baron@gmail.com', '341-2222222', 'rioja 4385', 'm', '2019-09-21', '1234'),
(10, 4, 30546534, 'Ezequiel', 'Gutierrez', 'gutierrez@gmail.com', '341-3654543', 'italia 890', 'h', '2019-09-21', '1234');

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
  MODIFY `ID_ACTIVIDAD_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dia`
--
ALTER TABLE `dia`
  MODIFY `ID_DIA` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `ID_HORARIO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_PAGO` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registro_e_s`
--
ALTER TABLE `registro_e_s`
  MODIFY `ID_REGISTRO_E_S` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID_TIPO` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
