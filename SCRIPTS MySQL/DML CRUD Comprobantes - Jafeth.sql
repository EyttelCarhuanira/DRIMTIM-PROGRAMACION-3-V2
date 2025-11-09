
-- A ComprobanteDePago vamos a agregarle activa, para todas sus comprobantes hijas
--ALTER TABLE mydb.ComprobanteDePago
--ADD COLUMN activa TINYINT AFTER arregloDatosDelCorrelativo;

--TODO LO ANTERIOR SE PUEDE BORRAR

DELIMITER $

CREATE PROCEDURE insertar_boleta(
	OUT _id_Comprobante INT,
	IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV   DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DNI VARCHAR(8)
)
BEGIN	
	INSERT INTO ComprobanteDePago(
    fecha,total,IGV,metodoDePago,correlativo,activa)
    VALUES (_FECHA,_TOTAL,_IGV,_METODOPAGO,_CORRELATIVO,1);
    SET _id_Comprobante = @@last_insert_id;
	INSERT INTO Boleta(idComprobante,DNI)
    VALUES (_id_Comprobante,_DNI);
END;

$

-- =========================================
-- MODIFICAR_BOLETA
-- =========================================

DELIMITER $

CREATE PROCEDURE modificar_boleta(
    IN _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DNI VARCHAR(8)
)
BEGIN
    UPDATE ComprobanteDePago
       SET fecha = _FECHA,
           total = _TOTAL,
           IGV = _IGV,
           metodoDePago = _METODOPAGO,
           correlativo = _CORRELATIVO
     WHERE idComprobante = _id_Comprobante;

    UPDATE Boleta
       SET DNI = _DNI
     WHERE idComprobante = _id_Comprobante;
END 
$

-- =========================================
-- OBTENER_BOLETA_X_ID (baja el activa)
-- =========================================

DELIMITER $
CREATE PROCEDURE eliminar_boleta(
    IN _id_Comprobante INT
)
BEGIN
    UPDATE ComprobanteDePago
       SET activa = 0
     WHERE idComprobante = _id_Comprobante;
END

$
-- =========================================
-- OBTENER_BOLETA_X_ID (corrige el "p IGV" y filtra activa)
-- =========================================

DELIMITER $

CREATE PROCEDURE obtener_boleta_x_id(
    IN _id_Comprobante INT
)
BEGIN
    SELECT 
        b.idComprobante,
        p.correlativo,
        p.fecha,
        p.IGV,
        p.metodoDePago,
        p.total,
        b.DNI,
        p.activa
    FROM ComprobanteDePago p
    INNER JOIN Boleta b ON p.idComprobante = b.idComprobante
    WHERE b.idComprobante = _id_Comprobante
      AND p.activa = 1;
END 

$

-- =========================================
-- LISTAR_BOLETAS_TODAS (corrige el "p IGV" y filtra activa)
-- =========================================
DELIMITER $$

CREATE PROCEDURE listar_boletas_todas()
BEGIN
    SELECT 
        b.idComprobante,
        p.correlativo AS Correlativo,
        p.fecha AS fecha,
        p.IGV AS IGV,
        p.metodoDePago AS metodoDePago,
        p.total AS total,
        b.DNI AS DNI,
        p.activa AS activa
    FROM ComprobanteDePago p
    INNER JOIN Boleta b ON p.idComprobante = b.idComprobante
    WHERE p.activa = 1
    ORDER BY p.fecha DESC, b.idComprobante DESC;
END $$

DELIMITER ;

-- =========================================
-- INSERTAR_FACTURA
-- =========================================
DELIMITER $


CREATE PROCEDURE insertar_factura(
    OUT _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _RUC VARCHAR(11),
    IN _RAZON_SOCIAL VARCHAR(110)
)
BEGIN
    INSERT INTO ComprobanteDePago (
        fecha, total, IGV, metodoDePago, correlativo, activa
    )
    VALUES (_FECHA, _TOTAL, _IGV, _METODOPAGO, _CORRELATIVO, 1);

    SET _id_Comprobante =  @@last_insert_id;

    INSERT INTO Factura (idComprobante, RUC, razonSocial)
    VALUES (_id_Comprobante, _RUC, _RAZON_SOCIAL);
