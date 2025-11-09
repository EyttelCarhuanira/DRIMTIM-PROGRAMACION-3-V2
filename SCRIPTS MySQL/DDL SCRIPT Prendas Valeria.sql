ALTER TABLE `mydb`.`Prenda`
  -- 1) Ajustes de columnas existentes
  MODIFY COLUMN `nombre` VARCHAR(100) NOT NULL,
  CHANGE COLUMN `stock` `stockPrenda` INT NOT NULL DEFAULT 0,
  CHANGE COLUMN `alertaMinima` `alertaMinStock` INT NOT NULL,
  MODIFY COLUMN `color` VARCHAR(30) NULL,
  DROP COLUMN `talla`,

  -- 2) Nuevas columnas de precios (con default para migración)
  ADD COLUMN `precioUnidad` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  ADD COLUMN `precioMayor`  DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  ADD COLUMN `precioDocena` DECIMAL(10,2) NOT NULL DEFAULT 0.00,

  -- 3) Nuevo ENUM material (con default para migración)
  ADD COLUMN `material` ENUM(
    'Algodon','Poliester','Mezcla_algodon_poliester','Lino','Viscosa_rayon',
    'Lana','Acrilico','Nylon','Elastano_lycra','Denim',
    'Drill','Gabardina','Polar','Franela','Cuero','Cuerina',
    'Saten','Chifon'
  ) NOT NULL DEFAULT 'Algodon',


  -- 4) Reglas de validación (MySQL 8.0.16+)
  ADD CONSTRAINT `chk_precioUnidad_nonneg` CHECK (`precioUnidad` >= 0),
  ADD CONSTRAINT `chk_precioMayor_nonneg`  CHECK (`precioMayor`  >= 0),
  ADD CONSTRAINT `chk_precioDocena_nonneg` CHECK (`precioDocena` >= 0),
  ADD CONSTRAINT `chk_alertaMinStock_nonneg` CHECK (`alertaMinStock` >= 0);

COMMIT;


