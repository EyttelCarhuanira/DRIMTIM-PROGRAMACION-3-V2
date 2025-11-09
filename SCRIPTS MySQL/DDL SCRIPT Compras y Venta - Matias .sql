
DROP TABLE IF EXISTS `mydb`.`Proveedor`;
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor`(
	`idProveedor` INT NOT NULL AUTO_INCREMENT,
	`RUC` BIGINT NOT NULL,
    `nombre` VARCHAR(70) DEFAULT NULL,
    `telefono` INT NOT NULL,
    `direccion` VARCHAR(150) DEFAULT NULL,
    `activo` TINYINT NOT NULL,
	PRIMARY KEY(`idProveedor`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


DROP TABLE IF EXISTS `mydb`.`CondicionPago`;

CREATE TABLE IF NOT EXISTS `mydb`.`CondicionPago`(
	`idCondicion` INT NOT NULL AUTO_INCREMENT,
	`descripcion` VARCHAR(120) DEFAULT NULL,
    `numDias` INT NOT NULL ,
	`vigente` TINYINT NOT NULL,
    
    `Proveedor_idProveedor` INT NOT NULL,
	PRIMARY KEY(`idCondicion`),
    INDEX `fk_Proveedor_idProveedor1_idx`(`Proveedor_idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_idProveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `mydb`.`Proveedor` (`idProveedor`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


DROP TABLE IF EXISTS `mydb`.`LineaLoteCompra`;

CREATE TABLE IF NOT EXISTS `mydb`.`LineaLoteCompra`(
	`idPrenda` INT NOT NULL,
    `numLinea` INT auto_increment,
    `cantidad` INT NOT NULL DEFAULT 0,
    `talla` ENUM('XS','S','M','L','XL','XXL'),
    `lote_idLote` INT NOT NULL,
    `precioLote` DECIMAL(10,2) NOT NULL,
    `OrdenCompra_idCompra` INT NOT NULL,
    
	
	PRIMARY KEY(`numLinea`),
    INDEX `fk_lote_idLote1_idx`(`lote_idLote` ASC) VISIBLE,
  CONSTRAINT `fk_lote_idLote1`
    FOREIGN KEY (`lote_idLote`)
    REFERENCES `mydb`.`Lote` (`idLote`),
    
    INDEX `fk_OrdenCompra_idCompra1_idx`(`OrdenCompra_idCompra` ASC) VISIBLE,
  CONSTRAINT `fk_OrdenCompra_idCompra1`
    FOREIGN KEY (`OrdenCompra_idCompra`)
    REFERENCES `mydb`.`OrdenCompra` (`idCompra`)
    
    
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE `mydb`.`LineaLoteCompra`
ADD COLUMN `activo` TINYINT NOT NULL DEFAULT 1;


DROP TABLE IF EXISTS `mydb`.`OrdenCompra`;
CREATE TABLE IF NOT EXISTS `mydb`.`OrdenCompra`(
	`idCompra` INT NOT NULL AUTO_INCREMENT,
	`fechaLlegada` DATETIME NOT NULL,
    `fechaEmision` DATETIME NOT NULL,
    `deudaPendiente` DECIMAL(10,2) NOT NULL,
	`montoTotal` DECIMAL(10,2) NOT NULL,
    `Proveedor_idProveedor` INT NOT NULL,
    `Empleado_idEmpleado` INT NOT NULL,
    
    PRIMARY KEY(`idCompra`),
    INDEX `fk_Empleado_idEmpleado11_idx`(`Empleado_idEmpleado` ASC) VISIBLE,
	CONSTRAINT `fk_Empleado_idEmpleado11`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`),
    
    INDEX `fk_Proveedor_idProveedor2_idx`(`Proveedor_idProveedor` ASC) VISIBLE,
	CONSTRAINT `fk_Proveedor_idProveedor2`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `mydb`.`Proveedor` (`idProveedor`)
	
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


ALTER TABLE `mydb`.`OrdenCompra`
ADD COLUMN `activo` TINYINT NOT NULL DEFAULT 1;





DROP TABLE IF EXISTS `mydb`.`TipoDeCliente`;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoDeCliente`(
	`tipoCliente` INT NOT NULL ,
	`abreviatura` CHAR(1) NOT NULL,
    `descripcion` VARCHAR(120) NOT NULL,
    
    PRIMARY KEY(`tipoCliente`)
    
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


DROP TABLE IF EXISTS `mydb`.`Cliente`;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente`(
	`idCliente` INT NOT NULL,
    `tipoCliente` INT NOT NULL ,
 	
    
    PRIMARY KEY(`idCliente`),
    
    INDEX `fk_Cliente_Persona10_idx`
    (`idCliente` ASC) VISIBLE,
	CONSTRAINT `fk_Cliente_Persona10`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Persona` (`idPersona`),
    
    INDEX `fk_Cliente_tipoCliente10_idx`
    (`tipoCliente` ASC) VISIBLE,
	CONSTRAINT `fk_Cliente_tipoCliente10`
    FOREIGN KEY (`tipoCliente`)
    REFERENCES `mydb`.`TipoDeCliente` (`tipoCliente`)
    
 )ENGINE = InnoDB
 DEFAULT CHARACTER SET = utf8mb4;


ALTER TABLE `mydb`.`Cliente`
ADD COLUMN `activo` TINYINT NOT NULL DEFAULT 1;



DROP TABLE IF EXISTS `mydb`.`Venta`;

CREATE TABLE IF NOT EXISTS `mydb`.`Venta`(
	`idVenta` INT NOT NULL AUTO_INCREMENT,
	`fecha` DATETIME NOT NULL,
    `total` DECIMAL(10,2) NOT NULL ,
    `Empleado_idEmpleado` INT NOT NULL,
    `Cliente_idCliente` INT NOT NULL,
    `Comprobante_idComprobante` INT NOT NULL,
    
    PRIMARY KEY(`idVenta`),
    
    INDEX `fk_Empleado_idEmpleado10_idx`
    (`Empleado_idEmpleado` ASC) VISIBLE,
	CONSTRAINT `fk_Empleado_idEmpleado10`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`),
    
    INDEX `fk_Cliente_idCliente10_idx`
    (`Cliente_idCliente` ASC) VISIBLE,
	CONSTRAINT `fk_Cliente_idCliente10`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`),
    
    INDEX `fk_Comprobante_idComprobante10_idx`
    (`Comprobante_idComprobante` ASC) VISIBLE,
	CONSTRAINT `fk_Comprobante_idComprobante10`
    FOREIGN KEY (`Comprobante_idComprobante`)
    REFERENCES `mydb`.`ComprobanteDePago` (`idComprobante`)
    
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE `mydb`.`Venta`
ADD COLUMN `activo` TINYINT NOT NULL DEFAULT 1;



DROP TABLE IF EXISTS `mydb`.`ItemVenta`;

CREATE TABLE IF NOT EXISTS `mydb`.`ItemVenta`(
	`numLinea` INT NOT NULL,
    `Prenda_idPrenda` INT NOT NULL,
    `cantidad` INT NOT NULL,
    -- descuento y promocion faltan
    `subtotal` DECIMAL(10,2) NOT NULL,
    
    `Venta_idVenta` INT NOT NULL,
    
    
    PRIMARY KEY(`numLinea`),
    INDEX `fk_Prenda_idPrenda1_idx`
    (`Prenda_idPrenda` ASC) VISIBLE,
	CONSTRAINT `fk_Prenda_idPrenda1`
    FOREIGN KEY (`Prenda_idPrenda`)
    REFERENCES `mydb`.`Prenda` (`idPrenda`),
    
    INDEX `fk_Venta_idVenta1_idx`
    (`Venta_idVenta` ASC) VISIBLE,
	CONSTRAINT `fk_Venta_idVenta1`
    FOREIGN KEY (`Venta_idVenta`)
    REFERENCES `mydb`.`Venta` (`idVenta`)
    
    
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE `mydb`.`ItemVenta` MODIFY `numLinea` INT AUTO_INCREMENT;


ALTER TABLE `mydb`.`ItemVenta`
ADD COLUMN `activo` TINYINT NOT NULL DEFAULT 1;






