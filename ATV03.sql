-- -----------------------------------------------------
-- Table `mydb`.`Consumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consumo` (
  `id_consumo` INT NOT NULL,
  `comida` VARCHAR(45) NULL,
  `bebida` VARCHAR(45) NULL,
  PRIMARY KEY (`id_consumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Quarto` (
  `id_quarto` INT NOT NULL,
  `numero` INT NULL,
  `andar` INT NULL,
  `leitos` VARCHAR(45) NULL,
  `id_cliente` INT NULL,
  `data_hospedagem` DATETIME NULL,
  `id_consumo` INT NULL,
  PRIMARY KEY (`id_quarto`),
  INDEX `quarto_consumo_idx` (`id_consumo` ASC) VISIBLE,
  CONSTRAINT `quarto_consumo`
    FOREIGN KEY (`id_consumo`)
    REFERENCES `mydb`.`Consumo` (`id_consumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `id_cliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `RG` VARCHAR(45) NULL,
  `id_endereco` INT NULL,
  `id_quarto` INT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `quarto_cliente_idx` (`id_quarto` ASC) VISIBLE,
  CONSTRAINT `quarto_cliente`
    FOREIGN KEY (`id_quarto`)
    REFERENCES `mydb`.`Quarto` (`id_quarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Logradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Logradouro` (
  `id_logradouro` INT NOT NULL,
  `Logradouro` VARCHAR(45) NULL,
  PRIMARY KEY (`id_logradouro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `id_estado` INT NOT NULL,
  `Estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pais` (
  `id_pais` INT NOT NULL,
  `Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `id_endereco` INT NOT NULL,
  `id_logradouro` INT NULL,
  `endereco` VARCHAR(45) NULL,
  `id_bairro` INT NULL,
  `id_estado` INT NULL,
  `id_pais` INT NULL,
  `id_cliente` INT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `endereco_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `endereco_logradouro_idx` (`id_logradouro` ASC) VISIBLE,
  INDEX `endereco_estado_idx` (`id_estado` ASC) VISIBLE,
  INDEX `endereco_pais_idx` (`id_pais` ASC) VISIBLE,
  CONSTRAINT `endereco_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `endereco_logradouro`
    FOREIGN KEY (`id_logradouro`)
    REFERENCES `mydb`.`Logradouro` (`id_logradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `endereco_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `endereco_pais`
    FOREIGN KEY (`id_pais`)
    REFERENCES `mydb`.`Pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `id_telefone` INT NOT NULL,
  `id_ddd` INT NULL,
  `numero` INT NULL,
  `id_cliente` INT NULL,
  PRIMARY KEY (`id_telefone`),
  INDEX `cliente_telefone_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `cliente_telefone`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DDD` (
  `id_ddd` INT NOT NULL,
  `DDD` INT NULL,
  PRIMARY KEY (`id_ddd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DDD_has_Telefone1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DDD_has_Telefone1` (
  `DDD_id_ddd` INT NOT NULL,
  `Telefone_id_telefone` INT NOT NULL,
  PRIMARY KEY (`DDD_id_ddd`, `Telefone_id_telefone`),
  INDEX `fk_DDD_has_Telefone1_Telefone1_idx` (`Telefone_id_telefone` ASC) VISIBLE,
  INDEX `fk_DDD_has_Telefone1_DDD1_idx` (`DDD_id_ddd` ASC) VISIBLE,
  CONSTRAINT `fk_DDD_has_Telefone1_DDD1`
    FOREIGN KEY (`DDD_id_ddd`)
    REFERENCES `mydb`.`DDD` (`id_ddd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DDD_has_Telefone1_Telefone1`
    FOREIGN KEY (`Telefone_id_telefone`)
    REFERENCES `mydb`.`Telefone` (`id_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
