-- Eliminar las tablas hijas primero, para no tener conflictos con las claves foráneas.
DROP TABLE IF EXISTS NotaDeCredito;
DROP TABLE IF EXISTS NotaDeDebito;
DROP TABLE IF EXISTS Boleta;
DROP TABLE IF EXISTS Factura;

-- Ahora eliminar la tabla base.
DROP TABLE IF EXISTS ComprobanteDePago;