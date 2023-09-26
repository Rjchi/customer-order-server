-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 20:53:24
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
(1741, 'ADICIÓN DE CLAVOS Y CANELA', 1, 1000, '13:35:31', 0, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `imagen_producto` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre_producto`, `precio_producto`, `categoria_id`, `imagen_producto`) VALUES
(79, 'CAFÉ', 4000, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu7HaURqaZAMT0Pn2f1Tj8bL1cn4y4QvTiz6qYMM2EOF41DrlUivIXt2DpF0PxzX-V6SA&usqp=CAU'),
(80, 'CAPUCCINO', 7000, 1, 'https://horena.com/wp-content/uploads/2023/02/capuccino.jpg'),
(81, 'CHOCOLATE DE LA ABUELA', 6000, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHzdoYcSKmo7H4IT9yumffrDUET4Q0ZtypaPLOEkyQ0iMYrPBTZpRmaAN-qlIFCA41fPY&usqp=CAU'),
(82, 'ADICIÓN DE CLAVOS Y CANELA', 1000, 1, 'https://www.guatevision.com/wp-content/uploads/sites/2/2018/09/35509748_ml.jpg?quality=82'),
(83, 'TÉ CHAI', 7000, 1, 'https://www.splenda.com/wp-content/themes/bistrotheme/assets/recipe-images/chai-tea-blend.jpg'),
(84, 'MILO', 7000, 1, 'https://images.aws.nestle.recipes/original/fde6ed66c94cd91b7aa4da804abc00ec_foto_milo_michelada.jpeg'),
(85, 'COLADITA DE CAFÉ', 8000, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLlnzrUpuC2pI8hafYJiqw64mjnouIhhMgOA&usqp=CAU'),
(86, 'ARÓMATICAS', 2500, 1, 'https://www.semana.com/resizer/ibRhRn2k4onQnME4p4neHzzEZKw=/1280x720/smart/filters:format(jpg):quality(80)/cloudfront-us-east-1.images.arcpublishing.com/semana/TCAHZNMUHRAI5G5GKZB47ZGPWU.jpg'),
(87, 'INFUSIONES', 6000, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSponH9XsKFXWfX-g4_u3rEeyElaAKFILJkg_GIKYJkGiG13Wt6xfggtsBA4H_b8u_CY98&usqp=CAU'),
(88, 'GRANIZADO DE CAFÉ', 9000, 2, 'https://www.comedera.com/wp-content/uploads/2022/05/granizado-de-cafe.jpg'),
(89, 'COFFEE TONIC', 10000, 2, 'https://cafecalentito.com/wp-content/uploads/2023/04/image.jpg.webp'),
(90, 'MALTEADA DE CHOCOLATE CON ARANDANOS', 12000, 2, 'https://i.blogs.es/c6f09d/como-hacer-malteada-chocolate-cremosa-receta-facil-mundo/1366_2000.jpg'),
(91, 'SODA DE MASMELOS', 9000, 2, 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/10/25/0/KC1106_Candy-Corn-Cocktail_s4x3.jpg.rend.hgtvcom.406.305.suffix/1477425731421.jpeg'),
(92, 'TÉ CHAI', 8000, 2, 'https://www.splenda.com/wp-content/themes/bistrotheme/assets/recipe-images/chai-tea-blend.jpg'),
(93, 'MILO', 8000, 2, 'https://images.aws.nestle.recipes/original/fde6ed66c94cd91b7aa4da804abc00ec_foto_milo_michelada.jpeg'),
(94, 'MALTEADA MÁGICA', 15000, 2, 'https://www.cocinavital.mx/wp-content/uploads/2018/02/freak-shakes-fresa-festiva.jpg'),
(95, 'LIMONADA DE COCO', 9000, 2, 'https://mejorconsalud.as.com/wp-content/uploads/2020/12/limonada-cremosa-coco-768x512.jpg'),
(96, 'CEVICHE DE PLÁTANO', 10000, 3, 'https://www.recetascostarica.com/base/stock/Recipe/160-image/160-image_web.jpg.webp'),
(97, 'BROWNIE', 4500, 3, 'https://cdn.cocineroaficionado.com/wp-content/uploads/2020/12/brownies.jpg'),
(98, 'BROWNIE CON HELADO', 7000, 3, 'https://mandolina.co/wp-content/uploads/2020/11/brownie-con-helado-destacada.jpg'),
(99, 'PORCIÓN DE TORTA (zanahoria-chocolate)', 7000, 3, 'https://es-mycooktouch.group-taurus.com/image/recipe/540x391/bizcocho-de-zanahoria-con-chocolate'),
(100, 'WAFFLES', 12000, 3, 'https://www.gourmet.cl/wp-content/uploads/2019/04/Waffles-editada.jpg'),
(101, 'ALFAJOR', 3000, 3, 'https://www.paulinacocina.net/wp-content/uploads/2022/06/receta-de-alfajor-artesanal.jpg'),
(102, 'SANDWICH', 12000, 3, 'https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2022/08/sandwich-de-jamon-para-el-lunch.jpg'),
(103, 'CHEESECAKE DE LIMÓN', 7500, 3, 'https://www.lanacion.com.ar/resizer/v2/cheese-cake-de-6DUJTC75ABCGHHPJMOCQRMO2U4.jpg?auth=2e8eb81c0fd415f26ecf399b52389e28bb4ea9d6d40d5498ec5eda9d6328db8a&width=420&height=280&quality=70&smart=true'),
(104, 'SIROPE DE LA ABUELA', 1000, 4, 'https://i.blogs.es/461119/siorpe-arce-botella/450_1000.jpg'),
(105, 'CHANTILLY', 3000, 4, 'https://cdn0.recetasgratis.net/es/posts/7/7/4/crema_chantilly_casera_57477_orig.jpg'),
(106, 'LECHE DE ALMENDRAS', 3000, 4, 'https://www.lavanguardia.com/files/image_948_465/uploads/2019/08/05/5ea9bd4a7cafa.jpeg'),
(107, 'HELADO DE VAINILLA', 3000, 4, 'https://www.recetasnestle.com.co/sites/default/files/styles/recipe_detail_desktop/public/srh_recipes/175e4ab14d932cfa61d7e1bd3573b505.png?itok=47FeWEB1'),
(108, 'PLATANITOS', 3000, 4, 'https://www.gastrolabweb.com/u/fotografias/m/2021/3/24/f608x342-10662_40385_0.jpg');

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
(3, 'Mesero', '2023-09-25 22:55:30'),
(4, 'Cajero', '2023-09-26 00:59:50');

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
  `usu_ingreso` timestamp NULL DEFAULT current_timestamp(),
  `usu_salida` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `documento`, `nombre`, `contrasenia_hash`, `usu_rol_id`, `usu_activo`, `usu_ingreso`, `usu_salida`) VALUES
(1, '1002546402', 'Richi', '$2b$10$JzRIpkrd0g/sNF9s0APSJuQSCdaVDByRCq3uTFzetAk61v5BQS.Iq', 1, 1, '2023-09-26 04:38:49', NULL),
(5, '1002546403', 'Rosa', '$2b$10$O/J9X16m1B6E7fgV1Y4WteuJekF2.t/0qFqhXCEDR.nBOE7.xTdg.', 3, 1, '2023-09-26 04:39:45', NULL),
(6, '1002546404', 'Pepe', '$2b$10$Ql4m9GMny2diimIJDKSgJ.FzYwrbq.VHJDinrsDcH9KvVGZSkRKsy', 2, 1, '2023-09-26 04:38:07', NULL),
(8, '1002546405', 'Pedro', '$2b$10$i4ci3GIvkYPF/zghtCgSJuBO8k7V83mRKvbO7vna8rw1I5Zv7OTb2', 4, 1, '2023-09-26 04:34:46', NULL),
(10, '1002546406', 'Jose', '$2b$10$WrGFNpAQgqkP3uX6yEoXi.53v1yFmb26gT3WOprgQ3GOB8JXWfMsa', 3, 1, '2023-09-26 04:22:16', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1742;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
