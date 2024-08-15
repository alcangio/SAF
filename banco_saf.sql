-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2024 at 08:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banco_saf`
--

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  `tel_responsavel` varchar(15) DEFAULT NULL,
  `endereco` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atividades`
--

CREATE TABLE `atividades` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contribuicoes`
--

CREATE TABLE `contribuicoes` (
  `id` int(11) NOT NULL,
  `id_voluntario` int(11) DEFAULT NULL,
  `data_contribuicao` date NOT NULL,
  `levar_lanche` tinyint(1) NOT NULL,
  `id_atividade_opcional` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presenca`
--

CREATE TABLE `presenca` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `presente` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programacao`
--

CREATE TABLE `programacao` (
  `data` date NOT NULL,
  `id_atividade` int(11) DEFAULT NULL,
  `id_voluntario_atividade` int(11) DEFAULT NULL,
  `id_voluntario_lanche` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voluntarios`
--

CREATE TABLE `voluntarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contribuicoes`
--
ALTER TABLE `contribuicoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_voluntario` (`id_voluntario`),
  ADD KEY `id_atividade_opcional` (`id_atividade_opcional`);

--
-- Indexes for table `presenca`
--
ALTER TABLE `presenca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data` (`data`),
  ADD KEY `id_aluno` (`id_aluno`);

--
-- Indexes for table `programacao`
--
ALTER TABLE `programacao`
  ADD PRIMARY KEY (`data`),
  ADD KEY `id_atividade` (`id_atividade`),
  ADD KEY `id_voluntario_atividade` (`id_voluntario_atividade`),
  ADD KEY `id_voluntario_lanche` (`id_voluntario_lanche`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atividades`
--
ALTER TABLE `atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contribuicoes`
--
ALTER TABLE `contribuicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presenca`
--
ALTER TABLE `presenca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voluntarios`
--
ALTER TABLE `voluntarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contribuicoes`
--
ALTER TABLE `contribuicoes`
  ADD CONSTRAINT `contribuicoes_ibfk_1` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntarios` (`id`),
  ADD CONSTRAINT `contribuicoes_ibfk_2` FOREIGN KEY (`id_atividade_opcional`) REFERENCES `atividades` (`id`);

--
-- Constraints for table `presenca`
--
ALTER TABLE `presenca`
  ADD CONSTRAINT `presenca_ibfk_1` FOREIGN KEY (`data`) REFERENCES `programacao` (`data`),
  ADD CONSTRAINT `presenca_ibfk_2` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`);

--
-- Constraints for table `programacao`
--
ALTER TABLE `programacao`
  ADD CONSTRAINT `programacao_ibfk_1` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id`),
  ADD CONSTRAINT `programacao_ibfk_2` FOREIGN KEY (`id_voluntario_atividade`) REFERENCES `voluntarios` (`id`),
  ADD CONSTRAINT `programacao_ibfk_3` FOREIGN KEY (`id_voluntario_lanche`) REFERENCES `voluntarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
