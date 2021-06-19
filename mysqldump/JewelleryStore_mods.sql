-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: silversmithUK_mods
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `title` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `building_number` varchar(5) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country` varchar(20) NOT NULL,
  `area` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Red','Mike','Mr','mike.red@gmail.com','44 7870 133426','5','Bristol','BS1 2TD','UK','GB'),(2,'Green','Andrea','Ms','agreen@hotmail.com','44 7442 923458','448','London','E17 6XS','UK','GB'),(3,'Blue','Janet','Miss','blue-spike@gmail.com','44 7871 121166','365','Dudley','DY11 4HK','UK','GB'),(4,'Purple','Fred','Ms','PURPLE-SPOT@outlook.com','44 7438 802322','12','London','SW2 5GB','UK','GB'),(5,'Magenta','Sami','Ms','magentas@yahoo.com','44 7221 802322','24','York','YK21 0IE','UK','GB'),(6,'Ochre','Jake','Mr','jochre@mail.com','38 7734 219023','31','Koln','55322','Germany','EU'),(7,'Yellow','Mariam','Dr','yellow-mar@aol.com','44 7557 212596','60','Swansea','SN21 5CZ','UK','GB'),(8,'Blue','Helen','Mrs','helen_blue@hotmail.com','44 7871 702618','112','Ely','CB21 8NL','UK','GB'),(9,'Orange','Becca','Miss','bex.orange@hello.com','44 7973 159427','6b','Glasgow','G7 2FB','UK','GB'),(10,'Orange','Steve','Mr','sorange@take.com','44 7973 159426','6b','Glasgow','G7 2FB','UK','GB'),(11,'Pink','Val','Mrs','pinkie@free.com','354 823 9352','93','Reykjavík','112','Iceland','Rest');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_customer_update` BEFORE UPDATE ON `customer` FOR EACH ROW INSERT INTO customer_audit
 SET action = 'update',
     building_old = OLD.building_number,
     city_old = OLD.city,
     postcode_old = OLD.postcode,
	 building_new = NEW.building_number,
     city_new = NEW.city,
     postcode_new = NEW.postcode,
     changedat = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_audit`
--

DROP TABLE IF EXISTS `customer_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_old` varchar(5) NOT NULL,
  `city_old` varchar(50) DEFAULT NULL,
  `postcode_old` varchar(10) DEFAULT NULL,
  `building_new` varchar(5) NOT NULL,
  `city_new` varchar(50) DEFAULT NULL,
  `postcode_new` varchar(10) DEFAULT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_audit`
--

