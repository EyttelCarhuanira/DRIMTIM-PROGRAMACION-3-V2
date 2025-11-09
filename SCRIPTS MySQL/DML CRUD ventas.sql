
-- Script de venta

DROP PROCEDURE IF EXISTS insertar_venta;
DROP PROCEDURE IF EXISTS modificar_venta;
DROP PROCEDURE IF EXISTS insertar_Item_Venta;
DROP PROCEDURE IF EXISTS eliminar_venta;
DROP PROCEDURE IF EXISTS obtener_venta_X_id;
DROP PROCEDURE IF EXISTS mostrar_ventas;
DROP PROCEDURE IF EXISTS mostrar_items_venta_X_ID_venta;
DROP PROCEDURE IF EXISTS mostrar_ventas_activas;
DROP PROCEDURE IF EXISTS mostrar_items_venta_X_ID_venta_activos;


-- ALTER TABLE `mydb`.`ItemVenta`
-- ADD COLUMN `activo` TINYINT NOT NULL DEFAULT 1;


DELIMITER $

-- insertar venta

CREATE PROCEDURE insertar_venta(
	OUT _idVenta INT,
    IN _fecha datetime,
    IN _total decimal(10,2),
    IN _Comprobante_idComprobante int,
    IN _activo tinyint,
    IN _Cliente_idCliente int,
    IN _Empleado_idEmpleado int
)
BEGIN
	INSERT INTO Venta (fecha,total,
    Empleado_idEmpleado,Cliente_idCliente,
    Comprobante_idComprobante,activo)
    VALUES (_fecha,_total,
    _Empleado_idEmpleado,_Cliente_idCliente,
   _Comprobante_idComprobante,1);
	-- puede que el valor del date se pueda insertar desde acá y se pase 
    -- como parametro de salida
    SET _idVenta = @@last_insert_id; 
END$


-- modificar venta

CREATE PROCEDURE modificar_venta(
	IN _idVenta INT,
    IN _fecha datetime,
    IN _total decimal(10,2),
    IN _Empleado_idEmpleado INT,
    IN _Cliente_idCliente INT,
    IN _Comprobante_idComprobante INT
)
BEGIN
	UPDATE ItemVenta
    SET activo = 0
    WHERE Venta_idVenta = _idVenta;
    
	UPDATE Venta 
    SET fecha = 
    _fecha,
    total = _total, 
    Empleado_idEmpleado = _Empleado_idEmpleado,
    Cliente_idCliente = _Cliente_idCliente,
    Comprobante_idComprobante = _Comprobante_idComprobante
    WHERE idVenta = _idVenta;
    
END$




-- añadir item venta

CREATE PROCEDURE insertar_Item_Venta(
	OUT _numLinea INT,
    IN _Prenda_idPrenda INT,
    IN _cantidad INT,
    IN _subtotal decimal(10,2),
    IN _Venta_idVenta INT
)
BEGIN

	INSERT INTO ItemVenta (Prenda_idPrenda,
    cantidad,subtotal,Venta_idVenta, activo)
    VALUES (_Prenda_idPrenda,_cantidad,
    _subtotal,_Venta_idVenta,  1);

    SET _numLinea = @@last_insert_id;
END$


-- eliminar venta

CREATE PROCEDURE eliminar_venta (
	IN _idVenta INT
)
BEGIN
	UPDATE Venta SET activo = 0 
    WHERE idVenta = _idVenta ;
    
    UPDATE ItemVenta 
    SET activo = 0 
    WHERE Venta_idVenta = _idVenta;
    
END$


