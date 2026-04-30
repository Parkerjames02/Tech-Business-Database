CREATE DATABASE  IF NOT EXISTS `tech_business_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tech_business_database`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tech_business_database
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `last_purchase_date` date DEFAULT NULL,
  `is_store_member` tinyint(1) DEFAULT NULL,
  `membership_join_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Enoch Pruitt','2023-06-11',0,NULL),(2,'Tom Hamilton','2022-01-16',0,NULL),(3,'Lyle Friedman','2023-09-04',1,'2022-06-21'),(4,'Aurelia Silva','2023-03-29',0,NULL),(5,'Pete Knox','2023-12-23',0,NULL),(6,'Hazel Sullivan','2024-02-10',0,'2023-04-12'),(7,'Gino Blake','2022-04-04',0,NULL),(8,'Trisha Massey','2023-01-18',1,'2021-03-18'),(9,'Colette Tapia','2022-05-03',0,NULL),(10,'Densie Huff','2022-09-25',0,NULL),(11,'Randy Carpenter','2023-02-16',1,'2022-01-23'),(12,'Ezra Joyce','2023-12-14',0,NULL),(13,'Alyce Ortiz','2024-08-29',0,NULL),(14,'Wilburn Cardenas','2024-03-20',1,'2022-09-02'),(15,'Jon Thornton','2023-04-30',0,NULL),(16,'Mallory Paul','2024-02-17',1,'2022-07-06'),(17,'Candy Conrad','2024-08-09',0,NULL),(18,'Geraldine Booth','2024-05-19',0,NULL),(19,'Bobbi Carr','2022-06-04',0,NULL),(20,'Andy Bolton','2023-08-10',1,'2022-11-30');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `store_id` int NOT NULL,
  `employee_name` varchar(250) DEFAULT NULL,
  `position` varchar(250) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,5,'Keith Gray','Inventory Manger','2019-01-31'),(2,2,'Jarred Cruz','Store Manager','2022-04-06'),(3,1,'Leah Daniel','Inventory Manager','2024-06-01'),(4,3,'Billie Burgess','Store Associate','2023-04-20'),(5,4,'Bart Hester','Store Manager','2021-09-23'),(6,4,'Minerva Guzman','Inventory Manager','2020-10-15'),(7,2,'Ulysses Clements','Inventory Manager','2022-02-26'),(8,1,'Alma Ware','Receptionist','2022-09-19'),(9,3,'Seymour Jenson','Store Manager','2021-07-18'),(10,5,'Pearl Duncan','Receptionist','2021-09-06'),(11,5,'Mac Delacruz','Store Associate','2022-03-16'),(12,3,'Antonio Miller','Receptionist','2019-11-22'),(13,2,'Richie Buchanan','Receptionist','2024-04-15'),(14,1,'Wilton Avila','Store Associate','2022-03-02'),(15,4,'Elliot Case','Receptionist','2021-11-08'),(16,5,'Rod Vaughan','Store Manager','2023-06-20'),(17,3,'Leroy Shaffer','Inventory Manager','2019-09-01'),(18,2,'Gale Collins','Store Associate','2022-02-01'),(19,1,'Walker Dillon','Store Manager','2021-03-03'),(20,4,'Claud Sharp','Store Associate','2022-11-15');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseinformation`
--

DROP TABLE IF EXISTS `purchaseinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseinformation` (
  `purchase_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `products_purchased` varchar(250) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `purchaseinformation_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `purchaseinformation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `purchaseinformation_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseinformation`
--

LOCK TABLES `purchaseinformation` WRITE;
/*!40000 ALTER TABLE `purchaseinformation` DISABLE KEYS */;
INSERT INTO `purchaseinformation` VALUES (1,2,11,10,'1x Samsung 12.4 in. Galaxy Tablet',543.00,'2023-02-16'),(2,5,3,12,'2x CRUA 30\" Curved Gaming Monitor',287.98,'2023-09-04'),(3,3,15,10,'1x ASUS VivoWatch SP(HC-A05)',180.00,'2023-04-30'),(4,1,8,12,'1x Sony ZV-E10 Mirrorless Camera',694.95,'2023-01-18'),(5,4,2,15,'3x Bose SoundLink Micro Bluetooth Speaker',357.00,'2022-01-16'),(6,4,12,10,'2x Beyerdynamic DT 990 PRO Studio Headphones',359.98,'2023-12-14'),(7,1,5,10,'1x Samsung Galaxy A55',344.99,'2023-12-23'),(8,3,18,13,'1x Google Pixel 7a',384.99,'2024-05-19'),(9,5,6,12,'1x Meta Oculus Quest 2',479.99,'2024-02-10'),(10,2,2,15,'2x ASUS ROG Gladius III Wired Gaming Mouse',89.98,'2022-01-16'),(11,2,1,12,'1x MOUNTAIN Everest Max Mechanical Gaming Keyboard',149.99,'2023-06-11'),(12,4,4,10,'1x NETGEAR High-Speed Cable Modem',119.99,'2023-03-29'),(13,1,17,13,'3x TP-Link USB Bluetooth Adapter',44.97,'2024-08-09'),(14,3,13,13,'1x Microsoft Xbox Series S',299.00,'2024-08-29'),(15,1,19,15,'2x Xbox Wireless Controller',49.99,'2022-06-04'),(16,4,16,12,'2x Tripp Lite Power Extension Cord',59.95,'2024-02-17'),(17,5,14,10,'1x MSI Cyborg Gaming Laptop',799.99,'2024-03-20'),(18,5,10,8,'3x Belkin Thunderbolt 3 Dock Core',107.97,'2022-09-25'),(19,1,9,15,'3x ORICO Aluminum M.2 NVMe SSD',37.77,'2022-05-03'),(20,3,7,15,'1x AuuSda Windows 11 Pro Home Laptop',199.98,'2022-04-04');
/*!40000 ALTER TABLE `purchaseinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL,
  `location` varchar(250) DEFAULT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Folsom, CA','Ronald Berry'),(2,'Carmichael, CA','Rochelle Blair'),(3,'Rancho Cordova, CA','Joyce Pearce'),(4,'Citrus Heights, CA','Vicki Solis'),(5,'Elk Grove, CA','Kelly Bell');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tech_business_database'
--

--
-- Dumping routines for database 'tech_business_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-12 17:07:23