CREATE TABLE Polo (
  id_prenda   INT NOT NULL,
  tipo_manga  ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos') NOT NULL,
  estampado   VARCHAR(80),
  tipo_cuello ENUM('Redondo','V','Camisero','Alto','Halter','OffShoulder','Otro') NOT NULL,
  PRIMARY KEY (id_prenda),
  FOREIGN KEY (id_prenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

ALTER TABLE Polo
RENAME COLUMN id_prenda TO idPrenda;

CREATE TABLE Blusa (
  idPrenda  INT NOT NULL,
  tipo_blusa ENUM('Camisera','CropTop','Peplum','OffShoulder','Transparente','Formal','Casual') NOT NULL,
  tipo_manga ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos') NOT NULL,
  PRIMARY KEY (idPrenda),
  FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

CREATE TABLE Casaca (
  idPrenda     INT NOT NULL,
  tipo_casaca  ENUM('Bomber','Puffer','Denim','Deportiva','Cuero','Cardigan','Otro') NOT NULL,
  -- sin (1), y con check para 0/1:
  con_capucha  TINYINT NOT NULL CHECK (con_capucha IN (0,1)) DEFAULT 0,
  PRIMARY KEY (idPrenda),
  FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

CREATE TABLE Falda (
  idPrenda     INT NOT NULL,
  tipo_falda   ENUM('Mini','Midi','Larga','Tubo','Plisada','Cruzada','ShortFalda','Otro') NOT NULL,
  largo        DECIMAL(6,2) NOT NULL CHECK (largo > 0),  -- cm
  con_forro    TINYINT NOT NULL CHECK (con_forro IN (0,1)) DEFAULT 0,
  con_volantes TINYINT NOT NULL CHECK (con_volantes IN (0,1)) DEFAULT 0,
  PRIMARY KEY (idPrenda),
  FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

CREATE TABLE Gorro (
  idPrenda        INT NOT NULL,
  tipo_gorra      ENUM('Bucket','Visera','Tejido','Beanie','Otro') NOT NULL,
  talla_ajustable TINYINT NOT NULL DEFAULT 0 CHECK (talla_ajustable IN (0,1)),
  impermeable     TINYINT NOT NULL DEFAULT 0 CHECK (impermeable IN (0,1)),
  PRIMARY KEY (idPrenda),
  FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

CREATE TABLE Pantalon (
  idPrenda       INT NOT NULL,
  tipo_pantalon  ENUM('Jean','Jogger','Chino','Cargo','Buzo','Leggins','Palazzo','Otro') NOT NULL,
  largo_pierna   DECIMAL(6,2) NOT NULL CHECK (largo_pierna > 0),  -- cm
  cintura        DECIMAL(6,2) NOT NULL CHECK (cintura > 0),       -- cm
  elasticidad    TINYINT NOT NULL DEFAULT 0 CHECK (elasticidad IN (0,1)),
  PRIMARY KEY (idPrenda),
  FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

CREATE TABLE Vestido (
  idPrenda     INT NOT NULL,
  tipo_vestido ENUM('Coctel','Fiesta','Gala','Playa','Ejecutivo','Maxi','Mini','Casual') NOT NULL,
  largo        INT NOT NULL CHECK (largo > 0),  -- cm
  tipo_manga   ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos') NOT NULL,
  PRIMARY KEY (idPrenda),
  FOREIGN KEY (idPrenda) REFERENCES Prenda(idPrenda)
) ENGINE=InnoDB;

DELIMITER $$

-- INSERTAR_POLO: crea Prenda y su fila hija en Polo

CREATE PROCEDURE INSERTAR_POLO(
    OUT _id_prenda INT,
    IN  _nombre VARCHAR(100),
    IN  _precioUnidad DECIMAL(10,2),
    IN  _precioMayor  DECIMAL(10,2),
    IN  _precioDocena DECIMAL(10,2),
    IN  _alertaMinStock INT,
    IN  _color VARCHAR(30),
    IN  _material ENUM('Algodon','Poliester','Mezcla_algodon_poliester','Lino','Viscosa_rayon',
                       'Lana','Acrilico','Nylon','Elastano_lycra','Denim','Drill','Gabardina',
                       'Polar','Franela','Cuero','Cuerina','Saten','Chifon'),
    IN  _tipo_manga  ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos'),
    IN  _estampado   VARCHAR(80),
    IN  _tipo_cuello ENUM('Redondo','V','Camisero','Alto','Halter','OffShoulder','Otro')
)
BEGIN

    INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = @@last_insert_id;

    INSERT INTO Polo(idPrenda, tipo_manga, estampado, tipo_cuello)
    VALUES(_id_prenda, _tipo_manga, _estampado, _tipo_cuello);
END$$


-- MODIFICAR_POLO: actualiza datos en Prenda y Polo
DROP PROCEDURE MODIFICAR_POLO;
/* MODIFICAR_POLO: también actualiza activo */
DELIMITER $$
CREATE PROCEDURE MODIFICAR_POLO(
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
    IN  _tipo_manga  ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos'),
    IN  _estampado   VARCHAR(80),
    IN  _tipo_cuello ENUM('Redondo','V','Camisero','Alto','Halter','OffShoulder','Otro'),
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

    UPDATE Polo
       SET tipo_manga  = _tipo_manga,
           estampado   = _estampado,
           tipo_cuello = _tipo_cuello
     WHERE idPrenda = _id_prenda;
END$$



-- OBTENER_POLO_X_ID: devuelve la fila combinada de Prenda + Polo

CREATE PROCEDURE OBTENER_POLO_X_IDPolo(
    IN _id_prenda INT
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            po.tipo_manga, po.estampado, po.tipo_cuello
      FROM  Prenda p
      JOIN  Polo   po ON po.idPrenda = p.idPrenda
     WHERE  p.idPrenda = _id_prenda;
END$$

DELIMITER ;

CALL INSERTAR_POLO(
  @id_prenda1,
  'Polo piqué básico',     -- _nombre
  29.90,                   -- _precioUnidad
  25.00,                   -- _precioMayor
  280.00,                  -- _precioDocena
  10,                      -- _alertaMinStock
  'Blanco',                -- _color
  'Algodon',               -- _material (ENUM)
  'MangaCorta',            -- _tipo_manga (ENUM)
  'Liso',                  -- _estampado
  'Redondo'                -- _tipo_cuello (ENUM)
);

CALL MODIFICAR_POLO(
  1,
  'Polo piqué básico',
  29.90,
  25.00,
  280.00,
  10,
  'Negro',
  'Algodon',
  'MangaCorta',
  'Liso',
  'Redondo',
  1           -- _activo
);

DELETE FROM Polo
WHERE idPrenda = 4;

DELETE FROM Prenda
WHERE idPrenda = 4;


 ALTER TABLE Prenda AUTO_INCREMENT = 1;
ALTER TABLE Polo AUTO_INCREMENT = 1;


SELECT * FROM Prenda INNER JOIN Polo ON Prenda.idPrenda = Polo.idPrenda;

SELECT * FROM Prenda;

COMMIT;