END 

$

-- =========================================
-- MODIFICAR_FACTURA
-- =========================================

DELIMITER $$

CREATE PROCEDURE modificar_factura(
    IN _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _RUC VARCHAR(11),
    IN _RAZON_SOCIAL VARCHAR(110)
)
BEGIN
    UPDATE ComprobanteDePago
       SET fecha = _FECHA,
           total = _TOTAL,
           IGV = _IGV,
           metodoDePago = _METODOPAGO,
           correlativo = _CORRELATIVO
     WHERE idComprobante = _id_Comprobante;

    UPDATE Factura
       SET RUC = _RUC,
           razonSocial = _RAZON_SOCIAL
     WHERE idComprobante = _id_Comprobante;
END $$
DELIMITER ;


-- =========================================
-- ELIMINAR_FACTURA (baja lógica)
-- =========================================
DELIMITER $$

CREATE PROCEDURE eliminar_factura(
    IN _id_Comprobante INT
)
BEGIN
    UPDATE ComprobanteDePago
       SET activa = 0
     WHERE idComprobante = _id_Comprobante;
END $$
DELIMITER ;


-- =========================================
-- OBTENER_FACTURA_X_ID
-- =========================================

DELIMITER $$

CREATE PROCEDURE obtener_factura_x_id(
    IN _id_Comprobante INT
)
BEGIN
    SELECT 
        f.idComprobante,
        p.correlativo,
        p.fecha,
        p.IGV,
        p.metodoDePago,
        p.total,
        f.RUC,
        f.razonSocial,
        p.activa
    FROM ComprobanteDePago p
    INNER JOIN Factura f ON p.idComprobante = f.idComprobante
    WHERE f.idComprobante = _id_Comprobante
      AND p.activa = 1;
END $$
DELIMITER ;


-- =========================================
-- LISTAR_FACTURAS_TODAS
-- =========================================
DELIMITER $$

CREATE PROCEDURE listar_facturas_todas()
BEGIN
    SELECT 
        f.idComprobante,
        p.correlativo AS Correlativo,
        p.fecha AS fecha,
        p.IGV AS IGV,
        p.metodoDePago AS metodoDePago,
        p.total AS total,
        f.RUC AS RUC,
        f.razonSocial AS razonSocial,
        p.activa AS activa
    FROM ComprobanteDePago p
    INNER JOIN Factura f ON p.idComprobante = f.idComprobante
    WHERE p.activa = 1
    ORDER BY p.fecha DESC, f.idComprobante DESC;
END $$
DELIMITER ;

-- =========================================
-- INSERTAR_NOTA_DE_CREDITO
-- =========================================
DELIMITER $$

CREATE PROCEDURE insertar_nota_de_credito(
    OUT _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DETALLE_MODIFICACION VARCHAR(255),
    IN _RUC VARCHAR(11),
    IN _RAZON_SOCIAL VARCHAR(45),
    IN _DNI VARCHAR(8),
    IN _MOTIVO_ESPECIFICO VARCHAR(255),
    IN _NUEVO_MONTO DOUBLE,
    IN _VALOR_AUMENTAR DOUBLE
)
BEGIN
    INSERT INTO ComprobanteDePago(
        fecha, total, IGV, metodoDePago, correlativo, activa
    )
    VALUES (_FECHA, _TOTAL, _IGV, _METODOPAGO, _CORRELATIVO, 1);

    SET _id_Comprobante = @@last_insert_id;

    INSERT INTO NotaDeCredito(
        idComprobante, detalleModificacion, RUC, razonSocial,
        DNI, motivoEspecifico, nuevoMonto, valorAumentar
    )
    VALUES (
        _id_Comprobante, _DETALLE_MODIFICACION, _RUC, _RAZON_SOCIAL,
        _DNI, _MOTIVO_ESPECIFICO, _NUEVO_MONTO, _VALOR_AUMENTAR
    );
END $$
DELIMITER ;


-- =========================================
-- MODIFICAR_NOTA_DE_CREDITO
-- =========================================

DELIMITER $$

