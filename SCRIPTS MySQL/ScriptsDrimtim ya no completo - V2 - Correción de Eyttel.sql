-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: database-drimtim.cv8mkagyktz5.us-east-1.rds.amazonaws.com    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Dumping data for table `Almacen`
--

LOCK TABLES `Almacen` WRITE;
/*!40000 ALTER TABLE `Almacen` DISABLE KEYS */;
INSERT INTO `Almacen` VALUES (1,'Secundario','Piso 9',40,1,0),(2,'Principal','Piso 2',50,1,1),(3,'Principal','Piso 2',50,1,1),(4,'Almacen de Prueba','Piso X',100,1,0),(5,'Almacen de Prueba','Piso X',100,1,0),(6,'Almacen de Prueba','Piso X',100,1,0),(7,'Almacen de Prueba','Piso X',100,1,0),(8,'Almacen de Prueba','Piso X',100,1,0),(9,'Secundario','Piso 9',40,1,0),(10,'Principal','Piso 2',50,1,1),(11,'Almacen de Prueba','Piso X',100,1,0),(12,'Almacen de Prueba','Piso X',100,1,0),(13,'Almacen de Prueba','Piso X',100,1,0),(14,'Almacen de Prueba','Piso X',100,1,0),(15,'Almacen de Prueba','Piso X',100,1,0),(16,'Almacen de Prueba','Piso X',100,1,0),(17,'Almacen de Prueba','Piso X',100,1,0),(18,'Almacen de Prueba','Piso X',100,1,0),(19,'Almacen de Prueba','Piso X',100,1,0),(20,'Almacen de Prueba','Piso X',100,1,0),(21,'Almacen de Prueba','Piso X',100,1,0),(22,'Almacen de Prueba','Piso X',100,1,0),(23,'Almacen de Prueba','Piso X',100,1,1),(24,'Almacen de Prueba','Piso X',100,1,0),(25,'Almacen de Prueba','Piso X',100,1,0),(26,'Almacen de Prueba','Piso X',100,1,0),(27,'Almacen de Prueba','Piso X',100,1,0),(28,'Almacen de Prueba','Piso X',100,1,0),(29,'Almacen de Prueba','Piso X',100,1,0),(30,'Almacen de Prueba','Piso X',100,1,0),(31,'Almacen de Prueba','Piso X',100,1,0),(32,'Almacen de Prueba','Piso X',100,1,0),(33,'Almacen de Prueba','Piso X',100,1,0),(34,'Principal','Piso 2',50,1,1),(35,'Almacen de Prueba','Piso X',100,1,0),(36,'Almacen de Prueba','Piso X',100,1,0);
/*!40000 ALTER TABLE `Almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Blusa`
--

LOCK TABLES `Blusa` WRITE;
/*!40000 ALTER TABLE `Blusa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Blusa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Boleta`
--

LOCK TABLES `Boleta` WRITE;
/*!40000 ALTER TABLE `Boleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (5,'S','SUPERVISOR',1),(6,'G','GERENTE',1);
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Casaca`
--

LOCK TABLES `Casaca` WRITE;
/*!40000 ALTER TABLE `Casaca` DISABLE KEYS */;
/*!40000 ALTER TABLE `Casaca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Catalogo`
--

LOCK TABLES `Catalogo` WRITE;
/*!40000 ALTER TABLE `Catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ComprobanteDePago`
--

LOCK TABLES `ComprobanteDePago` WRITE;
/*!40000 ALTER TABLE `ComprobanteDePago` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComprobanteDePago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `CondicionPago`
--

LOCK TABLES `CondicionPago` WRITE;
/*!40000 ALTER TABLE `CondicionPago` DISABLE KEYS */;
/*!40000 ALTER TABLE `CondicionPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `CuentaUsuario`
--

LOCK TABLES `CuentaUsuario` WRITE;
/*!40000 ALTER TABLE `CuentaUsuario` DISABLE KEYS */;
INSERT INTO `CuentaUsuario` VALUES (1,'Pedro','asws',1,'hola@gamil',1),(2,'Pato','1234',0,'pato@hotmail',2);
/*!40000 ALTER TABLE `CuentaUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Descuento`
--

LOCK TABLES `Descuento` WRITE;
/*!40000 ALTER TABLE `Descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `DescuentoLiquidacion`
--

LOCK TABLES `DescuentoLiquidacion` WRITE;
/*!40000 ALTER TABLE `DescuentoLiquidacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `DescuentoLiquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `DescuentoMonto`
--

LOCK TABLES `DescuentoMonto` WRITE;
/*!40000 ALTER TABLE `DescuentoMonto` DISABLE KEYS */;
/*!40000 ALTER TABLE `DescuentoMonto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `DescuentoPorcentaje`
--

LOCK TABLES `DescuentoPorcentaje` WRITE;
/*!40000 ALTER TABLE `DescuentoPorcentaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `DescuentoPorcentaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (11,13500.00,6),(12,3500.00,5),(13,777.00,5);
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Falda`
--

LOCK TABLES `Falda` WRITE;
/*!40000 ALTER TABLE `Falda` DISABLE KEYS */;
/*!40000 ALTER TABLE `Falda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Gorro`
--

LOCK TABLES `Gorro` WRITE;
/*!40000 ALTER TABLE `Gorro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Gorro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ItemVenta`
--

LOCK TABLES `ItemVenta` WRITE;
/*!40000 ALTER TABLE `ItemVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `LineaDeRopa`
--

LOCK TABLES `LineaDeRopa` WRITE;
/*!40000 ALTER TABLE `LineaDeRopa` DISABLE KEYS */;
/*!40000 ALTER TABLE `LineaDeRopa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `LineaLoteCompra`
--

LOCK TABLES `LineaLoteCompra` WRITE;
/*!40000 ALTER TABLE `LineaLoteCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `LineaLoteCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Lote`
--

LOCK TABLES `Lote` WRITE;
/*!40000 ALTER TABLE `Lote` DISABLE KEYS */;
INSERT INTO `Lote` VALUES (1,11,0),(2,13,0),(3,1,0),(4,15,0),(5,16,0),(6,17,0),(7,18,0),(8,19,0),(9,20,0),(10,21,0),(11,22,0),(12,23,1),(13,24,0),(14,25,0),(15,26,0),(16,27,0),(17,28,0),(18,29,0),(19,30,0),(20,31,0),(21,32,0),(22,33,0);
/*!40000 ALTER TABLE `Lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `MovimientoAlmacen`
--

LOCK TABLES `MovimientoAlmacen` WRITE;
/*!40000 ALTER TABLE `MovimientoAlmacen` DISABLE KEYS */;
INSERT INTO `MovimientoAlmacen` VALUES (1,4,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0),(2,5,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0),(3,6,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0),(4,7,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0),(5,8,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0),(6,9,'2011-05-19 00:00:00','K1','K9','Entrada',0),(7,11,'2011-05-19 00:00:00','K1','K9','Entrada',0),(8,12,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0),(9,13,'2011-05-19 00:00:00','K1','K9','Entrada',0),(10,15,'2011-05-19 00:00:00','K1','K9','Entrada',0),(11,16,'2011-05-19 00:00:00','K1','K9','Entrada',0),(12,17,'2011-05-19 00:00:00','K1','K9','Entrada',0),(13,18,'2011-05-19 00:00:00','K1','K9','Entrada',0),(14,19,'2011-05-19 00:00:00','K1','K9','Entrada',0),(15,20,'2011-05-19 00:00:00','K1','K9','Entrada',0),(16,21,'2011-05-19 00:00:00','K1','K9','Entrada',0),(17,22,'2011-05-19 00:00:00','K1','K9','Entrada',0),(18,23,'2011-05-19 00:00:00','K1','K9','Entrada',1),(19,24,'2011-05-19 00:00:00','K1','K9','Entrada',0),(20,25,'2011-05-19 00:00:00','K1','K9','Entrada',0),(21,26,'2011-05-19 00:00:00','K1','K9','Entrada',0),(22,27,'2011-05-19 00:00:00','K1','K9','Entrada',0),(23,28,'2011-05-19 00:00:00','K1','K9','Entrada',0),(24,29,'2011-05-19 00:00:00','K1','K9','Entrada',0),(25,30,'2011-05-19 00:00:00','K1','K9','Entrada',0),(26,31,'2011-05-19 00:00:00','K1','K9','Entrada',0),(27,32,'2011-05-19 00:00:00','K1','K9','Entrada',0),(28,33,'2011-05-19 00:00:00','K1','K9','Entrada',0),(29,35,'2011-05-19 00:00:00','K1','K9','Entrada',0),(30,36,'2011-05-19 00:00:00','K1','K9','Mov_Interno',0);
/*!40000 ALTER TABLE `MovimientoAlmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `MovimientoAlmacen_X_Lote`
--

LOCK TABLES `MovimientoAlmacen_X_Lote` WRITE;
/*!40000 ALTER TABLE `MovimientoAlmacen_X_Lote` DISABLE KEYS */;
INSERT INTO `MovimientoAlmacen_X_Lote` VALUES (1,22,28,33,1),(2,9,15,20,0),(3,10,16,21,0),(4,11,17,22,0),(5,13,19,24,0),(6,14,20,25,0),(7,15,21,26,0),(8,16,22,27,0),(9,17,23,28,0),(10,18,24,29,0),(11,19,25,30,0),(12,20,26,31,0),(13,21,27,32,0),(14,22,28,33,0);
/*!40000 ALTER TABLE `MovimientoAlmacen_X_Lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `NotaDeCredito`
--

LOCK TABLES `NotaDeCredito` WRITE;
/*!40000 ALTER TABLE `NotaDeCredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotaDeCredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `NotaDeDebito`
--

LOCK TABLES `NotaDeDebito` WRITE;
/*!40000 ALTER TABLE `NotaDeDebito` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotaDeDebito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `OrdenCompra`
--

LOCK TABLES `OrdenCompra` WRITE;
/*!40000 ALTER TABLE `OrdenCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdenCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Pantalon`
--

LOCK TABLES `Pantalon` WRITE;
/*!40000 ALTER TABLE `Pantalon` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pantalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO `Persona` VALUES (8,'RONY','CUEVA','SALAZAR',7773338,933222888,'M',0),(9,'MIGUEL','GUANIRA','SANTOS',11111111,999999999,'M',1),(10,'RONY','CUEVA','SALAZAR',7773338,933222888,'M',1),(11,'MANUEL','TUPIA','KLEIVNIKOV',11111111,999999999,'M',1),(12,'ANA','RONCAL','GUANIRA',77738876,93322341,'F',1),(13,'JOSE','CALDERON','BANCES',2223332,882782982,'M',1);
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Polo`
--

LOCK TABLES `Polo` WRITE;
/*!40000 ALTER TABLE `Polo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Polo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Prenda`
--

LOCK TABLES `Prenda` WRITE;
/*!40000 ALTER TABLE `Prenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PrendaDescuento`
--

LOCK TABLES `PrendaDescuento` WRITE;
/*!40000 ALTER TABLE `PrendaDescuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrendaDescuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PrendaLote`
--

LOCK TABLES `PrendaLote` WRITE;
/*!40000 ALTER TABLE `PrendaLote` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrendaLote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PrendaPromocion`
--

LOCK TABLES `PrendaPromocion` WRITE;
/*!40000 ALTER TABLE `PrendaPromocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrendaPromocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Promocion`
--

LOCK TABLES `Promocion` WRITE;
/*!40000 ALTER TABLE `Promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PromocionCombo`
--

LOCK TABLES `PromocionCombo` WRITE;
/*!40000 ALTER TABLE `PromocionCombo` DISABLE KEYS */;
/*!40000 ALTER TABLE `PromocionCombo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PromocionConjunto`
--

LOCK TABLES `PromocionConjunto` WRITE;
/*!40000 ALTER TABLE `PromocionConjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `PromocionConjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Proveedor`
--

LOCK TABLES `Proveedor` WRITE;
/*!40000 ALTER TABLE `Proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Tienda`
--

LOCK TABLES `Tienda` WRITE;
/*!40000 ALTER TABLE `Tienda` DISABLE KEYS */;
INSERT INTO `Tienda` VALUES (1,'WearDrop','Calle de Prueba');
/*!40000 ALTER TABLE `Tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `TipoCuenta`
--

LOCK TABLES `TipoCuenta` WRITE;
/*!40000 ALTER TABLE `TipoCuenta` DISABLE KEYS */;
INSERT INTO `TipoCuenta` VALUES (1,'ADMINISTRADOR',1),(2,'EMPLEAADO',0);
/*!40000 ALTER TABLE `TipoCuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `TipoDeCliente`
--

LOCK TABLES `TipoDeCliente` WRITE;
/*!40000 ALTER TABLE `TipoDeCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoDeCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Vestido`
--

LOCK TABLES `Vestido` WRITE;
/*!40000 ALTER TABLE `Vestido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vestido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Vigencia`
--

LOCK TABLES `Vigencia` WRITE;
/*!40000 ALTER TABLE `Vigencia` DISABLE KEYS */;
INSERT INTO `Vigencia` VALUES (1,'2000-11-01','2011-11-20',1),(2,'2000-12-01','2011-12-20',1);
/*!40000 ALTER TABLE `Vigencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_blusa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_blusa`(
    IN _idPrenda INT
)
BEGIN
  UPDATE Prenda
     SET activo = 0
   WHERE idPrenda = _idPrenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_cargo`(
	IN _idCargo INT
)
BEGIN
	UPDATE Cargo SET activo = 0
    WHERE idCargo=_idCargo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_cuentaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_cuentaUsuario`(
	IN _idCuenta INT
)
BEGIN
	UPDATE CuentaUsuario SET activo = 0
    WHERE idCuenta=_idCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_descuentoLiquidacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_descuentoLiquidacion`(in id int)
BEGIN
		update Promocion 
        set activo=0
        where idPromocion=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_descuentoMonto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_descuentoMonto`(in id int)
BEGIN
		update Descuento 
        set activo=0
        where idDescuento=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_descuentoPorcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_descuentoPorcentaje`(in id int)
BEGIN
		update Descuento 
        set activo=0
        where idDescuento=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_empleado`(
	IN _idEmpleado INT
)
BEGIN
	UPDATE Persona SET activo = 0
    WHERE idPersona=_idEmpleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_falda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_falda`(
		IN _idPrenda INT )
BEGIN
  UPDATE Prenda SET activo=0
  WHERE idPrenda=_idPrenda;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_gorro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_gorro`(
    IN _idPrenda INT
)
BEGIN
  UPDATE Prenda
     SET activo = 0
   WHERE idPrenda = _idPrenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_lote`(
	_idLote int
)
BEGIN
	UPDATE Lote SET activo=0
	WHERE idLote=_idLote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_mov_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_mov_almacen`(
	_idMovAlmacen INT
)
BEGIN
	UPDATE MovimientoAlmacen
    SET activo=0
    WHERE idMovAlmacen=_idMovAlmacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_mov_X_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_mov_X_lote`(
	_idMovAlmacen_X_Lote int
)
BEGIN
    UPDATE MovimientoAlmacen_X_Lote SET activo=0
	WHERE idMovAlmacen_X_Lote=_idMovAlmacen_X_Lote;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_pantalon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_pantalon`(
    IN _idPrenda INT
)
BEGIN
  UPDATE Prenda
     SET activo = 0
   WHERE idPrenda = _idPrenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_polo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_polo`(
    IN _id_prenda INT
)
BEGIN
  UPDATE Prenda
     SET activo = 0
   WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_prenda_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_prenda_lote`(
    IN _id_prenda_lote INT
)
BEGIN
  UPDATE PrendaLote
     SET activo = 0
   WHERE idPrendaLote = _id_prenda_lote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_promocioncombo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_promocioncombo`(in id int)
BEGIN
		update Promocion 
        set activo=0
        where idPromocion=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_promocionconjunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_promocionconjunto`(in id int)
BEGIN
		update Promocion 
        set activo=0
        where idPromocion=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_proveedor`(
		IN _idProveedor INT )
BEGIN
  UPDATE Proveedor SET activo=0
  WHERE idProveedor=_idProveedor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_tipoCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_tipoCuenta`(
	IN _idTipoCuenta INT
)
BEGIN
	UPDATE TipoCuenta SET activo = 0
    WHERE idTipoCuenta=_idTipoCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_venta`(
	IN _idVenta INT
)
BEGIN
	UPDATE Venta SET activo = 0 
    WHERE idVenta = _idVenta ;
    
    UPDATE ItemVenta 
    SET activo = 0 
    WHERE Venta_idVenta = _idVenta;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_vestido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_vestido`(
    IN _idPrenda INT
)
BEGIN
  UPDATE Prenda
     SET activo = 0
   WHERE idPrenda = _idPrenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_vigencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `eliminar_vigencia`(in id int)
BEGIN
		update Vigencia 
        set activo=0
        where idVigencia=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_almacen`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_blusa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_blusa`(
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
    IN  _tipo_blusa ENUM('Camisera','CropTop','Peplum','OffShoulder','Transparente','Formal','Casual'),
    IN  _tipo_manga ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos')
)
BEGIN
    INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = LAST_INSERT_ID();

    INSERT INTO Blusa(idPrenda, tipo_blusa, tipo_manga)
    VALUES(_id_prenda, _tipo_blusa, _tipo_manga);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_BOLETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `INSERTAR_BOLETA`(
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
    fecha,total,IGV,metodoDePago,correlativo)
    VALUES (_FECHA,_TOTAL,_IGV,_METODOPAGO,_CORRELATIVO);
    SET _id_Comprobante = @@last_insert_id;
	INSERT INTO Boleta(idComprobante,DNI)
    VALUES (_id_Comprobante,_DNI);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_cargo`(
	OUT _idCargo INT,
    IN _abreviatura CHAR,
    IN _descripcion VARCHAR(75)
)
BEGIN
	INSERT INTO Cargo (abreviatura,descripcion,activo) VALUES (
		_abreviatura,_descripcion,1);
	SET _idCargo = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_casaca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_casaca`(
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_cliente`(  OUT _idCliente INT,     
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
  
  INSERT INTO Cliente(idCliente,tipoCliente) VALUES (_idCliente,_tipoCliente);
  
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cuentaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_cuentaUsuario`(
	OUT _idCuenta INT,
    IN _username VARCHAR(75),
    IN _contrasenha VARCHAR(75),
    IN _email VARCHAR(75),
    IN _TipoCuenta_idTipoCuenta INT
)
BEGIN
	INSERT INTO CuentaUsuario (username,contrasenha,email,
    TipoCuenta_idTipoCuenta,activo) 
    VALUES (_username,_contrasenha,_email,
    _TipoCuenta_idTipoCuenta,1);
	SET _idCuenta = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_descuentoliquidacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_descuentoliquidacion`(out id INT,in nom VARCHAR(75),in porcentaje float,in stock int,in idV int)
begin 
	insert into Descuento (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into DescuentoLiquidacion(idDescuento,porcentajeLiquidacion,condicionStockMin) values (id,porcentaje,stock);
	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_descuentomonto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_descuentomonto`(out id INT,in nom VARCHAR(75),in montoE float,in montoM float,in idV int)
begin 
	insert into Descuento (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into DescuentoMonto(idDescuento,montoEditable,montoMaximo) values (id,montoE,montoM);
	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_descuentoporcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_descuentoporcentaje`(out id INT,in nom VARCHAR(75),in porcentaje float,in idV int)
begin 
	insert into Descuento (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into DescuentoPorcentaje(idDescuento,porcentaje) values (id,porcentaje);
	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_empleado`(
	OUT _idEmpleado INT,
    IN _nombre VARCHAR(75),
    IN _primerApellido VARCHAR(75),
    IN _segundoApellido VARCHAR(75),
    IN _dni INT,
    IN _telefono INT,
    IN _genero CHAR,
    IN _Cargo_idCargo INT,
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	INSERT INTO Persona (nombre,primerApellido,segundoApellido,
    dni,telefono,genero,activo)
    VALUES (_nombre,_primerApellido,_segundoApellido,
    _dni,_telefono,_genero,1);
	SET _idEmpleado = @@last_insert_id;
    INSERT INTO Empleado(idEmpleado,Cargo_idCargo,sueldo)
    VALUES (_idEmpleado,_Cargo_idCargo,_sueldo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `INSERTAR_FACTURA`(
    OUT p_idComprobante INT,
    IN p_fecha DATETIME,
    IN p_total DOUBLE,
    IN p_IGV DOUBLE,
    IN p_metodoDePago VARCHAR(45),
    IN p_correlativo VARCHAR(45),
	IN p_arregloDatosDelCorrelativo INT,
    IN p_RUC LONG,
    IN p_razonSocial VARCHAR(45)
)
BEGIN
    -- Insertar en ComprobanteDePago
    INSERT INTO ComprobanteDePago(idComprobante, fecha, total, IGV, metodoDePago, correlativo, arregloDatosDelCorrelativo)
    VALUES (p_idComprobante, p_fecha, p_total, p_IGV, p_metodoDePago, p_correlativo, p_arrCorrelativo);
    SET p_idComprobante=@@last_insert_id;
    -- Insertar en Factura
    INSERT INTO Factura(RUC, razonSocial)
    VALUES (p_RUC, p_razonSocial);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_falda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_falda`(
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
    IN  _tipo_falda   ENUM('Mini','Midi','Larga','Tubo','Plisada','Cruzada','ShortFalda','Otro'),
    IN  _largo        DECIMAL(6,2),
    IN  _con_forro    TINYINT,
    IN  _con_volantes TINYINT
)
BEGIN
    INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = @@last_insert_id;

    INSERT INTO Falda(idPrenda, tipo_falda, largo, con_forro, con_volantes)
    VALUES(_id_prenda, _tipo_falda, _largo, _con_forro, _con_volantes);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_gorro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_gorro`(
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
    IN  _tipo_gorra ENUM('Bucket','Visera','Tejido','Beanie','Otro'),
    IN  _talla_ajustable TINYINT,
    IN  _impermeable     TINYINT
)
BEGIN
    INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = LAST_INSERT_ID();

    INSERT INTO Gorro(idPrenda, tipo_gorra, talla_ajustable, impermeable)
    VALUES(_id_prenda, _tipo_gorra, _talla_ajustable, _impermeable);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_Item_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_Item_Venta`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_lote`(
	OUT _idLote int,
    _Almacen_idAlmacen int
)
BEGIN
	INSERT INTO Lote(idLote, Almacen_idAlmacen, activo)
    VALUES (_idLote, _Almacen_idAlmacen,  1);
	
	SET _idLote=@@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_mov_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_mov_almacen`(
	OUT _idMovAlmacen int,
    _Almacen_idAlmacen int,
    _fecha DATE,
    _lugarDestino VARCHAR(100),
    _lugarOrigen VARCHAR(100),
    _tipo ENUM('Entrada', 'Salida', 'Mov_Interno')
)
BEGIN
	INSERT INTO MovimientoAlmacen(idMovAlmacen, Almacen_idAlmacen, fecha,
    lugarDestino, lugarOrigen, tipo, activo)
    VALUES (_idMovAlmacen, _Almacen_idAlmacen, _fecha,
	_lugarDestino, _lugarOrigen, _tipo, 1);
	
	SET _idMovAlmacen=@@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_mov_X_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_mov_X_lote`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_NOTA_DE_CREDITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `INSERTAR_NOTA_DE_CREDITO`(
	OUT _id_Comprobante INT,
	IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV   DOUBLE,
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
    fecha,total,IGV,metodoDePago,correlativo)
    VALUES (_FECHA,_TOTAL,_IGV,_METODOPAGO,_CORRELATIVO);
    SET _id_Comprobante = @@last_insert_id;
	INSERT INTO NotaDeCredito(idComprobante,detalleModificacion,
		RUC,razonSocial,DNI,motivoEspecifico,nuevoMonto,valorAumentar)
    VALUES (_id_Comprobante,_DETALLE_MODIFICACION,_RUC,
		_RAZON_SOCIAL,_DNI,_MOTIVO_ESPECIFICO,_NUEVO_MONTO,
        _VALOR_AUMENTAR);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERTAR_NOTA_DE_DEBITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `INSERTAR_NOTA_DE_DEBITO`(
	OUT _id_Comprobante INT,
	IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV   DOUBLE,
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
    fecha,total,IGV,metodoDePago,correlativo)
    VALUES (_FECHA,_TOTAL,_IGV,_METODOPAGO,_CORRELATIVO);
    SET _id_Comprobante = @@last_insert_id;
	INSERT INTO NotaDeDebito(idComprobante,detalleModificacion,RUC,razonSocial,
		motivoEspecifico,nuevoMonto,valorAumentar,idPrenda)
    VALUES (_id_Comprobante,_DETALLE_MODIFICACION,
    _RUC,_RAZON_SOCIAL,_MOTIVO_ESPECIFICO,_NUEVO_MONTO,
    _VALOR_AUMENTAR,_ID_PRENDA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_pantalon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_pantalon`(
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
    IN  _tipo_pantalon ENUM('Jean','Jogger','Chino','Cargo','Buzo','Leggins','Palazzo','Otro'),
    IN  _largo_pierna DECIMAL(6,2),
    IN  _cintura      DECIMAL(6,2),
    IN  _elasticidad  TINYINT
)
BEGIN
    INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = LAST_INSERT_ID();

    INSERT INTO Pantalon(idPrenda, tipo_pantalon, largo_pierna, cintura, elasticidad)
    VALUES(_id_prenda, _tipo_pantalon, _largo_pierna, _cintura, _elasticidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_polo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_polo`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_prenda_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_prenda_lote`(
    OUT _id_prenda_lote INT,
    IN  _id_prenda  INT,
    IN  _id_lote    INT,
    IN  _talla      ENUM('XS','S','M','L','XL','XXL'),
    IN  _stock      INT
)
BEGIN
  INSERT INTO PrendaLote(Prenda_idPrenda, Lote_idLote, talla, stock, activo)
  VALUES(_id_prenda, _id_lote, _talla, _stock, 1);
  SET _id_prenda_lote = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_promocioncombo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_promocioncombo`(out id INT,in nom VARCHAR(75),in cantReque INT, in cantGrat int ,in idV int)
begin 
	insert into Promocion (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into PromocionCombo(idPromocion,cantidadRequerida,cantidadGratis) values (id,cantReque,cantGrat);
	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_promocionconjunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_promocionconjunto`(out id INT,in nom VARCHAR(75),in porcentaje float,in idV int)
begin 
	insert into Promocion (nombre,activo,esAutomatico,idVigencia) values (nom,1,1,idV);
	set id=@@last_insert_id;
    insert into PromocionConjunto(idPromocion,porcentajePromocion) values (id,porcentaje);
	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_proveedor`(  OUT _idProveedor INT,     
IN _RUC BIGINT,     IN _nombre VARCHAR(70),   
  IN _telefono INT,     IN _direccion VARCHAR(150))
BEGIN  
  INSERT INTO Proveedor(RUC, nombre,telefono,     direccion,activo) 
  VALUES (_RUC, _nombre, _telefono, _direccion ,1);  
  SET _idProveedor = @@last_insert_id; 
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_tipoCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_tipoCuenta`(
	OUT _idTipoCuenta INT,
    IN _descripcion VARCHAR(75)
)
BEGIN
	INSERT INTO TipoCuenta (descripcion,activo) VALUES (
		_descripcion,1);
	SET _idTipoCuenta = @@last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_venta`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_vestido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_vestido`(
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
    IN  _tipo_vestido ENUM('Coctel','Fiesta','Gala','Playa','Ejecutivo','Maxi','Mini','Casual'),
    IN  _tipo_manga   ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos'),
    IN  _largo        INT
)
BEGIN
    INSERT INTO Prenda(nombre, activo, precioUnidad, precioMayor, precioDocena,
                       alertaMinStock, color, material)
    VALUES(_nombre, 1, _precioUnidad, _precioMayor, _precioDocena,
           _alertaMinStock, _color, _material);

    SET _id_prenda = LAST_INSERT_ID();

    INSERT INTO Vestido(idPrenda, tipo_vestido, largo, tipo_manga)
    VALUES(_id_prenda, _tipo_vestido, _largo, _tipo_manga);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_vigencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `insertar_vigencia`(out id INT,in fecha1 date,in fecha2 date)
begin 
	insert into Vigencia (fechaInicio,fechaFin,activo) values (fecha1,fecha2,1);
	set id=@@last_insert_id;	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_almacen`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_blusa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_blusa`(
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
    IN  _tipo_blusa ENUM('Camisera','CropTop','Peplum','OffShoulder','Transparente','Formal','Casual'),
    IN  _tipo_manga ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos'),
    IN  _activo     TINYINT
)
BEGIN
    UPDATE Prenda
       SET nombre        = _nombre,
           precioUnidad  = _precioUnidad,
           precioMayor   = _precioMayor,
           precioDocena  = _precioDocena,
           alertaMinStock= _alertaMinStock,
           color         = _color,
           material      = _material,
           activo        = _activo
     WHERE idPrenda = _id_prenda;

    UPDATE Blusa
       SET tipo_blusa = _tipo_blusa,
           tipo_manga = _tipo_manga
     WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MODIFICAR_BOLETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `MODIFICAR_BOLETA`(
	IN _id_Comprobante INT,
	IN _FECHA DATETIME,
    IN _TOTAL DOUBLE,
    IN _IGV   DOUBLE,
    IN _METODOPAGO VARCHAR(45),
    IN _CORRELATIVO VARCHAR(45),
    IN _DNI VARCHAR(8)
)
BEGIN	
	UPDATE ComprobanteDePago SET 
    fecha=_FECHA,total=_TOTAL,IGV=_IGV,metodoDePago=_METODOPAGO
    ,correlativo = _CORRELATIVO WHERE idComprobante=_id_Comprobante;
	UPDATE Boleta SET DNI = _DNI WHERE idComprobante = _id_Comprobante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_cargo`(
	IN _idCargo INT,
	IN _abreviatura CHAR,
    IN _descripcion VARCHAR(75)
)
BEGIN
	UPDATE Cargo
    SET abreviatura=_abreviatura,
    descripcion=_descripcion
    WHERE idCargo=_idCargo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_casaca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_casaca`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_cliente`(  IN _idCliente INT,     
IN _nombre VARCHAR(75),     IN _primerApellido VARCHAR(75),   
  IN _segundoApellido VARCHAR(75),     IN _dni INT,
  IN _telefono INT, IN _genero CHAR , IN _abreviatura CHAR(1),
  IN _descripcion VARCHAR(120), IN _tipoCliente INT
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
  
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_cuentaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_cuentaUsuario`(
	IN _idCuenta INT,
    IN _username VARCHAR(75),
    IN _contrasenha VARCHAR(75),
    IN _email VARCHAR(75),
    IN _TipoCuenta_idTipoCuenta INT
)
BEGIN
	UPDATE CuentaUsuario
    SET username=_username, contrasenha=_contrasenha, 
    email=_email, 
    TipoCuenta_idTipoCuenta=_TipoCuenta_idTipoCuenta
    WHERE idCuenta=_idCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_descuentoliquidacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_descuentoliquidacion`(in id int, in nomb VARCHAR(75),in porcentaje float,in stock int)
BEGIN
		update Descuento 
        set nombre=nomb
        where idDescuento=id;
        
		update DescuentoLiquidacion 
        set porcentajeLiquidacion=montoE, condicionStockMin=stock
        where idDescuento=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_descuentomonto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_descuentomonto`(in id int, in nomb VARCHAR(75),in montoE float,in montoD float)
BEGIN
		update Descuento 
        set nombre=nomb
        where idDescuento=id;
        
		update DescuentoMonto 
        set montoEditable=montoE, montoMaximo=montoD
        where idDescuento=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_descuentoporcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_descuentoporcentaje`(in id int, in nomb VARCHAR(75),in porcen float )
BEGIN
		update Descuento 
        set nombre=nomb
        where idDescuento=id;
        
		update DescuentoPorcentaje 
        set porcentaje=porcen
        where idPromocion=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_empleado`(
	IN _idEmpleado INT,
    IN _nombre VARCHAR(75),
    IN _primerApellido VARCHAR(75),
    IN _segundoApellido VARCHAR(75),
    IN _dni INT,
    IN _telefono INT,
    IN _genero CHAR,
    IN _Cargo_idCargo INT,
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE Persona SET nombre=_nombre,
    primerApellido=_primerApellido,
    segundoApellido=_segundoApellido,
    dni=_dni,telefono=_telefono,genero=_genero
    WHERE idPersona=_idEmpleado;

    UPDATE Empleado SET Cargo_idCargo=_Cargo_idCargo,
    sueldo=_sueldo
    WHERE idEmpleado=_idEmpleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_falda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_falda`(
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
    IN  _tipo_falda   ENUM('Mini','Midi','Larga','Tubo','Plisada','Cruzada','ShortFalda','Otro'),
    IN  _largo        DECIMAL(6,2),
    IN  _con_forro    TINYINT,
    IN  _con_volantes TINYINT,
    IN  _activo       TINYINT
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

    UPDATE Falda
       SET tipo_falda   = _tipo_falda,
           largo        = _largo,
           con_forro    = _con_forro,
           con_volantes = _con_volantes
     WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_gorro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_gorro`(
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
    IN  _tipo_gorra ENUM('Bucket','Visera','Tejido','Beanie','Otro'),
    IN  _talla_ajustable TINYINT,
    IN  _impermeable     TINYINT,
    IN  _activo          TINYINT
)
BEGIN
    UPDATE Prenda
       SET nombre        = _nombre,
           precioUnidad  = _precioUnidad,
           precioMayor   = _precioMayor,
           precioDocena  = _precioDocena,
           alertaMinStock= _alertaMinStock,
           color         = _color,
           material      = _material,
           activo        = _activo
     WHERE idPrenda = _id_prenda;

    UPDATE Gorro
       SET tipo_gorra      = _tipo_gorra,
           talla_ajustable = _talla_ajustable,
           impermeable     = _impermeable
     WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_lote`(
	_idLote int,
    _Almacen_idAlmacen int,
    _activo TINYINT
)
BEGIN
	UPDATE Lote SET Almacen_idAlmacen=_Almacen_idAlmacen, activo=_activo
	WHERE idLote=_idLote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_mov_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_mov_almacen`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_mov_X_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_mov_X_lote`(
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
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_pantalon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_pantalon`(
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
    IN  _tipo_pantalon ENUM('Jean','Jogger','Chino','Cargo','Buzo','Leggins','Palazzo','Otro'),
    IN  _largo_pierna DECIMAL(6,2),
    IN  _cintura      DECIMAL(6,2),
    IN  _elasticidad  TINYINT,
    IN  _activo       TINYINT
)
BEGIN
    UPDATE Prenda
       SET nombre        = _nombre,
           precioUnidad  = _precioUnidad,
           precioMayor   = _precioMayor,
           precioDocena  = _precioDocena,
           alertaMinStock= _alertaMinStock,
           color         = _color,
           material      = _material,
           activo        = _activo
     WHERE idPrenda = _id_prenda;

    UPDATE Pantalon
       SET tipo_pantalon = _tipo_pantalon,
           largo_pierna  = _largo_pierna,
           cintura       = _cintura,
           elasticidad   = _elasticidad
     WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_polo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_polo`(
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
    IN  _tipo_cuello ENUM('Redondo','V','Camisero','Alto','Halter','OffShoulder','Otro')
)
BEGIN
    UPDATE Prenda
       SET nombre = _nombre,
           precioUnidad = _precioUnidad,
           precioMayor  = _precioMayor,
           precioDocena = _precioDocena,
           alertaMinStock = _alertaMinStock,
           color = _color,
           material = _material
     WHERE idPrenda = _id_prenda;

    UPDATE Polo
       SET tipo_manga  = _tipo_manga,
           estampado   = _estampado,
           tipo_cuello = _tipo_cuello
     WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_prenda_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_prenda_lote`(
    IN _id_prenda_lote INT,
    IN _stock          INT,
    IN _activo         TINYINT
)
BEGIN
  UPDATE PrendaLote
     SET stock  = _stock,
         activo = _activo
   WHERE idPrendaLote = _id_prenda_lote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_promocioncombo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_promocioncombo`(in id int, in nomb VARCHAR(75),in cantReque int , in cantGrat int,in indV int)
BEGIN
		update Promocion 
        set nombre=nomb, idVigencia=indV 
        where idPromocion=id;
        
		update PromocionCombo 
        set cantidadRequerida=cantReque, cantidadGratis=cantGrat 
        where idPromocion=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_promocionconjunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_promocionconjunto`(in id int, in nomb VARCHAR(75),in promocion float,in indV int)
BEGIN
		update Promocion 
        set nombre=nomb, idVigencia=indV 
        where idPromocion=id;
        
		update PromocionConjunto 
        set porcentajePromocion=promocion 
        where idPromocion=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_proveedor`(  IN _idProveedor INT,     
IN _RUC BIGINT,     IN _nombre VARCHAR(70),   
  IN _telefono INT,     IN _direccion VARCHAR(150), 
  IN _activo TINYINT)
BEGIN  
  
  UPDATE Proveedor SET RUC=_RUC,
  nombre=_nombre,telefono=_telefono,direccion=_direccion,activo=_activo
  WHERE idProveedor=_idProveedor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_tipoCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_tipoCuenta`(
	IN _idTipoCuenta INT,
    IN _descripcion VARCHAR(75)
)
BEGIN
	UPDATE TipoCuenta
    SET descripcion=_descripcion
    WHERE idTipoCuenta=_idTipoCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_venta`(
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
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_vestido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_vestido`(
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
    IN  _tipo_vestido ENUM('Coctel','Fiesta','Gala','Playa','Ejecutivo','Maxi','Mini','Casual'),
    IN  _tipo_manga   ENUM('MangaCorta','MangaLarga','SinManga','Globo','Campana','TresCuartos'),
    IN  _largo        INT,
    IN  _activo       TINYINT
)
BEGIN
    UPDATE Prenda
       SET nombre        = _nombre,
           precioUnidad  = _precioUnidad,
           precioMayor   = _precioMayor,
           precioDocena  = _precioDocena,
           alertaMinStock= _alertaMinStock,
           color         = _color,
           material      = _material,
           activo        = _activo
     WHERE idPrenda = _id_prenda;

    UPDATE Vestido
       SET tipo_vestido = _tipo_vestido,
           largo        = _largo,
           tipo_manga   = _tipo_manga
     WHERE idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_vigencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `modificar_vigencia`(in id INT,in fecha1 date, in fecha2 date)
begin
	update Vigencia 
    set fechaInicio=fecha1,fechaFin=fecha2
    where idVigencia=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_almacenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_almacenes`()
BEGIN
	SELECT *FROM Almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_almacenes_activos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_almacenes_activos`()
BEGIN
	SELECT *FROM Almacen
    WHERE activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_blusas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_blusas`()
BEGIN
  SELECT *
    FROM Prenda p
    JOIN Blusa  b ON b.idPrenda = p.idPrenda;
    -- WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_cargos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_cargos`()
BEGIN
	SELECT *
    FROM Cargo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_casacas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_casacas`(
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            c.tipo_casaca, c.con_capucha
      FROM  Prenda p
      JOIN  Casaca c ON c.idPrenda = p.idPrenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_clientes`()
BEGIN
  
  
  SELECT c.idCliente,p.nombre,
    p.primerApellido,p.segundoApellido,
    p.dni,p.telefono,p.genero,
    t.tipoCliente,t.abreviatura,t.descripcion
    FROM Cliente c INNER JOIN 
	Persona p ON c.idCliente=p.idPersona
	INNER JOIN TipoDeCliente t ON c.tipoCliente = t.tipoCliente;
  
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_cuentaUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_cuentaUsuarios`()
BEGIN
	SELECT c.idCuenta, c.username, c.contrasenha, c.email,
    t.descripcion
    FROM CuentaUsuario c
    INNER JOIN TipoCuenta t ON t.idTipoCuenta=c.TipoCuenta_idTipoCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_descuentoliquidacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_descuentoliquidacion`()
Begin

select d.idDescuento as idDescuento, d.nombre as nombre, dp.porcentajeLiquidacion as porcentajeLiquidacion,dp.condicionStockMin as condicionStockMin,
    d.activo as activo,
    d.esAutomatico as esAutomatico, d.idVigencia as idVigencia from DescuentoLiquidacion dp, Descuento d 
    where dp.idDescuento=d.idDescuento;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_descuentomonto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_descuentomonto`()
Begin

select d.idDescuento as idDescuento, d.nombre as nombre, dp.montoEditable as montoEditable,dp.montoMaximo as montoMaximo,
    d.activo as activo,
    d.esAutomatico as esAutomatico, d.idVigencia as idVigencia from DescuentoMonto dp, Descuento d 
    where dp.idDescuento=d.idDescuento;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_descuentoporcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_descuentoporcentaje`()
Begin

select dp.idDescuento, d.nombre as nombre,dp.porcentaje as porcentaje,d.idVigencia as idVigencia,d.esAutomatico as esAutomatico, d.activo as activo
 from DescuentoPorcentaje dp, Descuento d where d.idDescuento=dp.idDescuento;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_empleados`()
BEGIN
	SELECT p.idPersona, p.nombre, p.primerApellido, p.segundoApellido,
    p.dni, p.telefono, p.genero, e.sueldo, c.abreviatura,
    c.descripcion
    FROM Persona p
    INNER JOIN Empleado e ON p.idPersona=e.idEmpleado
    INNER JOIN Cargo c ON c.idCargo=e.Cargo_idCargo
    WHERE p.activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_faldas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_faldas`()
BEGIN
  SELECT  *
    FROM  Prenda p
    JOIN  Falda  f ON f.idPrenda = p.idPrenda;
    -- WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_gorros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_gorros`()
BEGIN
  SELECT *
    FROM Prenda p
    JOIN Gorro  g ON g.idPrenda = p.idPrenda;
    -- WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_lotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_lotes`()
BEGIN
	SELECT idLote, Almacen_idAlmacen, activo FROM Lote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_lotes_activos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_lotes_activos`()
BEGIN 
	SELECT idLote, Almacen_idAlmacen, activo FROM Lote
    WHERE activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_mov_almacenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_mov_almacenes`()
BEGIN
	SELECT idMovAlmacen, Almacen_idAlmacen, fecha, lugarDestino,
    lugarOrigen, tipo, activo FROM MovimientoAlmacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_mov_almacenes_activos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_mov_almacenes_activos`()
BEGIN
	SELECT idMovAlmacen, Almacen_idAlmacen, fecha, lugarDestino,
    lugarOrigen, tipo, activo FROM MovimientoAlmacen
    WHERE activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_mov_X_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_mov_X_lote`()
BEGIN
    SELECT*FROM MovimientoAlmacen_X_Lote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_mov_X_lote_activos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_mov_X_lote_activos`()
BEGIN
    SELECT*FROM MovimientoAlmacen_X_Lote WHERE activo=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_pantalones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_pantalones`()
BEGIN
  SELECT *
    FROM Prenda   p
    JOIN Pantalon t ON t.idPrenda = p.idPrenda;
    -- WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_polos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_polos`()
BEGIN
	SELECT * FROM Prenda INNER JOIN Polo ON Prenda.idPrenda = Polo.idPrenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_prenda_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_prenda_lote`()
BEGIN
  SELECT * FROM PrendaLote WHERE activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MOSTRAR_PROMOCIONCOMBOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `MOSTRAR_PROMOCIONCOMBOS`()
Begin

select * from PromocionCombo;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MOSTRAR_PROMOCIONCONJUNTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `MOSTRAR_PROMOCIONCONJUNTO`()
Begin

select * from PromocionConjunto;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_proveedores`()
BEGIN
  Select idProveedor,RUC,nombre,telefono,direccion,activo
  From Proveedor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_tipoCuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_tipoCuentas`()
BEGIN
	SELECT *
    FROM TipoCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_vestidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `mostrar_vestidos`()
BEGIN
  SELECT *
    FROM Prenda  p
    JOIN Vestido v ON v.idPrenda = p.idPrenda;
    -- WHERE p.activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerId_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtenerId_cliente`( IN _idCliente INT)
BEGIN
  
	SELECT c.idCliente,p.nombre,
    p.primerApellido,p.segundoApellido,
    p.dni,p.telefono,p.genero,
    t.tipoCliente,t.abreviatura,t.descripcion
    FROM Cliente c INNER JOIN 
	Persona p ON c.idCliente=p.idPersona
	INNER JOIN TipoDeCliente t ON c.tipoCliente = t.tipoCliente 
    where c.idCliente=_idCliente;
    
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerId_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtenerId_proveedor`( IN _idProveedor INT)
BEGIN
  Select idProveedor,RUC,nombre,telefono,direccion,activo
  From Proveedor WHERE idProveedor=_idProveedor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_almacen_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_almacen_X_id`(
	IN _idAlmacen int
)
BEGIN
	SELECT idAlmacen, nombre, ubicacion, stock, Tienda_idTienda, activo
    FROM Almacen
    WHERE idAlmacen=_idAlmacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_blusa_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_blusa_X_id`(
    IN _id_prenda INT
)
BEGIN
  SELECT *
    FROM Prenda p
    JOIN Blusa  b ON b.idPrenda = p.idPrenda
   WHERE p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_BOLETA_X_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `OBTENER_BOLETA_X_ID`(
	IN _id_Comprobante INT
)
BEGIN
	SELECT b.idComprobante, p.correlativo, p.fecha, p.IGV, p.metodoDePago, p.total, b.DNI FROM ComprobanteDePago p INNER JOIN Boleta b ON p.idComprobante = b.idComprobante WHERE b.idComprobante = _id_Comprobante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_cargo_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_cargo_X_id`(
	IN _idCargo INT
)
BEGIN
	SELECT *
    FROM Cargo
    WHERE idCargo=_idCargo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_casaca_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_casaca_X_id`(
    IN _id_prenda INT
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            c.tipo_casaca, c.con_capucha
      FROM  Prenda p
      JOIN  Casaca c ON c.idPrenda = p.idPrenda
     WHERE  p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_CASACA_X_IDCasaca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `OBTENER_CASACA_X_IDCasaca`(
    IN _id_prenda INT
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            c.tipo_casaca, c.con_capucha
      FROM  Prenda p
      JOIN  Casaca c ON c.idPrenda = p.idPrenda
     WHERE  p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_cuentaUsuarios_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_cuentaUsuarios_X_id`(
	IN _idCuenta INT
)
BEGIN
	SELECT c.idCuenta, c.username, c.contrasenha, c.email,
    t.descripcion
    FROM CuentaUsuario c
    INNER JOIN TipoCuenta t ON t.idTipoCuenta=c.TipoCuenta_idTipoCuenta
    WHERE idCuenta=_idCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_descuentoliquidacion_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_descuentoliquidacion_X_id`(in id int)
BEGIN
	select d.idDescuento as idDescuento, d.nombre as nombre, dp.porcentajeLiquidacion as porcentajeLiquidacion,dp.condicionStockMin as condicionStockMin,
    d.activo as activo,
    d.esAutomatico as esAutomatico, d.idVigencia as idVigencia from DescuentoLiquidacion dp, Descuento d 
    where d.idDescuento=id and dp.idDescuento=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_descuentomonto_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_descuentomonto_X_id`(in id int)
BEGIN
	select d.idDescuento as idDescuento, d.nombre as nombre, dp.montoEditable as montoEditable,dp.montoMaximo as montoMaximo,
    d.activo as activo,
    d.esAutomatico as esAutomatico, d.idVigencia as idVigencia from DescuentoMonto dp, Descuento d 
    where d.idDescuento=id and dp.idDescuento=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_descuentoporcentaje_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_descuentoporcentaje_X_id`(in id int)
BEGIN
	select d.idDescuento as idDescuento, d.nombre as nombre, dp.porcentaje as porcentaje,d.activo as activo,
    d.esAutomatico as esAutomatico, d.idVigencia as idVigencia from DescuentoPorcentaje dp, Descuento d 
    where d.idDescuento=id and dp.idDescuento=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_empleado_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_empleado_X_id`(
	IN _idEmpleado INT
)
BEGIN
	SELECT p.idPersona, p.nombre, p.primerApellido, p.segundoApellido,
    p.dni, p.telefono, p.genero, e.sueldo, c.abreviatura,
    c.descripcion
    FROM Persona p
    INNER JOIN Empleado e ON p.idPersona=e.idEmpleado
    INNER JOIN Cargo c ON c.idCargo=e.Cargo_idCargo
    WHERE e.idEmpleado=_idEmpleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_falda_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_falda_X_id`(
    IN _id_prenda INT
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            c.tipo_falda, c.largo, c.con_forro, c.con_volantes
      FROM  Prenda p
      JOIN  Falda c ON c.idPrenda = p.idPrenda
     WHERE  p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_gorro_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_gorro_X_id`(
    IN _id_prenda INT
)
BEGIN
  SELECT *
    FROM Prenda p
    JOIN Gorro  g ON g.idPrenda = p.idPrenda
   WHERE p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_lote_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_lote_X_id`(
	_idLote int
)
BEGIN
	SELECT idLote, Almacen_idAlmacen, activo FROM Lote
    WHERE _idLote=idLote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_mov_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_mov_X_id`(
	_idMovAlmacen int
)
BEGIN
	SELECT idMovAlmacen, Almacen_idAlmacen, fecha,
    lugarDestino, lugarOrigen, tipo, activo
    FROM MovimientoAlmacen
    WHERE idMovAlmacen=_idMovAlmacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_mov_X_lote_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_mov_X_lote_X_id`(
	_idMovAlmacen_X_Lote int
)
BEGIN
    SELECT*FROM MovimientoAlmacen_X_Lote WHERE _idMovAlmacen_X_Lote=idMovAlmacen_X_Lote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_pantalon_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_pantalon_X_id`(
    IN _id_prenda INT
)
BEGIN
  SELECT *
    FROM Prenda   p
    JOIN Pantalon t ON t.idPrenda = p.idPrenda
   WHERE p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_polo_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_polo_X_id`(
    IN _id_prenda INT
)
BEGIN
    SELECT  p.idPrenda, p.nombre, p.stockPrenda, p.precioUnidad, p.precioMayor, p.precioDocena,
            p.alertaMinStock, p.color, p.material,
            po.tipo_manga, po.estampado, po.tipo_cuello
      FROM  Prenda p
      JOIN  Polo   po ON po.idPrenda = p.idPrenda
     WHERE  p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_prenda_lote_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_prenda_lote_X_id`(
    IN _id_prenda_lote INT
)
BEGIN
  SELECT *
    FROM PrendaLote
   WHERE idPrendaLote = _id_prenda_lote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_PROMOCIONCOMBO_X_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `OBTENER_PROMOCIONCOMBO_X_ID`(in id int)
Begin 
	select * from PromocionCombo where idPromocion=id;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_PROMOCIONCONJUNTO_X_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `OBTENER_PROMOCIONCONJUNTO_X_ID`(in id int)
Begin 
	select * from PromocionConjunto where idPromocion=id;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_stock_prenda_talla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_stock_prenda_talla`(
    IN _id_prenda INT,
    IN _talla     ENUM('XS','S','M','L','XL','XXL')
)
BEGIN
  SELECT COALESCE(SUM(stock), 0) AS stock_total
    FROM PrendaLote
   WHERE Prenda_idPrenda = _id_prenda
     AND talla           = _talla
     AND activo          = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_tipoCuenta_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_tipoCuenta_X_id`(
	IN _idTipoCuenta INT
)
BEGIN
	SELECT *
    FROM TipoCuenta
    WHERE idTipoCuenta=_idTipoCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_venta_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_venta_X_id`(
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
    cargoEmple.idCargo as id_cargo_emple,
    cargoEmple.abreviatura as abreviatura_cargo,
    cargoEmple.descripcion as descripcion_emplea,
	cargoEmple.activo as activo_cargo_emple,
    clie.idCliente as id_cliente,
    tipoClie.tipoCliente as tipo_clie_id,
    tipoClie.abreviatura as abreviatura_clie,
    tipoClie.descripcion as descripcion_clie,
    vent.Comprobante_idComprobante as id_comprobante
    FROM
    Venta vent INNER JOIN Empleado_idEmpleado emple ON
    vent.Empleado_idEmpleado = emple.idEmpleado 
    INNER JOIN Cliente clie 
    ON vent.Cliente_idCliente = clie.idCliente 
    INNER JOIN ComprobanteDePago compPag 
    ON vent.Comprobante_idComprobante = compPag.idComprobante
    INNER JOIN Persona perClie
    ON clie.idCliente = perClie.idPersona
    INNER JOIN Pesona perEmple
    ON emple.idEmpleado =  perEmple.idPersona 
    INNER JOIN Cargo cargoEmple
    ON cargoEmple.idCargo = emple.Cargo_idCargo
    INNER JOIN TipoDeCliente tipoClie
    ON clie.tipoCliente = tipoClie.tipoCliente
    WHERE vent.idVenta = _idVenta;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_vestido_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_vestido_X_id`(
    IN _id_prenda INT
)
BEGIN
  SELECT *
    FROM Prenda  p
    JOIN Vestido v ON v.idPrenda = p.idPrenda
   WHERE p.idPrenda = _id_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_vigencia_X_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `obtener_vigencia_X_id`(in id int)
BEGIN
	select idVigencia,fechaInicio,fechaFin,activo from Vigencia where idVigencia=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-07 17:57:49
