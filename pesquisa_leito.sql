-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Mar-2023 às 19:54
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

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
-- Estrutura da tabela `adms_avaliacao_feita`
--

CREATE TABLE `adms_avaliacao_feita` (
  `id` int(11) NOT NULL,
  `adms_paciente_id` int(11) NOT NULL,
  `pergunta1` int(11) NOT NULL,
  `pergunta2` int(11) NOT NULL,
  `pergunta3` int(11) NOT NULL,
  `pergunta4` int(11) NOT NULL,
  `pergunta5` int(11) NOT NULL,
  `pergunta6` int(11) NOT NULL,
  `pergunta7` int(11) NOT NULL,
  `pergunta8` int(11) NOT NULL,
  `pergunta9` int(11) NOT NULL,
  `pergunta10` int(11) NOT NULL,
  `pergunta11` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `editor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_avaliacao_feita`
--

INSERT INTO `adms_avaliacao_feita` (`id`, `adms_paciente_id`, `pergunta1`, `pergunta2`, `pergunta3`, `pergunta4`, `pergunta5`, `pergunta6`, `pergunta7`, `pergunta8`, `pergunta9`, `pergunta10`, `pergunta11`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(29, 205, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, '2023-03-08 14:33:04', 1, NULL, NULL),
(30, 206, 2, 2, 1, 1, 2, 1, 1, 1, 2, 1, 9, '2023-03-08 15:21:21', 1, NULL, NULL);

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
(1, 'Inicio', 'fas fa-tachometer-alt', 1, 1, '2018-03-23 00:00:00', '2023-03-01 13:21:49'),
(2, 'Usuario', 'fas fa-user', 2, 1, '2018-03-23 00:00:00', '2023-03-01 13:21:49'),
(3, 'Menu', 'fas fa-list-ul', 3, 1, '2018-03-23 00:00:00', '2018-04-12 12:21:49'),
(4, 'Sair', 'fa fa-power-off', 6, 1, '2018-03-23 00:00:00', '2023-03-01 10:57:57'),
(5, 'Configurações', 'fas fa-cogs', 5, 1, '2018-05-01 16:54:42', '2023-02-28 08:43:17'),
(7, 'Paciente', 'fa fa-heartbeat', 4, 1, '2023-02-24 09:57:17', '2023-03-01 13:23:58');

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
(1, 1, 1, 2, 1, 1, 1, 1, '2018-03-23 00:00:00', '2023-02-24 07:28:41'),
(2, 1, 2, 1, 1, 2, 1, 5, '2018-03-23 00:00:00', '2023-02-24 08:05:48'),
(3, 1, 3, 1, 1, 2, 1, 6, '2018-03-23 00:00:00', '2023-02-24 07:28:52'),
(4, 1, 4, 1, 1, 5, 1, 7, '2018-03-23 00:00:00', '2021-04-28 23:47:13'),
(5, 1, 5, 1, 1, 5, 1, 8, '2018-03-23 00:00:00', '2021-04-28 23:47:31'),
(6, 1, 6, 2, 1, 4, 1, 4, '2018-03-23 00:00:00', '2023-02-24 07:33:37'),
(7, 1, 7, 2, 2, 2, 1, 9, '2018-03-23 00:00:00', NULL),
(8, 1, 8, 2, 2, 2, 1, 10, '2018-03-23 00:00:00', NULL),
(9, 1, 9, 2, 2, 2, 1, 11, '2018-03-23 00:00:00', NULL),
(10, 1, 10, 2, 2, 2, 1, 12, '2018-03-23 00:00:00', NULL),
(11, 1, 11, 2, 2, 2, 1, 13, '2018-03-23 00:00:00', NULL),
(23, 1, 12, 2, 2, 2, 1, 14, '2018-03-23 00:00:00', NULL),
(24, 1, 13, 2, 2, 2, 1, 15, '2018-03-23 00:00:00', '2023-03-01 07:32:46'),
(25, 1, 14, 2, 2, 3, 1, 16, '2018-03-23 00:00:00', '2023-03-01 07:32:49'),
(26, 1, 15, 1, 2, 3, 1, 17, '2018-03-23 00:00:00', NULL),
(27, 1, 16, 2, 2, 3, 1, 21, '2018-03-19 18:06:40', '2023-03-01 07:32:51'),
(31, 1, 17, 2, 2, 3, 1, 22, '2018-03-21 12:39:49', '2023-03-01 07:32:53'),
(35, 1, 18, 2, 2, 3, 1, 23, '2018-03-21 16:43:09', '2023-03-01 07:32:55'),
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
(189, 1, 47, 1, 2, 5, 1, 51, '2018-05-01 16:40:55', '2023-02-24 07:32:41'),
(194, 1, 48, 1, 2, 3, 1, 52, '2018-05-01 17:06:00', NULL),
(199, 1, 49, 1, 2, 5, 1, 53, '2018-05-02 23:57:08', '2023-02-24 07:32:06'),
(204, 1, 50, 1, 2, 3, 1, 54, '2018-05-03 00:04:59', NULL),
(209, 1, 51, 1, 2, 3, 1, 55, '2018-05-04 12:42:15', NULL),
(214, 1, 52, 1, 2, 3, 1, 56, '2018-05-04 13:10:17', NULL),
(219, 1, 53, 2, 2, 3, 1, 57, '2018-05-05 16:36:02', '2023-03-02 15:27:24'),
(901, 2, 127, 1, 2, 3, 7, 131, '2023-03-08 15:29:04', NULL),
(907, 2, 129, 1, 2, 3, 7, 133, '2023-03-09 10:47:36', NULL),
(910, 2, 130, 1, 2, 3, 7, 134, '2023-03-09 15:26:21', NULL),
(895, 2, 125, 1, 1, 3, 7, 129, '2023-03-02 15:13:03', NULL),
(892, 1, 124, 1, 2, 3, 7, 128, '2023-03-01 11:25:56', '2023-03-08 09:31:35'),
(904, 2, 128, 1, 2, 3, 7, 132, '2023-03-09 10:08:03', NULL),
(898, 1, 126, 1, 2, 3, 7, 130, '2023-03-08 10:02:56', '2023-03-08 10:04:38'),
(636, 1, 118, 2, 2, 3, 1, 122, '2022-03-21 21:27:21', '2022-03-21 21:28:08'),
(639, 1, 1, 2, 1, 1, 6, 1, '2023-02-23 08:26:35', '2023-03-01 07:59:59'),
(640, 1, 2, 2, 1, 4, 6, 4, '2023-02-23 08:26:35', '2023-03-01 08:00:00'),
(641, 1, 3, 1, 2, 3, 6, 2, '2023-02-23 08:26:35', NULL),
(642, 1, 4, 1, 2, 3, 6, 3, '2023-02-23 08:26:35', NULL),
(643, 1, 5, 1, 1, 2, 6, 5, '2023-02-23 08:26:35', '2023-03-01 08:00:08'),
(644, 1, 6, 1, 1, 2, 6, 6, '2023-02-23 08:26:35', '2023-03-01 08:00:21'),
(645, 2, 7, 1, 2, 5, 6, 7, '2023-02-23 08:26:35', NULL),
(646, 2, 8, 1, 2, 5, 6, 8, '2023-02-23 08:26:35', NULL),
(647, 2, 9, 1, 2, 2, 6, 9, '2023-02-23 08:26:35', NULL),
(648, 1, 10, 1, 2, 2, 6, 10, '2023-02-23 08:26:35', '2023-03-01 08:00:36'),
(649, 2, 11, 1, 2, 2, 6, 11, '2023-02-23 08:26:35', NULL),
(650, 2, 12, 1, 2, 2, 6, 12, '2023-02-23 08:26:35', NULL),
(651, 2, 13, 1, 2, 2, 6, 13, '2023-02-23 08:26:35', NULL),
(652, 2, 14, 1, 2, 2, 6, 14, '2023-02-23 08:26:35', NULL),
(653, 2, 15, 1, 2, 2, 6, 15, '2023-02-23 08:26:35', NULL),
(654, 2, 16, 1, 2, 3, 6, 16, '2023-02-23 08:26:35', NULL),
(655, 2, 17, 1, 2, 3, 6, 17, '2023-02-23 08:26:35', NULL),
(656, 2, 18, 1, 2, 3, 6, 27, '2023-02-23 08:26:35', NULL),
(657, 2, 19, 1, 2, 3, 6, 26, '2023-02-23 08:26:35', NULL),
(658, 2, 20, 1, 2, 3, 6, 21, '2023-02-23 08:26:35', NULL),
(659, 2, 21, 1, 2, 3, 6, 22, '2023-02-23 08:26:35', NULL),
(660, 2, 22, 1, 2, 3, 6, 23, '2023-02-23 08:26:35', NULL),
(661, 2, 23, 1, 2, 3, 6, 24, '2023-02-23 08:26:35', NULL),
(662, 2, 24, 1, 2, 3, 6, 28, '2023-02-23 08:26:35', NULL),
(663, 2, 25, 1, 2, 3, 6, 29, '2023-02-23 08:26:35', NULL),
(664, 2, 26, 1, 2, 3, 6, 30, '2023-02-23 08:26:35', NULL),
(665, 2, 27, 1, 2, 3, 6, 31, '2023-02-23 08:26:35', NULL),
(666, 2, 28, 1, 2, 3, 6, 32, '2023-02-23 08:26:35', NULL),
(667, 2, 29, 1, 2, 3, 6, 33, '2023-02-23 08:26:35', NULL),
(668, 2, 30, 1, 2, 3, 6, 34, '2023-02-23 08:26:35', NULL),
(669, 2, 31, 1, 2, 3, 6, 35, '2023-02-23 08:26:35', NULL),
(670, 2, 32, 1, 2, 3, 6, 36, '2023-02-23 08:26:35', NULL),
(671, 2, 33, 1, 2, 3, 6, 37, '2023-02-23 08:26:35', NULL),
(672, 2, 34, 1, 2, 3, 6, 38, '2023-02-23 08:26:35', NULL),
(673, 2, 35, 1, 2, 3, 6, 39, '2023-02-23 08:26:35', NULL),
(674, 2, 36, 1, 2, 3, 6, 40, '2023-02-23 08:26:35', NULL),
(675, 2, 37, 1, 2, 3, 6, 41, '2023-02-23 08:26:35', NULL),
(676, 2, 38, 1, 2, 3, 6, 42, '2023-02-23 08:26:35', NULL),
(677, 1, 39, 1, 2, 3, 6, 43, '2023-02-23 08:26:35', '2023-03-01 08:22:33'),
(678, 1, 40, 1, 2, 3, 6, 44, '2023-02-23 08:26:35', '2023-03-01 08:23:13'),
(679, 1, 41, 1, 2, 3, 6, 45, '2023-02-23 08:26:35', '2023-03-01 08:23:13'),
(680, 2, 42, 1, 2, 3, 6, 46, '2023-02-23 08:26:35', NULL),
(681, 1, 43, 1, 2, 3, 6, 47, '2023-02-23 08:26:35', '2023-03-01 08:21:56'),
(682, 1, 44, 1, 2, 3, 6, 48, '2023-02-23 08:26:35', '2023-03-01 08:22:06'),
(683, 1, 45, 1, 2, 3, 6, 49, '2023-02-23 08:26:35', '2023-03-01 08:22:06'),
(684, 1, 46, 1, 2, 3, 6, 50, '2023-02-23 08:26:35', NULL),
(685, 2, 47, 1, 2, 5, 6, 51, '2023-02-23 08:26:35', NULL),
(686, 2, 48, 1, 2, 3, 6, 52, '2023-02-23 08:26:35', NULL),
(687, 2, 49, 1, 2, 5, 6, 53, '2023-02-23 08:26:35', NULL),
(688, 2, 50, 1, 2, 3, 6, 54, '2023-02-23 08:26:35', NULL),
(689, 1, 51, 1, 2, 3, 6, 55, '2023-02-23 08:26:35', NULL),
(690, 1, 52, 1, 2, 3, 6, 56, '2023-02-23 08:26:35', NULL),
(691, 1, 53, 1, 2, 3, 6, 57, '2023-02-23 08:26:35', NULL),
(900, 2, 127, 1, 2, 3, 6, 131, '2023-03-08 15:29:04', NULL),
(906, 2, 129, 1, 2, 3, 6, 133, '2023-03-09 10:47:36', NULL),
(909, 2, 130, 1, 2, 3, 6, 134, '2023-03-09 15:26:21', NULL),
(894, 2, 125, 1, 1, 3, 6, 129, '2023-03-02 15:13:03', NULL),
(891, 1, 124, 1, 2, 3, 6, 128, '2023-03-01 11:25:56', '2023-03-08 09:34:48'),
(903, 2, 128, 1, 2, 3, 6, 132, '2023-03-09 10:08:03', NULL),
(897, 1, 126, 1, 2, 3, 6, 130, '2023-03-08 10:02:56', '2023-03-08 10:04:35'),
(756, 2, 118, 1, 2, 3, 6, 122, '2023-02-23 08:26:36', NULL),
(757, 1, 1, 2, 1, 1, 7, 1, '2023-02-24 07:39:21', '2023-03-01 07:37:28'),
(758, 1, 2, 2, 1, 4, 7, 4, '2023-02-24 07:39:21', '2023-03-01 07:37:35'),
(759, 1, 3, 1, 2, 3, 7, 2, '2023-02-24 07:39:21', NULL),
(760, 1, 4, 1, 2, 3, 7, 3, '2023-02-24 07:39:21', NULL),
(761, 2, 5, 1, 1, 2, 7, 5, '2023-02-24 07:39:21', '2023-03-07 13:46:40'),
(762, 2, 6, 1, 2, 2, 7, 6, '2023-02-24 07:39:21', NULL),
(763, 2, 7, 1, 2, 5, 7, 7, '2023-02-24 07:39:21', NULL),
(764, 2, 8, 1, 2, 5, 7, 8, '2023-02-24 07:39:21', NULL),
(765, 2, 9, 1, 2, 2, 7, 9, '2023-02-24 07:39:21', NULL),
(766, 2, 10, 1, 2, 2, 7, 10, '2023-02-24 07:39:21', NULL),
(767, 2, 11, 1, 2, 2, 7, 11, '2023-02-24 07:39:21', NULL),
(768, 2, 12, 1, 2, 2, 7, 12, '2023-02-24 07:39:21', NULL),
(769, 2, 13, 1, 2, 2, 7, 13, '2023-02-24 07:39:21', NULL),
(770, 2, 14, 1, 2, 2, 7, 14, '2023-02-24 07:39:21', NULL),
(771, 2, 15, 1, 2, 2, 7, 15, '2023-02-24 07:39:21', NULL),
(772, 2, 16, 1, 2, 3, 7, 16, '2023-02-24 07:39:22', NULL),
(773, 2, 17, 1, 2, 3, 7, 17, '2023-02-24 07:39:22', NULL),
(774, 2, 18, 1, 2, 3, 7, 27, '2023-02-24 07:39:22', NULL),
(775, 2, 19, 1, 2, 3, 7, 26, '2023-02-24 07:39:22', NULL),
(776, 2, 20, 1, 2, 3, 7, 21, '2023-02-24 07:39:22', NULL),
(777, 2, 21, 1, 2, 3, 7, 22, '2023-02-24 07:39:22', NULL),
(778, 2, 22, 1, 2, 3, 7, 23, '2023-02-24 07:39:22', NULL),
(779, 2, 23, 1, 2, 3, 7, 24, '2023-02-24 07:39:22', NULL),
(780, 2, 24, 1, 2, 3, 7, 28, '2023-02-24 07:39:22', NULL),
(781, 2, 25, 1, 2, 3, 7, 29, '2023-02-24 07:39:22', NULL),
(782, 2, 26, 1, 2, 3, 7, 30, '2023-02-24 07:39:22', NULL),
(783, 2, 27, 1, 2, 3, 7, 31, '2023-02-24 07:39:22', NULL),
(784, 2, 28, 1, 2, 3, 7, 32, '2023-02-24 07:39:22', NULL),
(785, 2, 29, 1, 2, 3, 7, 33, '2023-02-24 07:39:22', NULL),
(786, 2, 30, 1, 2, 3, 7, 34, '2023-02-24 07:39:22', NULL),
(787, 2, 31, 1, 2, 3, 7, 35, '2023-02-24 07:39:22', NULL),
(788, 2, 32, 1, 2, 3, 7, 36, '2023-02-24 07:39:22', NULL),
(789, 2, 33, 1, 2, 3, 7, 37, '2023-02-24 07:39:22', NULL),
(790, 2, 34, 1, 2, 3, 7, 38, '2023-02-24 07:39:22', NULL),
(791, 2, 35, 1, 2, 3, 7, 39, '2023-02-24 07:39:22', NULL),
(792, 2, 36, 1, 2, 3, 7, 40, '2023-02-24 07:39:22', NULL),
(793, 2, 37, 1, 2, 3, 7, 41, '2023-02-24 07:39:22', NULL),
(794, 2, 38, 1, 2, 3, 7, 42, '2023-02-24 07:39:22', NULL),
(795, 1, 39, 1, 2, 3, 7, 43, '2023-02-24 07:39:22', '2023-03-01 07:55:41'),
(796, 1, 40, 1, 2, 3, 7, 44, '2023-02-24 07:39:22', '2023-03-01 07:55:32'),
(797, 1, 41, 1, 2, 3, 7, 45, '2023-02-24 07:39:22', '2023-03-01 07:55:32'),
(798, 2, 42, 1, 2, 3, 7, 46, '2023-02-24 07:39:22', NULL),
(799, 1, 43, 1, 2, 3, 7, 47, '2023-02-24 07:39:22', '2023-03-01 07:36:57'),
(800, 1, 44, 2, 2, 3, 7, 48, '2023-02-24 07:39:22', '2023-03-01 07:51:51'),
(801, 1, 45, 1, 2, 3, 7, 49, '2023-02-24 07:39:22', '2023-03-01 07:36:48'),
(802, 1, 46, 2, 2, 3, 7, 50, '2023-02-24 07:39:22', '2023-03-01 07:52:49'),
(803, 2, 47, 2, 2, 5, 7, 51, '2023-02-24 07:39:22', '2023-03-01 07:52:42'),
(804, 2, 48, 1, 2, 3, 7, 52, '2023-02-24 07:39:22', NULL),
(805, 2, 49, 1, 2, 5, 7, 53, '2023-02-24 07:39:22', NULL),
(806, 2, 50, 1, 2, 3, 7, 54, '2023-02-24 07:39:22', NULL),
(807, 1, 51, 1, 2, 3, 7, 55, '2023-02-24 07:39:22', NULL),
(808, 2, 52, 1, 2, 3, 7, 56, '2023-02-24 07:39:22', '2023-03-01 07:53:01'),
(809, 1, 53, 1, 2, 3, 7, 57, '2023-02-24 07:39:22', NULL),
(899, 1, 127, 1, 2, 3, 1, 131, '2023-03-08 15:29:04', NULL),
(905, 1, 129, 1, 2, 3, 1, 133, '2023-03-09 10:47:36', NULL),
(908, 1, 130, 1, 2, 3, 1, 134, '2023-03-09 15:26:21', NULL),
(893, 1, 125, 2, 2, 3, 1, 129, '2023-03-02 15:13:03', '2023-03-02 15:27:12'),
(890, 1, 124, 1, 2, 3, 1, 128, '2023-03-01 11:25:56', NULL),
(902, 1, 128, 1, 2, 3, 1, 132, '2023-03-09 10:08:03', NULL),
(896, 1, 126, 1, 2, 3, 1, 130, '2023-03-08 10:02:56', NULL),
(874, 1, 118, 1, 2, 3, 7, 122, '2023-02-24 07:39:22', '2023-03-01 07:36:27'),
(875, 1, 120, 1, 1, 7, 1, 123, '2023-02-24 08:12:06', '2023-03-01 13:22:53'),
(876, 1, 120, 1, 1, 7, 6, 123, '2023-02-24 08:12:06', '2023-03-01 13:23:11'),
(877, 1, 120, 1, 1, 7, 7, 123, '2023-02-24 08:12:06', '2023-03-01 13:23:25'),
(878, 1, 121, 1, 2, 3, 1, 124, '2023-02-24 11:12:36', '2023-03-01 13:22:21'),
(879, 1, 121, 1, 2, 3, 6, 124, '2023-02-24 11:12:36', '2023-03-01 13:23:07'),
(880, 1, 121, 1, 2, 3, 7, 124, '2023-02-24 11:12:36', '2023-03-01 13:23:20'),
(881, 1, 119, 1, 1, 7, 1, 125, '2023-02-24 11:18:54', '2023-03-01 13:22:53'),
(882, 1, 119, 1, 1, 7, 6, 125, '2023-02-24 11:18:54', '2023-03-01 13:23:11'),
(883, 1, 119, 1, 1, 7, 7, 125, '2023-02-24 11:18:54', '2023-03-01 13:23:25'),
(884, 1, 122, 1, 2, 7, 1, 126, '2023-02-24 11:41:31', '2023-03-01 07:32:15'),
(885, 1, 122, 1, 2, 3, 6, 126, '2023-02-24 11:41:31', '2023-03-01 08:03:10'),
(886, 1, 122, 1, 2, 3, 7, 126, '2023-02-24 11:41:31', '2023-03-01 07:36:08'),
(887, 1, 123, 2, 2, 3, 1, 127, '2023-02-28 10:46:07', '2023-02-28 11:15:00'),
(888, 1, 123, 2, 2, 7, 6, 127, '2023-02-28 10:46:07', '2023-03-08 09:34:48'),
(889, 1, 123, 2, 2, 3, 7, 127, '2023-02-28 10:46:07', '2023-03-08 09:31:35');

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
(1, 'Super Administrador', 1, '2018-03-23 00:00:00', NULL),
(6, 'Administrador', 2, '2023-02-23 08:26:27', '2023-02-24 07:38:41'),
(7, 'Usuário', 3, '2023-02-24 07:38:50', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_paciente`
--

CREATE TABLE `adms_paciente` (
  `id` int(11) NOT NULL,
  `nome_paciente` varchar(220) NOT NULL,
  `telefone` varchar(220) DEFAULT NULL,
  `cpf_doc` varchar(220) NOT NULL,
  `endereco` varchar(220) DEFAULT NULL,
  `adms_situacao_paciente_id` int(11) NOT NULL,
  `atendido` int(11) NOT NULL DEFAULT 1,
  `baixa` int(11) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `editor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_paciente`
--

INSERT INTO `adms_paciente` (`id`, `nome_paciente`, `telefone`, `cpf_doc`, `endereco`, `adms_situacao_paciente_id`, `atendido`, `baixa`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(205, 'Paulo Albquerque', '11-99837-2022', '408.754.818-09', 'Avenida Agenor de Oliveira', 2, 2, 1, '2023-03-08 14:32:39', 1, '2023-03-08 14:33:04', 1),
(206, 'Luiz Gonzaga', '11-05515-5221', '408.754.818-00', 'Ceara', 1, 2, 1, '2023-03-08 14:41:53', 1, '2023-03-08 15:21:21', 1),
(208, 'José Bonifacio', '15-00000-0000', '000.000.000-05', 'Brasil - Portugal', 1, 1, 2, '2023-03-09 11:16:21', 1, NULL, NULL),
(209, 'Fernando Mesquita', '65-16505-1601', '651.968.489-40', 'Treze de maio', 1, 1, 1, '2023-03-09 11:28:05', 1, NULL, NULL),
(210, 'Manuel Gomes', '16-51651-6516', '551.651.651-65', 'Caneta azul', 2, 1, 1, '2023-03-09 15:52:57', 1, NULL, NULL);

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
(4, 'Sair', 'acesso/sair', 'Sair do ADM', 'Sair do ADM', 'Sair do ADM', 'Paulo Albuquerque', 1, 'fa fa-power-off', 0, 7, '1', 4, 1, '2018-03-23 00:00:00', '2023-02-28 07:29:33'),
(2, 'Login', 'acesso/login', 'Pagina de login do ADM', 'pagina login', 'pagina login', 'Paulo Albuquerque', 1, NULL, 0, 7, '1', 1, 1, '2018-03-23 00:00:00', NULL),
(3, 'Validar Login', 'acesso/valida', 'Validar Login', 'Validar Login', 'Validar Login', 'Paulo Albuquerque', 1, NULL, 2, 7, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(5, 'Usuários', 'listar/list_usuario', 'Pagina para listar usuarios', 'Listar usuarios', 'Listar usuarios', 'Paulo Albuquerque', 2, 'fas fa-users', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:41:39'),
(6, 'Níveis de Acesso', 'listar/list_niv_aces', 'Pagina para listar nivel de acesso', 'Listar nivel de acesso', 'Listar nivel de acesso', 'Paulo Albuquerque', 2, 'fas fa-key', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:41:27'),
(7, 'Telas', 'listar/list_pagina', 'Pagina para listar as paginas do ADM', 'Listar pagina', 'Listar pagina', 'Paulo Albuquerque', 2, 'fas fa-file-alt', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2023-03-08 13:26:24'),
(8, 'Menu', 'listar/list_menu', 'Pagina para listar os itens do menu', 'Pagina para listar os itens do menu', 'Pagina para listar os itens do menu', 'Paulo Albuquerque', 2, 'fab fa-elementor', 0, 1, '1', 4, 1, '2018-03-23 00:00:00', '2021-04-28 23:47:31'),
(9, 'Cadastrar nivel de Acesso', 'cadastrar/cad_niv_aces', 'Pagina para Cadastrar NÃ­vel de Acesso', 'Cadastrar Nivel de Acesso', 'Cadastrar Nivel de Acesso', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2018-03-23 00:00:00', '2023-03-01 07:29:17'),
(10, 'Visualizar nivel de acesso', 'visualizar/vis_niv_aces', 'Pagina para Visualizar nivel de acesso', 'Pagina para Visualizar nivel de acesso', 'Pagina para Visualizar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 5, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(11, 'Editar nivel de acesso', 'editar/edit_niv_aces', 'Pagina para editar nivel de acesso', 'Pagina para editar nivel de acesso', 'Pagina para editar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 3, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(12, 'Apagar nivel de acesso', 'processa/apagar/apagar_niv_aces', 'Pagina para apagar nivel de acesso', 'Pagina para apagar nivel de acesso', 'Pagina para apagar nivel de acesso', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-03-23 00:00:00', '2023-03-09 15:50:11'),
(13, 'Proc o form cadastrar nivel de acesso', 'processa/cadastrar/proc_cad_niv_aces', 'Processa o formulario cadastrar nivel de acesso', 'Processa o formulario cadastrar nivel de acesso', 'Processa o formulario cadastrar nivel de acesso', 'Paulo Albuquerque', 2, '', 9, 2, '1', 4, 1, '2018-03-23 00:00:00', '2023-03-09 15:46:45'),
(14, 'Proc o form editar nivel de acesso', 'processa/editar/proc_edit_niv_aces', NULL, 'Processa o formulario editar nivel de acesso', 'Processa o formulario editar nivel de acesso', 'Paulo Albuquerque', 2, NULL, 11, 3, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(15, 'Alterar ordem do nivel de acesso', 'processa/proc_ordem_niv_aces', 'Pagina para Alterar ordem do nivel de acesso', 'Alterar ordem do nivel de acesso', 'Alterar ordem do nivel de acesso', 'Paulo Albuquerque', 2, NULL, 0, 6, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(16, 'Cadastrar pagina', 'cadastrar/cad_pagina', 'Formulario para Cadastrar pagina', 'Cadastrar pagina', 'Cadastrar pagina', 'Paulo Albuquerque', 2, NULL, 0, 2, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(17, 'Procr o form cadastrar pagina', 'processa/cadastrar/proc_cad_pagina', 'Pagina para processar o formulario cadastrar pagina', 'Processar o formulario cadastrar pagina', 'Processar o formulario cadastrar pagina', 'Paulo Albuquerque', 2, NULL, 16, 2, '1', 4, 1, '2018-03-23 00:00:00', NULL),
(27, 'Proc Liberar PermissÃ£o', 'processa/proc_lib_per', 'PÃ¡gina para liberar permissÃ£o', 'Proc Liberar Permissao', 'Proc Liberar Permissao', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-21 21:56:03', NULL),
(26, 'PermissÃ£o', 'listar/list_permissao', 'PÃ¡gina para listar as permissÃµes', 'Permissao', 'Permissao', 'Paulo Albuquerque', 2, '', 0, 1, '1', 4, 1, '2018-03-21 20:16:19', NULL),
(21, 'Apagar Pagina', 'processa/apagar/apagar_pagina', 'PÃ¡gina para Apagar PÃ¡gina', 'Apagar Pagina', 'Apagar Pagina', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-03-19 18:06:40', '2023-03-09 15:50:16'),
(22, 'Visualizar Pagina', 'visualizar/vis_pagina', 'PÃ¡gina para visualizar detalhes da pÃ¡gina', 'Visualizar Pagina', 'Visualizar Pagina', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-03-21 12:39:49', '2023-03-01 07:29:53'),
(23, 'Editar Página', 'editar/edit_pagina', 'FormulÃ¡rio para Editar PÃ¡gina', 'Editar Pagina', 'Editar Pagina', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-21 16:43:09', '2021-04-28 23:45:13'),
(24, 'Proc form edita pagina', 'processa/editar/proc_edit_pagina', 'PÃ¡gina para processar o formulÃ¡rio editar a pÃ¡gina', 'Proc form edita pagina', 'Proc form edita pagina', 'Paulo Albuquerque', 2, '', 23, 3, '1', 4, 1, '2018-03-21 17:46:32', '2018-03-21 22:56:16'),
(28, 'Liberar Menu', 'processa/proc_lib_menu', 'PÃ¡gina para Liberar item Menu', 'Liberar Menu', 'Liberar Menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 17:14:57', NULL),
(29, 'Liberar Dropdown no menu', 'processa/proc_lib_dropdown', 'PÃ¡gina para Liberar Dropdown no menu', 'Liberar Dropdown no menu', 'Liberar Dropdown no menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 18:24:19', NULL),
(30, 'Alterar Ordem do Menu', 'processa/proc_ordem_menu', 'PÃ¡gina para Alterar Ordem do Menu', 'Alterar Ordem do Menu', 'Alterar Ordem do Menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 19:21:32', NULL),
(31, 'Sincronizar Paginas', 'processa/proc_sincro_nivac_pg', 'PÃ¡gina para Sincronizar Paginas com nÃ­vel de acesso', 'Sincronizar Paginas', 'Sincronizar Paginas', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 20:30:26', NULL),
(32, 'Editar í­cone do menu', 'editar/edit_permissao', 'PÃ¡gina para editar o Ã­cone do item do menu', 'Editar icone do menu', 'Editar icone do menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-03-22 22:15:13', '2021-04-28 23:45:38'),
(33, 'Proc form edita permissÃ£o', 'processa/editar/proc_edit_permissao', 'PÃ¡gina para processar o formulÃ¡rio editar permissÃ£o', 'Proc form edita permissÃ£o', 'Proc form edita permissÃ£o', 'Paulo Albuquerque', 2, '', 32, 3, '1', 4, 1, '2018-03-22 22:27:12', '2018-03-22 22:27:46'),
(34, 'Cadastrar Menu', 'cadastrar/cad_menu', 'PÃ¡gina para Cadastrar Menu', 'Cadastrar Menu', 'Cadastrar Menu', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2018-04-04 10:23:29', NULL),
(35, 'Proc Form Cad Menu', 'processa/cadastrar/proc_cad_menu', 'PÃ¡gina para processar o formulÃ¡rio cadastrar menu', 'Processar o formulario cadastrar menu', 'Processar o formulario cadastrar menu', 'Paulo Albuquerque', 2, '', 34, 2, '1', 4, 1, '2018-04-04 10:40:36', '2023-03-09 15:48:01'),
(36, 'Editar Menu', 'editar/edit_menu', 'FormulÃ¡rio para Editar Menu', 'Editar Menu', 'Editar Menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-04 12:26:09', '2018-04-04 12:27:40'),
(37, 'Proc Form Edit Menu', 'processa/editar/proc_edit_menu', 'Processar o formulÃ¡rio editar item de menu', 'Processar o formulario editar item de menu', 'Processar o formulario editar item de menu', 'Paulo Albuquerque', 2, '', 36, 3, '1', 4, 1, '2018-04-04 12:50:27', NULL),
(38, 'Visualizar Menu', 'visualizar/vis_menu', 'PÃ¡gina para Visualizar Menu', 'Visualizar Menu', 'Visualizar Menu', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-04-09 15:22:37', NULL),
(39, 'Apagar Menu', 'processa/apagar/apagar_menu', 'PÃ¡gina para Apagar Menu', 'Apagar Menu', 'Apagar Menu', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-04-09 15:54:43', '2023-03-09 15:50:23'),
(40, 'Alterar ordem item menu', 'processa/proc_ordem_menu_item', 'PÃ¡gina para alterar ordem item menu', 'Alterar ordem item menu', 'Alterar ordem item menu', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-12 12:12:17', NULL),
(41, 'Cadastrar usuário', 'cadastrar/cad_usuario', 'FormulÃ¡rio para cadastrar usuÃ¡rio', 'Cadastrar Usuario', 'Cadastrar Usuario', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2018-04-14 21:23:48', '2021-04-28 23:45:33'),
(42, 'Proc Form Cad User', 'processa/cadastrar/proc_cad_usuario', 'PÃ¡gina para processar a pÃ¡gina cadastrar usuÃ¡rio', 'Processar o formulario cadastrar usuario', 'Processar o formulario cadastrar usuario', 'Paulo Albuquerque', 2, '', 41, 2, '1', 4, 1, '2018-04-14 21:49:39', '2023-03-09 15:48:07'),
(43, 'Visualizar usuário', 'visualizar/vis_usuario', 'PÃ¡gina para visualizar usuÃ¡rio', 'visualizar usuario', 'visualizar usuario', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-04-20 17:50:56', '2023-03-01 07:29:07'),
(44, 'Editar usuário', 'editar/edit_usuario', 'FormulÃ¡rio para editar o usuÃ¡rio', 'Formulario para editar o usuario', 'Formulario para editar o usuario', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-22 09:00:33', '2021-04-28 23:51:00'),
(45, 'Proc Form Edit Usuario', 'processa/editar/proc_edit_usuario', 'PÃ¡gina para processar o formulÃ¡rio editar usuÃ¡rio', 'Pagina para processar o formulÃ¡rio editar usuario', 'Pagina para processar o formulÃ¡rio editar usuario', 'Paulo Albuquerque', 2, '', 44, 3, '1', 4, 1, '2018-04-22 09:50:59', NULL),
(46, 'Apagar usuario', 'processa/apagar/apagar_usuario', 'pagina para apagar  usuario', 'Apagar usuario', 'Apagar usuario', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2018-04-22 11:18:16', '2023-03-09 15:50:03'),
(47, 'Visualizar Perfil', 'visualizar/vis_perfil', 'UsuÃ¡rio Visualizar Perfil', 'Visualizar Perfil', 'Visualizar Perfil', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2018-04-22 13:50:45', NULL),
(48, 'Editar Perfil', 'editar/edit_perfil', 'FormulÃ¡rio para Editar Perfil', 'Editar Perfil', 'Editar Perfil', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2018-04-22 14:04:38', NULL),
(49, 'Proc Form Edit Perfil', 'processa/editar/proc_edit_perfil', 'PÃ¡gina para processar o formulÃ¡rio editar perfil', 'Processar o formulario editar perfil', 'Processar o formulario editar perfil', 'Paulo Albuquerque', 2, '', 48, 3, '1', 4, 1, '2018-04-22 14:15:52', NULL),
(50, 'Cadastrar usuario no login', 'cadastrar/cad_user_login', 'pagina  para cadastrar usuário no login', 'Cadastrar usuario no login', 'Cadastrar usuario no login', 'Paulo Albuquerque', 1, '', 0, 2, '1', 4, 1, '2018-05-01 15:38:25', '2023-03-01 07:30:42'),
(51, 'Cadastro Login', 'editar/edit_cad_user_login', 'FormulÃ¡rio para editar o nÃ­vel de acesso e a situaÃ§Ã£o do formulÃ¡rio cadastrar usuÃ¡rio na pÃ¡gina de login', 'Editar Cadastro Usuario login', 'Editar Cadastro Usuario login', 'Paulo Albuquerque', 2, 'fas fa-edit', 0, 3, '1', 4, 1, '2018-05-01 16:40:55', '2018-05-01 17:00:44'),
(52, 'Proc Form Cad User Login', 'processa/cadastrar/proc_cad_user_login', 'PÃ¡gina para processar o formulÃ¡rio utilizado para editar o nÃ­vel de acesso e a situaÃ§Ã£o do formulÃ¡rio cadastrar usuÃ¡rio atravÃ©s da pÃ¡gina de login', 'Formulario cadastrar usuario no login', 'Formulario cadastrar usuario no login', 'Paulo Albuquerque', 2, '', 51, 3, '1', 4, 1, '2018-05-01 17:06:00', '2023-03-09 15:48:28'),
(53, 'Credenciais E-mail', 'editar/edit_cred_email', 'FormulÃ¡rio para editar as credenciais de envio de e-mail', 'Credenciais E-mail', 'Credenciais E-mail', 'Paulo Albuquerque', 2, 'fas fa-at', 0, 3, '1', 4, 1, '2018-05-02 23:57:08', '2018-05-02 23:57:35'),
(54, 'Processar formulario credenciais e-mail', 'processa/editar/proc_edit_cred_email', 'Pagina para processar o formulario  editar credenciais de envio de e-mail', 'Processar formulario credenciais e-mail', 'Processar formulario credenciais e-mail', 'Paulo Albuquerque', 2, '', 53, 3, '1', 4, 1, '2018-05-03 00:04:59', '2023-03-01 07:31:00'),
(55, 'Validar E-mail', 'acesso/valida_email', 'PÃ¡gina para validar e-mail', 'Validar E-mail', 'Validar E-mail', 'Paulo Albuquerque', 1, '', 0, 3, '1', 4, 1, '2018-05-04 12:42:15', NULL),
(56, 'Recuperar Login', 'acesso/recuper_login', 'FormulÃ¡rio para recuperar login', 'Recuperar Login', 'Recuperar Login', 'Paulo Albuquerque', 1, '', 0, 7, '1', 4, 1, '2018-05-04 13:10:17', NULL),
(57, 'Atualizar a Senha', 'acesso/atual_senha', 'FormulÃ¡rio para atualizar a senha', 'Atualizar a Senha', 'Atualizar a Senha', 'Paulo Albuquerque', 1, '', 0, 7, '1', 4, 1, '2018-05-05 16:36:02', NULL),
(128, 'Processa o cadastro da avaliação', 'processa/cadastrar/proc_cad_avaliacao', 'Processa o cadastro da avaliação', 'Processa o cadastro da avaliação', 'Processa o cadastro da avaliação', 'Paulo Albuquerque', 2, '', 127, 2, '1', 4, 1, '2023-03-01 11:25:56', '2023-03-09 15:48:24'),
(129, 'Editar paciente', 'editar/edit_paciente', 'Editar paciente', 'Editar paciente', 'Editar paciente', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2023-03-02 15:13:03', NULL),
(130, 'Litando avaliações feitas', 'listar/list_avaliacoes', 'Litando avaliações feitas', 'Litando avaliações feitas', 'Litando avaliações feitas', 'Paulo Albuquerque', 2, '', 0, 1, '1', 4, 1, '2023-03-08 10:02:56', NULL),
(131, 'processa lista avaliações feitas', 'listar/list_avaliacaoes_tables', 'processa lista  de avaliações feitas', 'processa lista avaliações feitas', 'processa lista avaliações feitas', 'Paulo Albuquerque', 2, '', 130, 1, '1', 4, 1, '2023-03-08 15:29:04', NULL),
(132, 'Visualizar paciente', 'visualizar/vis_paciente', 'Visualizar detalhes dos pacientes', 'Visualizar paciente', 'Visualizar paciente', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2023-03-09 10:08:03', NULL),
(133, 'Apagar paciente', 'processa/apagar/apagar_paciente', 'apagar registro de paciente do sistema', 'Apagar paciente', 'Apagar paciente', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2023-03-09 10:47:36', '2023-03-09 15:49:57'),
(134, 'Processa editar de paciente', 'processa/editar/proc_edit_paciente', 'Processa editar de paciente', 'Processa editar de paciente', 'Processa editar de paciente', 'Paulo Albuquerque', 2, '', 129, 3, '1', 4, 1, '2023-03-09 15:26:21', NULL),
(122, 'list_usuario_tables', 'listar/list_usuario_tables', 'list_usuario_tables', 'list_usuario_tables', 'list_usuario_tables', 'Paulo Albuquerque', 2, '', 0, 1, '1', 4, 1, '2022-03-21 21:27:21', '2023-02-24 12:43:32'),
(123, 'Cadastro de paciente', 'cadastrar/cad_paciente', 'cadastrar os pacientes ', 'cadastrar os pacientes', 'cadastrar os pacientes', 'Paulo Albuquerque', 2, 'fa fa-medkit', 0, 2, '1', 4, 1, '2023-02-24 08:12:06', '2023-03-01 08:04:16'),
(124, 'Processamento de cadastro paciente', 'processa/cadastrar/proc_cad_paciente', 'Processamento de cadastro paciente', 'Processamento de cadastro paciente', 'Processamento de cadastro paciente', 'Paulo Albuquerque', 2, '', 123, 2, '1', 4, 1, '2023-02-24 11:12:36', '2023-03-09 15:48:18'),
(125, 'Pacientes', 'listar/list_paciente', 'Listar os pacientes', 'Listar os pacientes', 'Listar os pacientes', 'Paulo Albuquerque', 2, 'fa fa-male', 0, 1, '1', 4, 1, '2023-02-24 11:18:54', '2023-03-01 08:03:19'),
(126, 'Pacientes listado DATATABLES', 'listar/list_pacientes_tables', 'Listando os pacientes com o datatebles (list_pacientes_tables)', 'list_pacientes_tables', 'list_pacientes_tables', 'Paulo Albuquerque', 2, '', 0, 1, '1', 4, 1, '2023-02-24 11:41:31', '2023-03-01 07:31:24'),
(127, 'Cadastrar avaliação do leito', 'cadastrar/cad_avaliacao', 'Página para efetuar o cadastro do paciente em relação ao leito !', 'Cadastrar avaliação do leito', 'Cadastrar avaliação do leito', 'Paulo Albuquerque', 2, '', 0, 2, '1', 4, 1, '2023-02-28 10:46:07', '2023-03-01 08:03:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_pergunta`
--

CREATE TABLE `adms_pergunta` (
  `id` int(11) NOT NULL,
  `descricao_pergunta` varchar(330) NOT NULL,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `editor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_pergunta`
--

INSERT INTO `adms_pergunta` (`id`, `descricao_pergunta`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(1, 'Recepção', '2023-02-28 18:04:01', 1, NULL, NULL),
(2, 'Organização e limpeza', '2023-02-28 18:05:35', 1, NULL, NULL),
(3, 'Estrutura física (Acomodação, iluminação, climatização)', '2023-02-28 19:17:53', 1, NULL, NULL),
(4, 'Equipe Médica', '2023-02-28 19:18:34', 1, NULL, NULL),
(5, 'Equipe de Enfermagem', '2023-02-28 19:18:34', 1, NULL, NULL),
(6, 'Equipe Multidisciplinar (assistente social, fisioterapia, psicólogo, nutricionista, fonoaudiólogo, dentista, farmacêutico)', '2023-02-28 19:18:34', 1, NULL, NULL),
(7, 'Assistência Farmacêutica', '2023-02-28 19:18:34', 1, NULL, NULL),
(8, 'Equipe de coleta (exame de laboratório)', '2023-02-28 19:18:34', 1, NULL, NULL),
(9, 'Realização de outros exames', '2023-02-28 19:18:34', 1, NULL, NULL),
(10, 'Qualidade da alimentação', '2023-02-28 19:18:34', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_resposta`
--

CREATE TABLE `adms_resposta` (
  `id` int(11) NOT NULL,
  `descricao_resposta` varchar(220) NOT NULL,
  `icon_ico` varchar(300) DEFAULT NULL,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `editor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_resposta`
--

INSERT INTO `adms_resposta` (`id`, `descricao_resposta`, `icon_ico`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(1, 'Ruim', '<i class=\'fa fa-frown-o\' aria-hidden=\'true\'></i>', '2023-02-24 11:43:52', 1, NULL, NULL),
(2, 'Boa', '<i class=\'fa fa-smile-o\' aria-hidden=\'true\'></i>', '2023-02-24 11:43:52', 1, NULL, NULL),
(3, 'Excelente', '<i class=\'fa fa-heart-o\' aria-hidden=\'true\'></i>', '2023-02-24 11:44:09', 1, NULL, NULL),
(4, 'Nao Utilizei', '<i class=\"fa fa-window-close\" aria-hidden=\"true\"></i>', '2023-02-24 11:44:09', 1, NULL, NULL);

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
-- Estrutura da tabela `adms_situacao_paciente`
--

CREATE TABLE `adms_situacao_paciente` (
  `id` int(11) NOT NULL,
  `descricao_situacao` varchar(220) NOT NULL,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `editor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_situacao_paciente`
--

INSERT INTO `adms_situacao_paciente` (`id`, `descricao_situacao`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(1, 'Paciente', '2023-02-24 14:51:31', 1, NULL, NULL),
(2, 'Acompanhante', '2023-02-24 14:51:31', 1, NULL, NULL);

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
(1, 'adms', 'Administrativo', 'Administrativo', 1, '2023-02-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_usuarios`
--

CREATE TABLE `adms_usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `apelido` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `num_cracha` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `adms_usuarios` (`id`, `nome`, `apelido`, `email`, `num_cracha`, `usuario`, `senha`, `recuperar_senha`, `chave_descadastro`, `conf_email`, `imagem`, `adms_niveis_acesso_id`, `adms_sits_usuario_id`, `created`, `modified`) VALUES
(1, 'Paulo Albuquerque', 'Paulo', 'paulo.albuquerque@ints.org.br', '18569', 'paulo.albuquerque', '$2y$10$WSFg.JKfk9sF5/tXqhxSke8DyKVnf5D1X8cx6w7KqXLDjIraI5NVK', NULL, NULL, NULL, 'b48123f3-5c5c-450d-a362-2215fd4c348e-copia.jpg', 1, 1, '2022-04-30 19:49:14', '2023-02-28 10:14:34'),
(5, 'Usuário Administrador', 'Administrador', 'admin@admin.com', '00141', 'admin', '$2y$10$KzIOFEGZGTgY5ey4WZTb3Oxeydybh2mOducrLPBRXj4BeX4VjJL/C', NULL, NULL, NULL, NULL, 6, 1, '2023-03-01 07:44:04', '2023-03-08 14:38:42');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adms_avaliacao_feita`
--
ALTER TABLE `adms_avaliacao_feita`
  ADD PRIMARY KEY (`id`);

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
-- Índices para tabela `adms_paciente`
--
ALTER TABLE `adms_paciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_paginas`
--
ALTER TABLE `adms_paginas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_pergunta`
--
ALTER TABLE `adms_pergunta`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_resposta`
--
ALTER TABLE `adms_resposta`
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
-- Índices para tabela `adms_situacao_paciente`
--
ALTER TABLE `adms_situacao_paciente`
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
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adms_avaliacao_feita`
--
ALTER TABLE `adms_avaliacao_feita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `adms_nivacs_pgs`
--
ALTER TABLE `adms_nivacs_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=911;

--
-- AUTO_INCREMENT de tabela `adms_niveis_acessos`
--
ALTER TABLE `adms_niveis_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `adms_paciente`
--
ALTER TABLE `adms_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT de tabela `adms_paginas`
--
ALTER TABLE `adms_paginas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de tabela `adms_pergunta`
--
ALTER TABLE `adms_pergunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `adms_resposta`
--
ALTER TABLE `adms_resposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT de tabela `adms_situacao_paciente`
--
ALTER TABLE `adms_situacao_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `adms_tps_pgs`
--
ALTER TABLE `adms_tps_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `adms_usuarios`
--
ALTER TABLE `adms_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
