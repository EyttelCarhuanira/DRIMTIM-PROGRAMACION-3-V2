
-- Script de orden venta

DROP PROCEDURE IF EXISTS insertar_orden_compra ;
DROP PROCEDURE IF EXISTS insertar_Item__orden_Compra ;
DROP PROCEDURE IF EXISTS modificar_orden_compra ;
DROP PROCEDURE IF EXISTS eliminar_orden_compra ;
DROP PROCEDURE IF EXISTS obtener_orden_de_compra_X_id ;
DROP PROCEDURE IF EXISTS mostrar_ordenes_de_compra ;
DROP PROCEDURE IF EXISTS mostrar_Lineas_Lote_compra_X_ID_compra ;
DROP PROCEDURE IF EXISTS mostrar_Lineas_Lote_compra_X_ID_compra_activos ;


-- Insertar ordene compras

DELIMITER $
CREATE PROCEDURE insertar_orden_compra(
	OUT _idCompra INT,
    IN _fechaLlegada datetime,
    IN _fechaEmision datetime,
    IN _deudaPendiente decimal(10,2),
    IN _montoTotal decimal(10,2),
    IN _Proveedor_idProveedor INT,
    IN _Empleado_idEmpleado INT,
    IN _activo tinyint
)
BEGIN
	
	INSERT INTO OrdenCompra (fechaLlegada,
    fechaEmision,deudaPendiente,montoTotal,
    Proveedor_idProveedor,Empleado_idEmpleado,
    activo)
    VALUES (_fechaLlegada , _fechaEmision,
    _deudaPendiente,_montoTotal,
    _Proveedor_idProveedor,_Empleado_idEmpleado, 1 );

    SET _idCompra = @@last_insert_id; 
END$

-- insertar linea lote de compras  insertar_Item__orden_Compra

DELIMITER $
CREATE PROCEDURE insertar_Item__orden_Compra(
	OUT _numLinea INT,
    IN _idPrenda INT,
    IN _cantidad INT,
    IN _talla varchar(20),
    IN _lote_idLote INT,
    IN _precioLote decimal(10,2),
    IN _OrdenCompra_idCompra INT,
    IN _activo tinyint
)
BEGIN
	
	INSERT INTO LineaLoteCompra (idPrenda,
    cantidad,talla,lote_idLote,
    precioLote,OrdenCompra_idCompra,
    activo)
    VALUES (_idPrenda , _cantidad,
    _talla,_lote_idLote,
    _precioLote,_OrdenCompra_idCompra, 1 );

    SET _numLinea = @@last_insert_id; 
END$


-- modificar_orden_compra

DELIMITER $
CREATE PROCEDURE modificar_orden_compra(
	IN _idCompra INT,
    IN _fechaLlegada datetime,
    IN _fechaEmision datetime,
    IN _deudaPendiente decimal(10,2),
    IN _montoTotal decimal(10,2),
    IN _Proveedor_idProveedor INT,
    IN _Empleado_idEmpleado INT,
    IN _activo tinyint
)
BEGIN
	UPDATE LineaLoteCompra
    SET activo = 0
    WHERE OrdenCompra_idCompra = _idCompra ;
    
	UPDATE OrdenCompra 
    SET 
    fechaLlegada = _fechaLlegada,
    fechaEmision = _fechaEmision,
    deudaPendiente = _deudaPendiente,
    montoTotal = _montoTotal,
    Proveedor_idProveedor = _Proveedor_idProveedor,
    Empleado_idEmpleado = _Empleado_idEmpleado
    WHERE idCompra = _idCompra;
    
END$

-- eliminar_orden_compra
DELIMITER $
CREATE PROCEDURE eliminar_orden_compra (
	IN _idCompra INT
)
BEGIN
	UPDATE OrdenCompra SET activo = 0 
    WHERE idCompra = _idCompra ;
    
    UPDATE LineaLoteCompra 
    SET activo = 0 
    WHERE OrdenCompra_idCompra = _idCompra;
    
END$


-- obtener_orden_de_compra_X_id


DELIMITER $
CREATE PROCEDURE obtener_orden_de_compra_X_id(
	IN _idCompra INT
)
BEGIN
	SELECT 
    ordcomp.idCompra as id_orden_compra,
    ordcomp.fechaLlegada as fecha_llegada_orden_compra,
    ordcomp.fechaEmision as fecha_emision_orden_compra,
    ordcomp.deudaPendiente as deuda_pendiente_orden_compra,
    ordcomp.montoTotal as monto_total_orden_compra,
    ordcomp.activo as activo_orden_compra,
    
    ordcomp.Proveedor_idProveedor as id_proveedor,
    prove.RUC as ruc_proveedor,
    prove.nombre as nombre_proveedor,
    prove.telefono as telefono_proveedor,
    prove.direccion as direccion_proveedor,
    prove.activo as activo_prooveedor,
    
    ordcomp.Empleado_idEmpleado as id_empleado,
    empl.sueldo as sueldo_empleado,
    empl.Cargo_idCargo as empleado_cargoId,
    carg.abreviatura as empleado_abreviatura,
    carg.descripcion as empleado_descripcion,
    carg.activo as cargo_activo,
    
    empl.activo as activo_empleado,
    person_empl.nombre as nombre_empleado,
    person_empl.primerApellido as primer_ape_empleado,
    person_empl.segundoApellido as segun_ape_empleado,
    person_empl.dni as dni_empleado,
    person_empl.telefono as telefono_empleado,
    person_empl.genero as genero_empleado

    FROM
    OrdenCompra ordcomp INNER JOIN Proveedor prove ON
    ordcomp.Proveedor_idProveedor = prove.idProveedor
    INNER JOIN Empleado empl ON
    ordcomp.Empleado_idEmpleado  = empl.idEmpleado
    INNER JOIN Cargo carg ON
    empl.Cargo_idCargo = carg.idCargo
    INNER JOIN Persona person_empl ON
    person_empl.idPersona = empl.idEmpleado
    WHERE ordcomp.idCompra = _idCompra;
    
