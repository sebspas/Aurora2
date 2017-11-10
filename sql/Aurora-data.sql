-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 23 Mars 2016 à 16:13
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
--
-- Contenu de la table `faction`
--

INSERT INTO `faction` (`idfaction`, `nom`, `desc`, `image`) VALUES
(1, 'Alien', 'Les aliens sont apparus du jour au lendemain dans la galaxie, on ne sait ni pourquoi ni comment. C''est une race fière et avec des lois très complexe.', 'alien.png'),
(2, 'Les Pirates', 'Composés à la foi d''Humain et d''alien ils sont extrêmement dangereux. Ne voguant dans l''espace que pour piller et détruire les autres factions.', 'pirate.png'),
(3, 'Alien', 'Les aliens sont apparus du jour au lendemain dans la galaxie, on ne sait ni pourquoi ni comment. C''est une race fière et avec des lois très complexe.', 'alien.png');

--
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
-- Contenu de la table `deck`
--

INSERT INTO `deck` (`iddeck`, `nom`, `type`) VALUES
(1, 'Deck_Alpha', '1');
--
-- Contenu de la table `carte_has_deck`
--

INSERT INTO `carte_has_deck` (`idcarte`, `iddeck`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1);
--
-- Contenu de la table `systeme`
--

INSERT INTO `systeme` (`idsysteme`, `Nom`, `Desc`, `pos_x`, `pox_y`) VALUES
(1, 'Soil', NULL, 0, 0);

--
-- Contenu de la table `planet`
--

INSERT INTO `planet` (`idplanet`, `planete_nom`, `desc`, `pos_x`, `pos_y`, `image`, `idfaction`, `idsysteme`) VALUES
(1, 'Elama', 'Elama est la seule planète se trouvant dans la zone verte du système Kopplar. C’est la première\r\n\r\nplanète du système visité par l’homme. Son atmosphère est principalement composée d’azote,\r\n\r\nd’oxygène et d’hélium. Il est possible d’y survivre sans aide respiratoire pendant près de 5 minutes.\r\n\r\nSa végétation fait la joie des chercheurs et biologistes qui cherchent tous à obtenir les droits\r\n\r\nd’étudier ses plantes possédant des systèmes de survie très performants. Malgré une flore très\r\n\r\nimposante, Elama ne jouit d’aucune faune digne de ce nom. Même si l’on trouve des micro-\r\n\r\norganismes à la surface de ses océans, personne n’a encore découvert de forme de vie doué\r\n\r\nd’intelligence et visible à l’œil nu.\r\n\r\nGrâce à son atmosphère dense et son climat doux, la fédération s’est vite installée et des grandes\r\n\r\nvilles ont émergées dans les forêts et sur les littoraux de la planète. En cinquante années, la\r\n\r\npopulation de la planète a atteint plus de deux milliards d’humains et on y trouve maintenant de\r\n\r\ngrandes universités prestigieuses basées sur l’étude de la flore et des minéraux d’Elama.', 5, 8, 'Exoplanet.png', 1, 1),
(2, 'Criid', 'La planète Criid se trouve à une grande distance de son étoile. Offerte à Criid Mining Industry\r\n\r\n(CMI) par l’explorateur S. Kristorson pour l’aide apportée par l’entreprise dans ses recherches,\r\n\r\ncelle-ci exploite maintenant les ressources minières de sa planète gelée. L’exploitation constitue la\r\n\r\npremière source de topaz de la fédération. L’entreprise a donc obtenue le droit d’exploiter les\r\n\r\nressources de Criid au détriment de sa conservation. La CMI s’est donc développé tout autour de la\r\n\r\nplanète, parsemant des mines et des villes minières à intervalles réguliers.\r\n\r\nLa planète gelée Criid s’est doucement réchauffé, troquant sa robe blanche pour un sol noir et gris\r\n\r\ntypique des déchets des exploitations de topaz. Son ambiance industrielle a fait fuir les populations\r\n\r\net les voyageurs, laissant toujours plus de place à l’entreprise d’excavation.', 2, 4, 'Exoplanet3.png', 1, 1),
(3, 'Readsel', 'Readsel et la planète la plus proche de l’étoile Kopplar. Son sol est constitué de carbone et de\r\n\r\nsouffre, interdisant toute forme de vie de s’y développer. On peut trouver à sa surface quelques\r\n\r\nbâtiments abandonné, fruit des rares explorations de la fédération. La planète n’a presque rien à\r\n\r\noffrir hormis quelques minerais.\r\n\r\nSes volcans et bulles de gaz ont mis à rude épreuves les explorateurs venu l’observer et en ont\r\n\r\nmême tué plus d’un tiers. Aujourd’hui la planète et presque abandonnées, laissant un refuge,\r\n\r\nnéanmoins risqué, aux malfrats voulant éviter des rencontres avec la fédération.', 7, 6, 'GasGiant.png', 1, 1),
(4, 'Koplar', 'Etoile centrale du système.', 5, 5, 'RedGiant.png', 1, 1),
(5, 'Kylogi', 'Kylogi est une planète quasiment recouverte d’eau. On y trouve de rares îles sur lesquels se sont\r\n\r\ndéveloppées quelques espèces s’apparentant à des reptiles. Certaines îles ont était vidées de leurs\r\n\r\npopulation reptilienne suite à un afflux de scientifiques. Mais certaines organisations se sont\r\n\r\nbattues pour la préservation de ces îles, limitant leurs accès. Parmi les 42 îles plus de la moitié sont\r\n\r\nmaintenant fermées et surveillées. Les îles dépeuplées sont à présent habitées par des humains. La\r\n\r\nfédération veille à la non dégradation de Kylogi, comme l’avais demandé sont découvreur, S.\r\n\r\nKristorson.', 9, 3, 'Exoplanet2.png', 1, 1);


