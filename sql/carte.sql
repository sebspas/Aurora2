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
-- Structure de la table `carte`
--

CREATE TABLE IF NOT EXISTS `carte` (
  `idcarte` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `nom` varchar(155) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `effet` int(11) DEFAULT NULL,
  `desc` longtext,
  `chance` int(11) DEFAULT NULL,
  `cible` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `positif` int(11) DEFAULT NULL,
  `idfaction` int(11) NOT NULL,
  `type_vaisseau` varchar(45) DEFAULT NULL,
  `valeur` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`idcarte`),
  KEY `fk_carte_faction1_idx` (`idfaction`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `carte`
--

INSERT INTO `carte` (`idcarte`, `num`, `nom`, `image`, `type`, `effet`, `desc`, `chance`, `cible`, `level`, `positif`, `idfaction`, `type_vaisseau`, `valeur`, `duree`) VALUES
(4, 1, 'Tir Laser', 'laser.jpg', 1, 1, 'Tir d''un faisceau laser classique, de faible densité.', 80, 1, 1, 1, 3, NULL, 15, 1),
(5, 2, 'Tir Laser', 'laser.jpg', 1, 1, 'Tir d''un faisceau laser classique, de densité moyenne.', 80, 1, 2, 1, 3, NULL, 20, 1),
(6, 3, 'Tir Laser', 'laser.jpg', 1, 1, 'Tir d''un faisceau laser classique, de densité élevé.', 80, 1, 3, 1, 3, NULL, 30, 1),
(7, 12, 'Canon Corrosif', 'corrosif.jpg', 1, 2, 'Canon alien effectuant des dégâts chaque tour.', 1, 1, 1, 1, 1, NULL, 10, 3),
(8, 13, 'Canon Corrosif', 'corrosif.jpg', 1, 2, 'Canon alien effectuant des dégâts chaque tour.', 1, 1, 2, 2, 1, NULL, 15, 4),
(9, 14, 'Canon Corrosif', 'corrosif.jpg', 1, 2, 'Canon alien effectuant des dégâts chaque tour.', 1, 1, 3, 2, 1, NULL, 17, 5),
(10, 21, 'Canon Percant', 'percant.jpg', 1, 3, 'Tir concentré, ignorant l''armure adverse.', 75, 1, 1, 1, 2, NULL, 15, 1),
(11, 22, 'Canon Percant', 'percant.jpg', 1, 3, 'Tir concentré, ignorant l''armure adverse.', 75, 1, 2, 1, 2, NULL, 18, 1),
(12, 23, 'Canon Percant', 'percant.jpg', 1, 3, 'Tir concentré, ignorant l''armure adverse.', 75, 1, 3, 1, 2, NULL, 22, 1),
(13, 4, 'Répration d''urgence', 'repair.jpg', 2, 1, 'Répare le vaisseau instantanément.', 1, 0, 1, 1, 3, NULL, 75, 1),
(14, 5, 'Répration d''urgence', 'repair.jpg', 2, 1, 'Répare le vaisseau instantanément.', 1, 0, 2, 1, 3, NULL, 130, 1),
(15, 24, 'Réparation Automatisé', 'auto-repair', 2, 2, 'Réparation automatique sur la durée.', 85, 0, 1, 1, 3, NULL, 45, 3),
(16, 25, 'Réparation Automatisé', 'auto-repair', 2, 2, 'Réparation automatique sur la durée.', 85, 0, 2, 1, 3, NULL, 65, 4),
(18, 26, 'Réparation Automatisé', 'auto-repair', 2, 2, 'Réparation automatique sur la durée.', 85, 0, 3, 1, 3, NULL, 80, 4),
(19, 35, 'Poussée énergétique', 'shield.jpg', 2, 3, 'Régénération rapide d''une partie du bouclier grâce à une poussée énergétique.', 80, 0, 1, 1, 1, NULL, 50, 1),
(20, 36, 'Poussée énergétique', 'shield.jpg', 2, 3, 'Régénération rapide d''une partie du bouclier grâce à une poussée énergétique.', 80, 0, 2, 1, 1, NULL, 80, 1),
(21, 37, 'Poussée énergétique', 'shield.jpg', 2, 3, 'Régénération rapide d''une partie du bouclier grâce à une poussée énergétique.', 80, 0, 3, 1, 1, NULL, 120, 1),
(24, 7, 'IEM', 'reactor.jpg', 3, 3, 'IEM purifiant le vaisseau de tous les malus en cours.', 65, 0, 1, 1, 3, NULL, 0, 1),
(27, 29, 'Sabotage', 'reactor-overload.jpg', 3, 4, 'Sabotage du réacteur adverse, enlève tout les bonus de l''adversaire.', 60, 1, 1, 1, 2, NULL, 0, 1),
(28, 38, 'Breche dans la coque', 'breche.jpg', 3, 1, 'Tir précis causant une brèche dans la coque, réduisant l''armure du vaisseau adverse.', 75, 1, 1, 1, 2, NULL, 0, 2),
(29, 16, 'Destruction des canons', 'weapon-destroyed.jpg', 3, 6, 'Les armes adverses sont détruites, réduisant l''attaque du vaisseau adverse.', 69, 1, 1, 1, 1, NULL, 0, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `carte`
--
ALTER TABLE `carte`
  ADD CONSTRAINT `fk_carte_faction1` FOREIGN KEY (`idfaction`) REFERENCES `faction` (`idfaction`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