END$



-- mostrar_ordenes_de_compra
DELIMITER $
CREATE PROCEDURE mostrar_ordenes_de_compra()
BEGIN
	SELECT 
    ordcomp.idCompra as id_orden_compra,
    ordcomp.fechaLlegada as fecha_llegada_orden_compra,
    ordcomp.fechaEmision as fecha_emision_orden_compra,
    ordcomp.deudaPendiente as deuda_pendiente_orden_compra,
    ordcomp.montoTotal as monto_total_orden_compra,
    ordcomp.activo as activo_orden_compra,
    
    ordcomp.Proveedor_idProveedor as id_proveedor,
    prove.RUC as ruc_proveedor,
    prove.nombre as nombre_proveedor,
    prove.telefono as telefono_proveedor,
    prove.direccion as direccion_proveedor,
    prove.activo as activo_prooveedor,
    
    ordcomp.Empleado_idEmpleado as id_empleado,
    empl.sueldo as sueldo_empleado,
    empl.Cargo_idCargo as empleado_cargoId,
    carg.abreviatura as empleado_abreviatura,
    carg.descripcion as empleado_descripcion,
    carg.activo as cargo_activo,
    
    empl.activo as activo_empleado,
    person_empl.nombre as nombre_empleado,
    person_empl.primerApellido as primer_ape_empleado,
    person_empl.segundoApellido as segun_ape_empleado,
    person_empl.dni as dni_empleado,
    person_empl.telefono as telefono_empleado,
    person_empl.genero as genero_empleado

    FROM
    OrdenCompra ordcomp INNER JOIN Proveedor prove ON
    ordcomp.Proveedor_idProveedor = prove.idProveedor
    INNER JOIN Empleado empl ON
    ordcomp.Empleado_idEmpleado  = empl.idEmpleado
    INNER JOIN Cargo carg ON
    empl.Cargo_idCargo = carg.idCargo
    INNER JOIN Persona person_empl ON
    person_empl.idPersona = empl.idEmpleado;
    
END$



--  mostrar_Lineas_Lote_compra_X_ID_compra
DELIMITER $
CREATE PROCEDURE mostrar_Lineas_Lote_compra_X_ID_compra(
	IN _idCompra INT
)
BEGIN
	SELECT 
    lineaLotComp.idPrenda AS id_Prenda_linlote,
    lineaLotComp.numLinea AS num_linea_linlote,
    lineaLotComp.cantidad AS cantidad_linlote,
    lineaLotComp.talla AS talla_linlote,
    
    lineaLotComp.lote_idLote AS id_lote_linlote,
    lot.Almacen_idAlmacen AS almacen_id,
    lot.activo as activo_lote,
    
    
    lineaLotComp.precioLote AS precio_lote_linlote,
    lineaLotComp.OrdenCompra_idCompra AS id_orden_linlote,
    lineaLotComp.activo AS activo_linlote
    
    
    FROM
    LineaLoteCompra lineaLotComp INNER JOIN 
    Lote lot ON
    lineaLotComp.lote_idLote = lot.idLote
    WHERE lineaLotComp.OrdenCompra_idCompra = _idCompra;
    
END$


 -- mostrar_Lineas_Lote_compra_X_ID_compra_activos

DELIMITER $
CREATE PROCEDURE mostrar_Lineas_Lote_compra_X_ID_compra_activos(
	IN _idCompra INT
)
BEGIN
	SELECT 
    lineaLotComp.idPrenda AS id_Prenda_linlote,
    lineaLotComp.numLinea AS num_linea_linlote,
    lineaLotComp.cantidad AS cantidad_linlote,
    lineaLotComp.talla AS talla_linlote,
    
    lineaLotComp.lote_idLote AS id_lote_linlote,
    lot.Almacen_idAlmacen AS almacen_id,
    lot.activo as activo_lote,
    
    
    lineaLotComp.precioLote AS precio_lote_linlote,
    lineaLotComp.OrdenCompra_idCompra AS id_orden_linlote,
    lineaLotComp.activo AS activo_linlote
    
    
    FROM
    LineaLoteCompra lineaLotComp INNER JOIN 
    Lote lot ON
    lineaLotComp.lote_idLote = lot.idLote
    WHERE lineaLotComp.OrdenCompra_idCompra = _idCompra
    AND lineaLotComp.activo = 1;
END$







