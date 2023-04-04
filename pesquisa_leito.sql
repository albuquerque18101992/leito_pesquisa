-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Abr-2023 às 21:42
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
-- Estrutura da tabela `adms_andar`
--

CREATE TABLE `adms_andar` (
  `id` int(11) NOT NULL,
  `nome_andar` varchar(220) NOT NULL,
  `num_andar` varchar(220) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_andar`
--

INSERT INTO `adms_andar` (`id`, `nome_andar`, `num_andar`, `created`) VALUES
(1, 'Andar 7', '7ª', '2023-03-29 13:53:56'),
(2, 'Andar 8', '8ª', '2023-03-29 13:54:36');

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
(7, 'Acesso', 7, '2018-03-23 00:00:00', NULL),
(8, 'Exportar', 8, '2023-03-15 13:59:37', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_leitos`
--

CREATE TABLE `adms_leitos` (
  `id` int(11) NOT NULL,
  `num_andar` int(11) NOT NULL,
  `sala_num` int(11) NOT NULL,
  `leito_num` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `editor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_leitos`
--

INSERT INTO `adms_leitos` (`id`, `num_andar`, `sala_num`, `leito_num`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(1, 8, 1, 801, '2023-03-27 19:09:51', 1, NULL, NULL),
(2, 8, 2, 802, '2023-03-27 19:09:51', 1, NULL, NULL),
(3, 8, 2, 803, '2023-03-27 19:09:51', 1, NULL, NULL),
(4, 8, 3, 804, '2023-03-27 19:12:19', 1, NULL, NULL),
(5, 8, 3, 805, '2023-03-27 19:12:19', 1, NULL, NULL),
(6, 8, 4, 806, '2023-03-27 19:22:41', 1, NULL, NULL),
(7, 8, 4, 807, '2023-03-27 19:22:41', 1, NULL, NULL),
(8, 8, 4, 808, '2023-03-27 19:22:41', 1, NULL, NULL),
(9, 8, 5, 809, '2023-03-27 19:23:36', 1, NULL, NULL),
(10, 8, 5, 810, '2023-03-27 19:23:36', 1, NULL, NULL),
(11, 8, 6, 811, '2023-03-27 19:24:05', 1, NULL, NULL),
(12, 8, 6, 812, '2023-03-27 19:24:05', 1, NULL, NULL),
(13, 8, 7, 813, '2023-03-27 19:24:46', 1, NULL, NULL),
(14, 8, 7, 814, '2023-03-27 19:24:46', 1, NULL, NULL),
(15, 8, 7, 815, '2023-03-27 19:24:46', 1, NULL, NULL),
(16, 8, 7, 816, '2023-03-27 19:24:46', 1, NULL, NULL),
(17, 8, 8, 817, '2023-03-27 19:25:44', 1, NULL, NULL),
(18, 8, 8, 818, '2023-03-27 19:25:44', 1, NULL, NULL),
(19, 8, 9, 819, '2023-03-27 19:26:11', 1, NULL, NULL),
(20, 8, 9, 820, '2023-03-27 19:26:11', 1, NULL, NULL),
(21, 8, 10, 821, '2023-03-27 19:26:43', 1, NULL, NULL),
(22, 8, 10, 822, '2023-03-27 19:26:43', 1, NULL, NULL),
(23, 8, 11, 823, '2023-03-27 19:27:10', 1, NULL, NULL),
(24, 8, 11, 824, '2023-03-27 19:27:10', 1, NULL, NULL),
(25, 8, 11, 825, '2023-03-27 19:27:10', 1, NULL, NULL),
(26, 8, 12, 826, '2023-03-27 19:27:53', 1, NULL, NULL),
(27, 8, 12, 827, '2023-03-27 19:27:53', 1, NULL, NULL),
(28, 8, 12, 828, '2023-03-27 19:27:53', 1, NULL, NULL),
(29, 8, 12, 829, '2023-03-27 19:27:53', 1, NULL, NULL),
(30, 8, 13, 830, '2023-03-27 19:28:49', 1, NULL, NULL),
(31, 7, 1, 701, '2023-03-29 14:02:51', 1, NULL, NULL),
(32, 7, 2, 702, '2023-03-29 14:21:56', 1, NULL, NULL),
(33, 7, 2, 703, '2023-03-29 14:21:56', 1, NULL, NULL),
(34, 7, 3, 704, '2023-03-29 14:22:35', 1, NULL, NULL),
(35, 7, 3, 705, '2023-03-29 14:23:25', 1, NULL, NULL),
(36, 7, 4, 706, '2023-03-29 14:23:39', 1, NULL, NULL),
(37, 7, 4, 707, '2023-03-29 14:23:39', 1, NULL, NULL),
(38, 7, 4, 708, '2023-03-29 14:23:39', 1, NULL, NULL),
(39, 7, 5, 709, '2023-03-29 14:24:44', 1, NULL, NULL),
(40, 7, 5, 710, '2023-03-29 14:24:44', 1, NULL, NULL),
(41, 7, 6, 711, '2023-03-29 14:25:23', 1, NULL, NULL),
(42, 7, 6, 712, '2023-03-29 14:25:23', 1, NULL, NULL),
(43, 7, 7, 713, '2023-03-29 14:25:53', 1, NULL, NULL),
(44, 7, 7, 714, '2023-03-29 14:25:53', 1, NULL, NULL),
(45, 7, 7, 715, '2023-03-29 14:25:53', 1, NULL, NULL),
(46, 7, 7, 716, '2023-03-29 14:25:53', 1, NULL, NULL),
(47, 7, 8, 717, '2023-03-29 14:26:40', 1, NULL, NULL),
(48, 7, 8, 718, '2023-03-29 14:26:40', 1, NULL, NULL),
(49, 7, 9, 719, '2023-03-29 14:27:38', 1, NULL, NULL),
(50, 7, 9, 720, '2023-03-29 14:27:38', 1, NULL, NULL),
(51, 7, 10, 721, '2023-03-29 14:28:04', 1, NULL, NULL),
(52, 7, 10, 722, '2023-03-29 14:28:04', 1, NULL, NULL),
(53, 7, 11, 723, '2023-03-29 14:29:18', 1, NULL, NULL),
(54, 7, 11, 724, '2023-03-29 14:29:18', 1, NULL, NULL),
(55, 7, 11, 725, '2023-03-29 14:29:18', 1, NULL, NULL),
(56, 7, 12, 726, '2023-03-29 14:29:58', 1, NULL, NULL),
(57, 7, 12, 727, '2023-03-29 14:29:58', 1, NULL, NULL),
(58, 7, 12, 728, '2023-03-29 14:29:58', 1, NULL, NULL),
(59, 7, 12, 729, '2023-03-29 14:29:58', 1, NULL, NULL),
(60, 7, 13, 730, '2023-03-29 14:30:43', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_leitos_questoes`
--

CREATE TABLE `adms_leitos_questoes` (
  `id` int(11) NOT NULL,
  `adms_leito_id` int(11) NOT NULL,
  `adms_paciente_id` int(11) NOT NULL,
  `questao1` int(11) NOT NULL,
  `questao2` int(11) NOT NULL,
  `questao3` int(11) NOT NULL,
  `questao4` int(11) NOT NULL,
  `questao5` int(11) NOT NULL,
  `questao6` int(11) NOT NULL,
  `questao7` int(11) NOT NULL,
  `questao8` int(11) NOT NULL,
  `questao9` int(11) NOT NULL,
  `questao10` int(11) NOT NULL,
  `nota_avaliacao` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `cadastrador` int(11) NOT NULL,
  `editor` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_leitos_questoes`
--

INSERT INTO `adms_leitos_questoes` (`id`, `adms_leito_id`, `adms_paciente_id`, `questao1`, `questao2`, `questao3`, `questao4`, `questao5`, `questao6`, `questao7`, `questao8`, `questao9`, `questao10`, `nota_avaliacao`, `created`, `cadastrador`, `editor`, `modified`) VALUES
(87, 4, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 10, '2023-03-30 12:58:25', 1, NULL, NULL),
(88, 31, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 5, '2023-03-30 13:27:41', 1, NULL, NULL),
(89, 30, 1, 2, 3, 1, 2, 1, 4, 2, 1, 2, 2, 4, '2023-03-30 13:49:05', 1, NULL, NULL),
(90, 9, 2, 2, 1, 3, 2, 2, 3, 3, 3, 3, 2, 7, '2023-03-30 13:49:19', 1, NULL, NULL),
(91, 28, 5, 3, 1, 1, 4, 2, 3, 2, 2, 4, 1, 5, '2023-03-30 13:55:18', 3, NULL, NULL),
(92, 26, 6, 3, 2, 1, 2, 1, 2, 1, 1, 2, 2, 8, '2023-03-30 14:09:06', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_log_usuaios`
--

CREATE TABLE `adms_log_usuaios` (
  `id` int(11) NOT NULL,
  `adms_usuario_id` int(11) NOT NULL,
  `nome_logado` varchar(220) NOT NULL,
  `usuario_logado` varchar(220) NOT NULL,
  `adms_niveis_acesso_id` int(11) NOT NULL,
  `ip_maquina_acesso` varchar(220) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adms_log_usuaios`
--

INSERT INTO `adms_log_usuaios` (`id`, `adms_usuario_id`, `nome_logado`, `usuario_logado`, `adms_niveis_acesso_id`, `ip_maquina_acesso`, `created`) VALUES
(1, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-28 14:44:52'),
(2, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-28 15:22:09'),
(3, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-29 08:41:20'),
(4, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-29 08:49:12'),
(5, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-29 11:11:34'),
(6, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-29 13:18:00'),
(7, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-29 13:46:18'),
(8, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-29 13:46:33'),
(9, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-30 07:55:41'),
(10, 3, 'Lucas Ferreira Teixeira', '', 6, '::1', '2023-03-30 13:50:44'),
(11, 1, 'Paulo Albuquerque', '', 1, '::1', '2023-03-30 13:51:52'),
(12, 4, 'Usuario teste', '', 7, '::1', '2023-03-30 14:04:37'),
(13, 1, 'Paulo Albuquerque', 'paulo.albuquerque', 1, '::1', '2023-03-30 14:36:41'),
(14, 1, 'Paulo Albuquerque', 'paulo.albuquerque', 1, '::1', '2023-03-31 08:44:10');

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
(2, 'Usuário', 'fas fa-user', 2, 1, '2018-03-23 00:00:00', '2023-03-21 15:05:50'),
(3, 'Menu', 'fas fa-list-ul', 3, 1, '2018-03-23 00:00:00', '2018-04-12 12:21:49'),
(4, 'Sair', 'fa fa-power-off', 6, 1, '2018-03-23 00:00:00', '2023-03-01 10:57:57'),
(5, 'Configurações', 'fas fa-cogs', 5, 1, '2018-05-01 16:54:42', '2023-02-28 08:43:17'),
(7, 'Paciente', 'fa fa-heartbeat', 4, 1, '2023-02-24 09:57:17', '2023-03-30 10:26:26');

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
(934, 2, 136, 1, 2, 3, 7, 142, '2023-03-30 14:21:37', NULL),
(901, 2, 127, 1, 2, 3, 7, 131, '2023-03-08 15:29:04', NULL),
(922, 1, 134, 2, 2, 3, 7, 138, '2023-03-15 09:59:01', '2023-03-30 14:06:35'),
(919, 1, 133, 2, 2, 3, 7, 137, '2023-03-15 09:27:30', '2023-03-30 14:06:32'),
(931, 1, 135, 1, 2, 3, 7, 141, '2023-03-30 10:29:40', '2023-03-30 14:06:27'),
(913, 2, 131, 2, 2, 3, 7, 135, '2023-03-15 09:19:06', '2023-03-30 14:08:19'),
(907, 2, 129, 2, 2, 3, 7, 133, '2023-03-09 10:47:36', '2023-03-30 14:08:21'),
(910, 1, 130, 1, 2, 3, 7, 134, '2023-03-09 15:26:21', '2023-03-21 13:50:42'),
(895, 1, 125, 2, 2, 3, 7, 129, '2023-03-02 15:13:03', '2023-03-21 13:52:54'),
(892, 1, 124, 1, 2, 3, 7, 128, '2023-03-01 11:25:56', '2023-03-08 09:31:35'),
(904, 1, 128, 2, 2, 3, 7, 132, '2023-03-09 10:08:03', '2023-03-30 14:08:22'),
(898, 1, 126, 2, 2, 3, 7, 130, '2023-03-08 10:02:56', '2023-03-30 14:08:24'),
(916, 1, 132, 2, 2, 3, 7, 136, '2023-03-15 09:23:16', '2023-03-30 14:06:30'),
(636, 1, 118, 2, 2, 3, 1, 122, '2022-03-21 21:27:21', '2022-03-21 21:28:08'),
(639, 1, 1, 2, 1, 1, 6, 1, '2023-02-23 08:26:35', '2023-03-01 07:59:59'),
(640, 1, 2, 2, 1, 4, 6, 4, '2023-02-23 08:26:35', '2023-03-01 08:00:00'),
(641, 1, 3, 2, 2, 3, 6, 2, '2023-02-23 08:26:35', '2023-03-30 13:53:46'),
(642, 1, 4, 1, 2, 3, 6, 3, '2023-02-23 08:26:35', NULL),
(643, 1, 5, 1, 1, 2, 6, 5, '2023-02-23 08:26:35', '2023-03-30 13:57:23'),
(644, 2, 6, 2, 2, 2, 6, 6, '2023-02-23 08:26:35', '2023-03-30 13:57:46'),
(645, 2, 7, 2, 2, 5, 6, 7, '2023-02-23 08:26:35', '2023-03-30 13:53:49'),
(646, 2, 8, 2, 2, 5, 6, 8, '2023-02-23 08:26:35', '2023-03-30 13:53:50'),
(647, 2, 9, 2, 2, 2, 6, 9, '2023-02-23 08:26:35', '2023-03-30 13:53:54'),
(648, 1, 10, 2, 2, 2, 6, 10, '2023-02-23 08:26:35', '2023-03-30 13:53:57'),
(649, 2, 11, 2, 2, 2, 6, 11, '2023-02-23 08:26:35', '2023-03-30 13:53:57'),
(650, 2, 12, 2, 2, 2, 6, 12, '2023-02-23 08:26:35', '2023-03-30 13:53:58'),
(651, 2, 13, 1, 2, 2, 6, 13, '2023-02-23 08:26:35', NULL),
(652, 2, 14, 1, 2, 2, 6, 14, '2023-02-23 08:26:35', NULL),
(653, 2, 15, 2, 2, 2, 6, 15, '2023-02-23 08:26:35', '2023-03-30 13:53:58'),
(654, 2, 16, 2, 2, 3, 6, 16, '2023-02-23 08:26:35', '2023-03-30 13:53:59'),
(655, 2, 17, 1, 2, 3, 6, 17, '2023-02-23 08:26:35', NULL),
(656, 2, 18, 2, 2, 3, 6, 27, '2023-02-23 08:26:35', '2023-03-30 13:53:59'),
(657, 2, 19, 2, 2, 3, 6, 26, '2023-02-23 08:26:35', '2023-03-30 13:54:00'),
(658, 2, 20, 2, 2, 3, 6, 21, '2023-02-23 08:26:35', '2023-03-30 13:54:00'),
(659, 2, 21, 2, 2, 3, 6, 22, '2023-02-23 08:26:35', '2023-03-30 13:54:01'),
(660, 2, 22, 2, 2, 3, 6, 23, '2023-02-23 08:26:35', '2023-03-30 13:54:01'),
(661, 2, 23, 1, 2, 3, 6, 24, '2023-02-23 08:26:35', NULL),
(662, 2, 24, 2, 2, 3, 6, 28, '2023-02-23 08:26:35', '2023-03-30 13:54:02'),
(663, 2, 25, 2, 2, 3, 6, 29, '2023-02-23 08:26:35', '2023-03-30 13:54:02'),
(664, 2, 26, 2, 2, 3, 6, 30, '2023-02-23 08:26:35', '2023-03-30 13:54:03'),
(665, 2, 27, 2, 2, 3, 6, 31, '2023-02-23 08:26:35', '2023-03-30 13:54:04'),
(666, 2, 28, 2, 2, 3, 6, 32, '2023-02-23 08:26:35', '2023-03-30 13:54:11'),
(667, 2, 29, 1, 2, 3, 6, 33, '2023-02-23 08:26:35', NULL),
(668, 2, 30, 2, 2, 3, 6, 34, '2023-02-23 08:26:35', '2023-03-30 13:54:12'),
(669, 2, 31, 1, 2, 3, 6, 35, '2023-02-23 08:26:35', NULL),
(670, 2, 32, 2, 2, 3, 6, 36, '2023-02-23 08:26:35', '2023-03-30 13:54:12'),
(671, 2, 33, 1, 2, 3, 6, 37, '2023-02-23 08:26:35', NULL),
(672, 2, 34, 2, 2, 3, 6, 38, '2023-02-23 08:26:35', '2023-03-30 13:54:14'),
(673, 2, 35, 2, 2, 3, 6, 39, '2023-02-23 08:26:35', '2023-03-30 13:54:15'),
(674, 2, 36, 2, 2, 3, 6, 40, '2023-02-23 08:26:35', '2023-03-30 13:54:08'),
(675, 2, 37, 2, 2, 3, 6, 41, '2023-02-23 08:26:35', '2023-03-30 13:54:16'),
(676, 2, 38, 1, 2, 3, 6, 42, '2023-02-23 08:26:35', NULL),
(677, 1, 39, 2, 2, 3, 6, 43, '2023-02-23 08:26:35', '2023-03-30 13:54:17'),
(678, 1, 40, 2, 2, 3, 6, 44, '2023-02-23 08:26:35', '2023-03-30 13:54:18'),
(679, 1, 41, 1, 2, 3, 6, 45, '2023-02-23 08:26:35', '2023-03-01 08:23:13'),
(680, 2, 42, 2, 2, 3, 6, 46, '2023-02-23 08:26:35', '2023-03-30 13:54:19'),
(681, 1, 43, 2, 2, 3, 6, 47, '2023-02-23 08:26:35', '2023-03-30 13:54:19'),
(682, 1, 44, 2, 2, 3, 6, 48, '2023-02-23 08:26:35', '2023-03-30 13:54:20'),
(683, 1, 45, 1, 2, 3, 6, 49, '2023-02-23 08:26:35', '2023-03-01 08:22:06'),
(684, 1, 46, 2, 2, 3, 6, 50, '2023-02-23 08:26:35', '2023-03-30 13:54:22'),
(685, 2, 47, 2, 2, 5, 6, 51, '2023-02-23 08:26:35', '2023-03-30 13:54:23'),
(686, 2, 48, 1, 2, 3, 6, 52, '2023-02-23 08:26:35', NULL),
(687, 2, 49, 2, 2, 5, 6, 53, '2023-02-23 08:26:35', '2023-03-30 13:54:24'),
(688, 2, 50, 1, 2, 3, 6, 54, '2023-02-23 08:26:35', NULL),
(689, 1, 51, 2, 2, 3, 6, 55, '2023-02-23 08:26:35', '2023-03-30 13:54:25'),
(690, 1, 52, 2, 2, 3, 6, 56, '2023-02-23 08:26:35', '2023-03-30 13:54:25'),
(691, 1, 53, 2, 2, 3, 6, 57, '2023-02-23 08:26:35', '2023-03-30 13:54:25'),
(933, 2, 136, 1, 2, 3, 6, 142, '2023-03-30 14:21:37', NULL),
(900, 2, 127, 1, 2, 3, 6, 131, '2023-03-08 15:29:04', NULL),
(921, 1, 134, 2, 2, 3, 6, 138, '2023-03-15 09:59:01', '2023-03-30 13:53:33'),
(918, 1, 133, 2, 2, 3, 6, 137, '2023-03-15 09:27:30', '2023-03-30 13:54:52'),
(930, 1, 135, 1, 2, 3, 6, 141, '2023-03-30 10:29:40', '2023-03-30 13:54:49'),
(912, 2, 131, 2, 2, 3, 6, 135, '2023-03-15 09:19:06', '2023-03-30 13:54:34'),
(906, 2, 129, 2, 2, 3, 6, 133, '2023-03-09 10:47:36', '2023-03-30 13:54:33'),
(909, 1, 130, 1, 2, 3, 6, 134, '2023-03-09 15:26:21', '2023-03-30 13:52:31'),
(894, 1, 125, 2, 2, 3, 6, 129, '2023-03-02 15:13:03', '2023-03-30 13:52:37'),
(891, 1, 124, 1, 2, 3, 6, 128, '2023-03-01 11:25:56', '2023-03-08 09:34:48'),
(903, 1, 128, 2, 2, 3, 6, 132, '2023-03-09 10:08:03', '2023-03-30 13:52:46'),
(897, 1, 126, 2, 2, 3, 6, 130, '2023-03-08 10:02:56', '2023-03-30 13:54:39'),
(915, 1, 132, 2, 2, 3, 6, 136, '2023-03-15 09:23:16', '2023-03-30 13:54:49'),
(756, 2, 118, 2, 2, 3, 6, 122, '2023-02-23 08:26:36', '2023-03-30 13:54:26'),
(757, 1, 1, 2, 1, 1, 7, 1, '2023-02-24 07:39:21', '2023-03-01 07:37:28'),
(758, 1, 2, 2, 1, 4, 7, 4, '2023-02-24 07:39:21', '2023-03-01 07:37:35'),
(759, 1, 3, 2, 2, 3, 7, 2, '2023-02-24 07:39:21', '2023-03-30 14:06:37'),
(760, 1, 4, 1, 2, 3, 7, 3, '2023-02-24 07:39:21', NULL),
(761, 2, 5, 2, 2, 2, 7, 5, '2023-02-24 07:39:21', '2023-03-30 14:07:41'),
(762, 2, 6, 2, 2, 2, 7, 6, '2023-02-24 07:39:21', '2023-03-30 14:07:42'),
(763, 2, 7, 2, 2, 5, 7, 7, '2023-02-24 07:39:21', '2023-03-30 14:07:43'),
(764, 2, 8, 2, 2, 5, 7, 8, '2023-02-24 07:39:21', '2023-03-30 14:07:43'),
(765, 2, 9, 2, 2, 2, 7, 9, '2023-02-24 07:39:21', '2023-03-30 14:07:43'),
(766, 2, 10, 2, 2, 2, 7, 10, '2023-02-24 07:39:21', '2023-03-30 14:07:44'),
(767, 2, 11, 2, 2, 2, 7, 11, '2023-02-24 07:39:21', '2023-03-30 14:07:47'),
(768, 2, 12, 2, 2, 2, 7, 12, '2023-02-24 07:39:21', '2023-03-30 14:07:48'),
(769, 2, 13, 1, 2, 2, 7, 13, '2023-02-24 07:39:21', NULL),
(770, 2, 14, 1, 2, 2, 7, 14, '2023-02-24 07:39:21', NULL),
(771, 2, 15, 2, 2, 2, 7, 15, '2023-02-24 07:39:21', '2023-03-30 14:07:50'),
(772, 2, 16, 2, 2, 3, 7, 16, '2023-02-24 07:39:22', '2023-03-30 14:07:51'),
(773, 2, 17, 1, 2, 3, 7, 17, '2023-02-24 07:39:22', NULL),
(774, 2, 18, 2, 2, 3, 7, 27, '2023-02-24 07:39:22', '2023-03-30 14:07:52'),
(775, 2, 19, 2, 2, 3, 7, 26, '2023-02-24 07:39:22', '2023-03-30 14:07:52'),
(776, 2, 20, 2, 2, 3, 7, 21, '2023-02-24 07:39:22', '2023-03-30 14:07:53'),
(777, 2, 21, 2, 2, 3, 7, 22, '2023-02-24 07:39:22', '2023-03-30 14:07:54'),
(778, 2, 22, 2, 2, 3, 7, 23, '2023-02-24 07:39:22', '2023-03-30 14:07:54'),
(779, 2, 23, 1, 2, 3, 7, 24, '2023-02-24 07:39:22', NULL),
(780, 2, 24, 2, 2, 3, 7, 28, '2023-02-24 07:39:22', '2023-03-30 14:07:54'),
(781, 2, 25, 2, 2, 3, 7, 29, '2023-02-24 07:39:22', '2023-03-30 14:07:55'),
(782, 2, 26, 2, 2, 3, 7, 30, '2023-02-24 07:39:22', '2023-03-30 14:07:55'),
(783, 2, 27, 2, 2, 3, 7, 31, '2023-02-24 07:39:22', '2023-03-30 14:07:56'),
(784, 2, 28, 2, 2, 3, 7, 32, '2023-02-24 07:39:22', '2023-03-30 14:07:56'),
(785, 2, 29, 1, 2, 3, 7, 33, '2023-02-24 07:39:22', NULL),
(786, 2, 30, 2, 2, 3, 7, 34, '2023-02-24 07:39:22', '2023-03-30 14:07:57'),
(787, 2, 31, 1, 2, 3, 7, 35, '2023-02-24 07:39:22', NULL),
(788, 2, 32, 2, 2, 3, 7, 36, '2023-02-24 07:39:22', '2023-03-30 14:07:58'),
(789, 2, 33, 1, 2, 3, 7, 37, '2023-02-24 07:39:22', NULL),
(790, 2, 34, 2, 2, 3, 7, 38, '2023-02-24 07:39:22', '2023-03-30 14:07:58'),
(791, 2, 35, 2, 2, 3, 7, 39, '2023-02-24 07:39:22', '2023-03-30 14:08:00'),
(792, 2, 36, 2, 2, 3, 7, 40, '2023-02-24 07:39:22', '2023-03-30 14:08:01'),
(793, 2, 37, 2, 2, 3, 7, 41, '2023-02-24 07:39:22', '2023-03-30 14:08:02'),
(794, 2, 38, 1, 2, 3, 7, 42, '2023-02-24 07:39:22', NULL),
(795, 1, 39, 2, 2, 3, 7, 43, '2023-02-24 07:39:22', '2023-03-30 14:08:03'),
(796, 1, 40, 2, 2, 3, 7, 44, '2023-02-24 07:39:22', '2023-03-30 14:08:03'),
(797, 1, 41, 1, 2, 3, 7, 45, '2023-02-24 07:39:22', '2023-03-01 07:55:32'),
(798, 2, 42, 2, 2, 3, 7, 46, '2023-02-24 07:39:22', '2023-03-30 14:08:04'),
(799, 1, 43, 2, 2, 3, 7, 47, '2023-02-24 07:39:22', '2023-03-30 14:08:05'),
(800, 1, 44, 2, 2, 3, 7, 48, '2023-02-24 07:39:22', '2023-03-01 07:51:51'),
(801, 1, 45, 1, 2, 3, 7, 49, '2023-02-24 07:39:22', '2023-03-01 07:36:48'),
(802, 1, 46, 2, 2, 3, 7, 50, '2023-02-24 07:39:22', '2023-03-01 07:52:49'),
(803, 2, 47, 2, 2, 5, 7, 51, '2023-02-24 07:39:22', '2023-03-01 07:52:42'),
(804, 2, 48, 1, 2, 3, 7, 52, '2023-02-24 07:39:22', NULL),
(805, 2, 49, 2, 2, 5, 7, 53, '2023-02-24 07:39:22', '2023-03-30 14:08:06'),
(806, 2, 50, 1, 2, 3, 7, 54, '2023-02-24 07:39:22', NULL),
(807, 1, 51, 2, 2, 3, 7, 55, '2023-02-24 07:39:22', '2023-03-30 14:08:07'),
(808, 2, 52, 2, 2, 3, 7, 56, '2023-02-24 07:39:22', '2023-03-30 14:08:10'),
(809, 1, 53, 2, 2, 3, 7, 57, '2023-02-24 07:39:22', '2023-03-30 14:08:13'),
(932, 1, 136, 1, 1, 5, 1, 142, '2023-03-30 14:21:37', '2023-03-30 14:22:35'),
(899, 1, 127, 1, 2, 3, 1, 131, '2023-03-08 15:29:04', NULL),
(920, 1, 134, 1, 2, 3, 1, 138, '2023-03-15 09:59:01', NULL),
(917, 1, 133, 2, 2, 3, 1, 137, '2023-03-15 09:27:30', '2023-03-15 09:37:56'),
(929, 1, 135, 1, 2, 3, 1, 141, '2023-03-30 10:29:40', NULL),
(911, 1, 131, 1, 2, 3, 1, 135, '2023-03-15 09:19:06', NULL),
(905, 1, 129, 1, 2, 3, 1, 133, '2023-03-09 10:47:36', NULL),
(908, 1, 130, 1, 2, 3, 1, 134, '2023-03-09 15:26:21', NULL),
(893, 1, 125, 2, 2, 3, 1, 129, '2023-03-02 15:13:03', '2023-03-02 15:27:12'),
(890, 1, 124, 1, 2, 3, 1, 128, '2023-03-01 11:25:56', NULL),
(902, 1, 128, 1, 2, 3, 1, 132, '2023-03-09 10:08:03', NULL),
(896, 1, 126, 1, 2, 3, 1, 130, '2023-03-08 10:02:56', NULL),
(914, 1, 132, 1, 2, 3, 1, 136, '2023-03-15 09:23:16', NULL),
(874, 1, 118, 2, 2, 3, 7, 122, '2023-02-24 07:39:22', '2023-03-30 14:08:16'),
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
(885, 1, 122, 2, 2, 3, 6, 126, '2023-02-24 11:41:31', '2023-03-30 13:54:30'),
(886, 1, 122, 2, 2, 3, 7, 126, '2023-02-24 11:41:31', '2023-03-30 14:08:28'),
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
(6, 'Administrador', 2, '2023-02-23 08:26:27', '2023-03-28 14:23:52'),
(7, 'Usuário', 3, '2023-02-24 07:38:50', '2023-03-28 14:23:52');

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
  `adms_leito_id` int(11) NOT NULL,
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

INSERT INTO `adms_paciente` (`id`, `nome_paciente`, `telefone`, `cpf_doc`, `endereco`, `adms_situacao_paciente_id`, `adms_leito_id`, `atendido`, `baixa`, `created`, `cadastrador`, `modified`, `editor`) VALUES
(1, 'Miguel Falabela', '90-91980-1981', '981.981.980-19', 'teste', 1, 30, 2, 1, '2023-03-28 14:30:18', 4, '2023-03-30 13:49:05', 1),
(2, 'Fernando Pessoa', '98-40949-4984', '981.981.980-15', 'teste', 2, 9, 2, 1, '2023-03-28 14:30:50', 4, '2023-03-30 13:49:19', 1),
(3, 'Bulma', '49-14901-9109', '919.109.190-19', 'Japão', 1, 4, 2, 1, '2023-03-28 14:52:27', 1, '2023-03-30 12:58:25', 1),
(4, 'Van Persen', '65-01161-6165', '616.516.516-56', 'Holanda', 2, 31, 2, 1, '2023-03-29 13:25:47', 1, '2023-03-30 13:27:41', 1),
(5, 'Barnabé', '60-65165-0165', '651.651.984-89', 'Sitio', 1, 28, 2, 1, '2023-03-30 13:51:03', 3, '2023-03-30 13:55:18', 3),
(6, 'Paciente teste', '65-06159-1019', '919.810.981-99', 'HISA', 2, 26, 2, 1, '2023-03-30 14:05:04', 4, '2023-03-30 14:09:06', 4),
(7, 'Ronaldo Fenomeno', '80-68161-9151', '981.981.981-09', 'Brasil', 1, 48, 1, 1, '2023-03-30 15:07:59', 1, NULL, NULL);

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
(130, 'Listando avaliações feitas', 'listar/list_avaliacoes', 'Listando avaliações feitas', 'Listando avaliações feitas', 'Listando avaliações feitas', 'Paulo Albuquerque', 2, '', 0, 1, '1', 4, 1, '2023-03-08 10:02:56', '2023-03-30 15:08:28'),
(131, 'processa lista avaliações feitas', 'listar/list_avaliacaoes_tables', 'processa lista  de avaliações feitas', 'processa lista avaliações feitas', 'processa lista avaliações feitas', 'Paulo Albuquerque', 2, '', 130, 1, '1', 4, 1, '2023-03-08 15:29:04', '2023-03-30 15:09:22'),
(132, 'Visualizar paciente', 'visualizar/vis_paciente', 'Visualizar detalhes dos pacientes', 'Visualizar paciente', 'Visualizar paciente', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2023-03-09 10:08:03', NULL),
(133, 'Apagar paciente', 'processa/apagar/apagar_paciente', 'apagar registro de paciente do sistema', 'Apagar paciente', 'Apagar paciente', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2023-03-09 10:47:36', '2023-03-09 15:49:57'),
(134, 'Processa editar de paciente', 'processa/editar/proc_edit_paciente', 'Processa editar de paciente', 'Processa editar de paciente', 'Processa editar de paciente', 'Paulo Albuquerque', 2, '', 129, 3, '1', 4, 1, '2023-03-09 15:26:21', NULL),
(135, 'Apagar avaliações feitas', 'processa/apagar/apagar_avalia_realizada', 'Apagar avaliações feitas', 'Apagar avaliações feitas', 'Apagar avaliações feitas', 'Paulo Albuquerque', 2, '', 0, 4, '1', 4, 1, '2023-03-15 09:19:06', NULL),
(136, 'Editar av realizada', 'editar/edit_avalia_realizada', 'Editar avaliação realizada pelo paicente', 'Editar av realizada', 'Editar av realizada', 'Paulo Albuquerque', 2, '', 0, 3, '1', 4, 1, '2023-03-15 09:23:16', '2023-03-15 09:24:58'),
(137, 'Visualizar avaliação feita', 'visualizar/vis_avalia_realizada', 'Visualizar detalhes da avaliação feita pelo paciente ', 'Visualizar avaliação feita', 'Visualizar avaliação feita', 'Paulo Albuquerque', 2, '', 0, 5, '1', 4, 1, '2023-03-15 09:27:30', NULL),
(138, 'Excel avaliações feitas', 'exportar/exporta_excel', 'Botão de exportar excel de avaliações feitas pelo paciente', 'Excel avaliações feitas', 'Excel avaliações feitas', 'Paulo Albuquerque', 2, '', 0, 8, '1', 4, 1, '2023-03-15 09:59:01', '2023-03-15 10:00:11'),
(141, 'Processa editar avaliação feita', 'processa/editar/proc_edit_avaliacao', 'Processa editar avaliação feita', 'Processa editar avaliação feita', 'Processa editar avaliação feita', 'Paulo Albuquerque', 2, '', 136, 3, '1', 4, 1, '2023-03-30 10:29:40', NULL),
(142, 'Logs Usuários', 'listar/list_logs_acessos_users', 'Listar Logs user', 'Listar Logs user', 'Listar Logs user', 'Paulo Albuquerque', 2, 'fas fa-list-ol', 0, 1, '1', 4, 1, '2023-03-30 14:21:37', '2023-03-30 14:23:19'),
(122, 'list_usuario_tables', 'listar/list_usuario_tables', 'list_usuario_tables', 'list_usuario_tables', 'list_usuario_tables', 'Paulo Albuquerque', 2, '', 5, 1, '1', 4, 1, '2022-03-21 21:27:21', '2023-03-30 15:07:14'),
(123, 'Cadastro de paciente', 'cadastrar/cad_paciente', 'cadastrar os pacientes ', 'cadastrar os pacientes', 'cadastrar os pacientes', 'Paulo Albuquerque', 2, 'fa fa-medkit', 0, 2, '1', 4, 1, '2023-02-24 08:12:06', '2023-03-01 08:04:16'),
(124, 'Processamento de cadastro paciente', 'processa/cadastrar/proc_cad_paciente', 'Processamento de cadastro paciente', 'Processamento de cadastro paciente', 'Processamento de cadastro paciente', 'Paulo Albuquerque', 2, '', 123, 2, '1', 4, 1, '2023-02-24 11:12:36', '2023-03-09 15:48:18'),
(125, 'Pacientes', 'listar/list_paciente', 'Listar os pacientes', 'Listar os pacientes', 'Listar os pacientes', 'Paulo Albuquerque', 2, 'fa fa-male', 0, 1, '1', 4, 1, '2023-02-24 11:18:54', '2023-03-01 08:03:19'),
(126, 'Pacientes listado DATATABLES', 'listar/list_pacientes_tables', 'Listando os pacientes com o datatebles (list_pacientes_tables)', 'list_pacientes_tables', 'list_pacientes_tables', 'Paulo Albuquerque', 2, '', 125, 1, '1', 4, 1, '2023-02-24 11:41:31', '2023-03-30 15:07:37'),
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
(1, 'Paulo Albuquerque', 'Paulo', 'paulo.albuquerque@ints.org.br', '18569', 'paulo.albuquerque', '$2y$10$BTnidFcaG/00x3rwxpwnx.cnrAqvWSlFkLJ4wU.l.I5RI.vVnDxmW', NULL, NULL, NULL, 'b48123f3-5c5c-450d-a362-2215fd4c348e-copia.jpg', 1, 1, '2022-04-30 19:49:14', '2023-03-30 13:46:33'),
(3, 'Lucas Ferreira Teixeira', '', 'lucas.ferreira@ints.org.br', '18193', 'lucas.ferreira', '$2y$10$1ppUIxae5TPLraS5lheNw.M9OtQXcucCHufhL3PvJNACOuTd2XGd6', NULL, NULL, NULL, NULL, 6, 1, '2023-03-28 14:25:41', NULL),
(2, 'Wellington Dos Santos', '', 'wellington.santos@ints.org.br', '17096', 'wellington.santos', '$2y$10$A.WEicUqYtS5sdNP.89oNu9TtwGZfR5.4WygoL./HbQ43ZXGkQiSG', NULL, NULL, NULL, NULL, 6, 1, '2023-03-28 14:26:38', NULL),
(4, 'Usuario teste', '', 'usuario@teste.com.br', '171', 'teste', '$2y$10$qpD89PVDCoc0Tpc4I072o.K.cz5vYOLfoccVOlCEeIw6wSeqUBZP2', NULL, NULL, NULL, NULL, 7, 1, '2023-03-28 14:28:37', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adms_andar`
--
ALTER TABLE `adms_andar`
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
-- Índices para tabela `adms_leitos`
--
ALTER TABLE `adms_leitos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_leitos_questoes`
--
ALTER TABLE `adms_leitos_questoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `adms_log_usuaios`
--
ALTER TABLE `adms_log_usuaios`
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
-- AUTO_INCREMENT de tabela `adms_andar`
--
ALTER TABLE `adms_andar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `adms_leitos`
--
ALTER TABLE `adms_leitos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `adms_leitos_questoes`
--
ALTER TABLE `adms_leitos_questoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de tabela `adms_log_usuaios`
--
ALTER TABLE `adms_log_usuaios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `adms_menus`
--
ALTER TABLE `adms_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `adms_nivacs_pgs`
--
ALTER TABLE `adms_nivacs_pgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=935;

--
-- AUTO_INCREMENT de tabela `adms_niveis_acessos`
--
ALTER TABLE `adms_niveis_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `adms_paciente`
--
ALTER TABLE `adms_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `adms_paginas`
--
ALTER TABLE `adms_paginas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
