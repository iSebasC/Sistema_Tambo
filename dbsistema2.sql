-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2021 a las 01:39:05
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistema2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `condicion`) VALUES
(9, 13, 'CH001', 'Sublime Sonrisa', 10, 'chocolate con leche con maní', '1622946179.jpg', 1),
(10, 14, 'GL001', 'Soda', 26, 'galleta en unidad', '1622946217.jpg', 1),
(11, 14, 'GL002', 'Morocha', 15, 'de chocolate', '1622946235.jpg', 1),
(12, 15, 'BD001', 'Coca cola', 9, '1 ltr', '1622946245.png', 1),
(13, 15, 'BD002', 'Inca cola', 23, 'medio litro', '1622946258.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(13, 'Chocolates', 'chocolates', 1),
(14, 'Galletas', 'galletas', 1),
(15, 'Bebidas', 'bebidas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(23, 12, 12, 2, '4.00', '2.00'),
(24, 13, 9, 3, '2.00', '1.00'),
(25, 14, 13, 3, '4.00', '2.00'),
(26, 15, 10, 2, '2.00', '1.00'),
(27, 16, 11, 1, '2.00', '1.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(29, 23, 12, 1, '2.00', '0.00'),
(30, 24, 12, 1, '2.00', '0.00'),
(31, 24, 9, 1, '1.00', '0.00'),
(32, 24, 11, 1, '1.00', '0.00'),
(33, 25, 9, 1, '1.00', '0.00'),
(34, 25, 12, 1, '2.00', '0.00'),
(35, 26, 10, 1, '1.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(12, 1, 1, 'Boleta', '00001', '000001', '2021-06-05 00:00:00', '18.00', '8.00', 'Aceptado'),
(13, 2, 1, 'Boleta', '00002', '000002', '2021-06-05 00:00:00', '18.00', '6.00', 'Aceptado'),
(14, 1, 1, 'Boleta', '00003', '000003', '2021-06-05 00:00:00', '18.00', '12.00', 'Aceptado'),
(15, 3, 1, 'Boleta', '00004', '000004', '2021-06-05 00:00:00', '18.00', '4.00', 'Aceptado'),
(16, 3, 1, 'Boleta', '00005', '000005', '2021-06-05 00:00:00', '18.00', '2.00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Inventario'),
(3, 'Clientes'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Reporte Inventario'),
(7, 'Consulta Ventas'),
(8, 'Productos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(1, 'Proveedor', 'Coca cola', 'RUC', '20415932376', 'Av.La republica', '256348975', 'cocacola@gmail.com'),
(2, 'Proveedor', 'Nestle Perú', 'RUC', '20263322496', 'Ate', '0800-10-2-10', 'servicioalconsumidor@pe.nestle.com'),
(3, 'Proveedor', 'San Jorge', 'RUC', '20100093830', 'Lima-Victoria', '256354897', 'sanjorge@gmail.com'),
(12, 'Cliente', 'Sebastian', 'DNI', '12365478', 'Av.Surco', '256345287', 'sebas@gmail.com'),
(13, 'Cliente', 'Publico General', 'DNI', '', '', '', ''),
(14, 'Cliente', 'Angela', 'DNI', '125638548', 'Av.Lurin', '589632452', 'angela@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'Brenda', 'DNI', '72154871', 'Calle los alpes 210', '547821', 'admin@gmail.com', 'Administrador', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1622938124.png', 1),
(2, 'juan', 'DNI', '30115425', 'calle los jirasoles 450', '054789521', 'juan@hotmail.com', 'empleado', 'juan', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '1622938145.png', 1),
(3, 'sebastian', 'DNI', '12345687', 'Av.Surco', '12356478', 'sebas@gmail.com', 'Vendedor', 'sebas', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '1622938161.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(139, 1, 1),
(140, 1, 2),
(141, 1, 3),
(142, 1, 4),
(143, 1, 5),
(144, 1, 6),
(145, 1, 7),
(146, 1, 8),
(147, 2, 3),
(148, 2, 4),
(149, 3, 3),
(150, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(23, 13, 1, 'Ticket', '0001', '00001', '2021-06-05 00:00:00', '18.00', '2.00', 'Aceptado'),
(24, 12, 1, 'Ticket', '0002', '00002', '2021-06-05 00:00:00', '18.00', '4.00', 'Aceptado'),
(25, 14, 1, 'Ticket', '0003', '00003', '2021-06-05 00:00:00', '18.00', '3.00', 'Aceptado'),
(26, 12, 1, 'Ticket', '0004', '00004', '2021-06-05 00:00:00', '18.00', '1.00', 'Aceptado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_idx` (`idingreso`),
  ADD KEY `fk_detalle_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_idx` (`idpermiso`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
