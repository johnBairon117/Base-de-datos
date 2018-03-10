-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2018 a las 18:30:39
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `citFecha` date NOT NULL,
  `citHora` time NOT NULL,
  `citPaciente` int(11) NOT NULL,
  `citMedico` int(11) NOT NULL,
  `citConsultorio` int(11) NOT NULL,
  `citEstado` enum('Asignado','Atendido') COLLATE utf8_spanish_ci NOT NULL,
  `citObservaciones` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `idConsultorio` int(11) NOT NULL,
  `conNombre` char(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `idMedicos` int(11) NOT NULL,
  `medIdentificacion` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `medNombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medApellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medEspecialidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medTelefono` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `medCorreo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `IdPacientes` int(11) NOT NULL,
  `pacIdentificacion` char(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `pacNombres` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `pacApellidos` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `pacFechaNacimiento` date NOT NULL,
  `pacSexo` enum('Femenino','Masculina') COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`IdPacientes`, `pacIdentificacion`, `pacNombres`, `pacApellidos`, `pacFechaNacimiento`, `pacSexo`) VALUES
(1, '1061781633', 'Pablo', 'Daza', '2018-03-01', 'Femenino'),
(2, '1234679898', 'Alexa', 'Janieto', '2012-10-09', 'Femenino'),
(3, '45123464687', 'Daniela', 'Palo', '2018-03-12', 'Femenino'),
(4, '4654654354', 'Lame', 'Pito', '2018-03-19', 'Masculina'),
(5, '46454311654', 'Marvin', 'urrutia', '2018-03-29', 'Femenino'),
(6, '4354154646', 'Pablo', 'Gay', '2018-03-19', 'Femenino'),
(7, '65441654654', 'Rosa', 'Mariposa', '2018-03-12', 'Femenino'),
(8, '65467643516354', 'Elkin', 'Ortiz', '2018-08-14', 'Femenino'),
(9, '321547987', 'Paola', 'NN', '2018-03-19', 'Masculina'),
(10, '313764756785', 'Daniela o Daniel', 'Campo', '2018-03-26', 'Femenino');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD UNIQUE KEY `citPaciente` (`citPaciente`),
  ADD UNIQUE KEY `citMedico` (`citMedico`),
  ADD UNIQUE KEY `citConsultorio` (`citConsultorio`),
  ADD KEY `citPaciente_2` (`citPaciente`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`idConsultorio`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`idMedicos`),
  ADD UNIQUE KEY `medIdentificacion` (`medIdentificacion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`IdPacientes`),
  ADD UNIQUE KEY `pacIdentificacion` (`pacIdentificacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`citPaciente`) REFERENCES `pacientes` (`IdPacientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`citMedico`) REFERENCES `medicos` (`idMedicos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`citConsultorio`) REFERENCES `consultorios` (`idConsultorio`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
