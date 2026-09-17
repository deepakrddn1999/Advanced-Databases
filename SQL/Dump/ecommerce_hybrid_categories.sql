-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_hybrid
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

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Category 1','E-commerce product category number 1'),(2,'Category 2','E-commerce product category number 2'),(3,'Category 3','E-commerce product category number 3'),(4,'Category 4','E-commerce product category number 4'),(5,'Category 5','E-commerce product category number 5'),(6,'Category 6','E-commerce product category number 6'),(7,'Category 7','E-commerce product category number 7'),(8,'Category 8','E-commerce product category number 8'),(9,'Category 9','E-commerce product category number 9'),(10,'Category 10','E-commerce product category number 10'),(11,'Category 11','E-commerce product category number 11'),(12,'Category 12','E-commerce product category number 12'),(13,'Category 13','E-commerce product category number 13'),(14,'Category 14','E-commerce product category number 14'),(15,'Category 15','E-commerce product category number 15'),(16,'Category 16','E-commerce product category number 16'),(17,'Category 17','E-commerce product category number 17'),(18,'Category 18','E-commerce product category number 18'),(19,'Category 19','E-commerce product category number 19'),(20,'Category 20','E-commerce product category number 20'),(21,'Category 21','E-commerce product category number 21'),(22,'Category 22','E-commerce product category number 22'),(23,'Category 23','E-commerce product category number 23'),(24,'Category 24','E-commerce product category number 24'),(25,'Category 25','E-commerce product category number 25'),(26,'Category 26','E-commerce product category number 26'),(27,'Category 27','E-commerce product category number 27'),(28,'Category 28','E-commerce product category number 28'),(29,'Category 29','E-commerce product category number 29'),(30,'Category 30','E-commerce product category number 30'),(31,'Category 31','E-commerce product category number 31'),(32,'Category 32','E-commerce product category number 32'),(33,'Category 33','E-commerce product category number 33'),(34,'Category 34','E-commerce product category number 34'),(35,'Category 35','E-commerce product category number 35'),(36,'Category 36','E-commerce product category number 36'),(37,'Category 37','E-commerce product category number 37'),(38,'Category 38','E-commerce product category number 38'),(39,'Category 39','E-commerce product category number 39'),(40,'Category 40','E-commerce product category number 40'),(41,'Category 41','E-commerce product category number 41'),(42,'Category 42','E-commerce product category number 42'),(43,'Category 43','E-commerce product category number 43'),(44,'Category 44','E-commerce product category number 44'),(45,'Category 45','E-commerce product category number 45'),(46,'Category 46','E-commerce product category number 46'),(47,'Category 47','E-commerce product category number 47'),(48,'Category 48','E-commerce product category number 48'),(49,'Category 49','E-commerce product category number 49'),(50,'Category 50','E-commerce product category number 50'),(51,'Category 51','E-commerce product category number 51'),(52,'Category 52','E-commerce product category number 52'),(53,'Category 53','E-commerce product category number 53'),(54,'Category 54','E-commerce product category number 54'),(55,'Category 55','E-commerce product category number 55'),(56,'Category 56','E-commerce product category number 56'),(57,'Category 57','E-commerce product category number 57'),(58,'Category 58','E-commerce product category number 58'),(59,'Category 59','E-commerce product category number 59'),(60,'Category 60','E-commerce product category number 60'),(61,'Category 61','E-commerce product category number 61'),(62,'Category 62','E-commerce product category number 62'),(63,'Category 63','E-commerce product category number 63'),(64,'Category 64','E-commerce product category number 64'),(65,'Category 65','E-commerce product category number 65'),(66,'Category 66','E-commerce product category number 66'),(67,'Category 67','E-commerce product category number 67'),(68,'Category 68','E-commerce product category number 68'),(69,'Category 69','E-commerce product category number 69'),(70,'Category 70','E-commerce product category number 70'),(71,'Category 71','E-commerce product category number 71'),(72,'Category 72','E-commerce product category number 72'),(73,'Category 73','E-commerce product category number 73'),(74,'Category 74','E-commerce product category number 74'),(75,'Category 75','E-commerce product category number 75'),(76,'Category 76','E-commerce product category number 76'),(77,'Category 77','E-commerce product category number 77'),(78,'Category 78','E-commerce product category number 78'),(79,'Category 79','E-commerce product category number 79'),(80,'Category 80','E-commerce product category number 80'),(81,'Category 81','E-commerce product category number 81'),(82,'Category 82','E-commerce product category number 82'),(83,'Category 83','E-commerce product category number 83'),(84,'Category 84','E-commerce product category number 84'),(85,'Category 85','E-commerce product category number 85'),(86,'Category 86','E-commerce product category number 86'),(87,'Category 87','E-commerce product category number 87'),(88,'Category 88','E-commerce product category number 88'),(89,'Category 89','E-commerce product category number 89'),(90,'Category 90','E-commerce product category number 90'),(91,'Category 91','E-commerce product category number 91'),(92,'Category 92','E-commerce product category number 92'),(93,'Category 93','E-commerce product category number 93'),(94,'Category 94','E-commerce product category number 94'),(95,'Category 95','E-commerce product category number 95'),(96,'Category 96','E-commerce product category number 96'),(97,'Category 97','E-commerce product category number 97'),(98,'Category 98','E-commerce product category number 98'),(99,'Category 99','E-commerce product category number 99'),(100,'Category 100','E-commerce product category number 100');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-16 16:12:00
