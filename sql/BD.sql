-- MySQL Script generated by MySQL Workbench
-- 03/23/16 16:08:25
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Aurora
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Aurora` ;

-- -----------------------------------------------------
-- Schema Aurora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Aurora` DEFAULT CHARACTER SET utf8 ;
USE `Aurora` ;

-- -----------------------------------------------------
-- Table `Aurora`.`faction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`faction` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`faction` (
  `idfaction` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `desc` LONGTEXT NULL,
  `image` VARCHAR(255) NULL,
  PRIMARY KEY (`idfaction`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`user` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `pseudo` VARCHAR(55) NULL,
  `email` VARCHAR(255) NULL,
  `avatar` VARCHAR(255) NULL,
  `passwd` VARCHAR(512) NULL,
  `rang` INT NULL DEFAULT 0,
  `points` INT NULL DEFAULT 0,
  `idvaisseau` INT NOT NULL DEFAULT 0,
  `salt` VARCHAR(256) NULL,
  `levelquest` INT NULL DEFAULT 0,
  `idfaction` INT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_faction1_idx` (`idfaction` ASC),
  CONSTRAINT `fk_user_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`connecté`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`connecté` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`connecté` (
  `lastco` INT NULL,
  `iduser` INT NOT NULL,
  INDEX `fk_connecté_user_idx` (`iduser` ASC),
  PRIMARY KEY (`iduser`),
  CONSTRAINT `fk_connecté_user`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`item` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`item` (
  `idiitem` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `desc` LONGTEXT NULL,
  `prix` INT NULL,
  `image` VARCHAR(255) NULL,
  `spec` VARCHAR(45) NULL,
  `bonus` INT NULL,
  PRIMARY KEY (`idiitem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`vaisseau`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`vaisseau` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`vaisseau` (
  `idvaisseau` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `desc` LONGTEXT NULL,
  `pv` INT NULL,
  `attaque` INT NULL,
  `defense` INT NULL,
  `xp` INT NULL DEFAULT 0,
  `nextlevel` INT NULL DEFAULT 100,
  `type` INT NULL,
  `image` VARCHAR(255) NULL,
  `iduser` INT NOT NULL,
  `level` INT NULL DEFAULT 1,
  `idfaction` INT NOT NULL,
  `bouclier` INT NULL,
  PRIMARY KEY (`idvaisseau`),
  INDEX `fk_vaisseau_user1_idx` (`iduser` ASC),
  INDEX `fk_vaisseau_faction1_idx` (`idfaction` ASC),
  CONSTRAINT `fk_vaisseau_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vaisseau_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`equipement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`equipement` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`equipement` (
  `iduser` INT NOT NULL,
  `idiitem` INT NOT NULL,
  INDEX `fk_equipement_user1_idx` (`iduser` ASC),
  INDEX `fk_equipement_item1_idx` (`idiitem` ASC),
  PRIMARY KEY (`iduser`, `idiitem`),
  CONSTRAINT `fk_equipement_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipement_item1`
    FOREIGN KEY (`idiitem`)
    REFERENCES `Aurora`.`item` (`idiitem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`systeme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`systeme` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`systeme` (
  `idsysteme` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `Desc` LONGTEXT NULL,
  `pos_x` INT NULL,
  `pox_y` INT NULL,
  PRIMARY KEY (`idsysteme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`planet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`planet` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`planet` (
  `idplanet` INT NOT NULL AUTO_INCREMENT,
  `planete_nom` VARCHAR(45) NULL,
  `desc` LONGTEXT NULL,
  `pos_x` INT NULL,
  `pos_y` INT NULL,
  `image` VARCHAR(255) NULL,
  `idfaction` INT NOT NULL,
  `idsysteme` INT NOT NULL,
  PRIMARY KEY (`idplanet`),
  INDEX `fk_planet_faction1_idx` (`idfaction` ASC),
  INDEX `fk_planet_Système1_idx` (`idsysteme` ASC),
  CONSTRAINT `fk_planet_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planet_Système1`
    FOREIGN KEY (`idsysteme`)
    REFERENCES `Aurora`.`systeme` (`idsysteme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`mission` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`mission` (
  `idmission` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `niveau` INT NULL,
  `desc` LONGTEXT NULL,
  `image` VARCHAR(255) NULL,
  `levelquest` INT NULL,
  `levelquestreward` INT NULL,
  `idplanet` INT NOT NULL,
  PRIMARY KEY (`idmission`),
  INDEX `fk_mission_planet1_idx` (`idplanet` ASC),
  CONSTRAINT `fk_mission_planet1`
    FOREIGN KEY (`idplanet`)
    REFERENCES `Aurora`.`planet` (`idplanet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`effectue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`effectue` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`effectue` (
  `iduser` INT NOT NULL,
  `idmission` INT NOT NULL,
  INDEX `fk_effectue_user1_idx` (`iduser` ASC),
  INDEX `fk_effectue_mission1_idx` (`idmission` ASC),
  PRIMARY KEY (`idmission`, `iduser`),
  CONSTRAINT `fk_effectue_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_effectue_mission1`
    FOREIGN KEY (`idmission`)
    REFERENCES `Aurora`.`mission` (`idmission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`spaceship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`spaceship` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`spaceship` (
  `idspaceship` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `desc` LONGTEXT NULL,
  `pv` INT NULL,
  `attaque` INT NULL,
  `defense` INT NULL,
  `type` INT NULL,
  `image` VARCHAR(255) NULL,
  `prix` INT NULL,
  `xp` INT NULL DEFAULT 0,
  `nextlevel` INT NULL DEFAULT 100,
  `idfaction` INT NOT NULL,
  `identreprise` INT NULL,
  `bouclier` INT NULL DEFAULT 0,
  PRIMARY KEY (`idspaceship`),
  INDEX `fk_spaceship_faction1_idx` (`idfaction` ASC),
  INDEX `fk_spaceship_entreprise1_idx` (`identreprise` ASC),
  CONSTRAINT `fk_spaceship_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_spaceship_entreprise1`
    FOREIGN KEY (`identreprise`)
    REFERENCES `Aurora`.`entreprise` (`identreprise`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`entreprise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`entreprise` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`entreprise` (
  `identreprise` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `desc` LONGTEXT NULL,
  `image` LONGTEXT NULL,
  PRIMARY KEY (`identreprise`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`spaceship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`spaceship` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`spaceship` (
  `idspaceship` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `desc` LONGTEXT NULL,
  `pv` INT NULL,
  `attaque` INT NULL,
  `defense` INT NULL,
  `type` INT NULL,
  `image` VARCHAR(255) NULL,
  `prix` INT NULL,
  `xp` INT NULL DEFAULT 0,
  `nextlevel` INT NULL DEFAULT 100,
  `idfaction` INT NOT NULL,
  `identreprise` INT NULL,
  `bouclier` INT NULL DEFAULT 0,
  PRIMARY KEY (`idspaceship`),
  INDEX `fk_spaceship_faction1_idx` (`idfaction` ASC),
  INDEX `fk_spaceship_entreprise1_idx` (`identreprise` ASC),
  CONSTRAINT `fk_spaceship_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_spaceship_entreprise1`
    FOREIGN KEY (`identreprise`)
    REFERENCES `Aurora`.`entreprise` (`identreprise`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`IA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`IA` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`IA` (
  `idIA` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `pv` INT NULL,
  `attaque` INT NULL,
  `defense` INT NULL,
  `image` VARCHAR(255) NULL,
  `type` VARCHAR(45) NULL,
  `bouclier` INT NULL,
  `level` INT NULL,
  `idfaction` INT NULL,
  PRIMARY KEY (`idIA`),
  INDEX `fk_IA_faction1_idx` (`idfaction` ASC),
  CONSTRAINT `fk_IA_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`ennemi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`ennemi` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`ennemi` (
  `idIA` INT NOT NULL,
  `idmission` INT NOT NULL,
  INDEX `fk_ennemi_IA1_idx` (`idIA` ASC),
  INDEX `fk_ennemi_mission1_idx` (`idmission` ASC),
  CONSTRAINT `fk_ennemi_IA1`
    FOREIGN KEY (`idIA`)
    REFERENCES `Aurora`.`IA` (`idIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ennemi_mission1`
    FOREIGN KEY (`idmission`)
    REFERENCES `Aurora`.`mission` (`idmission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`news` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`news` (
  `idnews` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(150) NULL,
  `desc` LONGTEXT NULL,
  `image` VARCHAR(255) NULL,
  `date` TIMESTAMP NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idnews`),
  INDEX `fk_news_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_news_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`carte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`carte` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`carte` (
  `idcarte` INT NOT NULL AUTO_INCREMENT,
  `num` INT NULL,
  `nom` VARCHAR(155) NULL,
  `image` VARCHAR(255) NULL,
  `type` INT NULL,
  `effet` INT NULL,
  `desc` LONGTEXT NULL,
  `chance` INT NULL,
  `cible` INT NULL,
  `level` INT NULL,
  `positif` INT NULL,
  `idfaction` INT NOT NULL,
  `type_vaisseau` VARCHAR(45) NULL,
  `valeur` INT NULL,
  `duree` INT NULL,
  PRIMARY KEY (`idcarte`),
  INDEX `fk_carte_faction1_idx` (`idfaction` ASC),
  CONSTRAINT `fk_carte_faction1`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`deck`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`deck` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`deck` (
  `iddeck` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`iddeck`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`carte_has_deck`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`carte_has_deck` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`carte_has_deck` (
  `idcarte` INT NOT NULL,
  `iddeck` INT NOT NULL,
  INDEX `fk_carte_has_deck_deck1_idx` (`iddeck` ASC),
  INDEX `fk_carte_has_deck_carte1_idx` (`idcarte` ASC),
  PRIMARY KEY (`idcarte`, `iddeck`),
  CONSTRAINT `fk_carte_has_deck_carte1`
    FOREIGN KEY (`idcarte`)
    REFERENCES `Aurora`.`carte` (`idcarte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carte_has_deck_deck1`
    FOREIGN KEY (`iddeck`)
    REFERENCES `Aurora`.`deck` (`iddeck`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`ressources_joueur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`ressources_joueur` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`ressources_joueur` (
  `idressources` INT NOT NULL AUTO_INCREMENT,
  `aqua` INT NULL,
  `ruby` INT NULL,
  `emerald` INT NULL,
  `topaz` INT NULL,
  `money` INT NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idressources`, `iduser`),
  INDEX `fk_ressources_joueur_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_ressources_joueur_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`ressources_mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`ressources_mission` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`ressources_mission` (
  `idressources` INT NOT NULL AUTO_INCREMENT,
  `aqua` INT NULL,
  `ruby` INT NULL,
  `emerald` INT NULL,
  `topaz` INT NULL,
  `money` INT NULL,
  `xp` INT NULL,
  `energie` INT NULL,
  `idmission` INT NOT NULL,
  PRIMARY KEY (`idressources`, `idmission`),
  INDEX `fk_ressources_mission_mission1_idx` (`idmission` ASC),
  CONSTRAINT `fk_ressources_mission_mission1`
    FOREIGN KEY (`idmission`)
    REFERENCES `Aurora`.`mission` (`idmission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`promotion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`promotion` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`promotion` (
  `idpromotion` INT NOT NULL AUTO_INCREMENT,
  `reduction` INT NULL,
  `idspaceship` INT NOT NULL,
  PRIMARY KEY (`idpromotion`),
  INDEX `fk_promotion_spaceship1_idx` (`idspaceship` ASC),
  CONSTRAINT `fk_promotion_spaceship1`
    FOREIGN KEY (`idspaceship`)
    REFERENCES `Aurora`.`spaceship` (`idspaceship`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`combat_player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`combat_player` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`combat_player` (
  `idcombat_player` INT NOT NULL AUTO_INCREMENT,
  `tour` INT NULL,
  `type_combat` INT NULL,
  `type_player` INT NULL,
  `pioche` INT NULL,
  `idmission` INT NOT NULL,
  `iduser` INT NULL,
  PRIMARY KEY (`idcombat_player`),
  INDEX `fk_combat_player_mission1_idx` (`idmission` ASC),
  INDEX `fk_combat_player_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_combat_player_mission1`
    FOREIGN KEY (`idmission`)
    REFERENCES `Aurora`.`mission` (`idmission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_combat_player_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `Aurora`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`effet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`effet` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`effet` (
  `ideffet` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `duree` INT NULL,
  `valeur` INT NULL,
  `effet` INT NULL,
  `positif` INT NULL,
  `cible` INT NULL,
  `chance` INT NULL,
  `idcombat_player` INT NOT NULL,
  PRIMARY KEY (`ideffet`),
  INDEX `fk_effet_combat_player1_idx` (`idcombat_player` ASC),
  CONSTRAINT `fk_effet_combat_player1`
    FOREIGN KEY (`idcombat_player`)
    REFERENCES `Aurora`.`combat_player` (`idcombat_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`vaisseau_combat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`vaisseau_combat` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`vaisseau_combat` (
  `idvaisseau` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(65) NULL,
  `pv` INT NULL,
  `attaque` INT NULL,
  `defense` INT NULL,
  `type` INT NULL,
  `image` VARCHAR(255) NULL,
  `level` INT NULL DEFAULT 1,
  `bouclier` INT NULL,
  `idfaction` INT NULL,
  `idcombat_player` INT NOT NULL,
  PRIMARY KEY (`idvaisseau`),
  INDEX `fk_vaisseau_faction1_idx` (`idfaction` ASC),
  INDEX `fk_vaisseau_combat_combat_player1_idx` (`idcombat_player` ASC),
  CONSTRAINT `fk_vaisseau_faction10`
    FOREIGN KEY (`idfaction`)
    REFERENCES `Aurora`.`faction` (`idfaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vaisseau_combat_combat_player1`
    FOREIGN KEY (`idcombat_player`)
    REFERENCES `Aurora`.`combat_player` (`idcombat_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`deck_combat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`deck_combat` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`deck_combat` (
  `iddeck_combat` INT NOT NULL AUTO_INCREMENT,
  `nb_carte_max` INT NULL,
  `nb_carte_courant` INT NULL,
  `nb_carte_joue` INT NULL,
  `idcombat_player` INT NOT NULL,
  `iddeck` INT NOT NULL,
  PRIMARY KEY (`iddeck_combat`),
  INDEX `fk_deck_combat_combat_player1_idx` (`idcombat_player` ASC),
  INDEX `fk_deck_combat_deck1_idx` (`iddeck` ASC),
  CONSTRAINT `fk_deck_combat_combat_player1`
    FOREIGN KEY (`idcombat_player`)
    REFERENCES `Aurora`.`combat_player` (`idcombat_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deck_combat_deck1`
    FOREIGN KEY (`iddeck`)
    REFERENCES `Aurora`.`deck` (`iddeck`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`main_combat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`main_combat` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`main_combat` (
  `idcombat_player` INT NOT NULL,
  `idcarte` INT NOT NULL,
  INDEX `fk_main_combat_combat_player1_idx` (`idcombat_player` ASC),
  CONSTRAINT `fk_main_combat_combat_player1`
    FOREIGN KEY (`idcombat_player`)
    REFERENCES `Aurora`.`combat_player` (`idcombat_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_main_combat_carte1`
    FOREIGN KEY (`idcarte`)
    REFERENCES `Aurora`.`carte` (`idcarte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aurora`.`adversaire_combat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Aurora`.`adversaire_combat` ;

CREATE TABLE IF NOT EXISTS `Aurora`.`adversaire_combat` (
  `idcombat_player1` INT NOT NULL,
  `idcombat_player2` INT NOT NULL,
  PRIMARY KEY (`idcombat_player1`, `idcombat_player2`),
  INDEX `fk_combat_player_has_combat_player_combat_player2_idx` (`idcombat_player2` ASC),
  INDEX `fk_combat_player_has_combat_player_combat_player1_idx` (`idcombat_player1` ASC),
  CONSTRAINT `fk_combat_player_has_combat_player_combat_player1`
    FOREIGN KEY (`idcombat_player1`)
    REFERENCES `Aurora`.`combat_player` (`idcombat_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_combat_player_has_combat_player_combat_player2`
    FOREIGN KEY (`idcombat_player2`)
    REFERENCES `Aurora`.`combat_player` (`idcombat_player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
