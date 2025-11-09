CREATE TABLE ComprobanteDePago (
    idComprobante INT PRIMARY KEY AUTO_INCREMENT, -- Nueva PK independiente
    fecha DATETIME,                -- Fecha de emisión
    total DOUBLE,                  -- Total de la venta
    IGV DOUBLE,                    -- IGV de la venta
    metodoDePago VARCHAR(45),      -- Método de pago (tarjeta, efectivo, etc.)
    correlativo VARCHAR(45),       -- Correlativo o número del comprobante
    arregloDatosDelCorrelativo VARCHAR(110) -- Datos adicionales del correlativo
);

CREATE TABLE Factura (
    idComprobante INT PRIMARY KEY,   -- Relación con la tabla madre
    RUC LONG,                      -- RUC de la empresa o persona que emite la factura
    razonSocial VARCHAR(110),         -- Razón social del emisor de la factura
    FOREIGN KEY (idComprobante) REFERENCES ComprobanteDePago(idComprobante)
);

CREATE TABLE Boleta (
    idComprobante INT PRIMARY KEY,   -- Relación con la tabla madre
    DNI INT,                         -- DNI del comprador
    FOREIGN KEY (idComprobante) REFERENCES ComprobanteDePago(idComprobante)
);

CREATE TABLE NotaDeDebito (
    idComprobante INT PRIMARY KEY,   -- Relación con la tabla madre
    detalleModificacion VARCHAR(255),      -- Detalle del ajuste
    RUC LONG,                      -- RUC de la empresa o persona que emite la nota
    razonSocial VARCHAR(45),         -- Razón social del emisor
    motivoEspecifico VARCHAR(45),    -- Motivo 
    nuevoMonto DOUBLE,               -- Nuevo monto ajustado
    valorAumentar DOUBLE,            -- Valor a aumentar
    idPrenda INT,                    -- Referencia a prenda
    FOREIGN KEY (idComprobante) REFERENCES ComprobanteDePago(idComprobante),
    FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
);

CREATE TABLE NotaDeCredito (
    idComprobante INT PRIMARY KEY,   -- Relación con la tabla madre
    detalleModificacion VARCHAR(255),-- Detalles de la modificación
    RUC LONG,                      -- RUC de la empresa o persona que emite la nota
    razonSocial VARCHAR(45),         -- Razón social del emisor
    DNI INT,                         -- DNI del comprador
    motivoEspecifico VARCHAR(255),   -- Motivo específico de la nota
    nuevoMonto DOUBLE,               -- Nuevo monto ajustado
    valorAumentar DOUBLE,            -- Valor a aumentar
    FOREIGN KEY (idComprobante) REFERENCES ComprobanteDePago(idComprobante)
);





-- -----------------------------------------------------
-- Table `mydb`.`ComprobanteDePago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ComprobanteDePago` (
  `idComprobante` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `IGV` DOUBLE NULL DEFAULT NULL,
  `metodoDePago` VARCHAR(45) NULL DEFAULT NULL,
  `correlativo` VARCHAR(45) NULL DEFAULT NULL,
  `arregloDatosDelCorrelativo` VARCHAR(110) NULL DEFAULT NULL,
  PRIMARY KEY (`idComprobante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `mydb`.`Boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Boleta` (
  `idComprobante` INT NOT NULL,
  `DNI` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idComprobante`),
  CONSTRAINT `Boleta_ibfk_1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `mydb`.`ComprobanteDePago` (`idComprobante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `idComprobante` INT NOT NULL,
  `RUC` MEDIUMTEXT NULL DEFAULT NULL,
  `razonSocial` VARCHAR(110) NULL DEFAULT NULL,
  PRIMARY KEY (`idComprobante`),
  CONSTRAINT `Factura_ibfk_1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `mydb`.`ComprobanteDePago` (`idComprobante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`NotaDeCredito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NotaDeCredito` (
  `idComprobante` INT NOT NULL,
  `detalleModificacion` VARCHAR(255) NULL DEFAULT NULL,
  `RUC` MEDIUMTEXT NULL DEFAULT NULL,
  `razonSocial` VARCHAR(45) NULL DEFAULT NULL,
  `DNI` INT NULL DEFAULT NULL,
  `motivoEspecifico` VARCHAR(255) NULL DEFAULT NULL,
  `nuevoMonto` DOUBLE NULL DEFAULT NULL,
  `valorAumentar` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idComprobante`),
  CONSTRAINT `NotaDeCredito_ibfk_1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `mydb`.`ComprobanteDePago` (`idComprobante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`NotaDeDebito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NotaDeDebito` (
  `idComprobante` INT NOT NULL,
  `detalleModificacion` VARCHAR(255) NULL DEFAULT NULL,
  `RUC` MEDIUMTEXT NULL DEFAULT NULL,
  `razonSocial` VARCHAR(45) NULL DEFAULT NULL,
  `motivoEspecifico` VARCHAR(45) NULL DEFAULT NULL,
  `nuevoMonto` DOUBLE NULL DEFAULT NULL,
  `valorAumentar` DOUBLE NULL DEFAULT NULL,
  `idPrenda` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idComprobante`),
  CONSTRAINT `NotaDeDebito_ibfk_1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `mydb`.`ComprobanteDePago` (`idComprobante`),
  CONSTRAINT `NotaDeDebito_ibfk_2`
    FOREIGN KEY (`idPrenda`)
    REFERENCES `mydb`.`Prenda` (`idPrenda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- A ComprobanteDePago
ALTER TABLE mydb.ComprobanteDePago
ADD COLUMN activa TINYINT AFTER arregloDatosDelCorrelativo;

-- A Boleta
ALTER TABLE mydb.Boleta
ADD COLUMN activa TINYINT AFTER DNI;

-- A Factura
ALTER TABLE mydb.Factura
ADD COLUMN activa TINYINT AFTER razonSocial;

-- A NotaDeCredito
ALTER TABLE mydb.NotaDeCredito
ADD COLUMN activa TINYINT AFTER valorAumentar;

-- A NotaDeDebito
ALTER TABLE mydb.NotaDeDebito
ADD COLUMN activa TINYINT AFTER idPrenda;










