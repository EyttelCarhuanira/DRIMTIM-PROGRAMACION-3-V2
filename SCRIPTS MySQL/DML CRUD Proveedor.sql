ALTER TABLE Proveedor AUTO_INCREMENT =1;

INSERT INTO Proveedor (RUC, nombre,telefono,direccion,activo)
VALUES(20503644968,'Naomi',
986368555, 'Av. Simón Bolívar 1515, Pueblo Libre, Lima',
1);

SELECT * FROM Proveedor;

DELETE FROM Proveedor WHERE idProveedor = 1;


DROP PROCEDURE IF EXISTS insertar_proveedor;
DELIMITER $
CREATE PROCEDURE insertar_proveedor(  OUT _idProveedor INT,     
IN _RUC BIGINT, 
    IN _nombre VARCHAR(70),   
  IN _telefono INT,     
  IN _direccion VARCHAR(150)) 
  BEGIN  
  INSERT INTO Proveedor(RUC, nombre,telefono,     direccion,activo) 
  VALUES (_RUC, _nombre, _telefono, _direccion ,1);  
  SET _idProveedor = @@last_insert_id; 
  END$	

DELIMITER ;




-- insertar condicion de pgo del proveedor

DROP PROCEDURE IF EXISTS insertar_condicion_de_pago;

-- insertar Condicion de pago

DELIMITER $
CREATE PROCEDURE insertar_condicion_de_pago( 
  OUT _idCondicion INT,     
  IN _descripcion VARCHAR(120),  
  IN _numDias INT,   
  IN _vigente TINYINT(1),    
  IN _Proveedor_idProveedor INT) 
  BEGIN
  
  
  INSERT INTO  CondicionPago (descripcion
  , numDias,
  vigente, 
  Proveedor_idProveedor) 
  VALUES (_descripcion, _numDias,
  1 ,_Proveedor_idProveedor ); 
  
  SET _idCondicion = @@last_insert_id; 
  
  
  END$	

DELIMITER ;

-- modificar  proveedor

DROP PROCEDURE IF EXISTS modificar_proveedor;
DELIMITER $
CREATE PROCEDURE modificar_proveedor(  
IN _idProveedor INT,     
IN _RUC BIGINT,   
  IN _nombre VARCHAR(70),   
  IN _telefono INT,   
  IN _direccion VARCHAR(150), 
  IN _activo TINYINT) 
  BEGIN  
  
  UPDATE CondicionPago
    SET vigente = 0
    WHERE Proveedor_idProveedor = _idProveedor ;
  
  UPDATE Proveedor SET RUC=_RUC,
  nombre=_nombre,telefono=_telefono,direccion=_direccion
  WHERE idProveedor=_idProveedor;
  END$	
  
DELIMITER ;






DROP PROCEDURE IF EXISTS obtenerId_proveedor;
DELIMITER $
CREATE PROCEDURE obtenerId_proveedor( IN _idProveedor INT) 
  BEGIN
  Select idProveedor,RUC,nombre,telefono,direccion,activo
  From Proveedor 
  WHERE  idProveedor = _idProveedor;
  END$	

DELIMITER ;
-- Select idProveedor,RUC,nombre,telefono,direccion,activo
--   From Proveedor WHERE idProveedor=1;
--  END$	
DROP PROCEDURE IF EXISTS mostrar_proveedores;
DELIMITER $
CREATE PROCEDURE mostrar_proveedores() 
  BEGIN
  Select idProveedor,RUC,nombre,telefono,direccion,activo
  From Proveedor;
  END$	

DELIMITER ;

-- eliminar proveedor

DROP PROCEDURE IF EXISTS eliminar_proveedor;
DELIMITER $


CREATE PROCEDURE eliminar_proveedor(
		IN _idProveedor INT ) 
  BEGIN
  UPDATE Proveedor SET activo=0
  WHERE idProveedor=_idProveedor;
  
  
  UPDATE CondicionPago
    SET vigente = 0
    WHERE Proveedor_idProveedor = _idProveedor ;
  
  
  END$	
  
  
  -- mostrar_condiciones_de_Pago_X_idproveedor
  
DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_condiciones_de_Pago_X_idproveedor;
  
DELIMITER $
CREATE PROCEDURE mostrar_condiciones_de_Pago_X_idproveedor(
	IN _idProveedor INT
)
BEGIN
	SELECT 
    condicion.idCondicion AS id_condicon,
    condicion.descripcion AS descripcion_condicion,
    condicion.numDias AS num_dias_condicion,
    condicion.vigente AS vigente_condicion,
    condicion.Proveedor_idProveedor AS id_proveedor_condicion
    FROM
    CondicionPago condicion 
    WHERE condicion.Proveedor_idProveedor = _idProveedor;
    
END$


  -- mostrar_condiciones_de_Pago_X_idproveedor_activo
  
DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_condiciones_de_Pago_X_idproveedor_activo;
  
DELIMITER $
CREATE PROCEDURE mostrar_condiciones_de_Pago_X_idproveedor_activo(
	IN _idProveedor INT
)
BEGIN
	SELECT 
    condicion.idCondicion AS id_condicon,
    condicion.descripcion AS descripcion_condicion,
    condicion.numDias AS num_dias_condicion,
    condicion.vigente AS vigente_condicion,
    condicion.Proveedor_idProveedor AS id_proveedor_condicion
    FROM
    CondicionPago condicion 
    WHERE condicion.Proveedor_idProveedor = _idProveedor AND
    condicion.vigente = 1;
    
END$


-- script Procedures condicion de pago
DELIMITER ;
DROP PROCEDURE IF EXISTS insertar_condicion_de_pago;



-- insertar Condicion de pago

DELIMITER $
CREATE PROCEDURE insertar_condicion_de_pago( 
  OUT _idCondicion INT,     
  IN _descripcion VARCHAR(120),  
  IN _numDias INT,   
  IN _vigente TINYINT,    
  IN _Proveedor_idProveedor INT) 
  BEGIN
  
  
  INSERT INTO  CondicionPago (descripcion
  , numDias,
  vigente, 
  Proveedor_idProveedor) 
  VALUES (_descripcion, _numDias,
  1 ,_Proveedor_idProveedor ); 
  
  SET _idCondicion = @@last_insert_id; 
  
  
  END$	

DELIMITER ;