-- buscar por id
DELIMITER $
CREATE PROCEDURE obtener_venta_X_id(
	IN _idVenta INT
)
BEGIN
	SELECT 
    vent.idVenta as id_venta,
    vent.fecha as fecha_venta,
    vent.total as total_venta,
	vent.activo as estado_venta ,
    emple.idEmpleado as id_empleado,
    emple.sueldo as sueldo_empleado,
    emple.activo as estado_empleado,
    
    perEmple.nombre as nombre_empleado,
    perEmple.primerApellido as primerApellido_empleado,
    perEmple.segundoApellido as segundoApellido_empleado,
    perEmple.dni as dni_empleado,
    perEmple.telefono as telefono_empleado,
    perEmple.genero as genero_empleado,
    
    
    
    cargoEmple.idCargo as id_cargo_emple,
    cargoEmple.abreviatura as abreviatura_cargo,
    cargoEmple.descripcion as descripcion_emplea,
	cargoEmple.activo as activo_cargo_emple,
    clie.idCliente as id_cliente,
    clie.activo as activo_clie,
    
    
    tipoClie.tipoCliente as tipo_clie_id,
    tipoClie.abreviatura as abreviatura_clie,
    tipoClie.descripcion as descripcion_clie,
    perClie.dni as dni_clie,
    perClie.genero as genero_clie,
    perClie.nombre as nombre_clie,
    perClie.primerApellido as primerApellido_clie,
    perClie.segundoApellido as segundoApellido_clie,
    perClie.telefono as telefono_clie,
    vent.Comprobante_idComprobante as id_comprobante
    
    FROM
    Venta vent INNER JOIN Empleado emple ON
    vent.Empleado_idEmpleado = emple.idEmpleado 
    INNER JOIN Cliente clie 
    ON vent.Cliente_idCliente = clie.idCliente 
    INNER JOIN ComprobanteDePago compPag 
    ON vent.Comprobante_idComprobante = compPag.idComprobante
    INNER JOIN Persona perClie
    ON clie.idCliente = perClie.idPersona
    INNER JOIN Persona perEmple
    ON emple.idEmpleado =  perEmple.idPersona 
    INNER JOIN Cargo cargoEmple
    ON cargoEmple.idCargo = emple.Cargo_idCargo
    INNER JOIN TipoDeCliente tipoClie
    ON clie.tipoCliente = tipoClie.tipoCliente
    WHERE vent.idVenta = _idVenta;
    
END$

-- listar todas la ventas mostrar_ventas
DELIMITER $
CREATE PROCEDURE mostrar_ventas()
BEGIN
	SELECT 
    vent.idVenta as id_venta,
    vent.fecha as fecha_venta,
    vent.total as total_venta,
	vent.activo as estado_venta ,
    emple.idEmpleado as id_empleado,
    emple.sueldo as sueldo_empleado,
    emple.activo as estado_empleado,
    
    perEmple.nombre as nombre_empleado,
    perEmple.primerApellido as primerApellido_empleado,
    perEmple.segundoApellido as segundoApellido_empleado,
    perEmple.dni as dni_empleado,
    perEmple.telefono as telefono_empleado,
    perEmple.genero as genero_empleado,
    
    
    
    cargoEmple.idCargo as id_cargo_emple,
    cargoEmple.abreviatura as abreviatura_cargo,
    cargoEmple.descripcion as descripcion_emplea,
	cargoEmple.activo as activo_cargo_emple,
    clie.idCliente as id_cliente,
    clie.activo as activo_clie,
    
    tipoClie.tipoCliente as tipo_clie_id,
    tipoClie.abreviatura as abreviatura_clie,
    tipoClie.descripcion as descripcion_clie,
    perClie.dni as dni_clie,
    perClie.genero as genero_clie,
    
    perClie.nombre as nombre_clie,
    perClie.primerApellido as primerApellido_clie,
    perClie.segundoApellido as segundoApellido_clie,
    perClie.telefono as telefono_clie,
    vent.Comprobante_idComprobante as id_comprobante
    
    FROM
    Venta vent INNER JOIN Empleado emple ON
    vent.Empleado_idEmpleado = emple.idEmpleado 
    INNER JOIN Cliente clie 
    ON vent.Cliente_idCliente = clie.idCliente 
    INNER JOIN ComprobanteDePago compPag 
    ON vent.Comprobante_idComprobante = compPag.idComprobante
    INNER JOIN Persona perClie
    ON clie.idCliente = perClie.idPersona
    INNER JOIN Persona perEmple
    ON emple.idEmpleado =  perEmple.idPersona 
    INNER JOIN Cargo cargoEmple
    ON cargoEmple.idCargo = emple.Cargo_idCargo
    INNER JOIN TipoDeCliente tipoClie
    ON clie.tipoCliente = tipoClie.tipoCliente
    ;
    
