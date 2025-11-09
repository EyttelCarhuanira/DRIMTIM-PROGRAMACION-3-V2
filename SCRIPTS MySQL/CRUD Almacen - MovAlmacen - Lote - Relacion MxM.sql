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

DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_almacenes_activos;
DELIMITER $
CREATE PROCEDURE mostrar_almacenes_activos()
BEGIN
	SELECT *FROM Almacen
    WHERE activo=1;
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
    lugarDestino, lugarOrigen, tipo, activo)
    VALUES (_idMovAlmacen, _Almacen_idAlmacen, _fecha,
	_lugarDestino, _lugarOrigen, _tipo, 1);
	
	SET _idMovAlmacen=@@last_insert_id;
END$

#Modificar 
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
    lugarDestino=_lugarDestino, lugarOrigen=_lugarOrigen, tipo=_tipo_lote, activo=_activo
    WHERE idMovAlmacen=_idMovAlmacen;
END$

#Eliminar 
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
SELECT *FROM MovimientoAlmacen;
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

DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_mov_almacenes_activos;
DELIMITER $
CREATE PROCEDURE mostrar_mov_almacenes_activos()
BEGIN
	SELECT idMovAlmacen, Almacen_idAlmacen, fecha, lugarDestino,
    lugarOrigen, tipo, activo FROM MovimientoAlmacen
    WHERE activo=1;
END$



#Para Lote
DELIMITER ;
SELECT * FROM MovimientoAlmacen;


DROP PROCEDURE IF EXISTS insertar_lote;
select* FROM Lote;
DELIMITER $
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_lote`(
	OUT _idLote int,
    _Almacen_idAlmacen int,
    _descripcion VARCHAR(255)
)
BEGIN
	INSERT INTO Lote(idLote, Almacen_idAlmacen, activo, descripcion)
    VALUES (_idLote, _Almacen_idAlmacen,  1, _descripcion);
	
	SET _idLote=@@last_insert_id;
END$

DELIMITER ;
DROP PROCEDURE IF EXISTS modificar_lote;
DELIMITER $
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_lote`(
	_idLote int,
    _Almacen_idAlmacen int,
    _activo TINYINT,
    _descripcion VARCHAR(255)
)
BEGIN
	UPDATE Lote SET Almacen_idAlmacen=_Almacen_idAlmacen, activo=_activo, descripcion=_descripcion
	WHERE idLote=_idLote;
END$

DELIMITER ;
DROP PROCEDURE IF EXISTS eliminar_lote;
DELIMITER $
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_lote`(
	_idLote int
)
BEGIN
	UPDATE Lote SET activo=0
	WHERE idLote=_idLote;
END$

DELIMITER ;
DROP PROCEDURE IF EXISTS obtener_lote_X_id;
DELIMITER $
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_lote_X_id`(
	_idLote int
)
BEGIN
	SELECT*FROM Lote WHERE _idLote=idLote;
END$

DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_lotes;
DELIMITER $
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_lotes`()
BEGIN
    SELECT*FROM Lote;
END$

DELIMITER ;
DROP PROCEDURE IF EXISTS mostrar_lotes_activos;
DELIMITER $
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_lotes_activos`()
BEGIN
	SELECT* FROM Lote WHERE activo=1;
END$

#CRUD PARA MovimientoAlmacen_X_Lote
DELIMITER ;
DROP procedure IF EXISTS insertar_mov_X_lote;
SELECT *FROM MovimientoAlmacen_X_Lote;
DELIMITER $
CREATE PROCEDURE insertar_mov_X_lote(
	OUT _idMovAlmacen_X_Lote int,
    _Lote_idLote int,
    _MovimientoAlmacen_idMov_Almacen int,
    _MovimientoAlmacen_Almacen_idAlmacen int
)
BEGIN
	INSERT INTO MovimientoAlmacen_X_Lote(Lote_idLote, 
        MovimientoAlmacen_idMovAlmacen,
        MovimientoAlmacen_Almacen_idAlmacen, 
        activo)
    VALUES (_Lote_idLote, _MovimientoAlmacen_idMov_Almacen,
	_MovimientoAlmacen_Almacen_idAlmacen,  1);
	
	SET _idMovAlmacen_X_Lote=@@last_insert_id;
END$

DELIMITER ;
DROP procedure IF EXISTS modificar_mov_X_lote;
DELIMITER $
CREATE PROCEDURE modificar_mov_X_lote(
	_idMovAlmacen_X_Lote int,
    _Lote_idLote int,
    _MovimientoAlmacen_idMov_Almacen int,
    _MovimientoAlmacen_Almacen_idAlmacen int,
    _activo tinyint
)
BEGIN
    UPDATE MovimientoAlmacen_X_Lote SET Lote_idLote=_Lote_idLote, 
		MovimientoAlmacen_idMovAlmacen=_MovimientoAlmacen_idMov_Almacen,
        MovimientoAlmacen_Almacen_idAlmacen=_MovimientoAlmacen_Almacen_idAlmacen, activo=_activo
	WHERE idMovAlmacen_X_Lote=_idMovAlmacen_X_Lote;
    
END$

DELIMITER ;
DROP procedure IF EXISTS eliminar_mov_X_lote;
DELIMITER $
CREATE PROCEDURE eliminar_mov_X_lote(
	_idMovAlmacen_X_Lote int
)
BEGIN
    UPDATE MovimientoAlmacen_X_Lote SET activo=0
	WHERE idMovAlmacen_X_Lote=_idMovAlmacen_X_Lote;
    
END$

DELIMITER ;
DROP procedure IF EXISTS obtener_mov_X_lote_X_id;
DELIMITER $
CREATE PROCEDURE obtener_mov_X_lote_X_id(
	_idMovAlmacen_X_Lote int
)
BEGIN
    SELECT*FROM MovimientoAlmacen_X_Lote WHERE _idMovAlmacen_X_Lote=idMovAlmacen_X_Lote;
END$

DELIMITER ;
DROP procedure IF EXISTS mostrar_mov_X_lote;
DELIMITER $
CREATE PROCEDURE mostrar_mov_X_lote()
BEGIN
    SELECT*FROM MovimientoAlmacen_X_Lote;
END$

DELIMITER ;
DROP procedure IF EXISTS mostrar_mov_X_lote_activos;
DELIMITER $
CREATE PROCEDURE mostrar_mov_X_lote_activos()
BEGIN
    SELECT*FROM MovimientoAlmacen_X_Lote WHERE activo=1;
END$