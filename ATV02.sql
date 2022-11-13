CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `id_Telefone` INT NOT NULL,
  PRIMARY KEY (`id_Telefone`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Esporte` (
  `id_Esporte` INT NOT NULL,
  PRIMARY KEY (`id_Esporte`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Estado_Civil` (
  `id_Estado_Civil` INT NOT NULL,
  PRIMARY KEY (`id_Estado_Civil`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Grau_Escolaridade` (
  `id_Grau_Escolaridade` INT NOT NULL,
  PRIMARY KEY (`id_Grau_Escolaridade`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Carro` (
  `id_Carro` INT NOT NULL,
  `Possue` VARCHAR(45) NULL,
  `Não possue` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Carro`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Amigo` (
  `id_Amigo` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `id_telefone` INT NULL,
  `id_esporte` INT NULL,
  `id_carro` INT NULL,
  `id_estado_civil` INT NULL,
  `id_grau_escolaridade` INT NULL,
  PRIMARY KEY (`id_Amigo`),
  INDEX `id_telefone_idx` (`id_telefone` ASC) VISIBLE,
  INDEX `id_esporte_idx` (`id_esporte` ASC) VISIBLE,
  INDEX `id_estado_civil_idx` (`id_estado_civil` ASC) VISIBLE,
  INDEX `id_grau_escolaridade_idx` (`id_grau_escolaridade` ASC) VISIBLE,
  INDEX `id_carro_idx` (`id_carro` ASC) VISIBLE,
  CONSTRAINT `id_telefone`
    FOREIGN KEY (`id_telefone`)
    REFERENCES `mydb`.`Telefone` (`id_Telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_esporte`
    FOREIGN KEY (`id_esporte`)
    REFERENCES `mydb`.`Esporte` (`id_Esporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_estado_civil`
    FOREIGN KEY (`id_estado_civil`)
    REFERENCES `mydb`.`Estado_Civil` (`id_Estado_Civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_grau_escolaridade`
    FOREIGN KEY (`id_grau_escolaridade`)
    REFERENCES `mydb`.`Grau_Escolaridade` (`id_Grau_Escolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_carro`
    FOREIGN KEY (`id_carro`)
    REFERENCES `mydb`.`Carro` (`id_Carro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
