-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 01:36:33
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `custome_order`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre_categoria`) VALUES
(1, 'BEBIDAS CALIENTES'),
(2, 'BEBIDAS FRIAS'),
(3, 'ACOMPAÑANTES'),
(4, 'ADICIONES'),
(5, 'TEST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio` int(11) NOT NULL,
  `hora_pedido` time NOT NULL DEFAULT curtime(),
  `listo` tinyint(1) NOT NULL DEFAULT 0,
  `mesa` varchar(20) NOT NULL,
  `ped_usu_mesero_doc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `nombre`, `cantidad`, `precio`, `hora_pedido`, `listo`, `mesa`, `ped_usu_mesero_doc`) VALUES
(1665, 'CAFÉ', 23, 4000, '18:35:52', 0, '65', NULL),
(1666, 'CAPUCCINO', 3, 7000, '18:36:02', 0, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre_producto`, `precio_producto`, `categoria_id`) VALUES
(79, 'CAFÉ', 4000, 1),
(80, 'CAPUCCINO', 7000, 1),
(81, 'CHOCOLATE DE LA ABUELA', 6000, 1),
(82, 'ADICIÓN DE CLAVOS Y CANELA', 1000, 1),
(83, 'TÉ CHAI', 7000, 1),
(84, 'MILO', 7000, 1),
(85, 'COLADITA DE CAFÉ', 8000, 1),
(86, 'ARÓMATICAS', 2500, 1),
(87, 'INFUSIONES', 6000, 1),
(88, 'GRANIZADO DE CAFÉ', 9000, 2),
(89, 'COFFEE TONIC', 10000, 2),
(90, 'MALTEADA DE CHOCOLATE CON ARANDANOS', 12000, 2),
(91, 'SODA DE MASMELOS', 9000, 2),
(92, 'TÉ CHAI', 8000, 2),
(93, 'MILO', 8000, 2),
(94, 'MALTEADA MÁGICA', 15000, 2),
(95, 'LIMONADA DE COCO', 9000, 2),
(96, 'CEVICHE DE PLÁTANO', 10000, 3),
(97, 'BROWNIE', 4500, 3),
(98, 'BROWNIE CON HELADO', 7000, 3),
(99, 'PORCIÓN DE TORTA (zanahoria-chocolate)', 7000, 3),
(100, 'WAFFLES', 12000, 3),
(101, 'ALFAJOR', 3000, 3),
(102, 'SANDWICH', 12000, 3),
(103, 'CHEESECAKE DE LIMÓN', 7500, 3),
(104, 'SIROPE DE LA ABUELA', 1000, 4),
(105, 'CHANTILLY', 3000, 4),
(106, 'LECHE DE ALMENDRAS', 3000, 4),
(107, 'HELADO DE VAINILLA', 3000, 4),
(108, 'PLATANITOS', 3000, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol_nombre` varchar(30) NOT NULL,
  `rol_creado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_nombre`, `rol_creado`) VALUES
(1, 'Administrador', '2023-09-25 05:00:00'),
(2, 'Cocinero', '2023-09-25 22:01:51'),
(3, 'Mesero', '2023-09-25 22:55:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `documento` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contrasenia_hash` varchar(255) NOT NULL,
  `usu_rol_id` int(11) NOT NULL,
  `usu_activo` tinyint(1) NOT NULL DEFAULT 0,
  `usu_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  `usu_salida` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `documento`, `nombre`, `contrasenia_hash`, `usu_rol_id`, `usu_activo`, `usu_ingreso`, `usu_salida`) VALUES
(1, '1002546402', 'Richi', '$2b$10$JzRIpkrd0g/sNF9s0APSJuQSCdaVDByRCq3uTFzetAk61v5BQS.Iq', 1, 0, '2023-09-25 22:10:43', '2023-09-25 22:10:43'),
(5, '1002546403', 'Rosa', '$2b$10$O/J9X16m1B6E7fgV1Y4WteuJekF2.t/0qFqhXCEDR.nBOE7.xTdg.', 3, 0, '2023-09-25 22:10:43', '2023-09-25 22:10:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ped_usu_mesero_doc` (`ped_usu_mesero_doc`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD KEY `usu_rol_id` (`usu_rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1667;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`ped_usu_mesero_doc`) REFERENCES `usuarios` (`documento`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`usu_rol_id`) REFERENCES `rol` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
