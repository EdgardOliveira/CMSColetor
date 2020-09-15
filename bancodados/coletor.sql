-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2020 às 00:09
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `coletor`
--
CREATE DATABASE IF NOT EXISTS `coletor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coletor`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE IF NOT EXISTS `cidades` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `cidades`:
--

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Manaus', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(2, 'Manacapuru', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(3, 'Careiro', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(4, 'Itacoatiara', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(5, 'Presidente Figueiredo', '2020-08-29 04:03:16', '2020-08-29 04:03:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `clientes`:
--

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome_empresa`, `cpf_cnpj`, `created_at`, `updated_at`) VALUES
(1, 'Edgard Anselmo Ferreira Oliveira', '68921545632', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(2, 'Thiago Albuquerque Lins', '12345678912', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(3, 'Marcos Silva Oliveira', '32165498732', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(4, 'Marinho Alencar Neto', '98765432132', '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(5, 'João Guilherme', '15995112363', '2020-08-29 04:03:16', '2020-08-29 04:03:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
CREATE TABLE IF NOT EXISTS `enderecos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cep` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medidor_id` bigint(20) UNSIGNED NOT NULL,
  `cidade_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enderecos_medidor_id_foreign` (`medidor_id`),
  KEY `enderecos_cidade_id_foreign` (`cidade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `enderecos`:
--   `cidade_id`
--       `cidades` -> `id`
--   `medidor_id`
--       `medidores` -> `id`
--

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `uf`, `medidor_id`, `cidade_id`, `created_at`, `updated_at`) VALUES
(1, '69050001', 'Avenida Constantino Nery', '2525', 'Condomínio Parque dos Ingleses, Bloco 10B, Apartamento 102B', 'Chapada', 'AM', 1, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(2, '69049138', 'Rua 18', '1', 'Conjunto Vila Nova', 'Cidade Nova', 'AM', 2, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(3, '69010125', 'Rua 19', '1', 'Conjunto Vila Nova', 'Cidade Nova', 'AM', 3, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(4, '69050001', 'Avenida Constantino Nery', '2525', 'Condomínio Parque dos Ingleses, Bloco 10B, Apartamento 103B', 'Chapada', 'AM', 4, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `failed_jobs`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `leituras`
--

DROP TABLE IF EXISTS `leituras`;
CREATE TABLE IF NOT EXISTS `leituras` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mesAno` date NOT NULL,
  `anterior` bigint(20) NOT NULL,
  `atual` bigint(20) NOT NULL,
  `constante` double NOT NULL,
  `residuo` double NOT NULL,
  `medido` bigint(20) NOT NULL,
  `faturado` bigint(20) NOT NULL,
  `dataAnterior` date NOT NULL,
  `dataAtual` date NOT NULL,
  `dataEmissao` date NOT NULL,
  `dataApresentacao` date NOT NULL,
  `dataProxima` date NOT NULL,
  `diasConsumo` int(11) NOT NULL,
  `total` double NOT NULL,
  `consumo` bigint(20) NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `medidor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leituras_cliente_id_foreign` (`cliente_id`),
  KEY `leituras_medidor_id_foreign` (`medidor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `leituras`:
--   `cliente_id`
--       `clientes` -> `id`
--   `medidor_id`
--       `medidores` -> `id`
--

--
-- Extraindo dados da tabela `leituras`
--

INSERT INTO `leituras` (`id`, `mesAno`, `anterior`, `atual`, `constante`, `residuo`, `medido`, `faturado`, `dataAnterior`, `dataAtual`, `dataEmissao`, `dataApresentacao`, `dataProxima`, `diasConsumo`, `total`, `consumo`, `cliente_id`, `medidor_id`, `created_at`, `updated_at`) VALUES
(1, '2020-05-01', 41390, 41777, 1, 0, 387, 387, '2020-04-27', '2020-05-27', '2020-05-26', '2020-05-27', '2020-06-25', 30, 368.1, 387, 1, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(2, '2020-06-01', 41777, 42119, 1, 0, 342, 342, '2020-05-27', '2020-06-25', '2020-06-24', '2020-06-25', '2020-07-28', 29, 328.21, 342, 1, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(3, '2020-07-01', 42119, 42528, 1, 0, 409, 409, '2020-06-25', '2020-07-28', '2020-07-27', '2020-07-28', '2020-08-06', 33, 387.6, 409, 1, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16'),
(4, '2020-08-01', 42528, 42902, 1, 0, 374, 374, '2020-07-28', '2020-08-26', '2020-08-25', '2020-08-26', '2020-09-25', 29, 356.58, 374, 1, 1, '2020-08-29 04:03:16', '2020-08-29 04:03:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medidores`
--

DROP TABLE IF EXISTS `medidores`;
CREATE TABLE IF NOT EXISTS `medidores` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grupo` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ligacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faturamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modalidade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `medidores`:
--

--
-- Extraindo dados da tabela `medidores`
--

INSERT INTO `medidores` (`id`, `numero`, `grupo`, `classe`, `ligacao`, `faturamento`, `modalidade`, `status`, `created_at`, `updated_at`) VALUES
(1, '10236600', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'Ativa', NULL, NULL),
(2, '10236601', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'Ativa', NULL, NULL),
(3, '10236603', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'Ativa', NULL, NULL),
(4, '10236604', 'B', 'RESIDENCIAL', 'TRIFÁSICA', 'NORMAL', 'CONVENCIONAL', 'Ativa', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `migrations`:
--

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_26_025540_create_clientes_table', 1),
(5, '2020_08_26_025900_create_medidors_table', 1),
(6, '2020_08_26_025945_create_cidades_table', 1),
(7, '2020_08_26_025951_create_enderecos_table', 1),
(8, '2020_08_26_031613_create_leituras_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `password_resets`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONAMENTOS PARA TABELAS `users`:
--

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Edgard Oliveira', 'neovenom@gmail.com', NULL, '$2y$10$cxCXo6YdcUGkJuCS0k92yuk3I5La8Z/HoHoYmvv/8.6GUR5p.aJxy', NULL, '2020-08-29 04:03:16', '2020-08-29 04:03:16');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  ADD CONSTRAINT `enderecos_medidor_id_foreign` FOREIGN KEY (`medidor_id`) REFERENCES `medidores` (`id`);

--
-- Limitadores para a tabela `leituras`
--
ALTER TABLE `leituras`
  ADD CONSTRAINT `leituras_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `leituras_medidor_id_foreign` FOREIGN KEY (`medidor_id`) REFERENCES `medidores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
