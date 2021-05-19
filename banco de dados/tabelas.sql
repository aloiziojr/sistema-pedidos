-- MySQL Script generated by MySQL Workbench
-- qua 19 mai 2021 14:57:22
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sistema-pedidos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema-pedidos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema-pedidos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sistema-pedidos` ;

-- -----------------------------------------------------
-- Table `sistema-pedidos`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema-pedidos`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `sobrenome` VARCHAR(250) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `cep` VARCHAR(15) NULL DEFAULT NULL,
  `endereco` VARCHAR(250) NULL DEFAULT NULL,
  `numero` INT NULL DEFAULT NULL,
  `bairro` VARCHAR(45) NULL DEFAULT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema-pedidos`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema-pedidos`.`pedido` (
  `id` VARCHAR(14) NOT NULL,
  `cliente_id` INT NOT NULL,
  `ano` VARCHAR(4) NULL DEFAULT NULL,
  `mes` VARCHAR(2) NULL DEFAULT NULL,
  `dia` VARCHAR(2) NULL DEFAULT NULL,
  `hora` VARCHAR(2) NULL DEFAULT NULL,
  `minuto` VARCHAR(2) NULL DEFAULT NULL,
  `segundo` VARCHAR(2) NULL DEFAULT NULL,
  `total` DECIMAL(15,2) NULL DEFAULT NULL,
  `estado` ENUM('aberto', 'fechado', 'cancelado') NULL DEFAULT NULL,
  `pagamento` ENUM('d', 'c', 't') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedido_1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `sistema-pedidos`.`cliente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema-pedidos`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema-pedidos`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(250) NULL DEFAULT NULL,
  `preco` DECIMAL(15,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema-pedidos`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema-pedidos`.`item` (
  `pedido_id` VARCHAR(14) NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` INT NULL DEFAULT NULL,
  `preco` DECIMAL(15,2) NULL DEFAULT NULL,
  INDEX `fk_item_2_idx` (`produto_id` ASC) VISIBLE,
  INDEX `fk_item_1` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `sistema-pedidos`.`pedido` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_item_2`
    FOREIGN KEY (`produto_id`)
    REFERENCES `sistema-pedidos`.`produto` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