CREATE PROCEDURE modificar_nota_de_credito(
    IN _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DETALLE_MODIFICACION VARCHAR(255),
    IN _RUC VARCHAR(11),
    IN _RAZON_SOCIAL VARCHAR(45),
    IN _DNI VARCHAR(8),
    IN _MOTIVO_ESPECIFICO VARCHAR(255),
    IN _NUEVO_MONTO DOUBLE,
    IN _VALOR_AUMENTAR DOUBLE
)
BEGIN
    UPDATE ComprobanteDePago
       SET fecha = _FECHA,
           total = _TOTAL,
           IGV = _IGV,
           metodoDePago = _METODOPAGO,
           correlativo = _CORRELATIVO
     WHERE idComprobante = _id_Comprobante;

    UPDATE NotaDeCredito
       SET detalleModificacion = _DETALLE_MODIFICACION,
           RUC = _RUC,
           razonSocial = _RAZON_SOCIAL,
           DNI = _DNI,
           motivoEspecifico = _MOTIVO_ESPECIFICO,
           nuevoMonto = _NUEVO_MONTO,
           valorAumentar = _VALOR_AUMENTAR
     WHERE idComprobante = _id_Comprobante;
END $$
DELIMITER ;


-- =========================================
-- ELIMINAR_NOTA_DE_CREDITO (baja lógica)
-- =========================================

DELIMITER $$

CREATE PROCEDURE eliminar_nota_de_credito(
    IN _id_Comprobante INT
)
BEGIN
    UPDATE ComprobanteDePago
       SET activa = 0
     WHERE idComprobante = _id_Comprobante;
END $$
DELIMITER ;


-- =========================================
-- OBTENER_NOTA_DE_CREDITO_X_ID
-- =========================================
DELIMITER $$

CREATE PROCEDURE obtener_nota_de_credito_x_id(
    IN _id_Comprobante INT
)
BEGIN
    SELECT 
        n.idComprobante,
        p.correlativo,
        p.fecha,
        p.IGV,
        p.metodoDePago,
        p.total,
        n.detalleModificacion,
        n.RUC,
        n.razonSocial,
        n.DNI,
        n.motivoEspecifico,
        n.nuevoMonto,
        n.valorAumentar,
        p.activa
    FROM ComprobanteDePago p
    INNER JOIN NotaDeCredito n ON p.idComprobante = n.idComprobante
    WHERE n.idComprobante = _id_Comprobante
      AND p.activa = 1;
END $$
DELIMITER ;


-- =========================================
-- LISTAR_NOTAS_DE_CREDITO_TODAS
-- =========================================

DELIMITER $$

CREATE PROCEDURE listar_notas_de_credito_todas()
BEGIN
    SELECT 
        n.idComprobante,
        p.correlativo AS Correlativo,
        p.fecha AS fecha,
        p.IGV AS IGV,
        p.metodoDePago AS metodoDePago,
        p.total AS total,
        n.detalleModificacion AS detalleModificacion,
        n.RUC AS RUC,
        n.razonSocial AS razonSocial,
        n.DNI AS DNI,
        n.motivoEspecifico AS motivoEspecifico,
        n.nuevoMonto AS nuevoMonto,
        n.valorAumentar AS valorAumentar,
        p.activa AS activa
    FROM ComprobanteDePago p
    INNER JOIN NotaDeCredito n ON p.idComprobante = n.idComprobante
    WHERE p.activa = 1
    ORDER BY p.fecha DESC, n.idComprobante DESC;
END $$
DELIMITER ;


-- =========================================
-- INSERTAR_NOTA_DE_DEBITO
-- =========================================

DELIMITER $$

CREATE PROCEDURE insertar_nota_de_debito(
    OUT _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DETALLE_MODIFICACION VARCHAR(255),
    IN _RUC VARCHAR(11),
    IN _RAZON_SOCIAL VARCHAR(45),
    IN _MOTIVO_ESPECIFICO VARCHAR(45),
    IN _NUEVO_MONTO DOUBLE,
    IN _VALOR_AUMENTAR DOUBLE,
    IN _ID_PRENDA INT
)
BEGIN
    INSERT INTO ComprobanteDePago(
        fecha, total, IGV, metodoDePago, correlativo, activa
    )
    VALUES (_FECHA, _TOTAL, _IGV, _METODOPAGO, _CORRELATIVO, 1);

    SET _id_Comprobante = @@last_insert_id;
    

    INSERT INTO NotaDeDebito(
        idComprobante, detalleModificacion, RUC, razonSocial,
        motivoEspecifico, nuevoMonto, valorAumentar, idPrenda
    )
    VALUES (
        _id_Comprobante, _DETALLE_MODIFICACION, _RUC, _RAZON_SOCIAL,
        _MOTIVO_ESPECIFICO, _NUEVO_MONTO, _VALOR_AUMENTAR, _ID_PRENDA
    );