END$


-- Item venta buscar:

DELIMITER $
CREATE PROCEDURE mostrar_items_venta_X_ID_venta(
	IN _Venta_idVenta INT
)
BEGIN
	SELECT 
    itemVent.numLinea AS  numero_linea,
    itemVent.Prenda_idPrenda AS prendaID,
    itemVent.cantidad AS cantidad_item,
    itemVent.subtotal AS subtotal_item,
    itemVent.Venta_idVenta AS id_venta,
    itemVent.activo AS estado_Item
    FROM
    ItemVenta itemVent INNER JOIN  Prenda prend ON
    itemVent.Prenda_idPrenda = prend.idPrenda 
    WHERE itemVent.Venta_idVenta =  _Venta_idVenta;
END$


-- mostrar_ventas_activas

DELIMITER $
CREATE PROCEDURE mostrar_ventas_activas()
BEGIN
	SELECT 
    vent.idVenta as id_venta,
    vent.fecha as fecha_venta,
    vent.total as total_venta,
	vent.activo as estado_venta ,
    emple.idEmpleado as id_empleado,
    emple.sueldo as sueldo_empleado,
    emple.activo as estado_empleado,
    
    perEmple.nombre as nombre_empleado,
    perEmple.primerApellido as primerApellido_empleado,
    perEmple.segundoApellido as segundoApellido_empleado,
    perEmple.dni as dni_empleado,
    perEmple.telefono as telefono_empleado,
    perEmple.genero as genero_empleado,
  
    
    
    cargoEmple.idCargo as id_cargo_emple,
    cargoEmple.abreviatura as abreviatura_cargo,
    cargoEmple.descripcion as descripcion_emplea,
	cargoEmple.activo as activo_cargo_emple,
    clie.idCliente as id_cliente,
    clie.activo as activo_clie,
    
    tipoClie.tipoCliente as tipo_clie_id,
    tipoClie.abreviatura as abreviatura_clie,
    tipoClie.descripcion as descripcion_clie,
    perClie.dni as dni_clie,
    perClie.genero as genero_clie,
   
    perClie.nombre as nombre_clie,
    perClie.primerApellido as primerApellido_clie,
    perClie.segundoApellido as segundoApellido_clie,
    perClie.telefono as telefono_clie,
    vent.Comprobante_idComprobante as id_comprobante
    
    FROM
    Venta vent INNER JOIN Empleado emple ON
    vent.Empleado_idEmpleado = emple.idEmpleado 
    INNER JOIN Cliente clie 
    ON vent.Cliente_idCliente = clie.idCliente 
    INNER JOIN ComprobanteDePago compPag 
    ON vent.Comprobante_idComprobante = compPag.idComprobante
    INNER JOIN Persona perClie
    ON clie.idCliente = perClie.idPersona
    INNER JOIN Persona perEmple
    ON emple.idEmpleado =  perEmple.idPersona 
    INNER JOIN Cargo cargoEmple
    ON cargoEmple.idCargo = emple.Cargo_idCargo
    INNER JOIN TipoDeCliente tipoClie
    ON clie.tipoCliente = tipoClie.tipoCliente
    WHERE vent.activo = 1;
    
END$


-- mostrar_items_venta_X_ID_venta_activos

DELIMITER $
CREATE PROCEDURE mostrar_items_venta_X_ID_venta_activos(
	IN _Venta_idVenta INT
)
BEGIN
	SELECT 
    itemVent.numLinea AS  numero_linea,
    itemVent.Prenda_idPrenda AS prendaID,
    itemVent.cantidad AS cantidad_item,
    itemVent.subtotal AS subtotal_item,
    itemVent.Venta_idVenta AS id_venta,
    itemVent.activo AS estado_Item
    FROM
    ItemVenta itemVent INNER JOIN  Prenda prend ON
    itemVent.Prenda_idPrenda = prend.idPrenda 
    WHERE itemVent.Venta_idVenta =  _Venta_idVenta AND 
    itemVent.activo = 1;
END$




