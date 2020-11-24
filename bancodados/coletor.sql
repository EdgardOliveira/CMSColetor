-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2020 at 03:00 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coletor`
--

-- --------------------------------------------------------

--
-- Table structure for table `cidades`
--

CREATE TABLE `cidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cidades`
--

INSERT INTO `cidades` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Manaus', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(2, 'Manacapuru', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(3, 'Careiro', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(4, 'Itacoatiara', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(5, 'Presidente Figueiredo', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(6, 'huehuebr', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_empresa` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaVencimento` int(11) NOT NULL,
  `medidor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nome_empresa`, `cpf_cnpj`, `diaVencimento`, `medidor_id`, `created_at`, `updated_at`) VALUES
(1, 'Edgard Anselmo Ferreira Oliveira', '68921545632', 10, 1, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(2, 'Thiago Albuquerque Lins', '12345678912', 15, 2, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(3, 'Marcos Silva Oliveira', '32165498732', 20, 3, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(4, 'Marinho Alencar Neto', '98765432132', 25, 4, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(5, 'João Guilherme', '15995112363', 5, 5, '2020-11-24 00:23:27', '2020-11-24 00:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `enderecos`
--

CREATE TABLE `enderecos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cep` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medidor_id` bigint(20) UNSIGNED NOT NULL,
  `cidade_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enderecos`
--

