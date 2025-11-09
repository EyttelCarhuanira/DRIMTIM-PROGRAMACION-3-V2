#DDL para almacen.
SELECT*FROM Almacen;
SELECT *FROM Tienda;
#Lo primero que hay que ejecutar es esta sentencia.
INSERT INTO Tienda (nombre, ubicacion)
VALUES('WearDrop', 'Jirón Gamarra 653, sótano 1, tienda 13');

#Para reiniciar los AUTO_INCREMENTS
ALTER TABLE Tienda AUTO_INCREMENT =1;
ALTER TABLE Almacen AUTO_INCREMENT =1;


DELETE FROM Tienda WHERE (idTienda=1);
DELETE FROM Almacen WHERE (idAlmacen=1);
#Hay q aumentar la capacidad de ubicación...

#INSERTAR ALMACEN
DROP PROCEDURE IF EXISTS insertar_almacen;
DELIMITER $
CREATE PROCEDURE insertar_almacen(
	OUT _id_almacen INT,
    IN _nombre varchar(70),
    IN _ubicacion varchar(70),
    IN _stock int,
    IN _Tienda_idTienda int
)
BEGIN
	INSERT INTO Almacen(nombre, ubicacion, stock, Activo, Tienda_idTienda)
    VALUES (_nombre, _ubicacion, _stock, 1,_Tienda_idTienda);
    SET _id_almacen = @@last_insert_id;
END$
DELIMITER ;
DROP PROCEDURE IF EXISTS modificar_almacen;

#MODIFICAR ALMACEN
DELIMITER $
CREATE PROCEDURE modificar_almacen(
	_id int,
	_nombre varchar(70),
    _ubicacion varchar(70),
    _stock int,
    _activo tinyint,
    _idTienda int
)
BEGIN
	UPDATE Almacen 
    SET nombre=_nombre, ubicacion=_ubicacion, stock=_stock, activo=_activo, 
		Tienda_idTienda=_idTienda
    WHERE _id=idAlmacen;
END$

#ELIMINAR almacén
DELIMITER ;
DROP PROCEDURE IF EXISTS eliminar_almacen;
DELIMITER $
CREATE PROCEDURE eliminar_almacen(
	_idAlmacen int
)
BEGIN 
	UPDATE Almacen
    SET activo=0 
    WHERE idAlmacen=_idAlmacen;
END$

#OBTENER POR ID un almacén
DELIMITER ;
DROP PROCEDURE IF EXISTS obtener_almacen_X_id;
DELIMITER $
CREATE PROCEDURE obtener_almacen_X_id(
	IN _idAlmacen int
)
BEGIN
	SELECT idAlmacen, nombre, ubicacion, stock, Tienda_idTienda, activo
    FROM Almacen
    WHERE idAlmacen=_idAlmacen;
END$
DELIMITER ;
SELECT *FROM Almacen;

#MOSTRAR almacenes
DROP PROCEDURE IF EXISTS mostrar_almacenes;

DELIMITER $
CREATE PROCEDURE mostrar_almacenes()
BEGIN
	SELECT *FROM Almacen;
END$

#Para MovimientoAlmacen
DELIMITER ;
SELECT * FROM MovimientoAlmacen;
DROP PROCEDURE IF EXISTS insertar_mov_almacen;

DELIMITER $
CREATE PROCEDURE insertar_mov_almacen(
	OUT _idMovAlmacen int,
    _Almacen_idAlmacen int,
    _fecha DATE,
    _lugarDestino VARCHAR(100),
    _lugarOrigen VARCHAR(100),
    _tipo ENUM('Entrada', 'Salida', 'Mov_Interno')
)BEGIN
	INSERT INTO MovimientoAlmacen(idMovAlmacen, Almacen_idAlmacen, fecha,
    lugarDestino, lugarDestino, lugarOrigen, tipo, activo)
    VALUES (_idMovAlmacen, _Almacen_idAlmacen, _fecha,
    _lugarDestino, _lugarDestino, _lugarOrigen, _tipo, 1);
END$

#Modificar almacen
DELIMITER ;
DROP PROCEDURE IF EXISTS modificar_mov_almacen;

DELIMITER $
CREATE PROCEDURE modificar_mov_almacen(
	_idMovAlmacen int,
    _Almacen_idAlmacen int,
    _fecha DATE,
    _lugarDestino VARCHAR(100),
    _lugarOrigen VARCHAR(100),
    _tipo_lote ENUM('Entrada', 'Salida', 'Mov_Interno'),
    _activo TINYINT
)
BEGIN
	UPDATE MovimientoAlmacen
    SET Almacen_idAlmacen=_Almacen_idAlmacen, fecha=_fecha,
    lugarDestino=_lugarDestino, lugarOrigen=_lugarOrigen, tipo=_tipo, activo=_activo
    WHERE idMovAlmacen=_idMovAlmacen;
END$

#Eliminar Almacen
DELIMITER ;
DROP PROCEDURE IF EXISTS eliminar_mov_almacen;

DELIMITER $
CREATE PROCEDURE eliminar_mov_almacen(
	_idMovAlmacen INT
)
BEGIN
	UPDATE MovimientoAlmacen
    SET activo=0
    WHERE idMovAlmacen=_idMovAlmacen;
END$

#Obtener POR ID
DELIMITER ;
DROP PROCEDURE IF EXISTS obtener_mov_X_id;
DELIMITER $
CREATE PROCEDURE obtener_mov_X_id(
	_idMovAlmacen int
)
BEGIN
	SELECT idMovAlmacen, Almacen_idAlmacen, fecha,
    lugarDestino, lugarOrigen, tipo, activo
    FROM MovimientoAlmacen
    WHERE idMovAlmacen=_idMovAlmacen;
END$

DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_mov_almacenes;
DELIMITER $
CREATE PROCEDURE mostrar_mov_almacenes()
BEGIN
	SELECT idMovAlmacen, Almacen_idAlmacen, fecha, lugarDestino,
    lugarOrigen, tipo, activo FROM MovimientoAlmacen;
END$