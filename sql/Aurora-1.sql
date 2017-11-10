-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 24 Février 2016 à 15:52
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
-- Contenu de la table `effectue`
--

INSERT INTO `effectue` (`iduser`, `idmission`) VALUES
(1, 1),
(2, 1);

--
-- Contenu de la table `ennemi`
--

INSERT INTO `ennemi` (`idIA`, `idmission`) VALUES
(1, 1);

--
-- Contenu de la table `faction`
--

INSERT INTO `faction` (`idfaction`, `nom`, `desc`, `image`) VALUES
(1, 'Alien', 'Les aliens sont apparus du jour au lendemain dans la galaxie, on ne sait ni pourquoi ni comment. C''est une race fière et avec des lois très complexe.', 'alien.png'),
(2, 'Les Pirates', 'Composés à la foi d''Humain et d''alien ils sont extrêmement dangereux. Ne voguant dans l''espace que pour piller et détruire les autres factions.', 'pirate.png'),
(3, 'La Fédération', 'La fédération est composé de l''alliance de toutes les planètes humaines du système. Elle à pour but de rendre le système solaire au humains et d’empêcher la prolifération alien et pirate.', 'federation.png');

--
-- Contenu de la table `IA`
--

INSERT INTO `IA` (`idIA`, `nom`, `pv`, `attaque`, `defense`, `image`, `type`) VALUES
(1, 'Pirate Leger', 150, 5, 2, 'F5S3.png', '1');

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
-- Contenu de la table `mission`
--

INSERT INTO `mission` (`idmission`, `nom`, `niveau`, `desc`, `image`, `levelquest`, `idplanet`, `levelquestreward`) VALUES
(1, 'Le grand jour - History Quest', 1, 'C''est l''heure pour vous de partir à l''aventure. Ayant enfin rassembler suffisamment d''argent pour pouvoir intégrer une faction et choisir vôtre premier vaisseau, vous vous élancez alors vers de nouveau horizon. Cette mission sera votre premier test face à un ennemie plus que faible...', 'm1.jpg', 0, 2, 1),
(2, 'L''aventure continue - History Quest', 1, 'Suite à vôtre succès dans la première mission votre faction vous propose de repartir une nouvelle fois au combat plus loin dans le système.', 'marchand.jpg', 1, 1, 1);

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`idnews`, `titre`, `desc`, `image`, `date`, `iduser`) VALUES
(1, 'Patch - 0.03v', 'Ca avance bien<br>\n- Avancement map<br>\n- Travail sur le market<br>\n- Cortana en cours de dev<br>', NULL, '2016-02-16 13:54:19', 1);

--
-- Contenu de la table `planet`
--

