DROP PROCEDURE IF EXISTS INSERTAR_CASACA;


DELIMITER $
CREATE PROCEDURE INSERTAR_CASACA(
	OUT  _id_prenda INT,
    IN  _nombre VARCHAR(100),
    IN  _precioUnidad DECIMAL(10,2),
    IN  _precioMayor  DECIMAL(10,2),
    IN  _precioDocena DECIMAL(10,2),
    IN  _alertaMinStock INT,
    IN  _color VARCHAR(30),
    IN  _material ENUM('Algodon','Poliester','Mezcla_algodon_poliester','Lino','Viscosa_rayon',
                       'Lana','Acrilico','Nylon','Elastano_lycra','Denim','Drill','Gabardina',
                       'Polar','Franela','Cuero','Cuerina','Saten','Chifon'),
    IN  _tipo_casaca  ENUM('Bomber','Puffer','Denim','Deportiva','Cuero','Cardigan','Otro'),
    IN  _con_capucha TINYINT    
)
BEGIN
	INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = @@last_insert_id;

    INSERT INTO Casaca(idPrenda, tipo_casaca, con_capucha)
    VALUES(_id_prenda, _tipo_casaca, _con_capucha);

END$
DELIMITER ;
DROP PROCEDURE IF EXISTS MODIFICAR_CASACA;
DELIMITER $
CREATE PROCEDURE MODIFICAR_CASACA(
	IN  _id_prenda INT,
    IN  _nombre VARCHAR(100),
    IN  _precioUnidad DECIMAL(10,2),
    IN  _precioMayor  DECIMAL(10,2),
    IN  _precioDocena DECIMAL(10,2),
    IN  _alertaMinStock INT,
    IN  _color VARCHAR(30),
    IN  _material ENUM('Algodon','Poliester','Mezcla_algodon_poliester','Lino','Viscosa_rayon',
                       'Lana','Acrilico','Nylon','Elastano_lycra','Denim','Drill','Gabardina',
                       'Polar','Franela','Cuero','Cuerina','Saten','Chifon'),
    IN  _tipo_casaca  ENUM('Bomber','Puffer','Denim','Deportiva','Cuero','Cardigan','Otro'),
    IN  _con_capucha TINYINT,
    IN  _activo TINYINT
)
BEGIN
	UPDATE Prenda
       SET nombre = _nombre,
           precioUnidad = _precioUnidad,
           precioMayor  = _precioMayor,
           precioDocena = _precioDocena,
           alertaMinStock = _alertaMinStock,
           color = _color,
           material = _material,
           activo = _activo
     WHERE idPrenda = _id_prenda;

    UPDATE Casaca
       SET tipo_casaca  = _tipo_casaca,
           con_capucha = _con_capucha
     WHERE idPrenda = _id_prenda;
END$
DELIMITER ;

DROP PROCEDURE IF EXISTS OBTENER_CASACA_X_IDCASACA;
DELIMITER $$
CREATE PROCEDURE OBTENER_CASACA_X_IDCasaca(
    IN _id_prenda INT
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            c.tipo_casaca, c.con_capucha
      FROM  Prenda p
      JOIN  Casaca c ON c.idPrenda = p.idPrenda
     WHERE  p.idPrenda = _id_prenda;
END$$
DELIMITER ;
DROP PROCEDURE IF EXISTS MOSTRAR_CASACAS;
DELIMITER $$
CREATE PROCEDURE MOSTRAR_CASACAS(
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            c.tipo_casaca, c.con_capucha
      FROM  Prenda p
      JOIN  Casaca c ON c.idPrenda = p.idPrenda;
END$$
DELIMITER ;


