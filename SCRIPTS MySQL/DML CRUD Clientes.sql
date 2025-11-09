-- Select de todo
SELECT * FROM Cliente c INNER JOIN 
Persona p ON c.idCliente=p.idPersona
INNER JOIN TipoDeCliente t ON c.tipoCliente = t.tipoCliente;

-- Reincio de datos

ALTER TABLE Persona AUTO_INCREMENT =1;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Cliente;
DELETE FROM TipoDeCliente WHERE tipoCliente = 1;
DELETE FROM Persona;
SET SQL_SAFE_UPDATES = 1;

-- insertar

DROP PROCEDURE IF EXISTS insertar_cliente;
DELIMITER $
CREATE PROCEDURE insertar_cliente(  OUT _idCliente INT,     
IN _nombre VARCHAR(75),     IN _primerApellido VARCHAR(75),   
  IN _segundoApellido VARCHAR(75),     IN _dni INT,
  IN _telefono INT, IN _genero CHAR , IN _abreviatura CHAR(1),
  IN _descripcion VARCHAR(120), IN _tipoCliente INT
  ) 
  BEGIN  
  
  INSERT INTO Persona(nombre, primerApellido,segundoApellido,
  dni,telefono, genero) 
  VALUES (_nombre, _primerApellido, _segundoApellido, _dni ,
   _telefono  , _genero);  

  SET _idCliente = @@last_insert_id;
  
  
  INSERT INTO TipoDeCliente(tipoCliente,abreviatura, descripcion) 
  VALUES (_tipoCliente,_abreviatura, _descripcion);  
  
  INSERT INTO Cliente(idCliente,tipoCliente,activo)
  VALUES (_idCliente,_tipoCliente,1);
  
  
  END$	

-- modificar 

DELIMITER ;

DROP PROCEDURE IF EXISTS modificar_cliente;
DELIMITER $
CREATE PROCEDURE modificar_cliente( 
 IN _idCliente INT,     
IN _nombre VARCHAR(75),     
IN _primerApellido VARCHAR(75),   
  IN _segundoApellido VARCHAR(75),  
  IN _dni INT,
  IN _telefono INT,
  IN _genero CHAR , 
  IN _abreviatura CHAR(1),
  IN _descripcion VARCHAR(120),
  IN _tipoCliente INT
  ) 
  BEGIN  
  
  UPDATE Persona SET nombre=_nombre,
  primerApellido=_primerApellido,
  segundoApellido=_segundoApellido,
  dni=_dni,
  telefono=_telefono,
  genero=_genero
  WHERE idPersona=_idCliente;
  
  UPDATE TipoDeCliente SET 
  abreviatura=_abreviatura,
  descripcion=_descripcion
  WHERE tipoCliente=_tipoCliente;
  
  
  
  END$	
  
  
  
  -- obtener por ID
  
DELIMITER ;
DROP PROCEDURE IF EXISTS obtenerId_cliente;
DELIMITER $
CREATE PROCEDURE obtenerId_cliente( IN _idCliente INT) 
  BEGIN
  
	SELECT c.idCliente,c.activo,p.nombre,
    p.primerApellido,p.segundoApellido,
    p.dni,p.telefono,p.genero,
    t.tipoCliente,t.abreviatura,t.descripcion
    FROM Cliente c INNER JOIN 
	Persona p ON c.idCliente=p.idPersona
	INNER JOIN TipoDeCliente t ON c.tipoCliente = t.tipoCliente 
    where c.idCliente=_idCliente;
    
  END$	



DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_clientes;
DELIMITER $
CREATE PROCEDURE mostrar_clientes() 
  BEGIN
  
  
  SELECT c.idCliente, c.activo,p.nombre,
    p.primerApellido,p.segundoApellido,
    p.dni,p.telefono,p.genero,
    t.tipoCliente,t.abreviatura,t.descripcion
    FROM Cliente c INNER JOIN 
	Persona p ON c.idCliente=p.idPersona
	INNER JOIN TipoDeCliente t ON c.tipoCliente = t.tipoCliente;
  
  
  END$	

DELIMITER ;


-- eliminar clientes 

DROP PROCEDURE IF EXISTS eliminar_cliente;
DELIMITER $
CREATE PROCEDURE eliminar_cliente(
	IN _idCliente INT) 
  BEGIN
  
  UPDATE Cliente SET activo=0
  WHERE idCliente=_idCliente;
 
  
  
  END$	

DELIMITER ;