-- Contenu de la table `IA`
--

INSERT INTO `IA` (`idIA`, `nom`, `pv`, `attaque`, `defense`, `image`, `type`, `bouclier`, `level`, `idfaction`) VALUES
(1, 'Pirate Leger', 150, 5, 2, 'F5S3.png', '1', 100, 1, 2),
(2, 'Pirate Leger', 150, 5, 2, 'F5S3.png', '1', NULL, NULL, NULL);
--
-- Contenu de la table `mission`
--

INSERT INTO `mission` (`idmission`, `nom`, `niveau`, `desc`, `image`, `levelquest`, `levelquestreward`, `idplanet`) VALUES
(1, 'Le grand jour - History Quest', 1, 'C''est l''heure pour vous de partir à l''aventure. Ayant enfin rassembler suffisamment d''argent pour pouvoir intégrer une faction et choisir vôtre premier vaisseau, vous vous élancez alors vers de nouveau horizon. Cette mission sera votre premier test face à un ennemie plus que faible...', 'm1.jpg', 0, NULL, 2);

--
-- Contenu de la table `ennemi`
--

INSERT INTO `ennemi` (`idIA`, `idmission`) VALUES
(1, 1);



--
-- Contenu de la table `item`
--

INSERT INTO `item` (`idiitem`, `nom`, `desc`, `prix`, `image`, `spec`, `bonus`) VALUES
(1, 'M300 - V1', 'Le M3000 est l''arme de prédilection des vaisseau haut de gamme humain ! Equipez vous en pour augmenter considérablement votre force de frappe.', 1500, 'wep1.png', 'Attaque', 15),
(2, 'M3500 - V2', 'Le M3500 est l''évolution logique du M3000, elle possède une force de frappe encore plus élevée que le M3000 mais consomme aussi deux fois moins d''énergie lors de ses tirs.', 3000, 'wep2.png', 'Attaque', 30),
(3, 'Xelirack - V1', 'Le Xelirack est une arme utilisé sur la plupart des vaisseaux aliens. Elle inflige d''assez lourd dégâts en concentrant de l''énergie pure sous forme de faisceau de lumière.', 3500, 'wep6.png', 'Attaque', 30),
(4, 'Destructor ', 'Le Destructor est l''arme de base des vaisseaux pirates.', 4000, 'wep8.png', 'Attaque', 40),
(5, 'X-Destructeur', 'Depuis le Destructor les temps ont bien changés...', 9000, 'wep9.png', 'Attaque', 50),
(6, 'K2700 - Gold', 'Vous êtes riches et vous possédez déjà un bon arsenal ? Montrez votre richesse aux autres joueurs en achetant cette arme à un prix fou !', 15000, 'wep3.png', 'Attaque', 55),
(7, 'K5000 - Gold', 'Là ça deviens vraiment indécent ! Cette arme coûte beaucoup trop chère, ne l''achetez pas vous n''êtes pas un pigeon ou alors vous êtes vraiment trop riche !', 30000, 'wep4.png', 'Attaque', 60),
(8, 'Hybrid - Prot 2', 'Cette arme est la combinaison parfaite des technologies humaines et aliens combinés. Elle inflige les plus lourd dégâts possible.', 15000, 'wep5.png', 'Attaque', 50);

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`iduser`, `pseudo`, `email`, `avatar`, `passwd`, `rang`, `points`, `idvaisseau`, `salt`, `levelquest`, `idfaction`) VALUES
(1, 'sebspas', 'sebspas@yahoo.fr', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', 'b383ecdfdb563e97e2165484ddf3142bc46e4532710cbf74cd52c4f895b030cb7181132b3edd4966ddc8f2b7cad650c844ccea3cc747d19de816b62aa873b245', 2, 0, 1, 'a832617c09b891db39a7778388f13b0f091bfb5359714d5bf9f0cd948534e5ec', 0, 2);

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`idnews`, `titre`, `desc`, `image`, `date`, `iduser`) VALUES
(2, 'Patch - 0.03v', 'Ca avance bien<br>\n- Avancement map<br>\n- Travail sur le market<br>\n- Cortana en cours de dev<br>', NULL, '2016-03-22 21:22:11', 1);


