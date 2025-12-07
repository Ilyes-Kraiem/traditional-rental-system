-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 16 mai 2025 à 16:05
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd2023`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `codeCat` int NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`codeCat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`codeCat`, `libelle`) VALUES
(1, 'Robe de soirée'),
(2, 'Robe de mariée'),
(3, 'Caftan'),
(4, 'Costume'),
(5, 'Jebba');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `cin` varchar(8) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `tel` varchar(8) NOT NULL,
  PRIMARY KEY (`cin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cin`, `nom`, `tel`) VALUES
('02222222', 'Olfa Fourati', '13131313'),
('11111111', 'Maysa Abidi', '12121212'),
('13333333', 'Sami Dridi', '14141414');

-- --------------------------------------------------------

--
-- Structure de la table `habit`
--

DROP TABLE IF EXISTS `habit`;
CREATE TABLE IF NOT EXISTS `habit` (
  `codeHab` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `taille` char(1) NOT NULL,
  `prix` int NOT NULL,
  `disponible` char(1) NOT NULL DEFAULT 'D',
  `codeCat` int NOT NULL,
  PRIMARY KEY (`codeHab`),
  KEY `codeCat` (`codeCat`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `habit`
--

INSERT INTO `habit` (`codeHab`, `description`, `taille`, `prix`, `disponible`, `codeCat`) VALUES
(1, 'Blouza et fouta caramel', 'X', 123, 'D', 2),
(2, 'Blouza et fouta argentees', 'M', 150, 'N', 2),
(3, 'Caftan velour', 'L', 145, 'D', 3),
(4, 'Costume kamraya beige', 'X', 222, 'N', 4),
(5, 'Costume kamraya blanc', 'S', 111, 'D', 4),
(6, 'Catfan avec broderie', 'M', 222, 'D', 3),
(7, 'Robe longue en crepe', 'M', 222, 'D', 1),
(8, 'Robe sirene en soie bleu', 'L', 300, 'D', 1);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `dateLoc` date NOT NULL,
  `codeHab` int NOT NULL,
  `cin` varchar(8) NOT NULL,
  `duree` int NOT NULL,
  PRIMARY KEY (`dateLoc`,`codeHab`),
  KEY `cin` (`cin`),
  KEY `ck2` (`codeHab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`dateLoc`, `codeHab`, `cin`, `duree`) VALUES
('2023-05-21', 2, '02222222', 3),
('2023-05-22', 4, '13333333', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `habit`
--
ALTER TABLE `habit`
  ADD CONSTRAINT `ck1` FOREIGN KEY (`codeCat`) REFERENCES `categorie` (`codeCat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `ck2` FOREIGN KEY (`codeHab`) REFERENCES `habit` (`codeHab`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