INSERT INTO `planet` (`idplanet`, `planete_nom`, `desc`, `système`, `pos_x`, `pos_y`, `image`, `idfaction`) VALUES
(1, 'P 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 1, 4, 8, 'Exoplanet.png', 1),
(2, 'P 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 1, 2, 4, 'Exoplanet2.png', 2),
(3, 'The void', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 1, 8, 8, 'Strange Thingy.png', 2),
(4, 'P 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 1, 7, 2, 'Exoplanet3.png', 1),
(5, 'Soleil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis ac arcu id tincidunt. Maecenas odio sapien, finibus sed metus nec, semper facilisis erat. Etiam mattis fringilla ante, ut pretium lectus convallis in. Pellentesque sed hendrerit ante. Duis porta erat sit amet scelerisque tempus. Etiam et ligula pharetra, fringilla nisl in, scelerisque urna. Cras commodo mattis est, sed fringilla nisl pharetra non. Nam vel egestas ipsum, eu convallis massa. ', 1, 5, 5, 'Sun.png', 3);

--
-- Contenu de la table `promotion`
--

INSERT INTO `promotion` (`idpromotion`, `reduction`, `idspaceship`) VALUES
(1, 10, 3),
(2, 5, 4);

--
-- Contenu de la table `ressources_joueur`
--

INSERT INTO `ressources_joueur` (`idressources`, `aqua`, `ruby`, `emerald`, `topaz`, `money`, `iduser`) VALUES
(1, 105, 105, 105, 131, 1500, 1),
(2, 110, 110, 110, 140, 0, 2),
(3, 110, 110, 110, 140, 0, 2),
(4, 100, 100, 100, 140, 1000, 4),
(5, 100, 100, 100, 140, 1000, 5),
(6, 100, 100, 100, 140, 1000, 6),
(7, 100, 100, 100, 131, 1000, 1),
(8, 100, 100, 100, 138, 1000, 8),
(9, 100, 100, 100, 136, 100, 9);

--
-- Contenu de la table `ressources_mission`
--

INSERT INTO `ressources_mission` (`idressources`, `aqua`, `ruby`, `emerald`, `topaz`, `money`, `xp`, `energie`, `idmission`) VALUES
(1, 1, 1, 1, 1, 50, 10, 2, 1),
(2, 1, 1, 1, 1, 50, 10, 2, 2);

--
-- Contenu de la table `spaceship`
--

INSERT INTO `spaceship` (`idspaceship`, `nom`, `desc`, `pv`, `attaque`, `defense`, `type`, `image`, `prix`, `xp`, `nextlevel`, `idfaction`) VALUES
(1, 'Alien 1', 'Alien ship.', 350, 15, 3, 1, 'alien1.png', 750, 0, 100, 1),
(2, 'Federation 1', 'Federaion Ship.', 350, 15, 3, 1, 'blue1.png', 750, 0, 100, 3),
(3, 'Pirate 1', 'Pirate Ship.', 350, 17, 2, 1, 'RD1.png', 750, 0, 100, 2),
(4, 'Alien 2', 'Alien ship.', 425, 25, 5, 2, 'alien2.png', 1500, 0, 100, 1),
(5, 'Federation 2', 'Federation ship.', 1500, 25, 6, 2, 'att5.png', 1500, 0, 100, 3),
(6, 'Big Pirate Ship', 'Big irate ship.', 1000, 32, 8, 3, 'redship4.png', 2500, 0, 100, 2);

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`iduser`, `pseudo`, `email`, `avatar`, `passwd`, `rang`, `points`, `idvaisseau`, `salt`, `levelquest`, `idfaction`) VALUES
(1, 'sebspas', 'sebspas@yahoo.fr', 'https://upload.wikimedia.org/wikipedia/en/7/75/Saber.jpg', '1bcedcd49d8ccf1d8c516e90f17546a5b7d6ea89f02071b7f1cc7d22fddb43de09d4b32afe86abdc149b695a1b95aa6fe7e297d2b7c5ce4689195d869d09043d', 2, 30000, 2, '8bfced039e5cd2ebf2be77e73b72e2cb0566295e12d8a64926859d8eb5ed6446', 1, 1),
(2, 'livekontesk', 'timothee.ficat@laposte.net', 'http://payload96.cargocollective.com/1/1/34851/4228611/NK_Biosuit_01b_2048.jpg', 'b75f573e8248fe5e82cbf1eb0b82b93f6d3e7650c51191af5c548e0b30c1c58b0946b8db91d2d0131e647cd35cfde58df10a94b9a3aec0a6f381206898996cdf', 2, 100, 7, '8d0c731dac06bb19926fb7fc1107b5228359fb19369a72118ca9f6986a1f9262', 1, 3),
(3, 'livekontesk', 'timothee.ficat@laposte.net', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', '3e910b3700133146691d7224bedc514c24a822087426f8f2b5cae3fe34e92932cd55fa6f5c702ed6fb80127fb0cf1309d27c2eccba2c012f6bd980693915bc0e', 0, 0, 0, '3aa58c235535d5f937e3c6390422b6d183fd434c3c5585cf00884cc90e48f545', 0, NULL),
(4, 'misterperdu', 'vincent.pera@hotmail.fr', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', '537c01169b0558bcc89beccde8e2af96b4a5b4067a9ac991070a28f54848662d1302503f3bbfcbf45621b741dfdcc005fb03afe112babe40f0007ad81f68f945', 2, 0, 8, '9f7df66d6923dc170ca853dc98923304cf8cd34eca546e5bb96e3ecc91397778', 0, 2),
(5, 'misterperdu2', 'vincent.pera@hotmail.frr', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', 'b6e38e529da1bb3400e6dedaec5f747a91f50c7943e094f2318003d5a77bccdbae48657989f5219b004db742082e6850098280801803d583a36739066b9fb578', 2, 0, 9, '19a0e4c2acad3a6bcda90223fb5d4e7d5a6b9706b2680d5f34613da0ecac6d89', 0, 1),
(6, 'misterperdu1', 'vincent.pera@hotmail.fra', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', '87561b01286d595afc993eec0109668ffd1286fd2f08daa813508bb8c1646f06b0ea8578dfe62c4be1bdd5806a05f823f09bf498ce19a7bbb7676f5b96267584', 0, 0, 0, '97a38456dd9290dde363d7bc2ab47617d9ea53d89669c79eaa12f0a03ba4bdbb', 0, NULL),
(8, 'Misteraaaaa', 'vin@ta.tf', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', '447fcd82935034c88f7c44d0330b96a57fa405305359db545d5e0ddb66ac446dc5054ddcf7bcccec2b76de9e7fa55a96be39dbcc5f89ed67589bccde21b69491', 2, 0, 11, '021cb2ca3562d00b3373a4c5412e74c392305e40a48b8cc6e9218a3c6ce3abc0', 0, 2),
(9, 'john', 'john13@mailhazard.com', 'http://51.255.41.18/Aurora/asset/images/avatar/default.png', '64056be6e872fd0054ddff044f5c9c67870827b4909aa1f81295a6c1deabb12356abfd90a7ec742b4f5091cc841667c7e05f72b2267fae92bf62052f23a7d214', 2, 0, 13, '7832d00b03d01c42256bbcd9e2554134185e8d6d3278d271940e3d1404ef4783', 0, 1);

--
-- Contenu de la table `vaisseau`
--

INSERT INTO `vaisseau` (`idvaisseau`, `nom`, `desc`, `pv`, `attaque`, `defense`, `xp`, `nextlevel`, `type`, `image`, `iduser`, `level`, `idfaction`) VALUES
(2, 'Federation 1', 'Federaion Ship.', 350, 15, 3, 40, 100, 1, 'blue1.png', 1, 1, 3),
(5, 'Pirate 1', 'Pirate Ship.', 350, 17, 2, 0, 100, 1, 'RD1.png', 1, 1, 2),
(7, 'Federation 1', 'Federaion Ship.', 370, 20, 5, 0, 233, 1, 'blue1.png', 2, 2, 3),
(8, 'Alien 1', 'Alien ship.', 350, 15, 3, 0, 100, 1, 'alien1.png', 4, 1, 1),
(9, 'Federation 1', 'Federaion Ship.', 350, 15, 3, 0, 100, 1, 'blue1.png', 5, 1, 3),
(10, 'Pirate 1', 'Pirate Ship.', 350, 17, 2, 0, 100, 1, 'RD1.png', 2, 1, 2),
(11, 'Alien 1', 'Alien ship.', 350, 15, 3, 0, 100, 1, 'alien1.png', 8, 1, 1),
(12, 'Alien 1', 'Alien ship.', 350, 15, 3, 0, 100, 1, 'alien1.png', 2, 1, 1),
(13, 'Alien 1', 'Alien ship.', 350, 15, 3, 0, 100, 1, 'alien1.png', 9, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