END $$
DELIMITER ;

-- =========================================
-- MODIFICAR_NOTA_DE_DEBITO
-- =========================================

DELIMITER $$

CREATE PROCEDURE modificar_nota_de_debito(
    IN _id_Comprobante INT,
    IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DETALLE_MODIFICACION VARCHAR(255),
    IN _RUC VARCHAR(11),
    IN _RAZON_SOCIAL VARCHAR(45),
    IN _MOTIVO_ESPECIFICO VARCHAR(45),
    IN _NUEVO_MONTO DOUBLE,
    IN _VALOR_AUMENTAR DOUBLE,
    IN _ID_PRENDA INT
)
BEGIN
    UPDATE ComprobanteDePago
       SET fecha = _FECHA,
           total = _TOTAL,
           IGV = _IGV,
           metodoDePago = _METODOPAGO,
           correlativo = _CORRELATIVO
     WHERE idComprobante = _id_Comprobante;

    UPDATE NotaDeDebito
       SET detalleModificacion = _DETALLE_MODIFICACION,
           RUC = _RUC,
           razonSocial = _RAZON_SOCIAL,
           motivoEspecifico = _MOTIVO_ESPECIFICO,
           nuevoMonto = _NUEVO_MONTO,
           valorAumentar = _VALOR_AUMENTAR,
           idPrenda = _ID_PRENDA
     WHERE idComprobante = _id_Comprobante;
END $$
DELIMITER ;


-- =========================================
-- ELIMINAR_NOTA_DE_DEBITO (baja lógica)
-- =========================================

DELIMITER $$

CREATE PROCEDURE eliminar_nota_de_debito(
    IN _id_Comprobante INT
)
BEGIN
    UPDATE ComprobanteDePago
       SET activa = 0
     WHERE idComprobante = _id_Comprobante;
END $$
DELIMITER ;


-- =========================================
-- OBTENER_NOTA_DE_DEBITO_X_ID
-- =========================================
DELIMITER $$

CREATE PROCEDURE obtener_nota_de_debito_x_id(
    IN _id_Comprobante INT
)
BEGIN
    SELECT 
        n.idComprobante,
        p.correlativo,
        p.fecha,
        p.IGV,
        p.metodoDePago,
        p.total,
        n.detalleModificacion,
        n.RUC,
        n.razonSocial,
        n.motivoEspecifico,
        n.nuevoMonto,
        n.valorAumentar,
        n.idPrenda,
        p.activa
    FROM ComprobanteDePago p
    INNER JOIN NotaDeDebito n ON p.idComprobante = n.idComprobante
    WHERE n.idComprobante = _id_Comprobante
      AND p.activa = 1;
END $$
DELIMITER ;


-- =========================================
-- LISTAR_NOTAS_DE_DEBITO_TODAS
-- =========================================

DELIMITER $$

CREATE PROCEDURE listar_notas_de_debito_todas()
BEGIN
    SELECT 
        n.idComprobante,
        p.correlativo AS Correlativo,
        p.fecha AS fecha,
        p.IGV AS IGV,
        p.metodoDePago AS metodoDePago,
        p.total AS total,
        n.detalleModificacion AS detalleModificacion,
        n.RUC AS RUC,
        n.razonSocial AS razonSocial,
        n.motivoEspecifico AS motivoEspecifico,
        n.nuevoMonto AS nuevoMonto,
        n.valorAumentar AS valorAumentar,
        n.idPrenda AS idPrenda,
        p.activa AS activa
    FROM ComprobanteDePago p
    INNER JOIN NotaDeDebito n ON p.idComprobante = n.idComprobante
    WHERE p.activa = 1
    ORDER BY p.fecha DESC, n.idComprobante DESC;
END $$
DELIMITER ;