--
-- Contenu de la table `ressources_joueur`
--

INSERT INTO `ressources_joueur` (`idressources`, `aqua`, `ruby`, `emerald`, `topaz`, `money`, `iduser`) VALUES
(1, 100, 100, 100, 142, 1000, 1);

--
-- Contenu de la table `ressources_mission`
--

INSERT INTO `ressources_mission` (`idressources`, `aqua`, `ruby`, `emerald`, `topaz`, `money`, `xp`, `energie`, `idmission`) VALUES
(1, 1, 1, 1, 1, 50, 10, 2, 1);

--
-- Contenu de la table `spaceship`
--

INSERT INTO `spaceship` (`idspaceship`, `nom`, `desc`, `pv`, `attaque`, `defense`, `type`, `image`, `prix`, `xp`, `nextlevel`, `idfaction`, `identreprise`, `bouclier`) VALUES
(1, 'Alien 1', 'Alien ship.', 350, 15, 3, 1, 'alien1.png', 750, 0, 100, 1, NULL, 0),
(2, 'Federation 1', 'Federaion Ship.', 350, 15, 3, 1, 'blue1.png', 750, 0, 100, 3, NULL, 0),
(3, 'Pirate 1', 'Pirate Ship.', 350, 17, 2, 1, 'RD1.png', 750, 0, 100, 2, NULL, 0),
(4, 'Alien 2', 'Alien ship.', 425, 25, 5, 2, 'alien2.png', 1500, 0, 100, 1, NULL, 0),
(5, 'Federation 2', 'Federation ship.', 1500, 25, 6, 2, 'att5.png', 1500, 0, 100, 3, NULL, 0),
(6, 'Big Pirate Ship', 'Big irate ship.', 1000, 32, 8, 3, 'redship4.png', 2500, 0, 100, 2, NULL, 0);



--
-- Contenu de la table `vaisseau`
--

INSERT INTO `vaisseau` (`idvaisseau`, `nom`, `desc`, `pv`, `attaque`, `defense`, `xp`, `nextlevel`, `type`, `image`, `iduser`, `level`, `idfaction`, `bouclier`) VALUES
(1, 'Federation 1', 'Federaion Ship.', 350, 15, 3, 0, 100, 1, 'blue1.png', 1, 1, 3, NULL);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
