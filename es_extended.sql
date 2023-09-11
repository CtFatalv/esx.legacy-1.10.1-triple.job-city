-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 14 juil. 2023 à 22:51
-- Version du serveur : 10.11.4-MariaDB-1:10.11.4+maria~ubu2204
-- Version de PHP : 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `es_extended`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Savings account', 0),
('society_abatteur', 'Abatteur', 1),
('society_agriculteur', 'Agriculteur', 1),
('society_ambulance', 'EMS', 1),
('society_bucheron', 'Bûcheron', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_mineur', 'Mineur', 1),
('society_nightclub', 'Nightclub', 1),
('society_police', 'Police', 1),
('society_shop01', 'Shop01', 1),
('society_shop02', 'Shop02', 1),
('society_shop03', 'Shop03', 1),
('society_shop04', 'Shop04', 1),
('society_shop05', 'Shop05', 1),
('society_shop06', 'Shop06', 1),
('society_shop07', 'Shop07', 1),
('society_shop08', 'Shop08', 1),
('society_shop09', 'Shop09', 1),
('society_shop10', 'Shop10', 1),
('society_shop11', 'Shop11', 1),
('society_shop12', 'Shop12', 1),
('society_shop13', 'Shop13', 1),
('society_shop14', 'Shop14', 1),
('society_shop15', 'Shop15', 1),
('society_shop16', 'Shop16', 1),
('society_shop17', 'Shop17', 1),
('society_shop18', 'Shop18', 1),
('society_shop19', 'Shop19', 1),
('society_shop20', 'Shop20', 1),
('society_tailleur', 'Tailleur', 1),
('society_taxi', 'Taxi', 1),
('society_vigneron', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_abatteur', 'Abatteur', 1),
('society_agriculteur', 'Agriculteur', 1),
('society_ambulance', 'EMS', 1),
('society_bucheron', 'Bûcheron', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_mineur', 'Mineur', 1),
('society_nightclub', 'Nightclub', 1),
('society_police', 'Police', 1),
('society_shop01', 'Shop01', 1),
('society_shop02', 'Shop02', 1),
('society_shop03', 'Shop03', 1),
('society_shop04', 'Shop04', 1),
('society_shop05', 'Shop05', 1),
('society_shop06', 'Shop06', 1),
('society_shop07', 'Shop07', 1),
('society_shop08', 'Shop08', 1),
('society_shop09', 'Shop09', 1),
('society_shop10', 'Shop10', 1),
('society_shop11', 'Shop11', 1),
('society_shop12', 'Shop12', 1),
('society_shop13', 'Shop13', 1),
('society_shop14', 'Shop14', 1),
('society_shop15', 'Shop15', 1),
('society_shop16', 'Shop16', 1),
('society_shop17', 'Shop17', 1),
('society_shop18', 'Shop18', 1),
('society_shop19', 'Shop19', 1),
('society_shop20', 'Shop20', 1),
('society_tailleur', 'Tailleur', 1),
('society_taxi', 'Taxi', 1),
('society_vigneron', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `baninfo`
--

CREATE TABLE `baninfo` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `playername` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `banking`
--

CREATE TABLE `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `balance` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `banlist`
--

CREATE TABLE `banlist` (
  `license` varchar(50) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` varchar(50) NOT NULL,
  `expiration` varchar(50) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('society_abatteur', 'Abatteur', 1),
('society_agriculteur', 'Agriculteur', 1),
('society_ambulance', 'EMS', 1),
('society_bucheron', 'Bûcheron', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_mineur', 'Mineur', 1),
('society_nightclub', 'Nightclub', 1),
('society_police', 'Police', 1),
('society_shop01', 'Shop01', 1),
('society_shop02', 'Shop02', 1),
('society_shop03', 'Shop03', 1),
('society_shop04', 'Shop04', 1),
('society_shop05', 'Shop05', 1),
('society_shop06', 'Shop06', 1),
('society_shop07', 'Shop07', 1),
('society_shop08', 'Shop08', 1),
('society_shop09', 'Shop09', 1),
('society_shop10', 'Shop10', 1),
('society_shop11', 'Shop11', 1),
('society_shop12', 'Shop12', 1),
('society_shop13', 'Shop13', 1),
('society_shop14', 'Shop14', 1),
('society_shop15', 'Shop15', 1),
('society_shop16', 'Shop16', 1),
('society_shop17', 'Shop17', 1),
('society_shop18', 'Shop18', 1),
('society_shop19', 'Shop19', 1),
('society_shop20', 'Shop20', 1),
('society_tailleur', 'Tailleur', 1),
('society_taxi', 'Taxi', 1),
('society_vigneron', 'Vigneron', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Abus du klaxon', 30, 0),
(2, 'Traverser une ligne continue', 40, 0),
(3, 'Conduite à contre sens', 250, 0),
(4, 'Demi-tour illégal', 250, 0),
(5, 'Conduite hors route illégalement', 170, 0),
(6, 'Refuser un ordre légitime', 30, 0),
(7, 'Arrêt illégal du véhicule', 150, 0),
(8, 'Stationnement illégal', 70, 0),
(9, 'Ne pas céder la priorité à droite', 70, 0),
(10, 'Non-respect des informations sur le véhicule', 90, 0),
(11, 'Griller un Stop', 105, 0),
(12, 'Griller un feu rouge', 130, 0),
(13, 'Passage illégal', 100, 0),
(14, 'Conduire un véhicule illégal', 100, 0),
(15, 'Conduire sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Vitesse supérieure à < 5 mph', 90, 0),
(18, 'Vitesse supérieure à 5-15 mph', 120, 0),
(19, 'Vitesse supérieure à 15-30 mph', 180, 0),
(20, 'Vitesse supérieure à > 30 mph', 300, 0),
(21, 'Entrave à la fluidité du trafic', 110, 1),
(22, 'Ivresse publique', 90, 1),
(23, 'Conduite désordonnée', 90, 1),
(24, 'Entrave à la justice', 130, 1),
(25, 'Insultes envers les civils', 75, 1),
(26, 'Non-respect envers un LEO', 110, 1),
(27, 'Menace verbale envers un civil', 90, 1),
(28, 'Menace verbale envers un LEO', 150, 1),
(29, 'Fournir de fausses informations', 250, 1),
(30, 'Tentative de Corruption', 1500, 1),
(31, 'Brandir une arme dans la ville', 120, 2),
(32, 'Brandir une arme mortelle dans la ville', 300, 2),
(33, 'Pas de permis Armes à feu', 600, 2),
(34, 'Possession arme illégale', 700, 2),
(35, 'Possession outils de cambriolage', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intention de vendre/déranger une substance illégale', 1500, 2),
(38, 'Fabrication de substance illégale', 1500, 2),
(39, 'Possession de substance illégale', 650, 2),
(40, 'Enlèver un civil', 1500, 2),
(41, 'Kidnapper un LEO', 2000, 2),
(42, 'Vol', 650, 2),
(43, 'Vol à main armée magasin', 650, 2),
(44, 'Vol à main armée banque', 1500, 2),
(45, 'Assaut contre un civil', 2000, 3),
(46, 'Assaut envers LEO', 2500, 3),
(47, 'Tentative de meurtre  envers un civil', 3000, 3),
(48, 'Tentative de meurtre envers un LEO', 5000, 3),
(49, 'Meurtre envers un civil', 10000, 3),
(50, 'Meurtre envers un LEO', 30000, 3),
(51, 'Homicide involontaire', 1800, 3),
(52, 'Fraude', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('abatteur', 'Abatteur', 1),
('agriculteur', 'Agriculteur', 1),
('ambulance', 'EMS', 1),
('bucheron', 'Bûcheron', 1),
('cardealer', 'Concessionnaire', 1),
('mechanic', 'Mechanicien', 1),
('mineur', 'Mineur', 1),
('nightclub', 'Nightclub', 1),
('police', 'Policier', 1),
('shop01', 'Shop01', 1),
('shop02', 'Shop02', 1),
('shop03', 'Shop03', 1),
('shop04', 'Shop04', 1),
('shop05', 'Shop05', 1),
('shop06', 'Shop06', 1),
('shop07', 'Shop07', 1),
('shop08', 'Shop08', 1),
('shop09', 'Shop09', 1),
('shop10', 'Shop10', 1),
('shop11', 'Shop11', 1),
('shop12', 'Shop12', 1),
('shop13', 'Shop13', 1),
('shop14', 'Shop14', 1),
('shop15', 'Shop15', 1),
('shop16', 'Shop16', 1),
('shop17', 'Shop17', 1),
('shop18', 'Shop18', 1),
('shop19', 'Shop19', 1),
('shop20', 'Shop20', 1),
('tailleur', 'Tailleur', 1),
('taxi', 'Taxi', 1),
('unemployed', 'Chômeur', 0),
('unemployed2', 'Chômeur2', 1),
('unemployed3', 'Chômeur3', 1),
('vigneron', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Chômeur', 0, '{}', '{}'),
(2, 'unemployed2', 0, 'unemployed2', 'Chômeur2', 0, '{}', '{}'),
(3, 'unemployed3', 0, 'unemployed3', 'Chômeur3', 0, '{}', '{}'),
(4, 'police', 0, 'recruit', 'Recrue', 0, '{}', '{}'),
(5, 'police', 1, 'officer', 'Officier', 0, '{}', '{}'),
(6, 'police', 2, 'sergeant', 'Sergent', 0, '{}', '{}'),
(7, 'police', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(8, 'police', 4, 'boss', 'Capitaine', 0, '{}', '{}'),
(9, 'ambulance', 0, 'ambulance', 'Ambulancier', 0, '{}', '{}'),
(10, 'ambulance', 1, 'doctor', 'Docteur', 0, '{}', '{}'),
(11, 'ambulance', 2, 'chief_doctor', 'Chef', 0, '{}', '{}'),
(12, 'ambulance', 3, 'boss', 'Patron', 0, '{}', '{}'),
(13, 'taxi', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(14, 'taxi', 1, 'novice', 'Apprenti', 0, '{}', '{}'),
(15, 'taxi', 2, 'experimente', 'Employé', 0, '{}', '{}'),
(16, 'taxi', 3, 'uber', 'Chef', 0, '{}', '{}'),
(17, 'taxi', 4, 'boss', 'Patron', 0, '{}', '{}'),
(18, 'mechanic', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(19, 'mechanic', 1, 'novice', 'Apprenti', 0, '{}', '{}'),
(20, 'mechanic', 2, 'experimente', 'Employé', 0, '{}', '{}'),
(21, 'mechanic', 3, 'chief', 'Chef', 0, '{}', '{}'),
(22, 'mechanic', 4, 'boss', 'Patron', 0, '{}', '{}'),
(23, 'cardealer', 0, 'recruit', 'Recrue', 0, '{}', '{}'),
(24, 'cardealer', 1, 'novice', 'Apprenti', 0, '{}', '{}'),
(25, 'cardealer', 2, 'experienced', 'Employé', 0, '{}', '{}'),
(26, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(27, 'nightclub', 0, 'barman', 'Barman', 0, '{}', '{}'),
(28, 'nightclub', 1, 'dancer', 'Danseur', 0, '{}', '{}'),
(29, 'nightclub', 2, 'chef', 'Chef', 0, '{}', '{}'),
(30, 'nightclub', 3, 'boss', 'Patron', 0, '{}', '{}'),
(31, 'abatteur', 0, 'employee', 'Employé', 0, '{}', '{}'),
(32, 'abatteur', 1, 'chef', 'Chef', 0, '{}', '{}'),
(33, 'abatteur', 2, 'boss', 'Patron', 0, '{}', '{}'),
(34, 'vigneron', 0, 'employee', 'Employé', 0, '{}', '{}'),
(35, 'vigneron', 1, 'chef', 'Chef', 0, '{}', '{}'),
(36, 'vigneron', 2, 'boss', 'Patron', 0, '{}', '{}'),
(37, 'agriculteur', 0, 'employee', 'Employé', 0, '{}', '{}'),
(38, 'agriculteur', 1, 'chef', 'Chef', 0, '{}', '{}'),
(39, 'agriculteur', 2, 'boss', 'Patron', 0, '{}', '{}'),
(40, 'mineur', 0, 'employee', 'Employé', 0, '{}', '{}'),
(41, 'mineur', 1, 'chef', 'Chef', 0, '{}', '{}'),
(42, 'mineur', 2, 'boss', 'Patron', 0, '{}', '{}'),
(43, 'bucheron', 0, 'employee', 'Employé', 0, '{}', '{}'),
(44, 'bucheron', 1, 'chef', 'Chef', 0, '{}', '{}'),
(45, 'bucheron', 2, 'boss', 'Patron', 0, '{}', '{}'),
(46, 'tailleur', 0, 'employee', 'Employé', 0, '{}', '{}'),
(47, 'tailleur', 1, 'chef', 'Chef', 0, '{}', '{}'),
(48, 'tailleur', 2, 'boss', 'Patron', 0, '{}', '{}'),
(49, 'shop01', 0, 'employee', 'Employé', 0, '{}', '{}'),
(50, 'shop01', 1, 'boss', 'Patron', 0, '{}', '{}'),
(51, 'shop02', 0, 'employee', 'Employé', 0, '{}', '{}'),
(52, 'shop02', 1, 'boss', 'Patron', 0, '{}', '{}'),
(53, 'shop03', 0, 'employee', 'Employé', 0, '{}', '{}'),
(54, 'shop03', 1, 'boss', 'Patron', 0, '{}', '{}'),
(55, 'shop04', 0, 'employee', 'Employé', 0, '{}', '{}'),
(56, 'shop04', 1, 'boss', 'Patron', 0, '{}', '{}'),
(57, 'shop05', 0, 'employee', 'Employé', 0, '{}', '{}'),
(58, 'shop05', 1, 'boss', 'Patron', 0, '{}', '{}'),
(59, 'shop06', 0, 'employee', 'Employé', 0, '{}', '{}'),
(60, 'shop06', 1, 'boss', 'Patron', 0, '{}', '{}'),
(61, 'shop07', 0, 'employee', 'Employé', 0, '{}', '{}'),
(62, 'shop07', 1, 'boss', 'Patron', 0, '{}', '{}'),
(63, 'shop08', 0, 'employee', 'Employé', 0, '{}', '{}'),
(64, 'shop08', 1, 'boss', 'Patron', 0, '{}', '{}'),
(65, 'shop09', 0, 'employee', 'Employé', 0, '{}', '{}'),
(66, 'shop09', 1, 'boss', 'Patron', 0, '{}', '{}'),
(67, 'shop10', 0, 'employee', 'Employé', 0, '{}', '{}'),
(68, 'shop10', 1, 'boss', 'Patron', 0, '{}', '{}'),
(69, 'shop11', 0, 'employee', 'Employé', 0, '{}', '{}'),
(70, 'shop11', 1, 'boss', 'Patron', 0, '{}', '{}'),
(71, 'shop12', 0, 'employee', 'Employé', 0, '{}', '{}'),
(72, 'shop12', 1, 'boss', 'Patron', 0, '{}', '{}'),
(73, 'shop13', 0, 'employee', 'Employé', 0, '{}', '{}'),
(74, 'shop13', 1, 'boss', 'Patron', 0, '{}', '{}'),
(75, 'shop14', 0, 'employee', 'Employé', 0, '{}', '{}'),
(76, 'shop14', 1, 'boss', 'Patron', 0, '{}', '{}'),
(77, 'shop15', 0, 'employee', 'Employé', 0, '{}', '{}'),
(78, 'shop15', 1, 'boss', 'Patron', 0, '{}', '{}'),
(79, 'shop16', 0, 'employee', 'Employé', 0, '{}', '{}'),
(80, 'shop16', 1, 'boss', 'Patron', 0, '{}', '{}'),
(81, 'shop17', 0, 'employee', 'Employé', 0, '{}', '{}'),
(82, 'shop17', 1, 'boss', 'Patron', 0, '{}', '{}'),
(83, 'shop18', 0, 'employee', 'Employé', 0, '{}', '{}'),
(84, 'shop18', 1, 'boss', 'Patron', 0, '{}', '{}'),
(85, 'shop19', 0, 'employee', 'Employé', 0, '{}', '{}'),
(86, 'shop19', 1, 'boss', 'Patron', 0, '{}', '{}'),
(87, 'shop20', 0, 'employee', 'Employé', 0, '{}', '{}'),
(88, 'shop20', 1, 'boss', 'Patron', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Code de la route'),
('permis_aviation', 'Permis Aviation'),
('permis_bateau', 'Permis Bateau'),
('permis_camion', 'Permis Camion'),
('permis_moto', 'Permis Moto'),
('permis_voiture', 'Permis Voiture'),
('t_weapon', 'Licence Théorique Arme'),
('weapon', 'Permis Arme');

-- --------------------------------------------------------

--
-- Structure de la table `multicharacter_slots`
--

CREATE TABLE `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_shops`
--

CREATE TABLE `owned_shops` (
  `identifier` varchar(46) DEFAULT NULL,
  `ShopNumber` int(11) NOT NULL,
  `ShopName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `owned_shops`
--

INSERT INTO `owned_shops` (`identifier`, `ShopNumber`, `ShopName`) VALUES
('0', 1, '0'),
('0', 2, '0'),
('0', 3, '0'),
('0', 4, '0'),
('0', 5, '0'),
('0', 6, '0'),
('0', 7, '0'),
('0', 8, '0'),
('0', 9, '0'),
('0', 10, '0'),
('0', 11, '0'),
('0', 12, '0'),
('0', 13, '0'),
('0', 14, '0'),
('0', 15, '0'),
('0', 16, '0'),
('0', 17, '0'),
('0', 18, '0'),
('0', 19, '0'),
('0', 20, '0');

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'car',
  `job` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stored` tinyint(1) DEFAULT NULL,
  `parking` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SandyShores',
  `peopleWithKeys` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `pound` varchar(60) DEFAULT NULL,
  `mileage` float DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `garage_id` varchar(32) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ox_doorlock`
--

CREATE TABLE `ox_doorlock` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ox_doorlock`
--

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
(1, 'mrpd locker rooms', '{\"maxDistance\":2,\"heading\":90,\"coords\":{\"x\":450.1041259765625,\"y\":-985.7384033203125,\"z\":30.83930206298828},\"groups\":{\"police\":0},\"state\":1,\"model\":1557126584,\"hideUi\":false}'),
(2, 'mrpd cells/briefing', '{\"maxDistance\":2,\"coords\":{\"x\":444.7078552246094,\"y\":-989.4454345703125,\"z\":30.83930206298828},\"doors\":[{\"model\":185711165,\"coords\":{\"x\":446.0079345703125,\"y\":-989.4454345703125,\"z\":30.83930206298828},\"heading\":0},{\"model\":185711165,\"coords\":{\"x\":443.40777587890627,\"y\":-989.4454345703125,\"z\":30.83930206298828},\"heading\":180}],\"groups\":{\"police\":0},\"state\":1,\"hideUi\":false}'),
(3, 'mrpd cell 3', '{\"maxDistance\":2,\"heading\":90,\"coords\":{\"x\":461.8065185546875,\"y\":-1001.9515380859375,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),
(4, 'mrpd back entrance', '{\"maxDistance\":2,\"coords\":{\"x\":468.6697692871094,\"y\":-1014.4520263671875,\"z\":26.5362319946289},\"doors\":[{\"model\":-2023754432,\"coords\":{\"x\":467.37164306640627,\"y\":-1014.4520263671875,\"z\":26.5362319946289},\"heading\":0},{\"model\":-2023754432,\"coords\":{\"x\":469.9678955078125,\"y\":-1014.4520263671875,\"z\":26.5362319946289},\"heading\":180}],\"groups\":{\"police\":0},\"state\":1,\"hideUi\":false}'),
(5, 'mrpd cells security door', '{\"maxDistance\":2,\"heading\":0,\"coords\":{\"x\":464.1282958984375,\"y\":-1003.5386962890625,\"z\":25.00598907470703},\"autolock\":5,\"groups\":{\"police\":0},\"state\":1,\"model\":-1033001619,\"hideUi\":false}'),
(6, 'mrpd cell 2', '{\"maxDistance\":2,\"heading\":90,\"coords\":{\"x\":461.8064880371094,\"y\":-998.3082885742188,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),
(7, 'mrpd captain\'s office', '{\"maxDistance\":2,\"heading\":180,\"coords\":{\"x\":446.57281494140627,\"y\":-980.0105590820313,\"z\":30.83930206298828},\"groups\":{\"police\":0},\"state\":1,\"model\":-1320876379,\"hideUi\":false}'),
(8, 'mrpd gate', '{\"maxDistance\":6,\"heading\":90,\"coords\":{\"x\":488.894775390625,\"y\":-1017.2102661132813,\"z\":27.14714050292968},\"groups\":{\"police\":0},\"auto\":true,\"state\":1,\"model\":-1603817716,\"hideUi\":false}'),
(9, 'mrpd cell 1', '{\"maxDistance\":2,\"heading\":270,\"coords\":{\"x\":461.8065185546875,\"y\":-993.7586059570313,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),
(10, 'mrpd cells main', '{\"maxDistance\":2,\"heading\":360,\"coords\":{\"x\":463.92010498046877,\"y\":-992.6640625,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),
(11, 'mrpd armoury', '{\"maxDistance\":2,\"heading\":270,\"coords\":{\"x\":453.08428955078127,\"y\":-982.5794677734375,\"z\":30.81926536560058},\"autolock\":5,\"groups\":{\"police\":0},\"state\":1,\"model\":749848321,\"hideUi\":false}');

-- --------------------------------------------------------

--
-- Structure de la table `ox_inventory`
--

CREATE TABLE `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_outfit_codes`
--

CREATE TABLE `player_outfit_codes` (
  `id` int(11) NOT NULL,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext NOT NULL DEFAULT '[{"count":1,"slot":1,"name":"phone"},{"count":10,"slot":2,"name":"burger"},{"count":10,"slot":3,"name":"water"},{"count":500,"slot":4,"name":"money"},{"count":5,"slot":5,"name":"bandage"}]',
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(20) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `job3` varchar(20) DEFAULT 'unemployed3',
  `job3_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `pincode` int(11) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('17silvrb', '17silvrb', 25000, 'import'),
('19sclass', '19sclass', 100000, 'import'),
('206wrc', '206wrc', 20000, 'import'),
('a90pit', 'a90pit', 100000, 'import'),
('Adder', 'adder', 100000, 'super'),
('aemsv450', 'AEMSV450', 15000, 'métier'),
('Akuma', 'AKUMA', 8000, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('amarok', 'amarok', 60000, 'import'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('aventador', 'aventador', 250000, 'import'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('camry18', 'CAMRY18', 25000, 'import'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('castrolsupra', 'castrolsupra', 20000, 'import'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dodge EMS FiveM', 'dodgeEMS', 25000, 'métier'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('e63sf', 'E63SF', 60000, 'import'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('f450towtruk', 'f450towtruk', 40000, 'métier'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('gemera', 'gemera', 70000, 'import'),
('model fivem', 'gle21', 30000, 'import'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('EMSinterceptor', 'intems', 20000, 'import'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('ktmx', 'KTMX', 20000, 'import'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Aperta', 'laferrari17', 150000, 'import'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('m6prior', 'm6prior', 150000, 'import'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('BMWi422spe', 'ocni422spe', 40000, 'import'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('2018taurusrb', 'police3', 30000, 'métier'),
('pollp770', 'pollp770', 100000, 'métier'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('q820', 'q820', 50000, 'import'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('rs52021', 'RS52021', 50000, 'import'),
('RS6', 'rs62', 150000, 'import'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Sheriff Premier', 'SHERIFF', 25000, 'métier'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('taycan', 'taycan', 125000, 'import'),
('teslapd', 'teslapd', 125000, 'import'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('xperia', 'XPERIA38', 150, 'import'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_keys`
--

CREATE TABLE `vehicle_keys` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `plate` varchar(12) NOT NULL,
  `state` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(46) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Index pour la table `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `banking`
--
ALTER TABLE `banking`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`license`);

--
-- Index pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `multicharacter_slots`
--
ALTER TABLE `multicharacter_slots`
  ADD PRIMARY KEY (`identifier`) USING BTREE,
  ADD KEY `slots` (`slots`) USING BTREE;

--
-- Index pour la table `owned_shops`
--
ALTER TABLE `owned_shops`
  ADD PRIMARY KEY (`ShopNumber`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ox_inventory`
--
ALTER TABLE `ox_inventory`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Index pour la table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Index pour la table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Index pour la table `player_outfit_codes`
--
ALTER TABLE `player_outfit_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_player_outfit_codes_player_outfits` (`outfitid`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `index_users_phone_number` (`phone_number`);

--
-- Index pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Index pour la table `vehicle_keys`
--
ALTER TABLE `vehicle_keys`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `baninfo`
--
ALTER TABLE `baninfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `banking`
--
ALTER TABLE `banking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_outfit_codes`
--
ALTER TABLE `player_outfit_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicle_keys`
--
ALTER TABLE `vehicle_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