LOCK TABLES `customer_audit` WRITE;
/*!40000 ALTER TABLE `customer_audit` DISABLE KEYS */;
INSERT INTO `customer_audit` VALUES (1,'6b','Glasgow','G7 2FB','155','Dundee','DD15 5DB','2021-06-16 20:44:36','update'),(2,'155','Dundee','DD15 5DB','6b','Glasgow','G7 2FB','2021-06-16 20:45:10','update');
/*!40000 ALTER TABLE `customer_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_inv`
--

DROP TABLE IF EXISTS `customer_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_inv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `accounts_month` varchar(3) NOT NULL,
  `accounts_year` int NOT NULL,
  `transaction_stamp` datetime DEFAULT NULL,
  `paid` tinyint(1) NOT NULL,
  `refund` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_id` (`customer_id`),
  KEY `fk_stock_id` (`stock_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_inv`
--

LOCK TABLES `customer_inv` WRITE;
/*!40000 ALTER TABLE `customer_inv` DISABLE KEYS */;
INSERT INTO `customer_inv` VALUES (1,8,5,55.00,'jan',2020,'2020-01-27 23:11:00',1,0),(2,1,1,135.00,'feb',2020,NULL,0,0),(3,5,9,25.00,'feb',2020,'2020-02-10 23:11:00',1,0),(4,4,11,56.00,'mar',2020,'2020-03-15 23:11:00',1,0),(5,11,19,12.00,'apr',2020,'2020-04-18 23:11:00',1,0),(6,6,3,90.00,'apr',2020,'2020-04-24 23:11:00',1,0),(7,2,14,30.00,'may',2020,'2020-05-01 23:11:00',1,1),(8,1,13,72.00,'may',2020,'2020-05-31 23:11:00',0,0),(9,4,16,20.00,'jun',2020,'2020-06-13 23:11:00',1,0),(10,10,18,12.00,'jun',2020,'2020-06-24 23:11:00',1,0),(11,7,10,15.00,'oct',2020,'2020-10-31 23:11:00',1,0),(12,7,6,20.00,'dec',2020,'2020-12-03 23:11:00',1,0),(13,9,8,30.00,'dec',2020,'2020-12-24 23:11:00',1,0),(14,3,12,60.00,'dec',2020,'2020-12-25 23:11:00',1,0);
/*!40000 ALTER TABLE `customer_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `material` varchar(20) NOT NULL,
  `purity` int DEFAULT NULL,
  `finish` varchar(20) DEFAULT NULL,
  `gems` varchar(20) DEFAULT NULL,
  `recycled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_design` (`stock_id`),
  CONSTRAINT `fk_design` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
INSERT INTO `design` VALUES (1,16,'Earrings','Silver',925,'Acrylic',NULL,1),(2,20,'Earrings','Silver',925,'Acrylic',NULL,1),(3,17,'Earrings','Aluminium',0,'Original',NULL,1),(4,6,'Bangle','Perspex',0,'Texture',NULL,1),(5,12,'Brooch','Copper',0,'Enamel',NULL,0),(6,4,'Bangle','Silver',925,'Texture','Glass',1),(7,13,'Necklace','Silver',925,'Brush',NULL,1),(8,18,'Earrings','Aluminium',0,'Original',NULL,1),(9,19,'Earrings','Aluminium',0,'Original',NULL,1),(10,15,'Earrings','Silver',925,'Brush',NULL,1),(11,14,'Earrings','Gold',10,'Brush','Gold',1),(12,5,'Bangle','Silver',925,'Texture',NULL,1),(13,7,'Pendant','Silver',925,'Acrylic',NULL,0),(14,11,'Pendant','Copper',0,'Enamel',NULL,0),(15,10,'Pendant','Copper',0,'Texture',NULL,0),(16,1,'Ring','Silver',925,'Mirror','Blue Topaz',0),(17,3,'Ring','Silver',925,'Brush','Orange CZ',0),(18,8,'Pendant','Silver Clay',999,'Texture',NULL,1),(19,9,'Pendant','Perspex',0,'Mirror',NULL,0),(20,2,'Ring','Silver',925,'Texture',NULL,1);
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonPayment_mod`
--

DROP TABLE IF EXISTS `nonPayment_mod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonPayment_mod` (
  `count` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `title` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `date_stamp` date DEFAULT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonPayment_mod`
--

LOCK TABLES `nonPayment_mod` WRITE;
/*!40000 ALTER TABLE `nonPayment_mod` DISABLE KEYS */;
INSERT INTO `nonPayment_mod` VALUES (1,'Red','Mike','Mr','mike.red@gmail.com','44 7870 133426','2021-06-16'),(2,'Red','Mike','Mr','mike.red@gmail.com','44 7870 133426','2021-06-17'),(3,'Red','Mike','Mr','mike.red@gmail.com','44 7870 133426','2021-06-18');
/*!40000 ALTER TABLE `nonPayment_mod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(50) NOT NULL,
  `shop` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'Silver Tension Ring','website',135.00,3),(2,'Silver Adjustible Ring','website',15.00,1),(3,'Silver Collet Set Ring','website',90.00,1),(4,'Silver Adjustible Bangle','website',30.00,4),(5,'Silver Cuff Bangle','website',55.00,1),(6,'Neon Yellow Cuff Bangle','website',20.00,6),(7,'Silver Pink Splash Pendant','gallery',30.00,2),(8,'Pure Silver Abstract Pendant','website',30.00,3),(9,'Neon Pink Orange Eve Pendant','website',25.00,1),(10,'Copper Domed Pendant','website',15.00,7),(11,'Snow Flowers Enamelled Pendant','gallery',56.00,1),(12,'Domed Enamelled Red Abstract Brooch','gallery',60.00,1),(13,'Handmade Silver Chain','gallery',72.00,1),(14,'10ct Gold Casting Grain Studs','gallery',30.00,1),(15,'Silver Unisex Circle Studs','gallery',15.00,3),(16,'Pink Circle Studs','gallery',20.00,1),(17,'Upcycled Brew Dog Blue Earrings','Warwick',12.00,5),(18,'Upcycled Brew Dog Purple Earrings','Warwick',12.00,1),(19,'Upcycled Brew Dog Green Earrings','Warwick',12.00,2),(20,'Black & White Unisex Cube Studs','website',15.00,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Cooksongold','UK','Silver'),(2,'Cooksongold','UK','Gold'),(3,'Cooksongold','UK','Chain'),(4,'Kernow Craft','UK','Gems'),(5,'Kernow Craft','UK','Copper'),(6,'Amazon','UK','Findings'),(7,'Amazon','UK','Acrylic'),(8,'Warm Glass','UK','Glass'),(9,'Warm Glass','UK','Enamel'),(10,'Green Cast','Italy','Perspex'),(11,'Metal Clay Co','UK','Silver Clay'),(12,'Beavertown Brewery','UK','Aluminium');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_inv`
--

DROP TABLE IF EXISTS `supplier_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_inv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `refund` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_inv` (`supplier_id`),
  CONSTRAINT `fk_supplier_inv` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_inv`
--

LOCK TABLES `supplier_inv` WRITE;
/*!40000 ALTER TABLE `supplier_inv` DISABLE KEYS */;
INSERT INTO `supplier_inv` VALUES (1,8,155.00,1,0),(2,1,1135.00,0,0),(3,5,125.00,1,0),(4,4,157.00,1,0),(5,11,112.00,1,0),(6,6,190.00,1,0),(7,2,130.00,1,1),(8,1,172.00,0,0),(9,4,120.00,1,0),(10,10,112.00,1,0),(11,7,115.00,1,0),(12,7,121.00,1,0),(13,9,256.00,1,0),(14,3,160.00,1,0);
/*!40000 ALTER TABLE `supplier_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_stock_design`
--

DROP TABLE IF EXISTS `vw_stock_design`;
/*!50001 DROP VIEW IF EXISTS `vw_stock_design`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stock_design` AS SELECT 
 1 AS `stock_id`,
 1 AS `shop`,
 1 AS `category`,
 1 AS `city`,
 1 AS `accounts_month`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_stock_design`
--

/*!50001 DROP VIEW IF EXISTS `vw_stock_design`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stock_design` AS select `st`.`id` AS `stock_id`,`st`.`shop` AS `shop`,`d`.`category` AS `category`,`c`.`city` AS `city`,`cinv`.`accounts_month` AS `accounts_month` from (((`customer_inv` `cinv` join `customer` `c` on((`cinv`.`customer_id` = `c`.`id`))) join `stock` `st` on((`cinv`.`stock_id` = `st`.`id`))) join `design` `d` on((`cinv`.`stock_id` = `d`.`stock_id`))) where (`d`.`recycled` = true) order by `cinv`.`transaction_stamp` */;
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

-- Dump completed on 2021-06-19  6:15:13
