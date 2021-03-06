-- MySQL Script generated by MySQL Workbench
-- Fri Nov 16 08:41:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estatus` VARCHAR(45) NULL,
  `nombre_proveedor` VARCHAR(60) NULL,
  `tipo` VARCHAR(60) NULL,
  `nombre_representante` VARCHAR(50) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(10) NULL,
  `tipo` VARCHAR(20) NULL,
  `nombre` VARCHAR(50) NULL,
  `password` VARCHAR(20) NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `fecha_compra` DATE NULL,
  `status` VARCHAR(20) NULL,
  `total` DECIMAL(4,2) NULL,
  `proveedor_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id_compra`, `proveedor_id`, `usuario_id`),
  INDEX `fk_compra_proveedor_idx` (`proveedor_id` ASC) VISIBLE,
  INDEX `fk_compra_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_compra_proveedor`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `mydb`.`proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `producto` VARCHAR(45) NULL,
  `cantidad_producto` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productos_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos_compra` (
  `idproductos_compra` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NULL,
  `id_producto` INT NULL,
  `desc_producto` VARCHAR(30) NULL,
  `cantidad` INT NULL,
  `precio` DECIMAL(4,2) NULL,
  `subtotal` DECIMAL(4,2) NULL,
  `compra_id_compra` INT NOT NULL,
  `compra_id_proveedor` INT NOT NULL,
  `producto_id` INT NOT NULL,
  PRIMARY KEY (`idproductos_compra`, `compra_id_compra`, `compra_id_proveedor`, `producto_id`),
  INDEX `fk_productos_compra_compra1_idx` (`compra_id_compra` ASC, `compra_id_proveedor` ASC) VISIBLE,
  INDEX `fk_productos_compra_producto1_idx` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_productos_compra_compra1`
    FOREIGN KEY (`compra_id_compra` , `compra_id_proveedor`)
    REFERENCES `mydb`.`compra` (`id_compra` , `proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_compra_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `mydb`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL,
  `edad` INT NULL,
  `fecha_nacimiento` DATE NULL,
  `telefono` VARCHAR(10) NULL,
  `direccion` VARCHAR(10) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_ingre` VARCHAR(45) NULL,
  `tipo_ingre` VARCHAR(45) NULL,
  `costo_ingre` INT NULL,
  `unidad_de_ingre` FLOAT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingrediente_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingrediente_producto` (
  `id_principal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `id_producto` INT NULL,
  `unidad` FLOAT NULL,
  `id_ingrediente` INT NULL,
  `producto_id` INT NOT NULL,
  `ingredientes_id` INT NOT NULL,
  PRIMARY KEY (`id_principal`, `producto_id`, `ingredientes_id`),
  INDEX `fk_ingrediente_producto_producto1_idx` (`producto_id` ASC) VISIBLE,
  INDEX `fk_ingrediente_producto_ingredientes1_idx` (`ingredientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_ingrediente_producto_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `mydb`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_producto_ingredientes1`
    FOREIGN KEY (`ingredientes_id`)
    REFERENCES `mydb`.`ingredientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(15) NULL,
  `fecha_venta` DATETIME NULL,
  `id_cliente` INT NULL,
  `id_usuario` INT NULL,
  `total` FLOAT NULL,
  `cliente_id_cliente` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id_venta`, `cliente_id_cliente`, `usuario_id`),
  INDEX `fk_ventas_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_ventas_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `mydb`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productos_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos_venta` (
  `id_productos_venta` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NULL,
  `id_producto` INT NULL,
  `desc_venta` VARCHAR(45) NULL,
  `cantidad` INT NULL,
  `precio` FLOAT NULL,
  `subtotal` FLOAT NULL,
  `producto_id` INT NOT NULL,
  `ventas_id_venta` INT NOT NULL,
  PRIMARY KEY (`id_productos_venta`, `producto_id`, `ventas_id_venta`),
  INDEX `fk_productos_venta_producto1_idx` (`producto_id` ASC) VISIBLE,
  INDEX `fk_productos_venta_ventas1_idx` (`ventas_id_venta` ASC) VISIBLE,
  CONSTRAINT `fk_productos_venta_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `mydb`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_venta_ventas1`
    FOREIGN KEY (`ventas_id_venta`)
    REFERENCES `mydb`.`ventas` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredientes_has_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredientes_has_compra` (
  `ingredientes_id` INT NOT NULL,
  `compra_id_compra` INT NOT NULL,
  `compra_id_proveedor` INT NOT NULL,
  `compra_usuario_id` INT NOT NULL,
  PRIMARY KEY (`ingredientes_id`, `compra_id_compra`, `compra_id_proveedor`, `compra_usuario_id`),
  INDEX `fk_ingredientes_has_compra_compra1_idx` (`compra_id_compra` ASC, `compra_id_proveedor` ASC, `compra_usuario_id` ASC) VISIBLE,
  INDEX `fk_ingredientes_has_compra_ingredientes1_idx` (`ingredientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_ingredientes_has_compra_ingredientes1`
    FOREIGN KEY (`ingredientes_id`)
    REFERENCES `mydb`.`ingredientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredientes_has_compra_compra1`
    FOREIGN KEY (`compra_id_compra` , `compra_id_proveedor` , `compra_usuario_id`)
    REFERENCES `mydb`.`compra` (`id_compra` , `proveedor_id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
