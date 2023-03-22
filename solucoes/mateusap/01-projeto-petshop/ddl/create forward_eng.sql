-- -----------------------------------------------------
-- Schema 01-projeto-petshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `01-projeto-petshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `01-projeto-petshop` ;

-- -----------------------------------------------------
-- Table `01-projeto-petshop`.`c_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `01-projeto-petshop`.`c_cliente` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(70) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(254) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `01-projeto-petshop`.`c_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `01-projeto-petshop`.`c_fornecedor` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(70) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(254) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `01-projeto-petshop`.`c_pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `01-projeto-petshop`.`c_pagamentos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(70) NOT NULL,
  `taxa_juros` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `01-projeto-petshop`.`c_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `01-projeto-petshop`.`c_produto` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(70) NOT NULL,
  `data_cadastro` DATETIME NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_validade` DATE NOT NULL,
  `codigo_fornecedor` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `cod_fornecedor_idx` (`codigo_fornecedor` ASC) VISIBLE,
  CONSTRAINT `cod_fornecedor`
    FOREIGN KEY (`codigo_fornecedor`)
    REFERENCES `01-projeto-petshop`.`c_fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `01-projeto-petshop`.`c_vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `01-projeto-petshop`.`c_vendas` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `cod_cliente` INT NOT NULL,
  `cod_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `valor_total` DECIMAL(10,2) NOT NULL,
  `valor_desconto` DECIMAL(10,2) NOT NULL,
  `valor_frete` DECIMAL(10,2) NOT NULL,
  `tipo_pagamento` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `cod_cliente_idx` (`cod_cliente` ASC) VISIBLE,
  INDEX `cod_produto_idx` (`cod_produto` ASC) VISIBLE,
  INDEX `tipo_pagamento_idx` (`tipo_pagamento` ASC) VISIBLE,
  CONSTRAINT `cod_cliente`
    FOREIGN KEY (`cod_cliente`)
    REFERENCES `01-projeto-petshop`.`c_cliente` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_produto`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `01-projeto-petshop`.`c_produto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tipo_pagamento`
    FOREIGN KEY (`tipo_pagamento`)
    REFERENCES `01-projeto-petshop`.`c_pagamentos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;