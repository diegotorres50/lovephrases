-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2015 a las 22:16:25
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `diegotor_lovephrases`
--
CREATE DATABASE IF NOT EXISTS `diegotor_lovephrases` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `diegotor_lovephrases`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--
-- Creación: 08-08-2015 a las 14:41:04
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` smallint(5) NOT NULL,
  `article_title` varchar(120) DEFAULT 'TYPE HERE ANY TITLE' COMMENT 'Titulo de la nota principal',
  `article_alias` varchar(250) NOT NULL DEFAULT 'TYPE-HERE-ANY-TITLE',
  `article_lead` varchar(512) NOT NULL DEFAULT 'TYPE HERE ANY LEAD',
  `article_description` text,
  `article_status` set('PENDING','PUBLISHED') NOT NULL DEFAULT 'PENDING',
  `article_section` varchar(45) NOT NULL,
  `article_img` varchar(45) DEFAULT NULL,
  `article_type` set('IMAGE','VIDEO','QUOTE','AUDIO') NOT NULL DEFAULT 'IMAGE',
  `article_author` varchar(45) DEFAULT NULL,
  `article_credit` varchar(45) NOT NULL DEFAULT 'lovephrases.com',
  `article_position` set('PRIMARY','SECUNDARY') NOT NULL DEFAULT 'SECUNDARY',
  `article_section_order` tinyint(2) NOT NULL DEFAULT '0',
  `article_home_order` tinyint(2) NOT NULL DEFAULT '0',
  `article_created` datetime NOT NULL,
  `article_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Nota principal de la frase';

--
-- RELACIONES PARA LA TABLA `articles`:
--   `article_section`
--       `sections` -> `section_alias`
--

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`article_id`, `article_title`, `article_alias`, `article_lead`, `article_description`, `article_status`, `article_section`, `article_img`, `article_type`, `article_author`, `article_credit`, `article_position`, `article_section_order`, `article_home_order`, `article_created`, `article_modified`) VALUES
(1, 'When I am with you...', 'when-i-am-with-you', 'When I am with you, the only place I want to be is closer', NULL, 'PUBLISHED', 'best-love', '/public/content/1.jpg', 'IMAGE', 'Ritu Ghatourey', 'http://lovequotesforhimher.facts.co', 'PRIMARY', 0, 1, '0000-00-00 00:00:00', '2015-08-08 21:57:44'),
(2, 'Within you, I lose myself', 'within-you-i-lose-myself', 'Within you, I lose myself. Without you, I find myself wanting to be lost again.', NULL, 'PUBLISHED', 'best-love', '/public/content/2.jpg', 'IMAGE', NULL, 'http://lovequotesforhimher.facts.co', 'PRIMARY', 1, 0, '2015-08-08 09:57:38', '2015-08-08 09:57:38');

--
-- Disparadores `articles`
--
DROP TRIGGER IF EXISTS `articles_BEFORE_INSERT`;
DELIMITER $$
CREATE TRIGGER `articles_BEFORE_INSERT` BEFORE INSERT ON `articles`
 FOR EACH ROW BEGIN

#Actualizamos la fecha y hora en que el registro fue creado y modificado
set NEW.article_created=now();
set NEW.article_modified=now();

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `articles_BEFORE_UPDATE`;
DELIMITER $$
CREATE TRIGGER `articles_BEFORE_UPDATE` BEFORE UPDATE ON `articles`
 FOR EACH ROW BEGIN

#Actualizamos la fecha en que se modifico el articulo
set NEW.article_modified=now();

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `article_params`
--
-- Creación: 08-08-2015 a las 01:48:13
--

DROP TABLE IF EXISTS `article_params`;
CREATE TABLE IF NOT EXISTS `article_params` (
  `article_id` smallint(5) NOT NULL,
  `param_alias` varchar(45) NOT NULL,
  `param_value` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `article_params`:
--   `param_alias`
--       `parameters` -> `param_alias`
--   `article_id`
--       `articles` -> `article_id`
--

--
-- Volcado de datos para la tabla `article_params`
--

INSERT INTO `article_params` (`article_id`, `param_alias`, `param_value`) VALUES
(1, 'featured', 'className1 className2'),
(1, 'home', '1'),
(1, 'sharemetool', '1'),
(2, 'home', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `article_tags`
--
-- Creación: 08-08-2015 a las 01:14:07
--

DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE IF NOT EXISTS `article_tags` (
  `article_id` smallint(5) NOT NULL,
  `tag_alias` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `article_tags`:
--   `article_id`
--       `articles` -> `article_id`
--   `tag_alias`
--       `tags` -> `tag_alias`
--

--
-- Volcado de datos para la tabla `article_tags`
--

INSERT INTO `article_tags` (`article_id`, `tag_alias`) VALUES
(1, 'best-love');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parameters`
--
-- Creación: 08-08-2015 a las 02:05:01
--

DROP TABLE IF EXISTS `parameters`;
CREATE TABLE IF NOT EXISTS `parameters` (
  `param_alias` varchar(45) NOT NULL,
  `param_label` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `parameters`:
--

--
-- Volcado de datos para la tabla `parameters`
--

INSERT INTO `parameters` (`param_alias`, `param_label`) VALUES
('featured', 'Destaca un articulo entre otros'),
('home', 'Articulo se muestra en el home'),
('sharemetool', 'Nivel de redes sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--
-- Creación: 08-08-2015 a las 20:12:43
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `section_alias` varchar(45) NOT NULL,
  `section_name` varchar(45) NOT NULL,
  `section_path` varchar(45) NOT NULL,
  `section_order` smallint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `sections`:
--

--
-- Volcado de datos para la tabla `sections`
--

INSERT INTO `sections` (`section_alias`, `section_name`, `section_path`, `section_order`) VALUES
('best-love', 'Best Love', '/best-love', 0),
('bible-love', 'Bible Love', '/bible-love', 1),
('broken-love', 'Broken Love', '/broken-love', 2),
('cheesy-love', 'Cheesy Love', '/cheesy-love', 3),
('crazy-love', 'Crazy Love', '/crazy-love', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--
-- Creación: 08-08-2015 a las 00:53:21
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_alias` varchar(45) NOT NULL,
  `tag_label` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `tags`:
--

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`tag_alias`, `tag_label`) VALUES
('best-love', 'Best Love'),
('bible-love', 'Bible Love');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`), ADD KEY `fk_article_section_idx` (`article_section`);

--
-- Indices de la tabla `article_params`
--
ALTER TABLE `article_params`
  ADD PRIMARY KEY (`article_id`,`param_alias`), ADD KEY `fk_param_alias_idx` (`param_alias`), ADD KEY `fk_article_id_idx` (`article_id`);

--
-- Indices de la tabla `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`article_id`,`tag_alias`), ADD KEY `fk_tag_alias_idx` (`tag_alias`), ADD KEY `fk_article_id_idx` (`article_id`);

--
-- Indices de la tabla `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`param_alias`);

--
-- Indices de la tabla `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_alias`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_alias`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles`
--
ALTER TABLE `articles`
ADD CONSTRAINT `fk_article_section` FOREIGN KEY (`article_section`) REFERENCES `sections` (`section_alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `article_params`
--
ALTER TABLE `article_params`
ADD CONSTRAINT `fk_param_alias` FOREIGN KEY (`param_alias`) REFERENCES `parameters` (`param_alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_param_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `article_tags`
--
ALTER TABLE `article_tags`
ADD CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tag_alias` FOREIGN KEY (`tag_alias`) REFERENCES `tags` (`tag_alias`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
