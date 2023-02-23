-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Fev-2023 às 11:17
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pesquisa_leito`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_cads_usuarios`
--

CREATE TABLE `adms_cads_usuarios` (
  `id` int(11) NOT NULL,
  `env_email_conf` int(11) NOT NULL,
  `adms_niveis_acesso_id` int(11) NOT NULL,
  `adms_sits_usuario_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_cads_usuarios`
--

INSERT INTO `adms_cads_usuarios` (`id`, `env_email_conf`, `adms_niveis_acesso_id`, `adms_sits_usuario_id`, `created`, `modified`) VALUES
(1, 1, 2, 1, '2018-05-23 00:00:00', '2022-03-23 20:24:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_confs_emails`
--

CREATE TABLE `adms_confs_emails` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `smtpsecure` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `porta` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_confs_emails`
--

INSERT INTO `adms_confs_emails` (`id`, `nome`, `email`, `host`, `usuario`, `senha`, `smtpsecure`, `porta`, `created`, `modified`) VALUES
(1, '', '', '', '', '', '', 465, '2018-05-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_cors`
--

CREATE TABLE `adms_cors` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_cors`
--

INSERT INTO `adms_cors` (`id`, `nome`, `cor`, `created`, `modified`) VALUES
(1, 'Azul', 'primary', '2018-03-23 00:00:00', NULL),
(2, 'Cinza', 'secondary', '2018-03-23 00:00:00', NULL),
(3, 'Verde', 'success', '2018-03-23 00:00:00', NULL),
(4, 'Vermelho', 'danger', '2018-03-23 00:00:00', NULL),
(5, 'Laranjado', 'warning', '2018-03-23 00:00:00', NULL),
(6, 'Azul claro', 'info', '2018-03-23 00:00:00', NULL),
(7, 'Claro', 'light', '2018-03-23 00:00:00', NULL),
(8, 'Cinza escuro', 'dark', '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_grps_pgs`
--

CREATE TABLE `adms_grps_pgs` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_grps_pgs`
--

INSERT INTO `adms_grps_pgs` (`id`, `nome`, `ordem`, `created`, `modified`) VALUES
(1, 'Listar', 1, '2018-03-23 00:00:00', NULL),
(2, 'Cadastrar', 2, '2018-03-23 00:00:00', NULL),
(3, 'Editar', 3, '2018-03-23 00:00:00', NULL),
(4, 'Apagar', 4, '2018-03-23 00:00:00', NULL),
(5, 'Visualizar', 5, '2018-03-23 00:00:00', NULL),
(6, 'Outros', 6, '2018-03-23 00:00:00', NULL),
(7, 'Acesso', 7, '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_menus`
--

CREATE TABLE `adms_menus` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `icone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `adms_sit_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_menus`
--

INSERT INTO `adms_menus` (`id`, `nome`, `icone`, `ordem`, `adms_sit_id`, `created`, `modified`) VALUES
(1, 'Dashboard', 'fas fa-tachometer-alt', 1, 1, '2018-03-23 00:00:00', '2018-04-04 12:51:12'),
(2, 'Usuario', 'fas fa-user', 2, 1, '2018-03-23 00:00:00', '2018-04-12 12:21:49'),
(3, 'Menu', 'fas fa-list-ul', 3, 1, '2018-03-23 00:00:00', '2018-04-12 12:21:49'),
(4, 'Sair', 'fas fa-sign-out-alt', 6, 1, '2018-03-23 00:00:00', '2018-05-06 12:28:32'),
(5, 'Configurações', 'fas fa-cogs', 4, 1, '2018-05-01 16:54:42', '2021-04-28 23:42:09'),
(6, 'Site', 'fas fa-laptop', 5, 1, '2018-05-06 12:28:25', '2018-05-06 12:28:32');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_nivacs_pgs`
--

CREATE TABLE `adms_nivacs_pgs` (
  `id` int(11) NOT NULL,
  `permissao` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `dropdown` int(11) NOT NULL,
  `lib_menu` int(11) NOT NULL DEFAULT 2,
  `adms_menu_id` int(11) NOT NULL,
  `adms_niveis_acesso_id` int(11) NOT NULL,
  `adms_pagina_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_nivacs_pgs`
--

INSERT INTO `adms_nivacs_pgs` (`id`, `permissao`, `ordem`, `dropdown`, `lib_menu`, `adms_menu_id`, `adms_niveis_acesso_id`, `adms_pagina_id`, `created`, `modified`) VALUES
(1, 1, 1, 2, 1, 1, 1, 1, '2018-03-23 00:00:00', '2021-04-29 00:47:15'),
(2, 1, 2, 1, 1, 2, 1, 5, '2018-03-23 00:00:00', '2021-04-29 00:47:15'),
(3, 1, 3, 1, 1, 2, 1, 6, '2018-03-23 00:00:00', NULL),
(4, 1, 4, 1, 1, 5, 1, 7, '2018-03-23 00:00:00', '2021-04-28 23:47:13'),
(5, 1, 5, 1, 1, 5, 1, 8, '2018-03-23 00:00:00', '2021-04-28 23:47:31'),
(6, 1, 6, 2, 2, 4, 1, 4, '2018-03-23 00:00:00', '2021-04-28 23:49:50'),
(7, 1, 7, 2, 2, 2, 1, 9, '2018-03-23 00:00:00', NULL),
(8, 1, 8, 2, 2, 2, 1, 10, '2018-03-23 00:00:00', NULL),
(9, 1, 9, 2, 2, 2, 1, 11, '2018-03-23 00:00:00', NULL),
(10, 1, 10, 2, 2, 2, 1, 12, '2018-03-23 00:00:00', NULL),
(11, 1, 11, 2, 2, 2, 1, 13, '2018-03-23 00:00:00', NULL),
(23, 1, 12, 2, 2, 2, 1, 14, '2018-03-23 00:00:00', NULL),
(24, 1, 13, 1, 2, 2, 1, 15, '2018-03-23 00:00:00', NULL),
(25, 1, 14, 1, 2, 3, 1, 16, '2018-03-23 00:00:00', NULL),
(26, 1, 15, 1, 2, 3, 1, 17, '2018-03-23 00:00:00', NULL),
(27, 1, 16, 1, 2, 3, 1, 21, '2018-03-19 18:06:40', NULL),
(31, 1, 17, 1, 2, 3, 1, 22, '2018-03-21 12:39:49', NULL),
(35, 1, 18, 1, 2, 3, 1, 23, '2018-03-21 16:43:09', NULL),
(39, 1, 19, 1, 2, 3, 1, 24, '2018-03-21 17:46:32', NULL),
(47, 1, 20, 1, 2, 3, 1, 26, '2018-03-21 20:16:19', NULL),
(51, 1, 21, 1, 2, 3, 1, 27, '2018-03-21 21:56:03', NULL),
(55, 1, 22, 1, 2, 3, 1, 28, '2018-03-22 17:14:57', NULL),
(59, 1, 23, 1, 2, 3, 1, 29, '2018-03-22 18:24:20', NULL),
(63, 1, 24, 1, 2, 3, 1, 30, '2018-03-22 19:21:32', NULL),
(67, 1, 25, 1, 2, 3, 1, 31, '2018-03-22 20:30:26', NULL),
(71, 1, 26, 1, 2, 3, 1, 2, '2018-03-22 21:16:35', NULL),
(72, 1, 27, 1, 2, 3, 1, 3, '2018-03-22 21:16:35', NULL),
(113, 1, 28, 1, 2, 3, 1, 32, '2018-03-22 22:15:13', NULL),
(117, 1, 29, 1, 2, 3, 1, 33, '2018-03-22 22:27:12', NULL),
(121, 1, 30, 1, 2, 3, 1, 34, '2018-04-04 10:23:29', NULL),
(125, 1, 31, 1, 2, 3, 1, 35, '2018-04-04 10:40:36', NULL),
(129, 1, 32, 1, 2, 3, 1, 36, '2018-04-04 12:26:09', NULL),
(133, 1, 33, 1, 2, 3, 1, 37, '2018-04-04 12:50:27', NULL),
(137, 1, 34, 1, 2, 3, 1, 38, '2018-04-09 15:22:37', NULL),
(141, 1, 35, 1, 2, 3, 1, 39, '2018-04-09 15:54:43', NULL),
(145, 1, 36, 1, 2, 3, 1, 40, '2018-04-12 12:12:17', NULL),
(149, 1, 37, 1, 2, 3, 1, 41, '2018-04-14 21:23:48', NULL),
(153, 1, 38, 1, 2, 3, 1, 42, '2018-04-14 21:49:39', NULL),
(157, 1, 39, 1, 2, 3, 1, 43, '2018-04-20 17:50:56', NULL),
(161, 1, 40, 1, 2, 3, 1, 44, '2018-04-22 09:00:33', NULL),
(165, 1, 41, 1, 2, 3, 1, 45, '2018-04-22 09:50:59', NULL),
(169, 1, 42, 1, 2, 3, 1, 46, '2018-04-22 11:18:16', NULL),
(173, 1, 43, 1, 2, 3, 1, 47, '2018-04-22 13:50:45', NULL),
(177, 1, 44, 1, 2, 3, 1, 48, '2018-04-22 14:04:38', NULL),
(181, 1, 45, 1, 2, 3, 1, 49, '2018-04-22 14:15:52', NULL),
(185, 1, 46, 1, 2, 3, 1, 50, '2018-05-01 15:38:25', NULL),
(189, 1, 47, 1, 1, 5, 1, 51, '2018-05-01 16:40:55', '2018-05-01 16:58:13'),
(194, 1, 48, 1, 2, 3, 1, 52, '2018-05-01 17:06:00', NULL),
(199, 1, 49, 1, 1, 5, 1, 53, '2018-05-02 23:57:08', '2018-05-02 23:57:35'),
(204, 1, 50, 1, 2, 3, 1, 54, '2018-05-03 00:04:59', NULL),
(209, 1, 51, 1, 2, 3, 1, 55, '2018-05-04 12:42:15', NULL),
(214, 1, 52, 1, 2, 3, 1, 56, '2018-05-04 13:10:17', NULL),
(219, 1, 53, 1, 2, 3, 1, 57, '2018-05-05 16:36:02', NULL),
(224, 1, 54, 1, 1, 6, 1, 58, '2018-05-06 12:26:10', '2018-05-06 12:29:00'),
(229, 1, 55, 1, 2, 3, 1, 59, '2018-05-06 13:49:37', NULL),
(234, 1, 56, 1, 2, 3, 1, 60, '2018-05-06 14:54:26', NULL),
(239, 1, 57, 1, 2, 3, 1, 61, '2018-05-06 15:13:52', NULL),
(244, 1, 58, 1, 2, 3, 1, 62, '2018-05-11 12:50:42', NULL),
(249, 1, 59, 1, 2, 3, 1, 63, '2018-05-12 13:18:42', NULL),
(254, 1, 60, 1, 2, 3, 1, 64, '2018-05-16 11:25:25', NULL),
(259, 1, 61, 1, 2, 3, 1, 65, '2018-05-16 11:53:31', NULL),
(264, 1, 62, 1, 2, 3, 1, 66, '2018-05-16 12:30:02', NULL),
(269, 1, 63, 1, 1, 6, 1, 67, '2018-05-16 14:20:20', '2018-05-16 14:36:28'),
(274, 1, 64, 1, 2, 3, 1, 68, '2018-05-16 15:00:02', NULL),
(279, 1, 65, 1, 2, 3, 1, 69, '2018-05-16 15:36:49', NULL),
(284, 1, 66, 1, 2, 6, 1, 70, '2018-05-16 15:47:18', '2022-03-21 21:28:27'),
(289, 1, 67, 1, 2, 3, 1, 71, '2018-05-16 16:01:43', NULL),
(294, 1, 68, 1, 2, 3, 1, 72, '2018-05-16 16:09:53', NULL),
(299, 1, 69, 1, 2, 3, 1, 73, '2018-05-16 16:32:18', NULL),
(304, 1, 70, 1, 2, 3, 1, 74, '2018-05-16 16:52:52', NULL),
(309, 1, 71, 1, 1, 6, 1, 75, '2018-05-17 12:56:14', '2018-05-17 13:02:35'),
(314, 1, 72, 1, 2, 3, 1, 76, '2018-05-17 13:30:04', NULL),
(319, 1, 73, 1, 1, 6, 1, 77, '2018-05-17 14:00:20', '2018-05-17 14:01:34'),
(324, 1, 74, 1, 2, 3, 1, 78, '2018-05-17 15:58:26', NULL),
(329, 1, 75, 1, 1, 6, 1, 79, '2018-05-25 13:31:24', '2018-05-25 13:32:12'),
(334, 1, 76, 1, 2, 3, 1, 80, '2018-05-25 14:06:20', NULL),
(339, 1, 77, 1, 1, 6, 1, 81, '2018-05-26 18:35:39', '2018-05-26 18:37:11'),
(344, 1, 78, 1, 2, 3, 1, 82, '2018-05-26 18:54:14', NULL),
(349, 1, 79, 1, 1, 6, 1, 83, '2018-05-27 11:01:41', '2018-05-27 11:02:06'),
(354, 1, 80, 1, 2, 3, 1, 84, '2018-05-27 13:54:05', NULL),
(359, 1, 81, 1, 2, 3, 1, 85, '2018-05-27 14:00:39', NULL),
(364, 1, 82, 1, 2, 3, 1, 86, '2018-05-27 14:07:06', NULL),
(369, 1, 83, 1, 2, 3, 1, 87, '2018-05-27 14:12:11', NULL),
(374, 1, 84, 1, 2, 3, 1, 88, '2018-05-27 14:20:08', NULL),
(379, 1, 85, 1, 2, 3, 1, 89, '2018-05-27 14:27:24', NULL),
(384, 1, 86, 1, 2, 3, 1, 90, '2018-05-27 14:28:45', NULL),
(389, 1, 87, 1, 1, 6, 1, 91, '2018-05-27 15:58:39', '2018-05-27 16:00:00'),
(394, 1, 88, 1, 2, 3, 1, 92, '2018-05-27 16:08:51', NULL),
(399, 1, 89, 1, 2, 3, 1, 93, '2018-05-27 16:25:41', NULL),
(404, 1, 90, 1, 2, 3, 1, 94, '2018-05-27 16:29:21', NULL),
(409, 1, 91, 1, 2, 3, 1, 95, '2018-05-31 17:07:09', NULL),
(414, 1, 92, 1, 2, 3, 1, 96, '2018-05-31 17:16:35', NULL),
(419, 1, 93, 1, 2, 3, 1, 97, '2018-05-31 17:22:51', NULL),
(424, 1, 94, 1, 2, 3, 1, 98, '2018-05-31 17:26:16', NULL),
(429, 1, 95, 1, 1, 6, 1, 99, '2018-05-31 19:13:50', '2018-05-31 19:14:28'),
(434, 1, 96, 1, 2, 3, 1, 100, '2018-05-31 19:23:29', NULL),
(439, 1, 97, 1, 1, 6, 1, 101, '2018-06-01 12:00:25', '2018-06-01 12:09:20'),
(444, 1, 98, 1, 2, 3, 1, 102, '2018-06-01 12:01:16', NULL),
(449, 1, 99, 1, 2, 3, 1, 103, '2018-06-01 12:02:25', NULL),
(454, 1, 100, 1, 2, 3, 1, 104, '2018-06-01 12:03:43', NULL),
(459, 1, 101, 1, 2, 3, 1, 105, '2018-06-01 12:04:32', NULL),
(464, 1, 102, 1, 2, 3, 1, 106, '2018-06-01 12:05:45', NULL),
(469, 1, 103, 1, 2, 6, 1, 107, '2018-06-01 12:07:57', '2018-06-01 12:09:04'),
(474, 1, 104, 1, 1, 6, 1, 108, '2018-06-01 14:18:56', '2018-06-01 14:19:16'),
(479, 1, 105, 1, 2, 3, 1, 109, '2018-06-01 14:25:54', NULL),
(484, 1, 106, 1, 2, 3, 1, 110, '2018-06-01 14:30:34', NULL),
(489, 1, 107, 1, 2, 3, 1, 111, '2018-06-01 14:34:29', NULL),
(494, 1, 108, 1, 2, 3, 1, 112, '2018-06-01 15:58:40', NULL),
(499, 1, 109, 1, 2, 3, 1, 113, '2018-06-01 16:02:42', NULL),
(504, 1, 110, 1, 2, 3, 1, 114, '2018-06-01 16:06:04', NULL),
(509, 1, 111, 1, 1, 6, 1, 115, '2018-06-01 17:58:13', '2018-06-01 17:58:39'),
(514, 1, 112, 1, 2, 3, 1, 116, '2018-06-01 18:06:00', NULL),
(519, 1, 113, 1, 2, 3, 1, 117, '2018-06-01 18:11:48', NULL),
(524, 1, 114, 1, 2, 3, 1, 118, '2018-06-01 18:18:32', NULL),
(529, 1, 115, 1, 2, 3, 1, 119, '2018-06-01 18:23:01', NULL),
(534, 1, 116, 1, 2, 3, 1, 120, '2018-06-01 18:27:30', NULL),
(539, 1, 117, 1, 2, 3, 1, 121, '2018-06-01 18:32:59', NULL),
(636, 1, 118, 2, 2, 3, 1, 122, '2022-03-21 21:27:21', '2022-03-21 21:28:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_niveis_acessos`
--

CREATE TABLE `adms_niveis_acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_niveis_acessos`
--

INSERT INTO `adms_niveis_acessos` (`id`, `nome`, `ordem`, `created`, `modified`) VALUES
(1, 'Super Administrador', 1, '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_paginas`
--

CREATE TABLE `adms_paginas` (
  `id` int(11) NOT NULL,
  `nome_pagina` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `obs` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lib_pub` int(11) NOT NULL DEFAULT 2,
  `icone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depend_pg` int(11) NOT NULL DEFAULT 0,
  `adms_grps_pg_id` int(11) NOT NULL,
  `adms_tps_pg_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adms_robot_id` int(11) NOT NULL DEFAULT 4,
  `adms_sits_pg_id` int(11) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_paginas`
--

INSERT INTO `adms_paginas` (`id`, `nome_pagina`, `endereco`, `obs`, `keywords`, `description`, `author`, `lib_pub`, `icone`, `depend_pg`, `adms_grps_pg_id`, `adms_tps_pg_id`, `adms_robot_id`, `adms_sits_pg_id`, `created`, `modified`) VALUES
(1, 'Home', 'visualizar/home', 'Pagina home', 'home', 'pagina home', 'Paulo Albuquerque', 2, 'fas fa-tachometer-alt', 0, 5, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(4, 'Sair', 'acesso/sair', 'Sair do ADM', 'Sair do ADM', 'Sair do ADM', 'Paulo Albuquerque', 1, 'fas fa-sign-out-alt', 0, 7, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(2, 'Login', 'acesso/login', 'Pagina de login do ADM', 'pagina login', 'pagina login', 'Paulo Albuquerque', 1, NULL, 0, 7, '1', 1, 1, '2018-03-23 00:00:00', NULL),
(3, 'Validar Login', 'acesso/valida', 'Validar Login', 'Validar Login', 'Validar Login', 'Paulo Albuquerque', 1, NULL, 2, 7, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(5, 'Usuários', 'listar/list_usuario', 'Pagina para listar usuarios', 'Listar usuarios', 'Listar usuarios', 'Paulo Albuquerque', 2, 'fas fa-users', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:41:39'),
(6, 'Níveis de Acesso', 'listar/list_niv_aces', 'Pagina para listar nivel de acesso', 'Listar nivel de acesso', 'Listar nivel de acesso', 'Paulo Albuquerque', 2, 'fas fa-key', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:41:27'),
(7, 'Páginas', 'listar/list_pagina', 'Pagina para listar as paginas do ADM', 'Listar pagina', 'Listar pagina', 'Paulo Albuquerque', 2, 'fas fa-file-alt', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:47:13'),
(8, 'Menu', 'listar/list_menu', 'Pagina para listar os itens do menu', 'Pagina para listar os itens do menu', 'Pagina para listar os itens do menu', 'Paulo Albuquerque', 2, 'fab fa-elementor', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:47:31'),
(9, 'Cadastrar NÃ­vel de Acesso', 'cadastrar/cad_niv_aces', 'Pagina para Cadastrar NÃ­vel de Acesso', 'Cadastrar Nivel de Acesso', 'Cadastrar Nivel de Acesso', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2018-03-23 00:00:00', '2018-03-22 21:33:52'),
(10, 'Visualizar nivel de acesso', 'visualizar/vis_niv_aces', 'Pagina para Visualizar nivel de acesso', 'Pagina para Visualizar nivel de acesso', 'Pagina para Visualizar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 5, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(11, 'Editar nivel de acesso', 'editar/edit_niv_aces', 'Pagina para editar nivel de acesso', 'Pagina para editar nivel de acesso', 'Pagina para editar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 3, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(12, 'Apagar nivel de acesso', 'processa/apagar_niv_aces', 'Pagina para apagar nivel de acesso', 'Pagina para apagar nivel de acesso', 'Pagina para apagar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 4, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(13, 'Proc o form cadastrar nivel de acesso', 'processa/proc_cad_niv_aces', 'Processa o formulario cadastrar nivel de acesso', 'Processa o formulario cadastrar nivel de acesso', 'Processa o formulario cadastrar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 9, 2, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(14, 'Proc o form editar nivel de acesso', 'processa/proc_edit_niv_aces', NULL, 'Processa o formulario editar nivel de acesso', 'Processa o formulario editar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 11, 3, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(15, 'Alterar ordem do nivel de acesso', 'processa/proc_ordem_niv_aces', 'Pagina para Alterar ordem do nivel de acesso', 'Alterar ordem do nivel de acesso', 'Alterar ordem do nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 6, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(16, 'Cadastrar pagina', 'cadastrar/cad_pagina', 'Formulario para Cadastrar pagina', 'Cadastrar pagina', 'Cadastrar pagina', 'Paulo Albuquerque', 2, NULL, 0, 2, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(17, 'Procr o form cadastrar pagina', 'processa/proc_cad_pagina', 'Pagina para processar o formulario cadastrar pagina', 'Processar o formulario cadastrar pagina', 'Processar o formulario cadastrar pagina', 'Paulo Albuquerque', 2, NULL, 16, 2, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(27, 'Proc Liberar PermissÃ£o', 'processa/proc_lib_per', 'PÃ¡gina para liberar permissÃ£o', 'Proc Liberar Permissao', 'Proc Liberar Permissao', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-21 21:56:03', NULL),
(26, 'PermissÃ£o', 'listar/list_permissao', 'PÃ¡gina para listar as permissÃµes', 'Permissao', 'Permissao', 'Paulo Albuquerque', 2, '', 0, 1, '1', 4, 1, '2018-03-21 20:16:19', NULL),
(21, 'Apagar PÃ¡gina', 'processa/apagar_pagina', 'PÃ¡gina para Apagar PÃ¡gina', 'Apagar Pagina', 'Apagar Pagina', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-03-19 18:06:40', NULL),
(22, 'Visualizar PÃ¡gina', 'visualizar/vis_pagina', 'PÃ¡gina para visualizar detalhes da pÃ¡gina', 'Visualizar Pagina', 'Visualizar Pagina', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-03-21 12:39:49', NULL),
(23, 'Editar Página', 'editar/edit_pagina', 'FormulÃ¡rio para Editar PÃ¡gina', 'Editar Pagina', 'Editar Pagina', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-21 16:43:09', '2021-04-28 23:45:13'),
(24, 'Proc form edita pagina', 'processa/proc_edit_pagina', 'PÃ¡gina para processar o formulÃ¡rio editar a pÃ¡gina', 'Proc form edita pagina', 'Proc form edita pagina', 'Paulo Albuquerque', 2, '', 23, 3, '1', 4, 1, '2018-03-21 17:46:32', '2018-03-21 22:56:16'),
(28, 'Liberar Menu', 'processa/proc_lib_menu', 'PÃ¡gina para Liberar item Menu', 'Liberar Menu', 'Liberar Menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 17:14:57', NULL),
(29, 'Liberar Dropdown no menu', 'processa/proc_lib_dropdown', 'PÃ¡gina para Liberar Dropdown no menu', 'Liberar Dropdown no menu', 'Liberar Dropdown no menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 18:24:19', NULL),
(30, 'Alterar Ordem do Menu', 'processa/proc_ordem_menu', 'PÃ¡gina para Alterar Ordem do Menu', 'Alterar Ordem do Menu', 'Alterar Ordem do Menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 19:21:32', NULL),
(31, 'Sincronizar Paginas', 'processa/proc_sincro_nivac_pg', 'PÃ¡gina para Sincronizar Paginas com nÃ­vel de acesso', 'Sincronizar Paginas', 'Sincronizar Paginas', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 20:30:26', NULL),
(32, 'Editar í­cone do menu', 'editar/edit_permissao', 'PÃ¡gina para editar o Ã­cone do item do menu', 'Editar icone do menu', 'Editar icone do menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 22:15:13', '2021-04-28 23:45:38'),
(33, 'Proc form edita permissÃ£o', 'processa/proc_edit_permissao', 'PÃ¡gina para processar o formulÃ¡rio editar permissÃ£o', 'Proc form edita permissÃ£o', 'Proc form edita permissÃ£o', 'Paulo Albuquerque', 2, '', 32, 3, '1', 4, 1, '2018-03-22 22:27:12', '2018-03-22 22:27:46'),
(34, 'Cadastrar Menu', 'cadastrar/cad_menu', 'PÃ¡gina para Cadastrar Menu', 'Cadastrar Menu', 'Cadastrar Menu', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2018-04-04 10:23:29', NULL),
(35, 'Proc Form Cad Menu', 'processa/proc_cad_menu', 'PÃ¡gina para processar o formulÃ¡rio cadastrar menu', 'Processar o formulario cadastrar menu', 'Processar o formulario cadastrar menu', 'Paulo Albuquerque', 2, '', 34, 2, '1', 4, 1, '2018-04-04 10:40:36', NULL),
(36, 'Editar Menu', 'editar/edit_menu', 'FormulÃ¡rio para Editar Menu', 'Editar Menu', 'Editar Menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-04 12:26:09', '2018-04-04 12:27:40'),
(37, 'Proc Form Edit Menu', 'processa/proc_edit_menu', 'Processar o formulÃ¡rio editar item de menu', 'Processar o formulario editar item de menu', 'Processar o formulario editar item de menu', 'Paulo Albuquerque', 2, '', 36, 3, '1', 4, 1, '2018-04-04 12:50:27', NULL),
(38, 'Visualizar Menu', 'visualizar/vis_menu', 'PÃ¡gina para Visualizar Menu', 'Visualizar Menu', 'Visualizar Menu', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-04-09 15:22:37', NULL),
(39, 'Apagar Menu', 'processa/apagar_menu', 'PÃ¡gina para Apagar Menu', 'Apagar Menu', 'Apagar Menu', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-04-09 15:54:43', NULL),
(40, 'Alterar ordem item menu', 'processa/proc_ordem_menu_item', 'PÃ¡gina para alterar ordem item menu', 'Alterar ordem item menu', 'Alterar ordem item menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-12 12:12:17', NULL),
(41, 'Cadastrar usuário', 'cadastrar/cad_usuario', 'FormulÃ¡rio para cadastrar usuÃ¡rio', 'Cadastrar Usuario', 'Cadastrar Usuario', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2018-04-14 21:23:48', '2021-04-28 23:45:33'),
(42, 'Proc Form Cad User', 'processa/proc_cad_usuario', 'PÃ¡gina para processar a pÃ¡gina cadastrar usuÃ¡rio', 'Processar o formulario cadastrar usuario', 'Processar o formulario cadastrar usuario', 'Paulo Albuquerque', 2, '', 41, 2, '1', 4, 1, '2018-04-14 21:49:39', NULL),
(43, 'Visualizar usuÃ¡rio', 'visualizar/vis_usuario', 'PÃ¡gina para visualizar usuÃ¡rio', 'visualizar usuario', 'visualizar usuario', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-04-20 17:50:56', NULL),
(44, 'Editar usuário', 'editar/edit_usuario', 'FormulÃ¡rio para editar o usuÃ¡rio', 'Formulario para editar o usuario', 'Formulario para editar o usuario', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-22 09:00:33', '2021-04-28 23:51:00'),
(45, 'Proc Form Edit Usuario', 'processa/proc_edit_usuario', 'PÃ¡gina para processar o formulÃ¡rio editar usuÃ¡rio', 'Pagina para processar o formulÃ¡rio editar usuario', 'Pagina para processar o formulÃ¡rio editar usuario', 'Paulo Albuquerque', 2, '', 44, 3, '1', 4, 1, '2018-04-22 09:50:59', NULL),
(46, 'Apagar usuÃ¡rio', 'processa/apagar_usuario', 'PÃ¡gina para apagar usuÃ¡rio', 'Apagar usuario', 'Apagar usuario', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-04-22 11:18:16', NULL),
(47, 'Visualizar Perfil', 'visualizar/vis_perfil', 'UsuÃ¡rio Visualizar Perfil', 'Visualizar Perfil', 'Visualizar Perfil', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-04-22 13:50:45', NULL),
(48, 'Editar Perfil', 'editar/edit_perfil', 'FormulÃ¡rio para Editar Perfil', 'Editar Perfil', 'Editar Perfil', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-22 14:04:38', NULL),
(49, 'Proc Form Edit Perfil', 'processa/proc_edit_perfil', 'PÃ¡gina para processar o formulÃ¡rio editar perfil', 'Processar o formulario editar perfil', 'Processar o formulario editar perfil', 'Paulo Albuquerque', 2, '', 48, 3, '1', 4, 1, '2018-04-22 14:15:52', NULL),
(50, 'Cadastrar usuÃ¡rio no login', 'cadastrar/cad_user_login', 'PÃ¡gina para cadastrar usuÃ¡rio no login', 'Cadastrar usuario no login', 'Cadastrar usuario no login', 'Paulo Albuquerque', 1, '', 0, 2, '1', 4, 1, '2018-05-01 15:38:25', NULL),
(51, 'Cadastro Login', 'editar/edit_cad_user_login', 'FormulÃ¡rio para editar o nÃ­vel de acesso e a situaÃ§Ã£o do formulÃ¡rio cadastrar usuÃ¡rio na pÃ¡gina de login', 'Editar Cadastro Usuario login', 'Editar Cadastro Usuario login', 'Paulo Albuquerque', 2, 'fas fa-edit', 0, 3, '1', 4, 1, '2018-05-01 16:40:55', '2018-05-01 17:00:44'),
(52, 'Proc Form Cad User Login', 'processa/proc_cad_user_login', 'PÃ¡gina para processar o formulÃ¡rio utilizado para editar o nÃ­vel de acesso e a situaÃ§Ã£o do formulÃ¡rio cadastrar usuÃ¡rio atravÃ©s da pÃ¡gina de login', 'Formulario cadastrar usuario no login', 'Formulario cadastrar usuario no login', 'Paulo Albuquerque', 2, '', 51, 3, '1', 4, 1, '2018-05-01 17:06:00', NULL),
(53, 'Credenciais E-mail', 'editar/edit_cred_email', 'FormulÃ¡rio para editar as credenciais de envio de e-mail', 'Credenciais E-mail', 'Credenciais E-mail', 'Paulo Albuquerque', 2, 'fas fa-at', 0, 3, '1', 4, 1, '2018-05-02 23:57:08', '2018-05-02 23:57:35'),
(54, 'Processar formulÃ¡rio credenciais e-mail', 'processa/proc_edit_cred_email', 'PÃ¡gina para processar o formulÃ¡rio editar credenciais de envio de e-mail', 'Processar formulario credenciais e-mail', 'Processar formulario credenciais e-mail', 'Paulo Albuquerque', 2, '', 53, 3, '1', 4, 1, '2018-05-03 00:04:59', NULL),
(55, 'Validar E-mail', 'acesso/valida_email', 'PÃ¡gina para validar e-mail', 'Validar E-mail', 'Validar E-mail', 'Paulo Albuquerque', 1, '', 0, 3, '1', 4, 1, '2018-05-04 12:42:15', NULL),
(56, 'Recuperar Login', 'acesso/recuper_login', 'FormulÃ¡rio para recuperar login', 'Recuperar Login', 'Recuperar Login', 'Paulo Albuquerque', 1, '', 0, 7, '1', 4, 1, '2018-05-04 13:10:17', NULL),
(57, 'Atualizar a Senha', 'acesso/atual_senha', 'FormulÃ¡rio para atualizar a senha', 'Atualizar a Senha', 'Atualizar a Senha', 'Paulo Albuquerque', 1, '', 0, 7, '1', 4, 1, '2018-05-05 16:36:02', NULL),
(58, 'Página do Site', 'listar/sts_list_pagina', 'Listar as pÃ¡gina do site', 'Pagina do Site', 'Pagina do Site', 'Paulo Albuquerque', 2, 'fas fa-file-alt', 0, 1, '2', 4, 1, '2018-05-06 12:26:10', '2021-04-28 23:48:31'),
(59, 'Liberar menu site', 'processa/proc_sts_lib_menu', 'PÃ¡gina para liberar item de menu no site', 'Liberar menu site', 'Liberar menu site', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-06 13:49:37', NULL),
(60, 'Ordem menu site', 'processa/proc_sts_ordem_menu', 'PÃ¡gina para alterar a ordem dos itens de menu do site', 'Ordem menu site', 'Ordem menu site', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-06 14:54:26', NULL),
(61, 'Cadastrar página site', 'cadastrar/sts_cad_pagina', 'FormulÃ¡rio para cadastrar pÃ¡gina do site', 'Cadastrar pagina site', 'Cadastrar pagina site', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-05-06 15:13:52', '2021-04-28 23:48:40'),
(62, 'Proc Form Sts Cad página', 'processa/proc_sts_cad_pagina', 'PÃ¡gina para processar o formulÃ¡rio cadastrar pÃ¡gina do site', 'Cadastrar pagina do site', 'Cadastrar pagina do site', 'Paulo Albuquerque', 2, '', 61, 2, '2', 4, 1, '2018-05-11 12:50:42', '2021-04-28 23:49:00'),
(63, 'Visualizar Pg do Site', 'visualizar/sts_vis_pagina', 'PÃ¡gina para visualizar os detalhes da pÃ¡gina do site', 'Visualizar Pg do Site', 'Visualizar Pg do Site', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-05-12 13:18:42', NULL),
(64, 'Editar página do site', 'editar/sts_edit_pagina', 'FormulÃ¡rio para editar pÃ¡gina do site', 'Editar pagina do site', 'Editar pagina do site', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-16 11:25:25', '2021-04-28 23:51:05'),
(65, 'Proc Form Edit Pagina Site', 'processa/proc_sts_edit_pagina', 'PÃ¡gina para processar o formulÃ¡rio editar pÃ¡gina do site', 'Processar o formulario editar pagina do site', 'Processar o formulario editar pagina do site', 'Paulo Albuquerque', 2, '', 64, 3, '2', 4, 1, '2018-05-16 11:53:31', NULL),
(66, 'Apagar página do site', 'processa/sts_apagar_pagina', 'Apagar pÃ¡gina do site', 'Apagar pagina do site', 'Apagar pagina do site', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-05-16 12:30:02', '2021-04-28 23:48:54'),
(67, 'Listar Carousels', 'listar/sts_list_carousel', 'Listar Carousels', 'Listar Carousels', 'Listar Carousels', 'Paulo Albuquerque', 2, 'fas fa-sliders-h', 0, 1, '2', 4, 1, '2018-05-16 14:20:19', '2018-05-16 14:37:58'),
(68, 'Cadastrar Carousel', 'cadastrar/sts_cad_carousel', 'Cadastrar Carousel', 'Cadastrar Carousel', 'Cadastrar Carousel', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-05-16 15:00:02', NULL),
(69, 'Proc Cad Carousel', 'processa/proc_sts_cad_carousel', 'PÃ¡gina para processar o formulÃ¡rio cadastrar carousel', 'Proc Cad Carousel', 'Proc Cad Carousel', 'Paulo Albuquerque', 2, '', 68, 2, '2', 4, 1, '2018-05-16 15:36:49', NULL),
(70, 'Editar Carousel', 'editar/sts_edit_carousel', 'FormulÃ¡rio para editar o carousel', 'Editar Carousel', 'Editar Carousel', 'Paulo Albuquerque', 2, 'fas fa-wrench', 0, 3, '2', 4, 1, '2018-05-16 15:47:18', '2018-05-17 12:56:51'),
(71, 'Proc Form Edit Carousel', 'processa/proc_sts_edit_carousel', 'PÃ¡gina para processar o formulÃ¡rio editar carousel', 'Processar o formulario editar carousel', 'Processar o formulario editar carousel', 'Paulo Albuquerque', 2, '', 70, 3, '2', 4, 1, '2018-05-16 16:01:43', NULL),
(72, 'Visualizar Carousel', 'visualizar/sts_vis_carousel', 'PÃ¡gina para visualizar detalhes do carousel', 'Visualizar Carousel', 'Visualizar Carousel', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-05-16 16:09:53', NULL),
(73, 'Apagar carousel', 'processa/sts_apagar_carousel', 'Apagar carousel', 'Apagar carousel', 'Apagar carousel', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-05-16 16:32:18', NULL),
(74, 'Alterar ordem carousel', 'processa/proc_sts_ordem_car', 'Processa o alterar ordem carousel', 'Alterar ordem carousel', 'Alterar ordem carousel', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-16 16:52:52', NULL),
(75, 'Editar Serviços', 'editar/sts_edit_servico', 'FormulÃ¡rio para editar serviÃ§os', 'Editar Servicos', 'Editar Servicos', 'Paulo Albuquerque', 2, 'fas fa-wrench', 0, 3, '2', 4, 1, '2018-05-17 12:56:14', '2021-04-28 23:49:20'),
(76, 'Proc Form Edit Serviços', 'processa/proc_sts_edit_servico', 'PÃ¡gina para processar o formulÃ¡rio editar serviÃ§os', 'Processar o formulario editar servicos', 'Processar o formulario editar servicos', 'Paulo Albuquerque', 2, '', 75, 3, '2', 4, 1, '2018-05-17 13:30:04', '2021-04-28 23:49:15'),
(77, 'Editar Vídeo', 'editar/sts_edit_video', 'FormulÃ¡rio para editar vÃ­deos da pÃ¡gina inicial', 'Cadastrar Video', 'Cadastrar Video', 'Paulo Albuquerque', 2, 'fas fa-video', 0, 3, '2', 4, 1, '2018-05-17 14:00:20', '2021-04-28 23:49:06'),
(78, 'Proc Form Edit VÃ­deo', 'processa/proc_sts_edit_video', 'PÃ¡gina para processar o formulÃ¡rio editar vÃ­deo', 'Processar o formulario editar video', 'Processar o formulario editar video', 'Paulo Albuquerque', 2, '', 77, 3, '2', 4, 1, '2018-05-17 15:58:26', NULL),
(79, 'Editar Produto', 'editar/sts_edit_produto', 'PÃ¡gina para editar o produto da pÃ¡gina inicial', 'Editar Produto', 'Editar Produto', 'Paulo Albuquerque', 2, 'fas fa-dolly', 0, 3, '2', 4, 1, '2018-05-25 13:31:24', '2018-05-25 13:32:12'),
(80, 'Proc Form Edit Produto', 'processa/proc_sts_edit_produto', 'PÃ¡gina para processar o formulÃ¡rio editar produto na pÃ¡gina inicial', 'Processar o formulario editar produto', 'Processar o formulario editar produto', 'Paulo Albuquerque', 2, '', 79, 3, '2', 4, 1, '2018-05-25 14:06:20', NULL),
(81, 'Editar form email', 'editar/sts_edit_form_email', 'FormulÃ¡rio para editar as informaÃ§Ãµes da parte do site para o usuÃ¡rio inserir o e-mail', 'Editar Formulario E-mail', 'Editar Formulario E-mail', 'Paulo Albuquerque', 2, 'fas fa-at', 0, 3, '2', 4, 1, '2018-05-26 18:35:39', '2021-04-28 23:51:32'),
(82, 'Proc Form Edit Form E-mail', 'processa/proc_sts_edit_form_email', 'PÃ¡gina para processar o formulÃ¡rio editar o dados da Ã¡rea inserir e-mail na pÃ¡gina inicial', 'Processar o formulario editar formulario e-mail', 'Processar o formulario editar formulario e-mail', 'Paulo Albuquerque', 2, '', 81, 3, '2', 4, 1, '2018-05-26 18:54:14', NULL),
(83, 'Pergunta e Resposta', 'listar/sts_list_perg_resp', 'PÃ¡gina para listar pergunta e resposta', 'Listar Pergunta e Resposta', 'Listar Pergunta e Resposta', 'Paulo Albuquerque', 2, 'far fa-question-circle', 0, 1, '2', 4, 1, '2018-05-27 11:01:41', '2018-05-27 11:02:34'),
(84, 'Visualizar Perguntas e Respostas', 'visualizar/sts_vis_perg_resp', 'PÃ¡gina para Visualizar Perguntas e Respostas', 'Visualizar Perguntas e Respostas', 'Visualizar Perguntas e Respostas', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-05-27 13:54:05', NULL),
(85, 'Cadastrar Pegunta e Resposta', 'cadastrar/sts_cad_perg_resp', 'FormulÃ¡rio para Cadastrar Pegunta e Resposta', 'Cadastrar Pegunta e Resposta', 'Cadastrar Pegunta e Resposta', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-05-27 14:00:39', NULL),
(86, 'Proc Form Cad Perg e Resp', 'processa/proc_sts_cad_perg_resp', 'PÃ¡gina para processar o formulÃ¡rio para cadastrar pergunta e resposta', 'Processar o formulario para cadastrar pergunta e resposta', 'Processar o formulario para cadastrar pergunta e resposta', 'Paulo Albuquerque', 2, '', 85, 2, '2', 3, 1, '2018-05-27 14:07:06', NULL),
(87, 'Editar Pergunta e Resposta', 'editar/sts_edit_perg_resp', 'FormulÃ¡rio para Editar Pergunta e Resposta', 'Editar Pergunta e Resposta', 'Editar Pergunta e Resposta', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-27 14:12:11', NULL),
(88, 'Proc Form Edit Perg Resp', 'processa/proc_sts_edit_perg_resp', 'PÃ¡gina para processar o formulÃ¡rio editar pergunta e resposta', 'Processar o formulario editar pergunta e resposta', 'Processar o formulario editar pergunta e resposta', 'Paulo Albuquerque', 1, '', 87, 3, '2', 4, 1, '2018-05-27 14:20:08', NULL),
(89, 'Alterar ordem pergunta e resposta', 'processa/proc_sts_ordem_perg', 'Alterar ordem pergunta e resposta', 'Alterar ordem pergunta e resposta', 'Alterar ordem pergunta e resposta', 'Paulo Albuquerque', 2, '', 0, 6, '2', 4, 1, '2018-05-27 14:27:24', NULL),
(90, 'Apagar pergunta e resposta', 'processa/sts_apagar_perg_resp', 'PÃ¡gina para apagar pergunta e resposta', 'Apagar pergunta e resposta', 'Apagar pergunta e resposta', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-05-27 14:28:45', NULL),
(91, 'Sobre Empresa', 'listar/sts_list_sob_emp', 'Listar os registros sobre empresa', 'Sobre Empresa', 'Sobre Empresa', 'Paulo Albuquerque', 2, 'fas fa-newspaper', 0, 1, '2', 4, 1, '2018-05-27 15:58:39', '2018-05-27 16:00:00'),
(92, 'Visualizar Sobre Empresa', 'visualizar/sts_vis_sob_emp', 'PÃ¡gina para Visualizar Detalhes Sobre Empresa', 'Visualizar Sobre Empresa', 'Visualizar Sobre Empresa', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-05-27 16:08:51', NULL),
(93, 'Editar Sobre Empresa', 'editar/sts_edit_sob_emp', 'FormulÃ¡rio para Editar Sobre Empresa', 'Editar Sobre Empresa', 'Editar Sobre Empresa', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-27 16:25:41', NULL),
(94, 'Proc Form Edit Sob Emp', 'processa/proc_sts_edit_sob_emp', 'PÃ¡gina para processar o formulÃ¡rio editar sobre empresa', 'Processar o formulario editar sobre empresa', 'Processar o formulario editar sobre empresa', 'Paulo Albuquerque', 2, '', 93, 3, '2', 4, 1, '2018-05-27 16:29:21', NULL),
(95, 'Cadastrar Sobre Empresa', 'cadastrar/sts_cad_sob_emp', 'FormulÃ¡rio para Cadastrar Sobre Empresa', 'Cadastrar Sobre Empresa', 'Cadastrar Sobre Empresa', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-05-31 17:07:09', NULL),
(96, 'Proc From Sob Emp', 'processa/proc_sts_cad_sob_emp', 'PÃ¡gina para processar o formulÃ¡rio cadastrar sobre empresa', 'Formulario cadastrar sobre empresa', 'Formulario cadastrar sobre empresa', 'Paulo Albuquerque', 2, '', 95, 2, '2', 4, 1, '2018-05-31 17:16:35', NULL),
(97, 'Ordem Sobre Empresa', 'processa/proc_sts_ordem_sob_emp', 'Alterar ordem dos itens sobre empresa', 'Alterar ordem dos itens sobre empresa', 'Alterar ordem dos itens sobre empresa', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-05-31 17:22:51', NULL),
(98, 'Apagar Sobre Empresa', 'processa/sts_apagar_sob_emp', 'PÃ¡gina para Apagar Sobre Empresa', 'Apagar Sobre Empresa', 'Apagar Sobre Empresa', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-05-31 17:26:16', NULL),
(99, 'Editar Sobre Autor', 'editar/sts_edit_blog_sobre', 'FormulÃ¡rio para editar Sobre Autor', 'Sobre Autor', 'Sobre Autor', 'Paulo Albuquerque', 2, 'far fa-id-card', 0, 3, '2', 4, 1, '2018-05-31 19:13:50', '2018-05-31 19:23:08'),
(100, 'Proc Form Edit Sobre Autor', 'processa/proc_sts_edit_blog_sobre', 'FormulÃ¡rio Editar Sobre Autor', 'Editar Sobre Autor', 'Editar Sobre Autor', 'Paulo Albuquerque', 2, '', 99, 3, '2', 4, 1, '2018-05-31 19:23:29', '2018-05-31 19:38:32'),
(101, 'Listar Artigo', 'listar/sts_list_artigo', 'PÃ¡gina para listar os artigos', 'Listar Artigo', 'Listar Artigo', 'Paulo Albuquerque', 2, 'fas fa-newspaper', 0, 1, '2', 4, 1, '2018-06-01 12:00:25', '2018-06-01 12:09:20'),
(102, 'Cadastrar Artigo', 'cadastrar/sts_cad_artigo', 'FormulÃ¡rio para Cadastrar Artigo', 'Cadastrar Artigo', 'Cadastrar Artigo', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-06-01 12:01:16', NULL),
(103, 'Proc Cad Artigo', 'processa/proc_sts_cad_artigo', 'PÃ¡gina para processar o formulÃ¡rio cadastrar artigo', 'Processar o formulario cadastrar artigo', 'Processar o formulario cadastrar artigo', 'Paulo Albuquerque', 2, '', 102, 2, '2', 4, 1, '2018-06-01 12:02:25', NULL),
(104, 'Visualizar Artigo', 'visualizar/sts_vis_artigo', 'PÃ¡gina para ver detalhes do artigo', 'Visualizar Artigo', 'Visualizar Artigo', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-06-01 12:03:43', NULL),
(105, 'Editar Artigo', 'editar/sts_edit_artigo', 'FormulÃ¡rio para Editar Artigo', 'Editar Artigo', 'Editar Artigo', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-06-01 12:04:32', NULL),
(106, 'Proc Edit Artigo', 'processa/proc_sts_edit_artigo', 'PÃ¡gina para processar o formulÃ¡rio editar artigo', 'Processar o formulario editar artigo', 'Processar o formulario editar artigo', 'Paulo Albuquerque', 2, '', 105, 3, '2', 4, 1, '2018-06-01 12:05:45', NULL),
(107, 'Apagar Artigo', 'processa/sts_apagar_artigo', 'PÃ¡gina para Apagar Artigo', 'Apagar Artigo', 'Apagar Artigo', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-06-01 12:07:57', '2018-06-01 12:08:50'),
(108, 'Categoria de Artigo', 'listar/sts_list_cat_artigo', 'Listar as Categoria dos Artigo', 'Categoria de Artigo', 'Categoria de Artigo', 'Paulo Albuquerque', 2, 'fas fa-clipboard-list', 0, 1, '2', 4, 1, '2018-06-01 14:18:55', '2018-06-01 14:19:16'),
(109, 'Visualizar Cat Artigo', 'visualizar/sts_vis_cat_artigo', 'PÃ¡gina para ver detalhes da categoria do artigo', 'Visualizar Categoria Artigo', 'Visualizar Categoria Artigo', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-06-01 14:25:54', NULL),
(110, 'Editar categoria de Artigo', 'editar/sts_edit_cat_artigo', 'FormulÃ¡rio para Editar categoria de Artigo', 'Editar categoria de Artigo', 'Editar categoria de Artigo', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-06-01 14:30:34', NULL),
(111, 'Proc Edit Cat Artigo', 'processa/proc_sts_edit_cat_artigo', 'PÃ¡gina para processar o formulÃ¡rio editar categoria de artigo', 'Processar o formulario editar categoria de artigo', 'Processar o formulario editar categoria de artigo', 'Paulo Albuquerque', 2, '', 110, 3, '2', 4, 1, '2018-06-01 14:34:29', NULL),
(112, 'Cadastrar Categoria de Artigo', 'cadastrar/sts_cad_cat_artigo', 'FormulÃ¡rio para Cadastrar Categoria de Artigo', 'Cadastrar Categoria de Artigo', 'Cadastrar Categoria de Artigo', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-06-01 15:58:40', NULL),
(113, 'Proc Form Edit Cat Art', 'processa/proc_sts_cad_cat_artigo', 'PÃ¡gina para processar o formulÃ¡rio editar categoria de artigo', 'Processar o formulario editar categoria de artigo', 'Processar o formulario editar categoria de artigo', 'Paulo Albuquerque', 2, '', 112, 2, '2', 4, 1, '2018-06-01 16:02:42', NULL),
(114, 'Apagar categoria de artigo', 'processa/sts_apagar_cat_artigo', 'PÃ¡gina para apagar a categoria de artigo', 'Apagar categoria de artigo', 'Apagar categoria de artigo', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-06-01 16:06:03', NULL),
(115, 'Contato', 'listar/sts_list_contato', 'PÃ¡gina para listar as mensagens de contato', 'Listar mensagens de contato', 'Listar mensagens de contato', 'Paulo Albuquerque', 2, 'far fa-envelope', 0, 1, '2', 4, 1, '2018-06-01 17:58:13', '2018-06-01 17:58:39'),
(116, 'Visualizar detalhes contato', 'visualizar/sts_vis_contato', 'PÃ¡gina para ver detalhes da mensagem de contato', 'Visualizar detalhes contato', 'Visualizar detalhes contato', 'Paulo Albuquerque', 2, '', 0, 5, '2', 4, 1, '2018-06-01 18:06:00', NULL),
(117, 'Editar Mensagem de Contato', 'editar/sts_edit_contato', 'FormulÃ¡rio para Editar Mensagem de Contato', 'Editar Mensagem de Contato', 'Editar Mensagem de Contato', 'Paulo Albuquerque', 2, '', 0, 3, '2', 4, 1, '2018-06-01 18:11:48', NULL),
(118, 'Proc Form Edit Contato', 'processa/proc_sts_edit_contato', 'PÃ¡gina para processar o formulÃ¡rio editar mensagem de contato', 'Processar o formulario editar mensagem de contato', 'Processar o formulario editar mensagem de contato', 'Paulo Albuquerque', 2, '', 117, 3, '2', 4, 1, '2018-06-01 18:18:32', NULL),
(119, 'Cadastrar Mensagem de Contato', 'cadastrar/sts_cad_contato', 'FormulÃ¡rio para cadastrar mensagem de contato', 'Cadastrar Mensagem de Contato', 'Cadastrar Mensagem de Contato', 'Paulo Albuquerque', 2, '', 0, 2, '2', 4, 1, '2018-06-01 18:23:01', NULL),
(120, 'Proc Cad Msg Contato', 'processa/proc_sts_cad_contato', 'PÃ¡gina para processar o formulÃ¡rio cadastrar mensagem de contato', 'Processar o formulario cadastrar mensagem de contato', 'Processar o formulario cadastrar mensagem de contato', 'Paulo Albuquerque', 2, '', 119, 2, '2', 4, 1, '2018-06-01 18:27:30', NULL),
(121, 'Apagar mensagem de contato', 'processa/sts_apagar_contato', 'PÃ¡gina para apagar mensagem de contato', 'Apagar mensagem de contato', 'Apagar mensagem de contato', 'Paulo Albuquerque', 2, '', 0, 4, '2', 4, 1, '2018-06-01 18:32:59', NULL),
(122, 'list_usuario_tables', 'listar/list_usuario_tables', 'list_usuario_tables', 'list_usuario_tables', 'list_usuario_tables', 'PAULO', 2, '', 0, 1, '1', 4, 1, '2022-03-21 21:27:21', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_robots`
--

CREATE TABLE `adms_robots` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_robots`
--

INSERT INTO `adms_robots` (`id`, `nome`, `tipo`, `created`, `modified`) VALUES
(1, 'Indexar a página e seguir os links', 'index, follow', '2018-03-23 00:00:00', NULL),
(2, 'Não indexar a página mas seguir os links', 'noindex, follow', '2018-03-23 00:00:00', NULL),
(3, 'Indexar a página mas não seguir os links', 'index, nofollow', '2018-03-23 00:00:00', NULL),
(4, 'Não indexar a página e nem seguir os links', 'noindex, nofollow', '2018-03-23 00:00:00', NULL),
(5, 'Não exibir a versão em cache da página', 'noarchive', '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits`
--

CREATE TABLE `adms_sits` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `adms_cor_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits`
--

INSERT INTO `adms_sits` (`id`, `nome`, `adms_cor_id`, `created`, `modified`) VALUES
(1, 'Ativo', '3', '2018-03-23 00:00:00', NULL),
(2, 'Inativo', '4', '2018-03-23 00:00:00', NULL),
(3, 'Analise', '1', '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits_pgs`
--

CREATE TABLE `adms_sits_pgs` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits_pgs`
--

INSERT INTO `adms_sits_pgs` (`id`, `nome`, `cor`, `created`, `modified`) VALUES
(1, 'Ativo', 'success', '2018-03-23 00:00:00', NULL),
(2, 'Inativo', 'danger', '2018-03-23 00:00:00', NULL),
(3, 'Analise', 'primary', '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits_usuarios`
--

CREATE TABLE `adms_sits_usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `adms_cor_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits_usuarios`
--

INSERT INTO `adms_sits_usuarios` (`id`, `nome`, `adms_cor_id`, `created`, `modified`) VALUES
(1, 'Ativo', 3, '2018-03-23 00:00:00', NULL),
(2, 'Inativo', 5, '2018-03-23 00:00:00', NULL),
(3, 'Aguardando confirmacao', 1, '2018-03-23 00:00:00', NULL),
(4, 'Spam', 4, '2018-03-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_tps_pgs`
--

CREATE TABLE `adms_tps_pgs` (
  `id` int(11) NOT NULL,
  `tipo` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `obs` text COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_tps_pgs`
--

INSERT INTO `adms_tps_pgs` (`id`, `tipo`, `nome`, `obs`, `ordem`, `created`, `modified`) VALUES
(1, 'adms', 'Administrativo', 'Core do Administrativo', 1, '2018-03-23 00:00:00', NULL),
(2, 'sts', 'Site', 'Core do site', 2, '2018-05-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_usuarios`
--

CREATE TABLE `adms_usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `apelido` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `recuperar_senha` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chave_descadastro` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conf_email` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adms_niveis_acesso_id` int(11) NOT NULL,
  `adms_sits_usuario_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_usuarios`
--

INSERT INTO `adms_usuarios` (`id`, `nome`, `apelido`, `email`, `usuario`, `senha`, `recuperar_senha`, `chave_descadastro`, `conf_email`, `imagem`, `adms_niveis_acesso_id`, `adms_sits_usuario_id`, `created`, `modified`) VALUES
(1, 'Paulo', 'Paulo', 'paulo.albuquerque@ints.org.br', 'paulo.albuquerque', '$2y$10$ZNdJ7u55gVt1kLIZ7.nlyOsSpJLIGznKwgMh9jy6XkSFrBrM7abSC', NULL, NULL, NULL, 'b48123f3-5c5c-450d-a362-2215fd4c348e-copia.jpg', 1, 1, '2022-04-30 19:49:14', '2023-02-22 17:36:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_artigos`
--

CREATE TABLE `sts_artigos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `conteudo` text COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resumo_publico` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qnt_acesso` int(11) NOT NULL DEFAULT 0,
  `sts_robot_id` int(11) NOT NULL,
  `adms_usuario_id` int(11) NOT NULL,
  `sts_situacoe_id` int(11) NOT NULL,
  `sts_tps_artigo_id` int(11) NOT NULL,
  `sts_cats_artigo_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_artigos`
--

INSERT INTO `sts_artigos` (`id`, `titulo`, `descricao`, `conteudo`, `imagem`, `slug`, `keywords`, `description`, `author`, `resumo_publico`, `qnt_acesso`, `sts_robot_id`, `adms_usuario_id`, `sts_situacoe_id`, `sts_tps_artigo_id`, `sts_cats_artigo_id`, `created`, `modified`) VALUES
(1, 'Sample blog post 1', 'Donec 1 ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n								<hr>\n								<p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>\n								<blockquote>\n								  <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\n								</blockquote>\n								<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n								<h2>Heading</h2>\n								<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\n								<pre><code>Example code block</code></pre>\n								<p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\n								<ul>\n									<li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>\n									<li>Donec id elit non mi porta gravida at eget metus.</li>\n									<li>Nulla vitae elit libero, a pharetra augue.</li>\n								</ul>\n								<p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>\n								<ol>\n									<li>Vestibulum id ligula porta felis euismod semper.</li>\n									<li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>\n									<li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>\n								</ol>\n								<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', 'artigo.jpg', 'sample-blog-post-1', 'artigo, artigo 1, ', 'Descricao do artigo um para seo', 'Paulo Albuquerque', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n                            <hr>\n                            <p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>', 6, 1, 1, 1, 1, 1, '2018-02-18 00:00:00', NULL),
(2, 'Sample blog post 2', 'Donec 2 ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n								<hr>\n								<p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>\n								<blockquote>\n								  <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\n								</blockquote>\n								<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n								<h2>Heading</h2>\n								<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\n								<pre><code>Example code block</code></pre>\n								<p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\n								<ul>\n									<li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>\n									<li>Donec id elit non mi porta gravida at eget metus.</li>\n									<li>Nulla vitae elit libero, a pharetra augue.</li>\n								</ul>\n								<p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>\n								<ol>\n									<li>Vestibulum id ligula porta felis euismod semper.</li>\n									<li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>\n									<li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>\n								</ol>\n								<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', 'artigo.jpg', 'sample-blog-post-2', 'artigo, artigo 2, ', 'Descricao do artigo dois para seo', 'Paulo Albuquerque', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n                            <hr>\n                            <p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>', 4, 1, 1, 1, 1, 1, '2018-02-19 00:00:00', NULL),
(3, 'Sample blog post 3', 'Donec 3 ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n								<hr>\n								<p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>\n								<blockquote>\n								  <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\n								</blockquote>\n								<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n								<h2>Heading</h2>\n								<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\n								<pre><code>Example code block</code></pre>\n								<p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\n								<ul>\n									<li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>\n									<li>Donec id elit non mi porta gravida at eget metus.</li>\n									<li>Nulla vitae elit libero, a pharetra augue.</li>\n								</ul>\n								<p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>\n								<ol>\n									<li>Vestibulum id ligula porta felis euismod semper.</li>\n									<li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>\n									<li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>\n								</ol>\n								<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', 'artigo.jpg', 'sample-blog-post-3', 'artigo, artigo 3 ', 'Descricao do artigo tres para seo', 'Paulo Albuquerque', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n                            <hr>\n                            <p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>', 18, 1, 1, 1, 1, 1, '2018-02-20 00:00:00', NULL),
(4, 'Sample blog post 4 titulo', 'Donec 4 ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', '<p>4This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n								<hr>\n								<p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>\n								<blockquote>\n								  <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\n								</blockquote>\n								<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n								<h2>Heading</h2>\n								<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\n								<pre><code>Example code block</code></pre>\n								<p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\n								<ul>\n									<li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>\n									<li>Donec id elit non mi porta gravida at eget metus.</li>\n									<li>Nulla vitae elit libero, a pharetra augue.</li>\n								</ul>\n								<p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>\n								<ol>\n									<li>Vestibulum id ligula porta felis euismod semper.</li>\n									<li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>\n									<li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>\n								</ol>\n								<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', 'artigo.jpg', 'sample-blog-post-4', 'artigo, artigo 4 ', 'Descricao do artigo quatro para seo', 'Paulo Albuquerque', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n                            <hr>\n                            <p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>', 14, 1, 1, 1, 1, 1, '2018-02-21 00:00:00', NULL),
(5, 'Sample blog post 5', 'Donec 5 ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n								<hr>\n								<p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>\n								<blockquote>\n								  <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>\n								</blockquote>\n								<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>\n								<h2>Heading</h2>\n								<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\n								<pre><code>Example code block</code></pre>\n								<p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>\n								<h3>Sub-heading</h3>\n								<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>\n								<ul>\n									<li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>\n									<li>Donec id elit non mi porta gravida at eget metus.</li>\n									<li>Nulla vitae elit libero, a pharetra augue.</li>\n								</ul>\n								<p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>\n								<ol>\n									<li>Vestibulum id ligula porta felis euismod semper.</li>\n									<li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>\n									<li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>\n								</ol>\n								<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', 'artigo.jpg', 'sample-blog-post-5', 'artigo, artigo 5', 'Descricao do artigo cinco para seo', 'Paulo Albuquerque', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>\n                            <hr>\n                            <p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>', 2, 1, 1, 1, 1, 1, '2018-02-22 00:00:00', NULL),
(6, 'Sample blog post 6', '<p>Donec 6 ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>', '<p><strong>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</strong></p><p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p><blockquote><p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p></blockquote><p>Etiam porta <i>sem malesuada magna</i> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p><h2>Heading</h2><p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p><h3>Sub-heading</h3><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p>Example code block</p><p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p><h3>Sub-heading</h3><p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p><ul><li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li><li>Donec id elit non mi porta gravida at eget metus.</li><li>Nulla vitae elit libero, a pharetra augue.</li></ul><p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p><ol><li>Vestibulum id ligula porta felis euismod semper.</li><li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li><li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li></ol><p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>', 'artigo.jpg', 'sample-blog-post-6', 'artigo, artigo 6', 'Descricao do artigo seis para seo', 'Paulo Albuquerque', '<p>This blog post shows a few different types of content thats supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p><p>Cum sociis natoque penatibus et magnis <a href=\"#\">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>', 39, 4, 1, 1, 1, 1, '2018-02-23 00:00:00', '2018-06-01 13:55:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_blogs_sobres`
--

CREATE TABLE `sts_blogs_sobres` (
  `id` int(11) NOT NULL,
  `titulo` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `sts_situacoe_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_blogs_sobres`
--

INSERT INTO `sts_blogs_sobres` (`id`, `titulo`, `descricao`, `sts_situacoe_id`, `created`, `modified`) VALUES
(1, 'Paulo Albuquerque', 'Atualmente dono da página Etiammalesuada mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur', 1, '2018-02-23 00:00:00', '2021-04-29 02:27:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_carousels`
--

CREATE TABLE `sts_carousels` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posicao_text` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo_botao` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem` int(11) NOT NULL,
  `sts_cor_id` int(11) DEFAULT NULL,
  `sts_situacoe_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_carousels`
--

INSERT INTO `sts_carousels` (`id`, `nome`, `imagem`, `titulo`, `descricao`, `posicao_text`, `titulo_botao`, `link`, `ordem`, `sts_cor_id`, `sts_situacoe_id`, `created`, `modified`) VALUES
(1, 'Primeiro Exemplo', 'imagem_um.jpg', 'Example headline1.', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', 'text-center', 'Mais detalhes', '#', 1, 5, 1, '2018-02-23 00:00:00', '2021-04-29 01:55:01'),
(2, 'Segundo Exemplo', 'imagem_dois.jpg', 'Example headline2.', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', 'text-center', 'Inscrever-se', '#', 2, 5, 1, '2018-02-23 00:00:00', '2021-04-29 01:12:51'),
(3, 'Terceiro Exemplo', 'imagem_tres.jpg', 'One more for good measure3.', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', 'text-center', 'Comprar', '#', 3, 5, 1, '2018-02-23 00:00:00', '2021-04-29 01:55:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_cats_artigos`
--

CREATE TABLE `sts_cats_artigos` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `sts_situacoe_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_cats_artigos`
--

INSERT INTO `sts_cats_artigos` (`id`, `nome`, `sts_situacoe_id`, `created`, `modified`) VALUES
(1, 'PHP', 1, '2018-02-23 00:00:00', '2018-06-01 16:54:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_contatos`
--

CREATE TABLE `sts_contatos` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `assunto` varchar(520) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_contatos`
--

INSERT INTO `sts_contatos` (`id`, `nome`, `email`, `assunto`, `mensagem`, `created`, `modified`) VALUES
(1, 'Leonardo da Vinci', 'teste@hoje.com.br', 'Homem vitruviano', 'testee', '2021-04-29 11:04:59', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_cors`
--

CREATE TABLE `sts_cors` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_cors`
--

INSERT INTO `sts_cors` (`id`, `nome`, `cor`, `created`, `modified`) VALUES
(1, 'Azul', 'primary', '2018-02-23 00:00:00', NULL),
(2, 'Cinza ', 'secondary', '2018-02-23 00:00:00', NULL),
(3, 'Verde', 'success', '2018-02-23 00:00:00', NULL),
(4, 'Vermelho', 'danger', '2018-02-23 00:00:00', NULL),
(5, 'Laranjado', 'warning', '2018-02-23 00:00:00', NULL),
(6, 'Azul claro', 'info', '2018-02-23 00:00:00', NULL),
(7, 'Claro', 'light', '2018-02-23 00:00:00', NULL),
(8, 'Cinza escuro', 'dark', '2018-02-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_forms_emails`
--

CREATE TABLE `sts_forms_emails` (
  `id` int(11) NOT NULL,
  `titulo` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `titulo_botao` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_forms_emails`
--

INSERT INTO `sts_forms_emails` (`id`, `titulo`, `descricao`, `titulo_botao`, `imagem`, `created`, `modified`) VALUES
(1, 'Receber novidades', 'This is a wider card with supporting text below as a natural lead-in to additional content.', 'Cadastrar', 'imagem-um.jpg', '2018-02-23 00:00:00', '2018-05-26 19:10:06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_leads`
--

CREATE TABLE `sts_leads` (
  `id` int(11) NOT NULL,
  `email` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_leads`
--

INSERT INTO `sts_leads` (`id`, `email`, `created`, `modified`) VALUES
(1, 'albuquerque@site.com.br', '2018-02-20 17:48:08', NULL),
(2, 'albuquerques@site.com.br', '2018-02-20 17:57:55', NULL),
(3, 'testando@hoje.com.br', '2021-04-29 11:02:11', NULL),
(4, 'iknjbu@kjbhsd.com.br', '2021-04-29 11:02:40', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_paginas`
--

CREATE TABLE `sts_paginas` (
  `id` int(11) NOT NULL,
  `endereco` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `nome_pagina` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `obs` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lib_bloq` int(11) NOT NULL DEFAULT 2,
  `ordem` int(11) NOT NULL,
  `depend_pg` int(11) NOT NULL DEFAULT 0,
  `sts_tps_pg_id` int(11) NOT NULL,
  `sts_robot_id` int(11) NOT NULL,
  `sts_situacaos_pg_id` int(11) NOT NULL DEFAULT 2,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_paginas`
--

INSERT INTO `sts_paginas` (`id`, `endereco`, `nome_pagina`, `titulo`, `obs`, `keywords`, `description`, `author`, `imagem`, `lib_bloq`, `ordem`, `depend_pg`, `sts_tps_pg_id`, `sts_robot_id`, `sts_situacaos_pg_id`, `created`, `modified`) VALUES
(4, 'blog', 'Blog', 'Blog', NULL, 'siteblog, PHP, HTML, CSS, Bootstrap, JavaScrip', 'blog do site desenvolvido no Curso de PHP, MySQLi e Bootstrap', 'Paulo Albuquerque', 'blog.jpg', 1, 3, 0, 1, 1, 1, '2018-02-23 00:00:00', '2021-10-17 01:16:33'),
(5, 'artigo', 'Artigo', 'Artigo', NULL, 'site artigo, PHP, HTML, CSS, Bootstrap, JavaScript', 'artigo do site desenvolvido no Curso de PHP, MySQLi e Bootstrap', 'Paulo Albuquerque', 'artigo.jpg', 1, 4, 0, 1, 1, 1, '2018-02-23 00:00:00', '2023-02-22 17:53:32'),
(6, 'proc_cad_lead', 'Processa Cadastrar Lead', 'Cadastrar lead', '', 'php', 'Cadastrar e-mail para receber novidades', 'Paulo Albuquerque', 'sunp0177.jpg', 2, 6, 1, 1, 4, 1, '2018-02-23 00:00:00', '2023-02-22 17:55:39'),
(7, 'proc_cad_contato', 'Processa Cadastrar Contato', 'Cadastrar contato', NULL, 'cadastrar contato', 'cadastrar contato', 'Paulo Albuquerque', 'cadastrar.jpg', 2, 7, 3, 1, 4, 1, '2018-02-23 00:00:00', '2023-02-22 17:55:38'),
(8, 'home', 'Home', 'Home', '', 'Home', 'Home', 'Paulo Albuquerque', NULL, 1, 1, 0, 1, 1, 1, '2021-10-17 01:16:21', '2021-10-17 01:18:29'),
(2, 'sobre_empresa', 'Sobre Empresa', 'Sobre empresa', NULL, 'site sobre empresa, PHP, HTML, CSS, Bootstrap', 'sobre empresa do site desenvolvido no Curso de PHP, MySQLi e Bootstrap', 'Paulo Albuquerque', 'sobre_empresa.jpg', 1, 2, 0, 1, 1, 1, '2018-02-23 00:00:00', '2021-10-17 01:16:35'),
(3, 'contato', 'Contato', 'Contato', NULL, 'site contato, PHP, HTML, CSS, Bootstrap, JavaScript', 'contato do site desenvolvido no Curso de PHP, MySQLi e Bootstrap', 'Paulo Albuquerque', 'contato.jpg', 1, 5, 0, 1, 1, 1, '2018-02-23 00:00:00', '2022-03-31 19:57:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_pergs_resps`
--

CREATE TABLE `sts_pergs_resps` (
  `id` int(11) NOT NULL,
  `pergunta` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `resposta` text COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `sts_situacoe_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_pergs_resps`
--

INSERT INTO `sts_pergs_resps` (`id`, `pergunta`, `resposta`, `ordem`, `sts_situacoe_id`, `created`, `modified`) VALUES
(1, 'skateboard dolor brunch', '1Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably havent heard of them accusamus labore sustainable VHS.', 2, 1, '2018-02-23 00:00:00', '2021-04-29 10:56:47'),
(2, 'sustainable VHS', '2Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably havent heard of them accusamus labore sustainable VHS.', 3, 1, '2018-02-23 00:00:00', '2021-04-29 10:56:55'),
(3, 'reprehenderit, enim eiusmod high life', '3Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably havent heard of them accusamus labore sustainable VHS.', 1, 1, '2018-02-23 00:00:00', '2021-04-29 10:56:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_prods_homes`
--

CREATE TABLE `sts_prods_homes` (
  `id` int(11) NOT NULL,
  `titulo` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `subtitulo` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_prods_homes`
--

INSERT INTO `sts_prods_homes` (`id`, `titulo`, `subtitulo`, `descricao`, `imagem`, `created`, `modified`) VALUES
(1, 'Produto', 'First featurette heading.', 'Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', 'produto.jpg', '2018-02-23 00:00:00', '2021-04-29 02:08:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_robots`
--

CREATE TABLE `sts_robots` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_robots`
--

INSERT INTO `sts_robots` (`id`, `nome`, `tipo`, `created`, `modified`) VALUES
(1, 'Indexar a página e seguir os links', 'index,follow', '2018-02-23 00:00:00', NULL),
(2, 'Não indexar a página mas seguir os links', 'noindex,follow', '2018-02-23 00:00:00', NULL),
(3, 'Indexar a página mas não seguir os links', 'index,nofollow', '2018-02-23 00:00:00', NULL),
(4, 'Não indexar a página e nem seguir os links', 'noindex,nofollow', '2018-02-23 00:00:00', NULL),
(5, 'Não exibir a versão em cache da página', 'noarchive', '2018-02-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_servicos`
--

CREATE TABLE `sts_servicos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `icone_um` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nome_um` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_um` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `icone_dois` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nome_dois` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_dois` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `icone_tres` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nome_tres` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_tres` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_servicos`
--

INSERT INTO `sts_servicos` (`id`, `titulo`, `icone_um`, `nome_um`, `descricao_um`, `icone_dois`, `nome_dois`, `descricao_dois`, `icone_tres`, `nome_tres`, `descricao_tres`, `created`, `modified`) VALUES
(1, 'Serviços', 'ion-ios-camera-outline', 'Serviços um', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'ion-ios-film-outline', 'Serviços dois', 'This card has supporting text below as a natural lead-in to additional content.', 'ion-ios-videocam-outline', 'Serviços três', 'This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.', '2018-02-23 00:00:00', '2021-04-29 01:12:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_situacaos_pgs`
--

CREATE TABLE `sts_situacaos_pgs` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sts_cor_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_situacaos_pgs`
--

INSERT INTO `sts_situacaos_pgs` (`id`, `nome`, `sts_cor_id`, `created`, `modified`) VALUES
(1, 'Ativo', 3, '2018-05-23 00:00:00', NULL),
(2, 'Inativo', 5, '2018-05-23 00:00:00', NULL),
(3, 'Analise', 1, '2018-05-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_situacoes`
--

CREATE TABLE `sts_situacoes` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sts_cor_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_situacoes`
--

INSERT INTO `sts_situacoes` (`id`, `nome`, `sts_cor_id`, `created`, `modified`) VALUES
(1, 'Ativo', 3, '2018-05-23 00:00:00', NULL),
(2, 'Inativo', 5, '2018-05-23 00:00:00', NULL),
(3, 'Analise', 1, '2018-05-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_sobs_emps`
--

CREATE TABLE `sts_sobs_emps` (
  `id` int(11) NOT NULL,
  `titulo` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `sts_situacoe_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_sobs_emps`
--

INSERT INTO `sts_sobs_emps` (`id`, `titulo`, `descricao`, `imagem`, `ordem`, `sts_situacoe_id`, `created`, `modified`) VALUES
(1, 'Sobre empresa um.', 'Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', 'produto.jpg', 1, 1, '2018-02-23 00:00:00', '2018-05-31 18:44:27'),
(2, 'Sobre empresa dois.', 'Descricao sobre empresa 2 Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', 'empresa.jpg', 2, 1, '2018-02-23 00:00:00', '2018-05-31 18:49:37'),
(3, 'Sobre empresa tres.', 'Descricao sobre empresa 3 Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.', 'empresa.jpg', 3, 1, '2018-02-23 00:00:00', '2018-05-31 18:49:37'),
(4, 'Sobre empresa quatro', 'Descricao sobre empresa 4 Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo', 'produto.jpg', 4, 1, '2018-02-23 00:00:00', '2021-04-29 02:09:06'),
(7, 'xcv', 'ds', 'sunp0112.jpg', 5, 1, '2021-06-18 23:07:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_tps_artigos`
--

CREATE TABLE `sts_tps_artigos` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_tps_artigos`
--

INSERT INTO `sts_tps_artigos` (`id`, `nome`, `created`, `modified`) VALUES
(1, 'Publico', '2018-02-23 00:00:00', NULL),
(2, 'Privado', '2018-02-23 00:00:00', NULL),
(3, 'Privado com resumo publico', '2018-02-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_tps_pgs`
--

CREATE TABLE `sts_tps_pgs` (
  `id` int(11) NOT NULL,
  `tipo` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `obs` text COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_tps_pgs`
--

INSERT INTO `sts_tps_pgs` (`id`, `tipo`, `nome`, `obs`, `ordem`, `created`, `modified`) VALUES
(1, 'sts', 'Site Principal', 'Core do site principal', 1, '2018-05-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sts_videos`
--

CREATE TABLE `sts_videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `video_um` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `video_dois` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `video_tres` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `sts_videos`
--

INSERT INTO `sts_videos` (`id`, `titulo`, `descricao`, `video_um`, `video_dois`, `video_tres`, `created`, `modified`) VALUES
(1, 'Depoimentos', 'This is a wider card with supporting text below as a natural lead-in to additional content.', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CqsJPn6uNB8\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XQxitgyZ_S4\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/_x9AwxfjxvE\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2018-02-23 00:00:00', '2021-04-29 02:04:19');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adms_cads_usuarios`
--
ALTER TABLE `adms_cads_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_confs_emails`
--
ALTER TABLE `adms_confs_emails`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_cors`
--
ALTER TABLE `adms_cors`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_grps_pgs`
--
ALTER TABLE `adms_grps_pgs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_menus`
--
ALTER TABLE `adms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_nivacs_pgs`
--
ALTER TABLE `adms_nivacs_pgs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_niveis_acessos`
--
ALTER TABLE `adms_niveis_acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_paginas`
--
ALTER TABLE `adms_paginas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_robots`
--
ALTER TABLE `adms_robots`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_sits`
--
ALTER TABLE `adms_sits`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_sits_pgs`
--
ALTER TABLE `adms_sits_pgs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_sits_usuarios`
--
ALTER TABLE `adms_sits_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_tps_pgs`
--
ALTER TABLE `adms_tps_pgs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_usuarios`
--
ALTER TABLE `adms_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_artigos`
--
ALTER TABLE `sts_artigos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_blogs_sobres`
--
ALTER TABLE `sts_blogs_sobres`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_carousels`
--
ALTER TABLE `sts_carousels`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_cats_artigos`
--
ALTER TABLE `sts_cats_artigos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_contatos`
--
ALTER TABLE `sts_contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_cors`
--
ALTER TABLE `sts_cors`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_forms_emails`
--
ALTER TABLE `sts_forms_emails`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_leads`
--
ALTER TABLE `sts_leads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_paginas`
--
ALTER TABLE `sts_paginas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_pergs_resps`
--
ALTER TABLE `sts_pergs_resps`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_prods_homes`
--
ALTER TABLE `sts_prods_homes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_robots`
--
ALTER TABLE `sts_robots`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_servicos`
--
ALTER TABLE `sts_servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_situacaos_pgs`
--
ALTER TABLE `sts_situacaos_pgs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_situacoes`
--
ALTER TABLE `sts_situacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_sobs_emps`
--
ALTER TABLE `sts_sobs_emps`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_tps_artigos`
--
ALTER TABLE `sts_tps_artigos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_tps_pgs`
--
ALTER TABLE `sts_tps_pgs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sts_videos`
--
ALTER TABLE `sts_videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adms_cads_usuarios`
--
ALTER TABLE `adms_cads_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `adms_confs_emails`
--
ALTER TABLE `adms_confs_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `adms_cors`
--
ALTER TABLE `adms_cors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `adms_grps_pgs`
--
ALTER TABLE `adms_grps_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `adms_menus`
--
ALTER TABLE `adms_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `adms_nivacs_pgs`
--
ALTER TABLE `adms_nivacs_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT de tabela `adms_niveis_acessos`
--
ALTER TABLE `adms_niveis_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `adms_paginas`
--
ALTER TABLE `adms_paginas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de tabela `adms_robots`
--
ALTER TABLE `adms_robots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `adms_sits`
--
ALTER TABLE `adms_sits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `adms_sits_pgs`
--
ALTER TABLE `adms_sits_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `adms_sits_usuarios`
--
ALTER TABLE `adms_sits_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `adms_tps_pgs`
--
ALTER TABLE `adms_tps_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `adms_usuarios`
--
ALTER TABLE `adms_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `sts_artigos`
--
ALTER TABLE `sts_artigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `sts_blogs_sobres`
--
ALTER TABLE `sts_blogs_sobres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sts_carousels`
--
ALTER TABLE `sts_carousels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sts_cats_artigos`
--
ALTER TABLE `sts_cats_artigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sts_contatos`
--
ALTER TABLE `sts_contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sts_cors`
--
ALTER TABLE `sts_cors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sts_forms_emails`
--
ALTER TABLE `sts_forms_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sts_leads`
--
ALTER TABLE `sts_leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sts_paginas`
--
ALTER TABLE `sts_paginas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sts_pergs_resps`
--
ALTER TABLE `sts_pergs_resps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sts_prods_homes`
--
ALTER TABLE `sts_prods_homes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sts_robots`
--
ALTER TABLE `sts_robots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `sts_servicos`
--
ALTER TABLE `sts_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sts_situacaos_pgs`
--
ALTER TABLE `sts_situacaos_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sts_situacoes`
--
ALTER TABLE `sts_situacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sts_sobs_emps`
--
ALTER TABLE `sts_sobs_emps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `sts_tps_artigos`
--
ALTER TABLE `sts_tps_artigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sts_tps_pgs`
--
ALTER TABLE `sts_tps_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sts_videos`
--
ALTER TABLE `sts_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
