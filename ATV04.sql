
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
-- Table `mydb`.`Sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sexo` (
  `id_sexo` INT NOT NULL,
  `Feminino` VARCHAR(45) NULL,
  `Masculino` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relacao` (
  `id_relacao` INT NOT NULL,
  `Filho` VARCHAR(45) NULL,
  `Mae` VARCHAR(45) NULL,
  `Esposa` VARCHAR(45) NULL,
  `Marido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_relacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dependente-Sim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente-Sim` (
  `id_sim` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `id_sexo` INT NULL,
  `id_relacao` INT NULL,
  `id_empregado` INT NULL,
  `id_depentende` INT NULL,
  PRIMARY KEY (`id_sim`),
  INDEX `dependente-sim_idx` (`id_depentende` ASC) VISIBLE,
  INDEX `sexo_dependente_idx` (`id_sexo` ASC) VISIBLE,
  INDEX `relacao_dependente_idx` (`id_relacao` ASC) VISIBLE,
  CONSTRAINT `dependente-sim`
    FOREIGN KEY (`id_depentende`)
    REFERENCES `mydb`.`Dependente` (`id_depentende`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sexo_dependente`
    FOREIGN KEY (`id_sexo`)
    REFERENCES `mydb`.`Sexo` (`id_sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `relacao_dependente`
    FOREIGN KEY (`id_relacao`)
    REFERENCES `mydb`.`Relacao` (`id_relacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
  `id_depentende` INT NOT NULL,
  `sim` VARCHAR(45) NULL,
  `nao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_depentende`),
  CONSTRAINT `dependente-sim`
    FOREIGN KEY (`id_depentende`)
    REFERENCES `mydb`.`Dependente-Sim` (`id_sim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gerente` (
  `id_gerente` INT NOT NULL,
  `sim` VARCHAR(45) NULL,
  `nao` VARCHAR(45) NULL,
  `id_departamento` INT NULL,
  `id_empregado` INT NULL,
  PRIMARY KEY (`id_gerente`),
  CONSTRAINT `empregado_gerente`
    FOREIGN KEY (`id_gerente`)
    REFERENCES `mydb`.`Empregado` (`id_empregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `id_departamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `id_empregado` INT NULL,
  `id_projeto` INT NULL,
  `id_gerente` INT NULL,
  PRIMARY KEY (`id_departamento`),
  INDEX `gerente_departamento_idx` (`id_gerente` ASC) VISIBLE,
  CONSTRAINT `gerente_departamento`
    FOREIGN KEY (`id_gerente`)
    REFERENCES `mydb`.`Gerente` (`id_gerente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projeto` (
  `id_projeto` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `numero` INT NULL,
  `cidade` VARCHAR(45) NULL,
  `id_empregado` INT NULL,
  `id_departamento` INT NULL,
  PRIMARY KEY (`id_projeto`),
  INDEX `projeto_departamento_idx` (`id_departamento` ASC) VISIBLE,
  CONSTRAINT `projeto_departamento`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `mydb`.`Departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `id_telefone` INT NOT NULL,
  `id_ddd` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id_telefone`))
ENGINE = InnoDB
COMMENT = '\n';


-- -----------------------------------------------------
-- Table `mydb`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empregado` (
  `id_empregado` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `nº_funiconal` INT NOT NULL,
  `id_telefone` INT NULL,
  `id_dependente` INT NULL,
  `departamento` INT NULL,
  `gerente` INT NULL,
  `id_projeto` INT NULL,
  PRIMARY KEY (`id_empregado`),
  INDEX `dependente_empregado_idx` (`id_dependente` ASC) VISIBLE,
  INDEX `departamento_empregado_idx` (`departamento` ASC) VISIBLE,
  INDEX `projeto_empregado_idx` (`id_projeto` ASC) VISIBLE,
  INDEX `telefone_empregado_idx` (`id_telefone` ASC) VISIBLE,
  CONSTRAINT `dependente_empregado`
    FOREIGN KEY (`id_dependente`)
    REFERENCES `mydb`.`Dependente` (`id_depentende`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `departamento_empregado`
    FOREIGN KEY (`departamento`)
    REFERENCES `mydb`.`Departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `projeto_empregado`
    FOREIGN KEY (`id_projeto`)
    REFERENCES `mydb`.`Projeto` (`id_projeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `telefone_empregado`
    FOREIGN KEY (`id_telefone`)
    REFERENCES `mydb`.`Telefone` (`id_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `id_cidade` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `id_projeto` INT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `cidade_projeto_idx` (`id_projeto` ASC) VISIBLE,
  CONSTRAINT `cidade_projeto`
    FOREIGN KEY (`id_projeto`)
    REFERENCES `mydb`.`Projeto` (`id_projeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DDD` (
  `id_ddd` INT NOT NULL,
  `DDD` VARCHAR(45) NULL,
  PRIMARY KEY (`id_ddd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DDD_has_Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DDD_has_Telefone` (
  `DDD_id_ddd` INT NOT NULL,
  `Telefone_id_telefone` INT NOT NULL,
  PRIMARY KEY (`DDD_id_ddd`, `Telefone_id_telefone`),
  INDEX `fk_DDD_has_Telefone_Telefone1_idx` (`Telefone_id_telefone` ASC) VISIBLE,
  INDEX `fk_DDD_has_Telefone_DDD1_idx` (`DDD_id_ddd` ASC) VISIBLE,
  CONSTRAINT `fk_DDD_has_Telefone_DDD1`
    FOREIGN KEY (`DDD_id_ddd`)
    REFERENCES `mydb`.`DDD` (`id_ddd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DDD_has_Telefone_Telefone1`
    FOREIGN KEY (`Telefone_id_telefone`)
    REFERENCES `mydb`.`Telefone` (`id_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


