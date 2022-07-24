-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema FitnessTracker
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `FitnessTracker` ;

-- -----------------------------------------------------
-- Schema FitnessTracker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FitnessTracker` DEFAULT CHARACTER SET utf8 ;
USE `FitnessTracker` ;

-- -----------------------------------------------------
-- Table `FitnessTracker`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FitnessTracker`.`User` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FitnessTracker`.`Sport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FitnessTracker`.`Sport` (
  `sportId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sportId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FitnessTracker`.`UserSport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FitnessTracker`.`UserSport` (
  `userSportId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `sportId` INT NOT NULL,
  PRIMARY KEY (`userSportId`),
  INDEX `fk_User_has_Sport_Sport1_idx` (`sportId` ASC),
  INDEX `fk_User_has_Sport_User_idx` (`userId` ASC),
  CONSTRAINT `fk_User_has_Sport_User`
    FOREIGN KEY (`userId`)
    REFERENCES `FitnessTracker`.`User` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Sport_Sport1`
    FOREIGN KEY (`sportId`)
    REFERENCES `FitnessTracker`.`Sport` (`sportId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FitnessTracker`.`Attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FitnessTracker`.`Attributes` (
  `attributesId` INT NOT NULL AUTO_INCREMENT,
  `duration` INT NULL,
  `date` DATE NOT NULL,
  `trainer` VARCHAR(45) NULL,
  `tachiWaza` INT NULL,
  `newaza` INT NULL,
  `distance` DOUBLE NULL,
  `repetition` INT NULL,
  PRIMARY KEY (`attributesId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FitnessTracker`.`Excercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FitnessTracker`.`Excercise` (
  `excerciseId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`excerciseId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FitnessTracker`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FitnessTracker`.`Event` (
  `eventId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `sportId` INT NOT NULL,
  `attributesId` INT NOT NULL,
  `excerciseId` INT NULL,
  INDEX `fk_Attributes_has_Excercise_Excercise1_idx` (`excerciseId` ASC),
  INDEX `fk_Attributes_has_Excercise_Attributes1_idx` (`attributesId` ASC),
  PRIMARY KEY (`eventId`),
  INDEX `fk_AttributesExcercise_Sport1_idx` (`sportId` ASC),
  INDEX `fk_Event_User1_idx` (`userId` ASC),
  CONSTRAINT `fk_Attributes_has_Excercise_Attributes1`
    FOREIGN KEY (`attributesId`)
    REFERENCES `FitnessTracker`.`Attributes` (`attributesId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_has_Excercise_Excercise1`
    FOREIGN KEY (`excerciseId`)
    REFERENCES `FitnessTracker`.`Excercise` (`excerciseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AttributesExcercise_Sport1`
    FOREIGN KEY (`sportId`)
    REFERENCES `FitnessTracker`.`Sport` (`sportId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `FitnessTracker`.`User` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