INSERT INTO `enderecos` (`id`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `uf`, `medidor_id`, `cidade_id`, `created_at`, `updated_at`) VALUES
(1, '69050100', 'Avenida Brasil', '25', 'Condomínio Compensa', 'Compensa', 'AM', 1, 1, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(2, '69049148', 'Rua 21', '1', 'Conjunto Vila Rica', 'Cidade Nova', 'AM', 2, 1, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(3, '69010125', 'Rua 19', '1', 'Conjunto Vila Suiça', 'Tarumã', 'AM', 3, 1, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(4, '69050001', 'Avenida das Torres', '2525', 'Condomínio Japonês, Apartamento 103B', 'Parque 10 de Dezembro', 'AM', 4, 1, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(5, '99999999', 'Rua teste', '123', 'Próximo da bocada', 'Cidade de Deus', 'AM', 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
--

CREATE TABLE `grupos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grupos`
--

INSERT INTO `grupos` (`id`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 'Administradores', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(2, 'Gerentes', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(3, 'Atendentes', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(4, 'Leituristas', '2020-11-24 00:23:27', '2020-11-24 00:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `leituras`
--

CREATE TABLE `leituras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mesAno` date NOT NULL,
  `anterior` bigint(20) NOT NULL,
  `atual` bigint(20) DEFAULT NULL,
  `constante` double NOT NULL,
  `residuo` double DEFAULT NULL,
  `medido` bigint(20) DEFAULT NULL,
  `faturado` bigint(20) DEFAULT NULL,
  `tarifaSemTributos` double NOT NULL,
  `tarifaComTributos` double NOT NULL,
  `media12Meses` bigint(20) NOT NULL,
  `dataVencimento` date DEFAULT NULL,
  `dataAnterior` date NOT NULL,
  `dataAtual` date DEFAULT NULL,
  `dataEmissao` date DEFAULT NULL,
  `dataApresentacao` date DEFAULT NULL,
  `dataProxima` date DEFAULT NULL,
  `diasConsumo` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `consumo` bigint(20) DEFAULT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `medidor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leituras`
--

INSERT INTO `leituras` (`id`, `mesAno`, `anterior`, `atual`, `constante`, `residuo`, `medido`, `faturado`, `tarifaSemTributos`, `tarifaComTributos`, `media12Meses`, `dataVencimento`, `dataAnterior`, `dataAtual`, `dataEmissao`, `dataApresentacao`, `dataProxima`, `diasConsumo`, `total`, `consumo`, `cliente_id`, `medidor_id`, `created_at`, `updated_at`) VALUES
(1, '2020-05-01', 41390, 41690, 1, 0, 300, 300, 0.66484, 0.886453, 340, '2020-06-10', '2020-04-27', '2020-11-23', '2020-11-23', '2020-11-23', '2020-12-23', 210, 290.9859, 300, 1, 1, '2020-11-24 00:23:27', '2020-11-24 03:08:57'),
(2, '2020-06-01', 41777, 41977, 1, 0, 200, 200, 0.66484, 0.886453, 349, '2020-07-10', '2020-05-27', '2020-11-23', '2020-11-23', '2020-11-23', '2020-12-23', 180, 202.34060000000002, 200, 1, 1, '2020-11-24 00:23:27', '2020-11-24 03:08:58'),
(3, '2020-07-01', 42119, 42319, 1, 0, 200, 200, 0.66484, 0.886453, 350, '2020-08-10', '2020-06-25', '2020-11-23', '2020-11-23', '2020-11-23', '2020-12-23', 151, 202.34060000000002, 200, 1, 1, '2020-11-24 00:23:27', '2020-11-24 03:08:57'),
(4, '2020-08-01', 42528, 42828, 1, 0, 300, 300, 0.66484, 0.886453, 358, '2020-09-10', '2020-07-28', '2020-11-23', '2020-11-23', '2020-11-23', '2020-12-23', 118, 290.9859, 300, 1, 1, '2020-11-24 00:23:27', '2020-11-24 03:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `medidores`
--

CREATE TABLE `medidores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grupo` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ligacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faturamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modalidade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medidores`
--

INSERT INTO `medidores` (`id`, `numero`, `grupo`, `classe`, `ligacao`, `faturamento`, `modalidade`, `status`, `created_at`, `updated_at`) VALUES
(1, '10236600', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'ATIVA', NULL, NULL),
(2, '10236601', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'ATIVA', NULL, NULL),
(3, '10236603', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'ATIVA', NULL, NULL),
(4, '10236604', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'ATIVA', NULL, NULL),
(5, '10236605', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'ATIVA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_11_000000_create_grupos_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_08_26_025900_create_medidors_table', 1),
(6, '2020_08_26_025901_create_clientes_table', 1),
(7, '2020_08_26_025945_create_cidades_table', 1),
(8, '2020_08_26_025951_create_enderecos_table', 1),
(9, '2020_08_26_031613_create_leituras_table', 1),
(10, '2020_09_15_190550_create_recursos_table', 1),
(11, '2020_09_19_123330_create_permissaos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissoes`
--

CREATE TABLE `permissoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `recurso_id` bigint(20) UNSIGNED NOT NULL,
  `consultar` tinyint(1) NOT NULL,
  `cadastrar` tinyint(1) NOT NULL,
  `atualizar` tinyint(1) NOT NULL,
  `excluir` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissoes`
--

INSERT INTO `permissoes` (`id`, `usuario_id`, `recurso_id`, `consultar`, `cadastrar`, `atualizar`, `excluir`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 1, 1, 1, NULL, NULL),
(2, 2, 2, 1, 1, 1, 1, NULL, NULL),
(3, 2, 3, 1, 1, 1, 1, NULL, NULL),
(4, 2, 4, 1, 1, 1, 1, NULL, NULL),
(5, 2, 5, 1, 1, 1, 1, NULL, NULL),
(6, 2, 5, 1, 1, 1, 1, NULL, NULL),
(7, 2, 6, 1, 1, 1, 1, NULL, NULL),
(8, 2, 7, 1, 1, 1, 1, NULL, NULL),
(9, 2, 8, 1, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recursos`
--

CREATE TABLE `recursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recursos`
--

INSERT INTO `recursos` (`id`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 'usuarios', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(2, 'clientes', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(3, 'medidores', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(4, 'cidades', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(5, 'enderecos', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(6, 'leituras', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(7, 'recursos', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(8, 'permissoes', '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(9, 'grupos', '2020-11-24 00:23:27', '2020-11-24 00:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grupo_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `grupo_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Edgard Oliveira', 'neovenom@gmail.com', NULL, '$2y$10$cxCXo6YdcUGkJuCS0k92yuk3I5La8Z/HoHoYmvv/8.6GUR5p.aJxy', 1, NULL, '2020-11-24 00:23:27', '2020-11-24 00:23:27'),
(2, 'Edgard', 'edgard@gmail.com', NULL, '123456', 1, NULL, '2020-11-24 00:23:27', '2020-11-24 00:23:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_medidor_id_foreign` (`medidor_id`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enderecos_medidor_id_foreign` (`medidor_id`),
  ADD KEY `enderecos_cidade_id_foreign` (`cidade_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leituras`
--
ALTER TABLE `leituras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leituras_cliente_id_foreign` (`cliente_id`),
  ADD KEY `leituras_medidor_id_foreign` (`medidor_id`);

--
-- Indexes for table `medidores`
--
ALTER TABLE `medidores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissoes_usuario_id_foreign` (`usuario_id`),
  ADD KEY `permissoes_recurso_id_foreign` (`recurso_id`);

--
-- Indexes for table `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_grupo_id_foreign` (`grupo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leituras`
--
ALTER TABLE `leituras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medidores`
--
ALTER TABLE `medidores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_medidor_id_foreign` FOREIGN KEY (`medidor_id`) REFERENCES `medidores` (`id`);

--
-- Constraints for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `enderecos_medidor_id_foreign` FOREIGN KEY (`medidor_id`) REFERENCES `medidores` (`id`);

--
-- Constraints for table `leituras`
--
ALTER TABLE `leituras`
  ADD CONSTRAINT `leituras_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `leituras_medidor_id_foreign` FOREIGN KEY (`medidor_id`) REFERENCES `medidores` (`id`);

--
-- Constraints for table `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `permissoes_recurso_id_foreign` FOREIGN KEY (`recurso_id`) REFERENCES `recursos` (`id`),
  ADD CONSTRAINT `permissoes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
