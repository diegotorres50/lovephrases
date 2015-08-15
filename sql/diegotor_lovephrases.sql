-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-08-2015 a las 05:06:08
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
  `article_img` varchar(512) DEFAULT NULL,
  `article_type` set('IMAGE','GALLERY','STANDARD','LINK','VIDEO','QUOTE','AUDIO') NOT NULL DEFAULT 'IMAGE',
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
(1, 'When I am with you...', 'when-i-am-with-you', 'When I am with you, the only place I want to be is closer', NULL, 'PUBLISHED', 'for-broken-heart', '/bundles/lovephrasesapp/content/love-phrases/for-broken-heart/1.jpg', 'STANDARD', 'Ritu Ghatourey', 'facts.co', 'PRIMARY', 0, 0, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(2, 'Within you, I lose myself', 'within-you-i-lose-myself', 'Within you, I lose myself. Without you, I find myself wanting to be lost again.', NULL, 'PUBLISHED', 'for-broken-heart', '/bundles/lovephrasesapp/content/love-phrases/for-broken-heart/2.jpg', 'STANDARD', 'Nicholas Sparks', 'facts.co', 'PRIMARY', 1, 1, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(3, 'You are every reason', 'You-are-every-reason', 'You are every reason, every hope and every dream I''ve ever had', NULL, 'PUBLISHED', 'for-broken-heart', '/bundles/lovephrasesapp/content/love-phrases/for-broken-heart/3.jpg', 'STANDARD', 'F. Scott Fitzgerald', 'facts.co', 'PRIMARY', 2, 2, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(4, 'If you live to be a hundred', 'here-your-alias', 'If you live to be a hundred, I want to live to be a hundred minus one day so I never have to live without you', NULL, 'PUBLISHED', 'for-broken-heart', '/bundles/lovephrasesapp/content/love-phrases/for-broken-heart/4.jpg', 'STANDARD', 'Rabindranath Tagore', 'facts.co', 'PRIMARY', 3, 3, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(5, 'When I am with you...', 'here-your-alias', 'You''re special to me in every way. Thank you for being who you are and for letting me be myself', NULL, 'PUBLISHED', 'for-broken-heart', '/bundles/lovephrasesapp/content/love-phrases/for-broken-heart/5.jpg', 'STANDARD', 'Valerie Lombardo', 'facts.co', 'PRIMARY', 4, 4, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(6, 'Within you, I lose myself', 'here-your-alias', 'If I could be anything in the world I would want to be a teardrop because I would be born in your eyes, live on your cheeks, and die on your lips', NULL, 'PUBLISHED', 'for-making-love', '/bundles/lovephrasesapp/content/love-phrases/for-making-love/1.jpg', 'STANDARD', 'George Moore', 'facts.co', 'PRIMARY', 5, 5, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(7, 'You are every reason', 'here-your-alias', 'I will always care for you, even if we''re not together and even if we''re far, far away from each other', NULL, 'PUBLISHED', 'for-making-love', '/bundles/lovephrasesapp/content/love-phrases/for-making-love/2.jpg', 'STANDARD', 'Roy Croft', 'facts.co', 'PRIMARY', 6, 6, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(8, 'If you live to be a hundred', 'here-your-alias', 'If I had a flower for every time I thought of you, I could walk in my garden forever', NULL, 'PUBLISHED', 'for-making-love', '/bundles/lovephrasesapp/content/love-phrases/for-making-love/3.jpg', 'STANDARD', 'Bill Wilson', 'facts.co', 'PRIMARY', 7, 7, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(9, 'When I am with you...', 'here-your-alias', 'I love you without knowing how, or when, or from where. I love you simply, without problems or pride: I love you in this way because I do not know any other way of loving but this, in which there is no I or you, so intimate that your hand upon my chest is my hand, so intimate that when I fall asleep your eyes close ', NULL, 'PUBLISHED', 'for-making-love', '/bundles/lovephrasesapp/content/love-phrases/for-making-love/4.jpg', 'STANDARD', 'Valerie Lombardo', 'facts.co', 'PRIMARY', 8, 8, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(10, 'Within you, I lose myself', 'here-your-alias', 'If kisses were stars, I''d give you the sky. \nIf touches were tears, I would cry. \nIf love was water, I''d give you the sea.\nAnd be with you for all eternity.', NULL, 'PUBLISHED', 'for-making-love', '/bundles/lovephrasesapp/content/love-phrases/for-making-love/5.jpg', 'STANDARD', 'A.A. Milne', 'facts.co', 'PRIMARY', 9, 9, '2015-08-14 21:37:16', '2015-08-14 21:37:16'),
(11, 'You are every reason', 'here-your-alias', 'When I am with you, the only place I want to be is closer', NULL, 'PUBLISHED', 'for-her', '/bundles/lovephrasesapp/content/love-phrases/for-her/1.jpg', 'IMAGE', 'Ritu Ghatourey', 'facts.co', 'PRIMARY', 10, 10, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(12, 'If you live to be a hundred', 'here-your-alias', 'Within you, I lose myself. Without you, I find myself wanting to be lost again.', NULL, 'PUBLISHED', 'for-her', '/bundles/lovephrasesapp/content/love-phrases/for-her/2.jpg', 'LINK', 'Nicholas Sparks', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(13, 'Within you, I lose myself', 'here-your-alias', 'You are every reason, every hope and every dream I''ve ever had', NULL, 'PUBLISHED', 'for-her', '/bundles/lovephrasesapp/content/love-phrases/for-her/3.jpg', 'VIDEO', 'F. Scott Fitzgerald', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(14, 'You are every reason', 'here-your-alias', 'If you live to be a hundred, I want to live to be a hundred minus one day so I never have to live without you', NULL, 'PUBLISHED', 'for-her', '/bundles/lovephrasesapp/content/love-phrases/for-her/4.jpg', 'QUOTE', 'Rabindranath Tagore', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(15, 'If you live to be a hundred', 'here-your-alias', 'You''re special to me in every way. Thank you for being who you are and for letting me be myself', NULL, 'PUBLISHED', 'for-her', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'AUDIO', 'Valerie Lombardo', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(16, 'When I am with you...', 'here-your-alias', 'If I could be anything in the world I would want to be a teardrop because I would be born in your eyes, live on your cheeks, and die on your lips', NULL, 'PUBLISHED', 'for-him', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'STANDARD', 'George Moore', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(17, 'Within you, I lose myself', 'here-your-alias', 'I will always care for you, even if we''re not together and even if we''re far, far away from each other', NULL, 'PUBLISHED', 'for-him', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'STANDARD', 'Roy Croft', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(18, 'You are every reason', 'here-your-alias', 'If I had a flower for every time I thought of you, I could walk in my garden forever', NULL, 'PUBLISHED', 'for-him', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'STANDARD', 'Bill Wilson', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(19, 'If you live to be a hundred', 'here-your-alias', 'I love you without knowing how, or when, or from where. I love you simply, without problems or pride: I love you in this way because I do not know any other way of loving but this, in which there is no I or you, so intimate that your hand upon my chest is my hand, so intimate that when I fall asleep your eyes close ', NULL, 'PUBLISHED', 'for-him', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'STANDARD', 'Valerie Lombardo', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(20, 'When I am with you...', 'here-your-alias', 'I love you without knowing how, or when, or from where. I love you simply, without problems or pride: I love you in this way because I do not know any other way of loving but this, in which there is no I or you, so intimate that your hand upon my chest is my hand, so intimate that when I fall asleep your eyes close ', NULL, 'PUBLISHED', 'for-him', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'STANDARD', 'A.A. Milne', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17'),
(21, 'When I am with you...', 'here-your-alias', 'I love you without knowing how, or when, or from where. I love you simply, without problems or pride: I love you in this way because I do not know any other way of loving but this, in which there is no I or you, so intimate that your hand upon my chest is my hand, so intimate that when I fall asleep your eyes close ', NULL, 'PUBLISHED', 'for-him', '/bundles/lovephrasesapp/content/love-phrases/for-her/5.jpg', 'STANDARD', 'Bill Wilson', 'facts.co', 'SECUNDARY', 127, 127, '2015-08-14 21:37:17', '2015-08-14 21:37:17');

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
(1, 'home', '1'),
(2, 'home', '1'),
(3, 'home', '1'),
(4, 'home', '1'),
(5, 'home', '1'),
(6, 'home', '1'),
(7, 'home', '1'),
(8, 'home', '1'),
(9, 'home', '1'),
(10, 'home', '1'),
(11, 'home', '1'),
(12, 'home', '1'),
(13, 'home', '1'),
(14, 'home', '1'),
(15, 'home', '1'),
(16, 'home', '1'),
(17, 'home', '1'),
(18, 'home', '1'),
(19, 'home', '1'),
(20, 'home', '1'),
(21, 'home', '1');

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
--buu
INSERT INTO `article_tags` (`article_id`, `tag_alias`) VALUES
(1, 'for-broken-heart'),
(1, 'for-her'),
(1, 'for-him'),
(1, 'for-making-love'),
(2, 'for-broken-heart'),
(2, 'for-her'),
(2, 'for-him'),
(2, 'for-making-love'),
(3, 'for-broken-heart'),
(3, 'for-her'),
(3, 'for-him'),
(3, 'for-making-love'),
(4, 'for-broken-heart'),
(4, 'for-her'),
(4, 'for-him'),
(4, 'for-making-love'),
(5, 'for-broken-heart'),
(5, 'for-her'),
(5, 'for-him'),
(5, 'for-making-love'),
(6, 'for-broken-heart'),
(6, 'for-her'),
(6, 'for-him'),
(6, 'for-making-love'),
(7, 'for-broken-heart'),
(7, 'for-her'),
(7, 'for-him'),
(7, 'for-making-love'),
(8, 'for-broken-heart'),
(8, 'for-her'),
(8, 'for-him'),
(8, 'for-making-love'),
(9, 'for-broken-heart'),
(9, 'for-her'),
(9, 'for-him'),
(9, 'for-making-love'),
(10, 'for-broken-heart'),
(10, 'for-her'),
(10, 'for-him'),
(10, 'for-making-love'),
(11, 'for-broken-heart'),
(11, 'for-her'),
(11, 'for-him'),
(11, 'for-making-love'),
(12, 'for-broken-heart'),
(12, 'for-her'),
(12, 'for-him'),
(12, 'for-making-love'),
(13, 'for-broken-heart'),
(13, 'for-her'),
(13, 'for-him'),
(13, 'for-making-love'),
(14, 'for-broken-heart'),
(14, 'for-her'),
(14, 'for-him'),
(14, 'for-making-love'),
(15, 'for-broken-heart'),
(15, 'for-her'),
(15, 'for-him'),
(15, 'for-making-love'),
(16, 'for-broken-heart'),
(16, 'for-her'),
(16, 'for-him'),
(16, 'for-making-love'),
(17, 'for-broken-heart'),
(17, 'for-her'),
(17, 'for-him'),
(17, 'for-making-love'),
(18, 'for-broken-heart'),
(18, 'for-her'),
(18, 'for-him'),
(18, 'for-making-love'),
(19, 'for-broken-heart'),
(19, 'for-her'),
(19, 'for-him'),
(19, 'for-making-love'),
(20, 'for-broken-heart'),
(20, 'for-her'),
(20, 'for-him'),
(20, 'for-making-love'),
(21, 'for-broken-heart'),
(21, 'for-her'),
(21, 'for-him'),
(21, 'for-making-love');

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
('for-boyfriend', 'For Boyfriend', '/for-boyfriend', 1),
('for-broken-heart', 'For Broken Heart', '/for-broken-heart', 2),
('for-her', 'For Her', '/for-her', 3),
('for-him', 'For Him', '/for-him', 4),
('for-making-love', 'For Making Love', '/for-making-love', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--
-- Creación: 11-08-2015 a las 02:26:58
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_alias` varchar(45) NOT NULL,
  `tag_label` varchar(45) NOT NULL,
  `tag_path` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `tags`:
--

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`tag_alias`, `tag_label`, `tag_path`) VALUES
('best-love-phrases', 'Best Love', '/tags/best-love-phrases'),
('best-whatsapp-status', 'Best Whatsapp Status', '/tags/best-whatsapp-status'),
('bible-love-phrases', 'Bible Love', '/tags/bible-love-phrases'),
('broken-heart-phrases', 'Broken Heart', '/tags/broken-heart-phrases'),
('cool-whatsapp-status', 'Cool Whatsapp Status', '/tags/cool-whatsapp-status'),
('crazy-love-phrases', 'Crazy Love', '/tags/crazy-love-phrases'),
('deep-love-phrases', 'Deep Love', '/tags/deep-love-phrases'),
('disney-love-phrases', 'Disney Love', '/tags/disney-love-phrases'),
('falling-in-love-phrases', 'Falling In Love', '/tags/falling-in-love-phrases'),
('family-love-phrases', 'Family Love', '/tags/family-love-phrases'),
('famous-love-phrases', 'Famous Love', '/tags/famous-love-phrases'),
('finding-love-phrases', 'Finding Love', '/tags/finding-love-phrases'),
('first-love-phrases', 'First Love', '/tags/first-love-phrases'),
('for-boyfriend', 'For Boyfriend', '/tags/for-boyfriend'),
('for-broken-heart', 'For Broken Heart', '/tags/for-broken-heart'),
('for-friends', 'For Friends', '/tags/for-friends'),
('for-girlfriend', 'For Girlfriend', '/tags/for-girlfriend'),
('for-her', 'For Her', '/tags/for-her'),
('for-him', 'For Him', '/tags/for-him'),
('for-husband', 'For Husband', '/tags/for-husband'),
('for-making-love', 'For Making Love', '/tags/for-making-love'),
('for-wife', 'For Wife', '/tags/for-wife'),
('forever-love-phrases', 'Forever Love', '/tags/forever-love-phrases'),
('funny-love-phrases', 'Funny Love', '/tags/funny-love-phrases'),
('funny-whatsapp-status', 'Funny Whatsapp Status', '/tags/funny-whatsapp-status'),
('good-love-phrases', 'Good Love', '/tags/good-love-phrases'),
('happy-love-phrases', 'Happy Love', '/tags/happy-love-phrases'),
('hurt-love-phrases', 'Hurt Love', '/tags/hurt-love-phrases'),
('i-love-you-phrases', 'I love You', '/tags/i-love-you-phrases'),
('in-love-phrases', 'In Love', '/tags/in-love-phrases'),
('inspirational-love-phrases', 'Inspirational Love', '/tags/inspirational-love-phrases'),
('love-live-phrases', 'Love Live', '/tags/love-live-phrases'),
('love-lyrics', 'Love Lyrics', '/tags/love-lyrics'),
('love-messages', 'Love Meesages', '/tags/love-messages'),
('love-poems', 'Love Poems', '/tags/love-poems'),
('love-sayings', 'Love Sayings', '/tags/love-sayings'),
('movie-love-phrases', 'Movie Love', '/tags/movie-love-phrases'),
('quotes', 'Quotes', '/tags/quotes'),
('real-love-phrases', 'Real Love', '/tags/real-love-phrases'),
('romantic-love-phrases', 'Romantic Love', '/tags/romantic-love-phrases'),
('sad-love-phrases', 'Sad Love', '/tags/sad-love-phrases'),
('secret-love-phrases', 'Secret Love', '/tags/secret-love-phrases'),
('self-love-phrases', 'Self Love', '/tags/self-love-phrases'),
('true-love-phrases', 'True Love', '/tags/true-love-phrases'),
('whatsapp-love-status', 'Whatsapp Love Status', '/tags/whatsapp-love-status'),
('whatsapp-sad-status', 'Whatsapp Sad Status', '/tags/whatsapp-sad-status');

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
