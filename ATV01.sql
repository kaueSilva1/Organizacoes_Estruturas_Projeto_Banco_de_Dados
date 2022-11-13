CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `id_Funcionario` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Turnos` (
  `id_Turnos` INT NOT NULL,
  `Manhã` VARCHAR(45) NULL,
  `Tarde` VARCHAR(45) NULL,
  `Noite` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Turnos`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `id_Cargo` INT NOT NULL,
  `Motorista` VARCHAR(45) NULL,
  `id_Transporte` INT NOT NULL,
  `id_Funcionario` INT NOT NULL,
  PRIMARY KEY (`id_Cargo`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Transporte` (
  `id_Transporte` INT NOT NULL,
  `veiculo` VARCHAR(45) NULL,
  `id_Produto` INT NOT NULL,
  PRIMARY KEY (`id_Transporte`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `id_Funcionario` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `id_Cargo` INT NOT NULL,
  `id_Turnos` INT NOT NULL,
  `idEmpresa` INT NOT NULL,
  `id_Transporte` INT NOT NULL,
  PRIMARY KEY (`id_Funcionario`),
  INDEX `id_Funcionario_idx` (`idEmpresa` ASC) VISIBLE,
  INDEX `id_Turnos_idx` (`id_Turnos` ASC) VISIBLE,
  INDEX `id_Cargo_idx` (`id_Cargo` ASC) VISIBLE,
  INDEX `id_Transporte_idx` (`id_Transporte` ASC) VISIBLE,
  CONSTRAINT `id_Funcionario`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Turnos`
    FOREIGN KEY (`id_Turnos`)
    REFERENCES `mydb`.`Turnos` (`id_Turnos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Cargo`
    FOREIGN KEY (`id_Cargo`)
    REFERENCES `mydb`.`Cargo` (`id_Cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Transporte`
    FOREIGN KEY (`id_Transporte`)
    REFERENCES `mydb`.`Transporte` (`id_Transporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `id_Fornecedor` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CNPJF` VARCHAR(45) NULL,
  `id_Produto` INT NOT NULL,
  PRIMARY KEY (`id_Fornecedor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `id_Produto` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Produto`),
  CONSTRAINT `id_Fornecedor`
    FOREIGN KEY (`id_Produto`)
    REFERENCES `mydb`.`Fornecedor` (`id_Fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Transporte_has_Produto` (
  `Transporte_id_Transporte` INT NOT NULL,
  `Produto_id_Produto` INT NOT NULL,
  PRIMARY KEY (`Transporte_id_Transporte`, `Produto_id_Produto`),
  INDEX `fk_Transporte_has_Produto_Produto1_idx` (`Produto_id_Produto` ASC) VISIBLE,
  INDEX `fk_Transporte_has_Produto_Transporte1_idx` (`Transporte_id_Transporte` ASC) VISIBLE,
  CONSTRAINT `fk_Transporte_has_Produto_Transporte1`
    FOREIGN KEY (`Transporte_id_Transporte`)
    REFERENCES `mydb`.`Transporte` (`id_Transporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transporte_has_Produto_Produto1`
    FOREIGN KEY (`Produto_id_Produto`)
    REFERENCES `mydb`.`Produto` (`id_Produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
