-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2023 a las 01:42:06
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
-- Base de datos: `cafe`
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
  `mesa` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `hora_pedido` time NOT NULL DEFAULT curtime(),
  `listo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `nombre`, `cantidad`, `mesa`, `precio`, `hora_pedido`, `listo`) VALUES
(1595, 'ARÓMATICAS', 75, 45, 2500, '15:00:33', 0),
(1596, 'MILO', 5, 742, 7000, '15:00:36', 0),
(1599, 'SANDWICH', 75, 88, 12000, '15:00:46', 0),
(1600, 'ALFAJOR', 75, 44, 3000, '15:00:48', 0),
(1601, 'CHEESECAKE DE LIMÓN', 57, 75, 7500, '15:00:51', 0),
(1603, 'CHANTILLY', 5, 45, 3000, '15:00:59', 0),
(1604, 'HELADO DE VAINILLA', 85, 433, 3000, '15:01:02', 0),
(1605, 'LECHE DE ALMENDRAS', 64, 465, 3000, '15:01:05', 0),
(1606, 'WAFFLES', 64, 323, 12000, '15:01:08', 0),
(1616, 'PORCIÓN DE TORTA (zanahoria-chocolate)', 4, 44, 7000, '16:28:08', 0),
(1618, 'BROWNIE CON HELADO', 2, 720, 7000, '13:11:55', 0),
(1619, 'CEVICHE DE PLÁTANO', 1, 742, 10000, '13:12:15', 0),
(1621, 'LIMONADA DE COCO', 2, 14, 9000, '13:17:02', 0),
(1626, 'COFFEE TONIC', 1, 6, 10000, '14:20:52', 0),
(1627, 'COFFEE TONIC', 6, 9, 10000, '14:21:39', 0),
(1636, 'COFFEE TONIC', 1, 6, 10000, '14:29:43', 0),
(1653, 'INFUSIONES', 1, 1, 6000, '14:39:13', 0),
(1654, 'SIROPE DE LA ABUELA', 1, 2, 1000, '14:39:13', 0),
(1655, 'CHOCOLATE DE LA ABUELA', 1, 1, 6000, '15:38:53', 0);

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
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('2sc4hcjiK_E_-_fl_4DlaCESlAWYDEZX', 1695166393, '{\"cookie\":{\"originalMaxAge\":60000,\"expires\":\"2023-09-19T23:33:04.941Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":1,\"nombre\":\"Richi\",\"documento\":\"1002546402\"}}'),
('OF1-o39Z3Y4wOnT1uTW17f2_k4zNXPb1', 1695166001, '{\"cookie\":{\"originalMaxAge\":60000,\"expires\":\"2023-09-19T23:26:40.654Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":1,\"nombre\":\"Richi\",\"documento\":\"1002546402\"}}'),
('OSbXBzkM_priXgPpvvp3RX5zE7_4qbif', 1695166194, '{\"cookie\":{\"originalMaxAge\":60000,\"expires\":\"2023-09-19T23:29:54.126Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":5,\"nombre\":\"Rosa\",\"documento\":\"1002546403\"}}'),
('VHEYPKnSTI-ykS8Qd0cprtiut2XCNrOz', 1695166315, '{\"cookie\":{\"originalMaxAge\":60000,\"expires\":\"2023-09-19T23:31:23.254Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":1,\"nombre\":\"Richi\",\"documento\":\"1002546402\"}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `documento` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contrasenia_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `documento`, `nombre`, `contrasenia_hash`) VALUES
(1, '1002546402', 'Richi', '$2b$10$JzRIpkrd0g/sNF9s0APSJuQSCdaVDByRCq3uTFzetAk61v5BQS.Iq'),
(5, '1002546403', 'Rosa', '$2b$10$O/J9X16m1B6E7fgV1Y4WteuJekF2.t/0qFqhXCEDR.nBOE7.xTdg.');

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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

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
  ADD UNIQUE KEY `documento` (`documento`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1656;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
