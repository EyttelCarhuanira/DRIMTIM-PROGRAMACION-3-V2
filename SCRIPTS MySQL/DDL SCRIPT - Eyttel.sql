-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `abreviatura` CHAR NULL,
  `activo` TINYINT NOT NULL,
  `descripcion` VARCHAR(75) NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoCuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoCuenta` (
  `idTipoCuenta` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(75) NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`idTipoCuenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CuentaUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CuentaUsuario` (
  `idCuenta` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(75) NULL,
  `contrasenha` VARCHAR(75) NULL,
  `activo` TINYINT NOT NULL,
  `email` VARCHAR(75) NULL,
  `TipoCuenta_idTipoCuenta` INT NOT NULL,
  PRIMARY KEY (`idCuenta`, `TipoCuenta_idTipoCuenta`),
  CONSTRAINT `fk_CuentaUsuario_TipoCuenta1`
    FOREIGN KEY (`TipoCuenta_idTipoCuenta`)
    REFERENCES `mydb`.`TipoCuenta` (`idTipoCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CuentaUsuario_TipoCuenta1_idx` ON `mydb`.`CuentaUsuario` (`TipoCuenta_idTipoCuenta` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NULL,
  `primerApellido` VARCHAR(75) NULL,
  `segundoApellido` VARCHAR(45) NULL,
  `dni` INT NULL,
  `telefono` INT NULL,
  `genero` CHAR NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `sueldo` DECIMAL(10,2) NULL,
  `activo` TINYINT NOT NULL,
  `Cargo_idCargo` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`, `Cargo_idCargo`),
  CONSTRAINT `fk_Empleado_Cargo1`
    FOREIGN KEY (`Cargo_idCargo`)
    REFERENCES `mydb`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Empleado_Cargo1_idx` ON `mydb`.`Empleado` (`Cargo_idCargo` ASC) VISIBLE;

CREATE INDEX `fk_Empleado_Persona1_idx` ON `mydb`.`Empleado` (`Persona_idPersona` ASC) VISIBLE;