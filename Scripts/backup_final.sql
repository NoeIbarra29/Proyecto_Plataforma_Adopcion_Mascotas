CREATE DATABASE  IF NOT EXISTS `plataforma_adopcion_mascotas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plataforma_adopcion_mascotas`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: plataforma_adopcion_mascotas
-- ------------------------------------------------------
-- Server version	8.0.39

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

--
-- Temporary view structure for view `adopciones_realizadas`
--

DROP TABLE IF EXISTS `adopciones_realizadas`;
/*!50001 DROP VIEW IF EXISTS `adopciones_realizadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adopciones_realizadas` AS SELECT 
 1 AS `id_mascota`,
 1 AS `nombre_mascota`,
 1 AS `especie`,
 1 AS `sexo`,
 1 AS `edad`,
 1 AS `id_refugio`,
 1 AS `nombre_refugio`,
 1 AS `id_usuario`,
 1 AS `nombrecompleto_usuario`,
 1 AS `fecha_solicitud`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_delete_solicitud_adop`
--

DROP TABLE IF EXISTS `log_delete_solicitud_adop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_delete_solicitud_adop` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  `fecha_delete` date NOT NULL,
  `time_delete` time NOT NULL,
  `usuario_delete` varchar(200) NOT NULL,
  PRIMARY KEY (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_delete_solicitud_adop`
--

LOCK TABLES `log_delete_solicitud_adop` WRITE;
/*!40000 ALTER TABLE `log_delete_solicitud_adop` DISABLE KEYS */;
INSERT INTO `log_delete_solicitud_adop` VALUES (1,'2024-12-19','pendiente',32,27,'2024-12-19','10:15:42','root@localhost'),(2,'2024-12-19','pendiente',45,49,'2024-12-19','10:15:42','root@localhost');
/*!40000 ALTER TABLE `log_delete_solicitud_adop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_solicitud_adop_espejo`
--

DROP TABLE IF EXISTS `log_solicitud_adop_espejo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_solicitud_adop_espejo` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  `fecha_insercion` date NOT NULL,
  `time_insercion` time NOT NULL,
  `usuario_insercion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_solicitud_adop_espejo`
--

LOCK TABLES `log_solicitud_adop_espejo` WRITE;
/*!40000 ALTER TABLE `log_solicitud_adop_espejo` DISABLE KEYS */;
INSERT INTO `log_solicitud_adop_espejo` VALUES (1,'2024-12-19','pendiente',32,27,'2024-12-19','10:03:16','root@localhost'),(2,'2024-12-19','pendiente',45,49,'2024-12-19','10:03:18','root@localhost');
/*!40000 ALTER TABLE `log_solicitud_adop_espejo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_update_delete_mascota`
--

DROP TABLE IF EXISTS `log_update_delete_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_update_delete_mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `especie` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('hembra','macho','desconocido') NOT NULL,
  `tamaño` enum('chico','mediano','grande') DEFAULT NULL,
  `id_refugio` int NOT NULL,
  `fecha_modif` date NOT NULL,
  `time_modif` time NOT NULL,
  `usuario_modif` varchar(200) NOT NULL,
  `tipo_modif` varchar(200) NOT NULL,
  PRIMARY KEY (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_update_delete_mascota`
--

LOCK TABLES `log_update_delete_mascota` WRITE;
/*!40000 ALTER TABLE `log_update_delete_mascota` DISABLE KEYS */;
INSERT INTO `log_update_delete_mascota` VALUES (1,'Brianna','Ave','2018-03-07','hembra','grande',6,'2024-12-19','09:47:03','root@localhost','UPDATE: Se actualizó el registro'),(2,'Wendy','Gato','2021-11-22','hembra','chico',1,'2024-12-19','09:47:03','root@localhost','UPDATE: Se actualizó el registro'),(3,'Karen','Conejo','2019-03-22','hembra','mediano',7,'2024-12-19','09:47:03','root@localhost','UPDATE: Se actualizó el registro'),(4,'Michelle','Perro','2016-12-28','hembra','chico',2,'2024-12-19','09:47:03','root@localhost','UPDATE: Se actualizó el registro'),(5,'Scott','Gato','2021-06-16','macho','chico',12,'2024-12-19','09:47:10','root@localhost','UPDATE: Se actualizó el registro'),(6,'Steven','Conejo','2022-12-20','macho','mediano',2,'2024-12-19','09:47:10','root@localhost','UPDATE: Se actualizó el registro'),(7,'Edwin','Perro','2018-10-02','macho','mediano',6,'2024-12-19','09:47:10','root@localhost','UPDATE: Se actualizó el registro'),(8,'Jason','Ave','2022-08-07','macho','chico',4,'2024-12-19','09:47:10','root@localhost','UPDATE: Se actualizó el registro'),(9,'Robin','Ave','2023-07-02','macho','chico',2,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(10,'Brianna','Ave','2018-03-07','hembra','chico',6,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(11,'Gary','Ave','2021-02-08','hembra','chico',5,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(12,'Travis','Ave','2017-05-22','desconocido','chico',3,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(13,'Michael','Ave','2022-07-14','desconocido','chico',6,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(14,'Nicholas','Ave','2022-02-16','macho','chico',8,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(15,'Clayton','Ave','2020-04-18','desconocido','chico',1,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(16,'April','Ave','2019-02-12','macho','chico',12,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(17,'Deanna','Ave','2016-11-16','desconocido','chico',7,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(18,'Jason','Ave','2022-08-07','macho','chico',4,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(19,'Keith','Ave','2018-03-29','hembra','chico',2,'2024-12-19','09:48:06','root@localhost','UPDATE: Se actualizó el registro'),(20,'Para eliminar','Ave','2024-12-19','hembra','chico',1,'2024-12-19','09:54:39','root@localhost','DELETE: Se eliminó el registro'),(21,'Para eliminar','Conejo','2024-12-19','macho','grande',1,'2024-12-19','09:54:39','root@localhost','DELETE: Se eliminó el registro');
/*!40000 ALTER TABLE `log_update_delete_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `especie` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('hembra','macho','desconocido') NOT NULL,
  `tamaño` enum('chico','mediano','grande') DEFAULT NULL,
  `estirilizado` tinyint(1) DEFAULT '1',
  `descripcion` text,
  `id_refugio` int NOT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_refugio` (`id_refugio`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`id_refugio`) REFERENCES `refugio` (`id_refugio`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Max','Perro','2019-05-15','macho','grande',1,'Perro juguetón y cariñoso. Ideal para familias.',1),(2,'Luna','Gato','2019-08-10','hembra','chico',1,'Gatita tímida pero muy dulce.',2),(3,'Rex','Perro','2019-01-20','macho','mediano',1,'Perro rescatado en busca de un hogar tranquilo.',1),(4,'Mia','Conejo','2023-02-14','hembra','chico',1,'Conejo activo y saludable, ideal para niños.',2),(5,'Scott','Gato','2021-06-16','macho','chico',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',12),(6,'Victor','Reptil','2019-03-20','hembra','mediano',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',5),(7,'Charles','Perro','2021-05-26','macho','mediano',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',1),(8,'Robin','Ave','2023-07-02','macho','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',2),(9,'Robert','Reptil','2018-06-02','desconocido','grande',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',7),(10,'Brianna','Ave','2018-03-07','hembra','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',6),(11,'Carlos','Gato','2016-05-20','hembra','grande',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',11),(12,'Kevin','Conejo','2018-10-15','macho','mediano',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',10),(13,'Steven','Conejo','2022-12-20','macho','mediano',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',2),(14,'Rodney','Reptil','2018-06-26','desconocido','chico',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',2),(15,'Deborah','Conejo','2018-06-19','macho','chico',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',2),(16,'Crystal','Gato','2021-03-12','hembra','chico',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',11),(17,'Jane','Gato','2019-09-09','macho','grande',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',10),(18,'Andrew','Conejo','2019-11-11','macho','chico',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',5),(19,'Gary','Ave','2021-02-08','hembra','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',5),(20,'Heather','Reptil','2023-01-07','macho','chico',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',1),(21,'Cody','Perro','2017-11-16','macho','chico',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',9),(22,'Travis','Ave','2017-05-22','desconocido','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',3),(23,'Frank','Gato','2021-02-11','macho','mediano',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',3),(24,'Calvin','Reptil','2019-02-21','hembra','mediano',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',3),(25,'Deborah','Reptil','2019-03-05','desconocido','chico',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',4),(26,'Michael','Ave','2022-07-14','desconocido','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',6),(27,'Eric','Gato','2015-02-12','macho','chico',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',1),(28,'Jasmine','Reptil','2019-01-13','macho','chico',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',5),(29,'Nicholas','Ave','2022-02-16','macho','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',8),(30,'Keith','Reptil','2015-04-13','hembra','chico',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',8),(31,'Mitchell','Gato','2018-02-11','macho','mediano',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',8),(32,'Susan','Perro','2019-03-02','hembra','grande',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',12),(33,'Wendy','Gato','2021-11-22','hembra','chico',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',1),(34,'Clayton','Ave','2020-04-18','desconocido','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',1),(35,'Jennifer','Reptil','2023-08-18','macho','grande',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',1),(36,'April','Ave','2019-02-12','macho','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',12),(37,'Rachel','Reptil','2018-01-06','desconocido','grande',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',12),(38,'Deanna','Ave','2016-11-16','desconocido','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',7),(39,'Karen','Conejo','2019-03-22','hembra','mediano',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',7),(40,'Jared','Gato','2023-10-28','desconocido','grande',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',9),(41,'Jeffrey','Perro','2019-09-18','macho','grande',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',1),(42,'Michelle','Perro','2016-12-28','hembra','chico',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',2),(43,'Paul','Perro','2023-09-09','macho','grande',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',10),(44,'Kristopher','Gato','2015-12-05','hembra','chico',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',11),(45,'Timothy','Conejo','2018-06-12','hembra','mediano',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',11),(46,'Christopher','Reptil','2017-11-24','hembra','grande',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',10),(47,'Edwin','Perro','2018-10-02','macho','mediano',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',6),(48,'Erin','Gato','2022-02-12','hembra','chico',1,'Gato curioso que ama explorar cada rincon y descansar bajo el sol.',6),(49,'Mike','Conejo','2017-06-12','macho','grande',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',6),(50,'Jason','Ave','2022-08-07','macho','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',4),(51,'Cassidy','Reptil','2023-11-26','hembra','chico',1,'Reptil tranquilo que se siente feliz en un ambiente calido y seguro.',4),(52,'Keith','Ave','2018-03-29','hembra','chico',1,'Ave alegre que llena el lugar con su canto y su energia vibrante.',2),(53,'Matthew','Conejo','2022-04-08','hembra','chico',1,'Conejito especial que merece todo el cariÃ±o y cuidado del mundo.',1),(54,'Jordan','Perro','2023-12-06','hembra','grande',1,'Perro muy amigable que disfruta de largos paseos y juegos con su familia.',1);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bef_update_mascota` BEFORE UPDATE ON `mascota` FOR EACH ROW INSERT INTO `LOG_update_delete_mascota` (id_mascota, nombre, especie, fecha_nacimiento, sexo, 
tamaño, id_refugio, fecha_modif, time_modif, usuario_modif, tipo_modif)
VALUES (NULL, NEW.nombre, NEW.especie, NEW.fecha_nacimiento, NEW.sexo, NEW.tamaño, 
NEW.id_refugio, current_date(), current_time(), session_user(), 'UPDATE: Se actualizó el registro') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_mascota` AFTER DELETE ON `mascota` FOR EACH ROW INSERT INTO `LOG_update_delete_mascota` (id_mascota, nombre, especie, fecha_nacimiento, sexo, 
tamaño, id_refugio, fecha_modif, time_modif, usuario_modif, tipo_modif)
VALUES (NULL, OLD.nombre, OLD.especie, OLD.fecha_nacimiento, OLD.sexo, OLD.tamaño, 
OLD.id_refugio, current_date(), current_time(), session_user(), 'DELETE: Se eliminó el registro') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `mascotas_disponibles`
--

DROP TABLE IF EXISTS `mascotas_disponibles`;
/*!50001 DROP VIEW IF EXISTS `mascotas_disponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mascotas_disponibles` AS SELECT 
 1 AS `id_mascota`,
 1 AS `nombre`,
 1 AS `especie`,
 1 AS `tamaño`,
 1 AS `edad`,
 1 AS `id_refugio`,
 1 AS `refugio`,
 1 AS `direccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `refugio`
--

DROP TABLE IF EXISTS `refugio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refugio` (
  `id_refugio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` bigint NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  PRIMARY KEY (`id_refugio`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refugio`
--

LOCK TABLES `refugio` WRITE;
/*!40000 ALTER TABLE `refugio` DISABLE KEYS */;
INSERT INTO `refugio` VALUES (1,'Refugio Feliz','Calle Alegría 123, Ciudad',5551234,'contacto@refugiofeliz.org','www.refugiofeliz.org'),(2,'Hogar Animal','Avenida Central 456, Ciudad',5555678,'info@hogaranimal.com','www.hogaranimal.com'),(3,'Refugio Esperanza Animal','12718 Osborne Square',1864915326,'jeremylawrence@hotmail.com','www.esperanzaanimal.com.mx'),(4,'Santuario Vida Nueva','532 Johnson Viaduct Suite 653',8195630155,'lrusso@gmail.com','www.vidanuevasantuario.org'),(5,'Proteccion Animal Amparo','505 Jose Manors',2859633540,'elizabethdean@thompson-wright.biz','www.amparoanimal.org'),(6,'Manos Amigas para Animales','8683 Roberts Ridge',9304273854,'amyraymond@gmail.com','www.manosamigasanimales.com'),(7,'Corazon Animal Refugio','487 Nathan Canyon',1777040172,'davenporttara@jones.com','www.corazonanimal.org'),(8,'Albergue Amigos de Cuatro Patas','45463 Sellers Cape',8305324252,'kaylathompson@johnson.net','www.amigoscuatropatas.mx'),(9,'Rescate y Refugio Canino','361 Brandon Harbor',6598863689,'angiedaniel@hotmail.com','www.rescatecanino.org'),(10,'Refugio Gato y Perro','6785 Jason Highway Apt. 913',8708983751,'wmoore@yahoo.com','www.gatoyperrorefugio.org'),(11,'Hogar Temporal para Mascotas','1944 Christopher Trafficway',9681467536,'christine74@richardson-choi.net','www.hogartemporalmascotas.com'),(12,'Hogar de Mascotas Felices','58035 Burke Tunnel Apt. 111',9971079273,'fsimmons@gmail.com','www.hogarfelicesmascotas.org');
/*!40000 ALTER TABLE `refugio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `resumen_refugios`
--

DROP TABLE IF EXISTS `resumen_refugios`;
/*!50001 DROP VIEW IF EXISTS `resumen_refugios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `resumen_refugios` AS SELECT 
 1 AS `id_refugio`,
 1 AS `nombre_refugio`,
 1 AS `direccion`,
 1 AS `q_mascotas_disponibles`,
 1 AS `q_mascotas_adoptadas`,
 1 AS `q_solicitudes_rechazadas`,
 1 AS `q_visitas_recibidas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `solicitud_adopcion`
--

DROP TABLE IF EXISTS `solicitud_adopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_adopcion` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `solicitud_adopcion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `solicitud_adopcion_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_adopcion`
--

LOCK TABLES `solicitud_adopcion` WRITE;
/*!40000 ALTER TABLE `solicitud_adopcion` DISABLE KEYS */;
INSERT INTO `solicitud_adopcion` VALUES (1,'2020-01-05','pendiente',30,1),(2,'2020-01-20','rechazada',3,2),(3,'2020-01-27','rechazada',30,3),(4,'2023-02-23','aprobada',51,53),(5,'2020-03-12','aprobada',22,6),(6,'2022-03-24','rechazada',17,5),(7,'2020-04-28','aprobada',34,17),(8,'2023-05-04','rechazada',27,2),(9,'2021-09-09','aprobada',23,19),(10,'2020-09-13','pendiente',19,37),(11,'2022-09-18','aprobada',21,33),(12,'2022-10-07','aprobada',43,5),(13,'2024-12-05','pendiente',38,35),(14,'2020-12-21','rechazada',8,12),(15,'2020-12-26','aprobada',31,32),(16,'2020-12-30','rechazada',52,9),(17,'2023-02-11','rechazada',11,26),(18,'2021-02-18','pendiente',37,41),(19,'2021-02-23','rechazada',13,39),(20,'2021-02-28','aprobada',44,42),(21,'2023-03-05','aprobada',49,13),(22,'2021-03-26','rechazada',15,14),(23,'2021-05-24','rechazada',25,10),(24,'2021-08-01','rechazada',7,12),(25,'2021-10-02','rechazada',12,10),(26,'2021-12-14','rechazada',21,15),(27,'2022-01-04','rechazada',37,45),(28,'2022-01-04','pendiente',49,9),(29,'2022-01-27','aprobada',16,30),(30,'2022-02-20','pendiente',47,22),(31,'2022-04-26','rechazada',6,47),(32,'2022-06-16','pendiente',4,31),(33,'2023-07-01','aprobada',16,48),(34,'2022-07-22','pendiente',22,10),(35,'2022-09-22','rechazada',53,11),(36,'2022-10-22','rechazada',11,34),(37,'2022-10-29','aprobada',50,45),(38,'2022-11-28','rechazada',10,28),(39,'2023-04-13','rechazada',19,4),(40,'2024-02-18','aprobada',1,40),(41,'2023-03-22','aprobada',36,39),(42,'2023-03-27','aprobada',26,38),(43,'2023-04-11','pendiente',35,3),(44,'2023-12-13','aprobada',8,4),(45,'2023-05-15','aprobada',42,2),(46,'2024-05-20','rechazada',1,20),(47,'2024-06-18','aprobada',36,8),(48,'2023-10-19','aprobada',39,15),(49,'2024-02-02','aprobada',27,21),(50,'2024-05-29','pendiente',22,50),(51,'2024-06-07','rechazada',48,44),(52,'2024-06-12','rechazada',36,16),(53,'2024-08-05','aprobada',43,7),(54,'2024-12-17','pendiente',28,43),(57,'2024-12-17','pendiente',48,23);
/*!40000 ALTER TABLE `solicitud_adopcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_id_usuario` BEFORE INSERT ON `solicitud_adopcion` FOR EACH ROW BEGIN
	IF NEW.id_usuario IN (1, 2) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El valor de id_usuario no puede ser 1 o 2 ya que corresponden a usuarios admin';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bef_insert_solicitud` BEFORE INSERT ON `solicitud_adopcion` FOR EACH ROW INSERT INTO `log_solicitud_adop_espejo` (id_solicitud, fecha_solicitud, estado, id_usuario, id_mascota, 
fecha_insercion, time_insercion, usuario_insercion)
VALUES (NULL, NEW.fecha_solicitud, NEW.estado, NEW.id_usuario, NEW.id_mascota,
current_date(), current_time(), session_user()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_solicitud` AFTER DELETE ON `solicitud_adopcion` FOR EACH ROW INSERT INTO `log_delete_solicitud_adop` (id_solicitud, fecha_solicitud, estado, id_usuario, id_mascota, 
fecha_delete, time_delete, usuario_delete)
VALUES (NULL, OLD.fecha_solicitud, OLD.estado, OLD.id_usuario, OLD.id_mascota,
current_date(), current_time(), session_user()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ultimas_solicitudes`
--

DROP TABLE IF EXISTS `ultimas_solicitudes`;
/*!50001 DROP VIEW IF EXISTS `ultimas_solicitudes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ultimas_solicitudes` AS SELECT 
 1 AS `id_solicitud`,
 1 AS `fecha_solicitud`,
 1 AS `estado`,
 1 AS `id_mascota`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `telefono` bigint NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `tipo_usuario` enum('adoptador','administrador') NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Noelia','Martínez','NoeliaMartinez@example.com','hashed_password_1',5558765,'Calle Luna 789, Ciudad','administrador','2024-11-21'),(2,'Carlos','Gómez','CarlosGomez@example.com','hashed_password_2',5552345,'Avenida Sol 345, Ciudad','administrador','2024-10-15'),(3,'María','López','MariaLopez@example.com','hashed_password_3',5556789,'Plaza Norte 101, Ciudad','adoptador','2024-09-10'),(4,'Isabela','Suarez','IsabelaSuareza@example.com','hashed_password_4',9669318885,'022 Mark Prairie Suite 776','adoptador','2004-03-12'),(5,'Mara','Guzman','MaraGuzmana@example.com','hashed_password_5',6272160957,'59908 Morris Circles Apt. 212','adoptador','2022-04-02'),(6,'Lucia','Diaz','LuciaDiaza@example.com','hashed_password_6',5680967855,'3831 Carter Creek Suite 370','adoptador','2007-04-19'),(7,'Martina','Ortiz','MartinaOrtiza@example.com','hashed_password_7',7608713908,'6465 Garcia Field Apt. 205','adoptador','2004-03-14'),(8,'Luis','Castro','LuisCastroa@example.com','hashed_password_8',2420846829,'80976 Smith Prairie Suite 279','adoptador','2010-12-20'),(9,'Carlos','Rojas','CarlosRojasa@example.com','hashed_password_9',4046292067,'70025 Martinez Causeway','adoptador','2009-12-27'),(10,'Diego','Perez','DiegoPereza@example.com','hashed_password_10',8439501459,'09993 Sutton Mountain','adoptador','2016-03-09'),(11,'Isabela','Rojas','IsabelaRojasa@example.com','hashed_password_11',4758063996,'181 Bradley Passage','adoptador','2004-12-04'),(12,'Diego','Hernandez','DiegoHernandeza@example.com','hashed_password_12',7460975522,'62068 Donald Road','adoptador','2002-07-08'),(13,'Luis','Romero','LuisRomeroa@example.com','hashed_password_13',4205571415,'8165 Garner Ville','adoptador','2008-07-01'),(14,'Juan','Martinez','JuanMartineza@example.com','hashed_password_14',1773391440,'0102 Winters Corner Suite 019','adoptador','2024-03-19'),(15,'Alejandro','Ortiz','AlejandroOrtiza@example.com','hashed_password_15',1624902635,'9697 Ramirez Plains','adoptador','2016-01-15'),(16,'Martina','Perez','MartinaPereza@example.com','hashed_password_16',8312982519,'87269 Diane Viaduct Suite 673','adoptador','2017-05-21'),(17,'Sofia','Romero','SofiaRomeroa@example.com','hashed_password_17',9643083136,'537 Miguel Falls','adoptador','2013-03-04'),(18,'Lucia','Flores','LuciaFloresa@example.com','hashed_password_18',2080818229,'8182 Brown Summit','adoptador','2008-08-16'),(19,'Lucia','Rodriguez','LuciaRodrigueza@example.com','hashed_password_19',3960457267,'845 Dixon Stravenue','adoptador','2004-05-14'),(20,'Martina','Rodriguez','MartinaRodrigueza@example.com','hashed_password_20',2786175205,'54803 Peter Ferry','adoptador','2005-06-04'),(21,'Mateo','Mendoza','MateoMendozaa@example.com','hashed_password_21',8227909658,'83758 Lewis Roads Suite 927','adoptador','2022-12-21'),(22,'Mateo','Guzman','MateoGuzmana@example.com','hashed_password_22',9885913209,'666 Cannon Village Suite 869','adoptador','2012-05-20'),(23,'Emiliano','Rodriguez','EmilianoRodrigueza@example.com','hashed_password_23',2705223873,'1082 Price Place','adoptador','2000-09-25'),(24,'Emiliano','Ramirez','EmilianoRamireza@example.com','hashed_password_24',6921211379,'031 Leah Forge','adoptador','2020-10-18'),(25,'Mateo','Rojas','MateoRojasa@example.com','hashed_password_25',8023343205,'07544 Nelson Drive Suite 724','adoptador','2021-04-09'),(26,'Nicolas','Guzman','NicolasGuzmana@example.com','hashed_password_26',2621709244,'8088 Clinton Meadows','adoptador','2016-02-09'),(27,'Juan','Morales','JuanMoralesa@example.com','hashed_password_27',2973084275,'4859 Joseph Manor','adoptador','2012-07-29'),(28,'Isabela','Ortiz','IsabelaOrtiza@example.com','hashed_password_28',3798836673,'05444 Jason Point Apt. 804','adoptador','2015-11-14'),(29,'Marta','Romero','MartaRomeroa@example.com','hashed_password_29',7423443760,'036 Smith Way Apt. 983','adoptador','2023-03-15'),(30,'Gabriel','Garcia','GabrielGarciaa@example.com','hashed_password_30',6937352221,'634 Shirley Tunnel','adoptador','2021-12-22'),(31,'Isabela','Perez','IsabelaPereza@example.com','hashed_password_31',2688739261,'965 Young Ridges Suite 086','adoptador','2000-08-14'),(32,'Camila','Rodriguez','CamilaRodrigueza@example.com','hashed_password_32',2354810332,'52032 Amy Park Apt. 128','adoptador','2015-01-20'),(33,'Gabriel','Vargas','GabrielVargasa@example.com','hashed_password_33',3484013693,'2598 Joshua Mill','adoptador','2017-09-24'),(34,'Mateo','Ortiz','MateoOrtiza@example.com','hashed_password_34',6682369020,'245 Frank Tunnel','adoptador','2022-05-08'),(35,'Josue','Martinez','JosueMartineza@example.com','hashed_password_35',1251837417,'38180 Lynch Passage Suite 235','adoptador','2016-11-13'),(36,'Diego','Romero','DiegoRomeroa@example.com','hashed_password_36',1676573785,'809 Chavez Turnpike','adoptador','2004-07-02'),(37,'Pedro','Diaz','PedroDiaza@example.com','hashed_password_37',7710485818,'4064 Guerrero Stravenue Suite 383','adoptador','2011-01-11'),(38,'Isabela','Ramirez','IsabelaRamireza@example.com','hashed_password_38',9358641000,'04460 Dean Points','adoptador','2021-04-09'),(39,'Luis','Gomez','LuisGomeza@example.com','hashed_password_39',4244718681,'77017 James Canyon Apt. 106','adoptador','2012-08-26'),(40,'Carlos','Gomez','CarlosGomeza@example.com','hashed_password_40',6127582759,'9382 Courtney Summit Suite 163','adoptador','2001-03-13'),(41,'Ana','Guzman','AnaGuzmana@example.com','hashed_password_41',9480151464,'12262 Murphy Ways','adoptador','2022-08-02'),(42,'Camila','Hernandez','CamilaHernandeza@example.com','hashed_password_42',7986657644,'5592 Wright Shoal Apt. 785','adoptador','2018-03-27'),(43,'Emiliano','Ortiz','EmilianoOrtiza@example.com','hashed_password_43',7846319647,'98018 Anthony Avenue','adoptador','2006-09-09'),(44,'Juan','Gomez','JuanGomeza@example.com','hashed_password_44',9397221084,'65442 Joshua Gateway Apt. 000','adoptador','2019-02-09'),(45,'Alejandro','Martinez','AlejandroMartineza@example.com','hashed_password_45',7760330726,'45856 Caleb Manors Apt. 747','adoptador','2003-04-30'),(46,'Valentina','Rodriguez','ValentinaRodrigueza@example.com','hashed_password_46',7080506786,'574 Lisa Track Apt. 890','adoptador','2011-11-15'),(47,'Gabriel','Lopez','GabrielLopeza@example.com','hashed_password_47',7549682268,'983 Crystal Stream Apt. 600','adoptador','2020-10-28'),(48,'Juan','Lopez','JuanLopeza@example.com','hashed_password_48',7868611172,'7695 Rivas Crest Apt. 863','adoptador','2012-05-21'),(49,'Camila','Suarez','CamilaSuareza@example.com','hashed_password_49',2116404435,'22096 Haley Stravenue','adoptador','2014-08-19'),(50,'Maria','Suarez','MariaSuareza@example.com','hashed_password_50',2671271489,'92236 Lin Ways Apt. 329','adoptador','2004-10-16'),(51,'Marcela','Rojas','MarcelaRojasa@example.com','hashed_password_51',2263228928,'997 David Summit','adoptador','2007-07-21'),(52,'Gonzalo','Suarez','GonzaloSuareza@example.com','hashed_password_52',9877379119,'978 Mary Street Apt. 263','adoptador','2009-06-17'),(53,'Sebastian','Vargas','SebastianVargasa@example.com','hashed_password_53',6417590305,'329 Devin Ways','adoptador','2001-03-12');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `fecha_visita` date NOT NULL,
  `id_usuario` int NOT NULL,
  `id_mascota` int NOT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES (1,'2024-11-15',4,1),(2,'2024-11-14',3,2),(3,'2024-11-10',8,3),(4,'2024-11-12',20,4),(5,'2023-07-17',40,3),(6,'2020-07-26',45,12),(7,'2020-02-16',47,17),(8,'2024-03-26',17,54),(9,'2022-04-25',37,28),(10,'2021-07-24',23,19),(11,'2021-06-02',40,45),(12,'2022-11-20',30,47),(13,'2023-11-13',16,13),(14,'2022-05-10',6,23),(15,'2022-09-26',7,48),(16,'2023-10-06',6,14),(17,'2024-11-01',41,25),(18,'2023-09-24',53,22),(19,'2022-12-30',15,10),(20,'2022-11-14',8,49),(21,'2024-05-28',31,54),(22,'2024-09-09',25,33),(23,'2023-12-11',35,7),(24,'2024-08-03',14,20),(25,'2020-10-14',15,44),(26,'2024-08-22',20,8),(27,'2023-04-19',6,29),(28,'2024-04-21',20,18),(29,'2023-12-22',7,38),(30,'2023-10-25',17,17),(31,'2023-03-09',6,41),(32,'2024-03-25',15,17),(33,'2020-08-20',43,25),(34,'2024-05-02',52,50),(35,'2021-03-07',4,1),(36,'2024-06-28',10,25),(37,'2022-08-17',18,52),(38,'2023-06-08',6,13),(39,'2024-08-29',7,45),(40,'2022-09-04',35,9),(41,'2022-07-15',49,18),(42,'2023-10-11',34,35),(43,'2024-03-23',53,15),(44,'2024-01-24',39,50),(45,'2024-09-16',32,29),(46,'2021-01-31',25,6),(47,'2021-11-09',22,49),(48,'2021-03-17',52,17),(49,'2021-11-28',4,1),(50,'2022-05-09',11,28),(51,'2024-03-28',38,7),(52,'2023-12-12',27,30),(53,'2024-01-26',40,25),(54,'2022-09-28',48,53),(55,'2024-12-19',12,9),(56,'2024-12-19',13,14),(57,'2024-12-19',51,46),(58,'2024-12-19',43,43),(59,'2024-12-19',42,11),(60,'2024-12-19',19,16),(61,'2024-12-19',21,22),(62,'2024-12-19',5,3);
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visitas_mascotas_disponibles`
--

DROP TABLE IF EXISTS `visitas_mascotas_disponibles`;
/*!50001 DROP VIEW IF EXISTS `visitas_mascotas_disponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visitas_mascotas_disponibles` AS SELECT 
 1 AS `id_mascota`,
 1 AS `nombre`,
 1 AS `edad`,
 1 AS `direccion_refugio`,
 1 AS `ultima_visita`,
 1 AS `cantidad_visitas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'plataforma_adopcion_mascotas'
--

--
-- Dumping routines for database 'plataforma_adopcion_mascotas'
--
/*!50003 DROP FUNCTION IF EXISTS `adoptante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `adoptante`(mascota_id INT) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR (100);
    SET resultado = (SELECT nombrecompleto_usuario FROM adopciones_realizadas WHERE id_mascota = mascota_id);
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `nro_usuarios_registrados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nro_usuarios_registrados`(fecha_inicio DATE, fecha_fin DATE) RETURNS int
    NO SQL
BEGIN
	DECLARE resultado INT;
    SET resultado = (SELECT count(*) FROM usuario where fecha_registro between fecha_inicio and fecha_fin);
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `solicitudes_pendientes_porusuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudes_pendientes_porusuario`(usuario_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = 
		(SELECT COUNT(id_usuario) FROM solicitud_adopcion WHERE estado = 'pendiente' and id_usuario = usuario_id);
	RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_solicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_solicitud`(IN n_fecha_solicitud DATE, IN n_estado CHAR(45), IN n_id_usuario INT, IN n_id_mascota INT)
BEGIN
	INSERT INTO solicitud_adopcion (fecha_solicitud, estado, id_usuario, id_mascota)
    VALUES (n_fecha_solicitud, n_estado, n_id_usuario, n_id_mascota);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_tabla_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_tabla_mascota`(IN campo CHAR(100))
BEGIN
	IF campo <> ' ' THEN 
		SET @ordenar = CONCAT ('ORDER BY ', campo);
	ELSE
		SET @ordenar = ' ';
	END IF;
SET @clausula = CONCAT ('SELECT * FROM mascota ', @ordenar);
PREPARE ejecutarSQL FROM @clausula;
EXECUTE ejecutarSQL;
deallocate prepare ejecutarSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `adopciones_realizadas`
--

/*!50001 DROP VIEW IF EXISTS `adopciones_realizadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adopciones_realizadas` AS select `mascota`.`id_mascota` AS `id_mascota`,`mascota`.`nombre` AS `nombre_mascota`,`mascota`.`especie` AS `especie`,`mascota`.`sexo` AS `sexo`,timestampdiff(YEAR,`mascota`.`fecha_nacimiento`,curdate()) AS `edad`,`refugio`.`id_refugio` AS `id_refugio`,`refugio`.`nombre` AS `nombre_refugio`,`usuario`.`id_usuario` AS `id_usuario`,concat(`usuario`.`nombre`,' ',`usuario`.`apellido`) AS `nombrecompleto_usuario`,`solicitud_adopcion`.`fecha_solicitud` AS `fecha_solicitud`,`solicitud_adopcion`.`estado` AS `estado` from (((`mascota` join `refugio`) join `usuario`) join `solicitud_adopcion`) where ((`mascota`.`id_refugio` = `refugio`.`id_refugio`) and (`mascota`.`id_mascota` = `solicitud_adopcion`.`id_mascota`) and (`solicitud_adopcion`.`id_usuario` = `usuario`.`id_usuario`) and (`solicitud_adopcion`.`estado` = 'aprobada')) order by `solicitud_adopcion`.`fecha_solicitud` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mascotas_disponibles`
--

/*!50001 DROP VIEW IF EXISTS `mascotas_disponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mascotas_disponibles` AS select `mascota`.`id_mascota` AS `id_mascota`,`mascota`.`nombre` AS `nombre`,`mascota`.`especie` AS `especie`,`mascota`.`tamaño` AS `tamaño`,timestampdiff(YEAR,`mascota`.`fecha_nacimiento`,curdate()) AS `edad`,`refugio`.`id_refugio` AS `id_refugio`,`refugio`.`nombre` AS `refugio`,`refugio`.`direccion` AS `direccion` from ((`mascota` join `refugio` on((`mascota`.`id_refugio` = `refugio`.`id_refugio`))) left join `ultimas_solicitudes` on((`mascota`.`id_mascota` = `ultimas_solicitudes`.`id_mascota`))) where ((`ultimas_solicitudes`.`estado` <> 'aprobada') or (`ultimas_solicitudes`.`id_mascota` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resumen_refugios`
--

/*!50001 DROP VIEW IF EXISTS `resumen_refugios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `resumen_refugios` AS select `r`.`id_refugio` AS `id_refugio`,`r`.`nombre` AS `nombre_refugio`,`r`.`direccion` AS `direccion`,count(distinct `md`.`id_mascota`) AS `q_mascotas_disponibles`,count(distinct `ar`.`id_mascota`) AS `q_mascotas_adoptadas`,count((case when (`sa`.`estado` = 'rechazada') then 1 end)) AS `q_solicitudes_rechazadas`,count(distinct `v`.`id_mascota`) AS `q_visitas_recibidas` from (((((`refugio` `r` left join `mascota` `m` on((`r`.`id_refugio` = `m`.`id_refugio`))) left join `mascotas_disponibles` `md` on((`m`.`id_mascota` = `md`.`id_mascota`))) left join `adopciones_realizadas` `ar` on((`m`.`id_mascota` = `ar`.`id_mascota`))) left join `solicitud_adopcion` `sa` on((`m`.`id_mascota` = `sa`.`id_mascota`))) left join `visita` `v` on((`m`.`id_mascota` = `v`.`id_mascota`))) group by `r`.`id_refugio`,`r`.`nombre`,`r`.`direccion` order by `r`.`id_refugio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ultimas_solicitudes`
--

/*!50001 DROP VIEW IF EXISTS `ultimas_solicitudes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ultimas_solicitudes` AS select `s`.`id_solicitud` AS `id_solicitud`,`s`.`fecha_solicitud` AS `fecha_solicitud`,`s`.`estado` AS `estado`,`s`.`id_mascota` AS `id_mascota` from (`solicitud_adopcion` `s` join (select `solicitud_adopcion`.`id_mascota` AS `id_mascota`,max(`solicitud_adopcion`.`fecha_solicitud`) AS `fecha_ultima_solicitud` from `solicitud_adopcion` group by `solicitud_adopcion`.`id_mascota`) `m` on(((`s`.`id_mascota` = `m`.`id_mascota`) and (`s`.`fecha_solicitud` = `m`.`fecha_ultima_solicitud`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visitas_mascotas_disponibles`
--

/*!50001 DROP VIEW IF EXISTS `visitas_mascotas_disponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visitas_mascotas_disponibles` AS select `md`.`id_mascota` AS `id_mascota`,`md`.`nombre` AS `nombre`,`md`.`edad` AS `edad`,`md`.`direccion` AS `direccion_refugio`,max(`v`.`fecha_visita`) AS `ultima_visita`,count(`v`.`id_mascota`) AS `cantidad_visitas` from (`mascotas_disponibles` `md` left join `visita` `v` on((`md`.`id_mascota` = `v`.`id_mascota`))) group by `md`.`id_mascota`,`md`.`edad` order by `cantidad_visitas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 12:32:55
