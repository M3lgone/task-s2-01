-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optical_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optical_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optical_store` DEFAULT CHARACTER SET utf8 ;
USE `optical_store` ;

-- -----------------------------------------------------
-- Table `optical_store`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optical_store`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `cp` INT(5) NOT NULL,
  `phone` INT(11) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `date_record` DATETIME NOT NULL,
  `recommended_by` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_client1_idx` (`recommended_by` ASC) VISIBLE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`recommended_by`)
    REFERENCES `optical_store`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optical_store`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optical_store`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `adress` VARCHAR(120) NOT NULL,
  `phone` INT(11) NOT NULL,
  `fax` INT(12) NOT NULL,
  `nif` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optical_store`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optical_store`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optical_store`.`lens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optical_store`.`lens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `lens_graduation` VARCHAR(45) NOT NULL,
  `type_frame` ENUM('plastic', 'metal', 'rimless') NOT NULL,
  `color_frame` VARCHAR(12) NOT NULL,
  `color_lens` VARCHAR(12) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `suppliers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lens_suppliers_idx` (`suppliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_lens_suppliers`
    FOREIGN KEY (`suppliers_id`)
    REFERENCES `optical_store`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optical_store`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optical_store`.`sale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clients_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `lens_id` INT NOT NULL,
  `record_data_sale` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sale_clients1_idx` (`clients_id` ASC) VISIBLE,
  INDEX `fk_sale_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_sale_lens1_idx` (`lens_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `optical_store`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `optical_store`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_lens1`
    FOREIGN KEY (`lens_id`)
    REFERENCES `optical_store`.`lens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

