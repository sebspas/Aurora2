-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 22 Mars 2016 à 22:15
-- Version du serveur: 5.5.47
-- Version de PHP: 5.4.45-0+deb7u2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `Aurora`
--

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE IF NOT EXISTS `mission` (
  `idmission` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(65) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  `desc` longtext,
  `image` varchar(255) DEFAULT NULL,
  `levelquest` int(11) DEFAULT NULL,
  `levelquestreward` int(11) DEFAULT NULL,
  `idplanet` int(11) NOT NULL,
  PRIMARY KEY (`idmission`),
  KEY `fk_mission_planet1_idx` (`idplanet`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `mission`
--

INSERT INTO `mission` (`idmission`, `nom`, `niveau`, `desc`, `image`, `levelquest`, `levelquestreward`, `idplanet`) VALUES
(1, 'Le grand jour - History Quest', 1, 'C''est l''heure pour vous de partir à l''aventure. Ayant enfin rassembler suffisamment d''argent pour pouvoir intégrer une faction et choisir vôtre premier vaisseau, vous vous élancez alors vers de nouveau horizon. Cette mission sera votre premier test face à un ennemie plus que faible...', 'm1.jpg', 0, NULL, 2);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `mission`
--
ALTER TABLE `mission`
  ADD CONSTRAINT `fk_mission_planet1` FOREIGN KEY (`idplanet`) REFERENCES `planet` (`idplanet`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
