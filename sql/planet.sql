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
-- Structure de la table `planet`
--

CREATE TABLE IF NOT EXISTS `planet` (
  `idplanet` int(11) NOT NULL AUTO_INCREMENT,
  `planete_nom` varchar(45) DEFAULT NULL,
  `desc` longtext,
  `pos_x` int(11) DEFAULT NULL,
  `pos_y` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `idfaction` int(11) NOT NULL,
  `idsysteme` int(11) NOT NULL,
  PRIMARY KEY (`idplanet`),
  KEY `fk_planet_faction1_idx` (`idfaction`),
  KEY `fk_planet_Système1_idx` (`idsysteme`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `planet`
--

INSERT INTO `planet` (`idplanet`, `planete_nom`, `desc`, `pos_x`, `pos_y`, `image`, `idfaction`, `idsysteme`) VALUES
(1, 'The void', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 8, 8, 'Strange Thingy.png', 2, 1),
(2, 'P 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 7, 2, 'Exoplanet3.png', 1, 1),
(3, 'Soleil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 5, 5, 'Sun.png', 3, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `planet`
--
ALTER TABLE `planet`
  ADD CONSTRAINT `fk_planet_faction1` FOREIGN KEY (`idfaction`) REFERENCES `faction` (`idfaction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_planet_Système1` FOREIGN KEY (`idsysteme`) REFERENCES `systeme` (`idsysteme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
