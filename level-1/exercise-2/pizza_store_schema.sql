-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizza_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizza_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizza_store` DEFAULT CHARACTER SET utf8 ;
USE `pizza_store` ;

-- -----------------------------------------------------
-- Table `pizza_store`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL,
  `province` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_store`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`store` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(60) NOT NULL,
  `cp` INT(5) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_store`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `nif` INT(11) NOT NULL,
  `phone` INT(11) NOT NULL,
  `employee_rol` ENUM('chef', 'driver') NOT NULL,
  `store_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_store1_idx` (`store_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizza_store`.`store` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_store`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time_order` DATETIME NOT NULL,
  `delivery_place` ENUM('home', 'store') NOT NULL,
  `quantity` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `employee_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `delivery_order` VARCHAR(45) NULL,
  `date_time_delivery` DATETIME NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_order_store1_idx` (`store_id` ASC) VISIBLE,
  INDEX `fk_order_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizza_store`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizza_store`.`store` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `pizza_store`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_store`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_store`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type_product` ENUM('pizza', 'hamburguer', 'drink') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(120) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `category_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `pizza_store`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_store`.`product_has_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`product_has_order` (
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `order_id`),
  INDEX `fk_product_has_order_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_has_order_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_order_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `pizza_store`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizza_store`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
