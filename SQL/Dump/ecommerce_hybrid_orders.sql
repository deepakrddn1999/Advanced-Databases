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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `total_amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_customer` (`customer_id`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `chk_order_status` CHECK ((`order_status` in (_utf8mb4'Pending',_utf8mb4'Processing',_utf8mb4'Shipped',_utf8mb4'Delivered',_utf8mb4'Cancelled'))),
  CONSTRAINT `chk_order_total` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-09-15 07:47:27','Processing',87.00),(2,2,'2026-09-14 07:47:27','Shipped',124.00),(3,3,'2026-09-13 07:47:27','Delivered',161.00),(4,4,'2026-09-12 07:47:27','Cancelled',198.00),(5,5,'2026-09-11 07:47:27','Pending',235.00),(6,6,'2026-09-10 07:47:27','Processing',272.00),(7,7,'2026-09-09 07:47:27','Shipped',309.00),(8,8,'2026-09-08 07:47:27','Delivered',346.00),(9,9,'2026-09-07 07:47:27','Cancelled',383.00),(10,10,'2026-09-06 07:47:27','Pending',420.00),(11,11,'2026-09-05 07:47:27','Processing',457.00),(12,12,'2026-09-04 07:47:27','Shipped',494.00),(13,13,'2026-09-03 07:47:27','Delivered',531.00),(14,14,'2026-09-02 07:47:27','Cancelled',568.00),(15,15,'2026-09-01 07:47:27','Pending',605.00),(16,16,'2026-08-31 07:47:27','Processing',642.00),(17,17,'2026-08-30 07:47:27','Shipped',679.00),(18,18,'2026-08-29 07:47:27','Delivered',716.00),(19,19,'2026-08-28 07:47:27','Cancelled',753.00),(20,20,'2026-08-27 07:47:27','Pending',790.00),(21,21,'2026-08-26 07:47:27','Processing',77.00),(22,22,'2026-08-25 07:47:27','Shipped',114.00),(23,23,'2026-08-24 07:47:27','Delivered',151.00),(24,24,'2026-08-23 07:47:27','Cancelled',188.00),(25,25,'2026-08-22 07:47:27','Pending',225.00),(26,26,'2026-08-21 07:47:27','Processing',262.00),(27,27,'2026-08-20 07:47:27','Shipped',299.00),(28,28,'2026-08-19 07:47:27','Delivered',336.00),(29,29,'2026-08-18 07:47:27','Cancelled',373.00),(30,30,'2026-08-17 07:47:27','Pending',410.00),(31,31,'2026-08-16 07:47:27','Processing',447.00),(32,32,'2026-08-15 07:47:27','Shipped',484.00),(33,33,'2026-08-14 07:47:27','Delivered',521.00),(34,34,'2026-08-13 07:47:27','Cancelled',558.00),(35,35,'2026-08-12 07:47:27','Pending',595.00),(36,36,'2026-08-11 07:47:27','Processing',632.00),(37,37,'2026-08-10 07:47:27','Shipped',669.00),(38,38,'2026-08-09 07:47:27','Delivered',706.00),(39,39,'2026-08-08 07:47:27','Cancelled',743.00),(40,40,'2026-08-07 07:47:27','Pending',780.00),(41,41,'2026-08-06 07:47:27','Processing',67.00),(42,42,'2026-08-05 07:47:27','Shipped',104.00),(43,43,'2026-08-04 07:47:27','Delivered',141.00),(44,44,'2026-08-03 07:47:27','Cancelled',178.00),(45,45,'2026-08-02 07:47:27','Pending',215.00),(46,46,'2026-08-01 07:47:27','Processing',252.00),(47,47,'2026-07-31 07:47:27','Shipped',289.00),(48,48,'2026-07-30 07:47:27','Delivered',326.00),(49,49,'2026-07-29 07:47:27','Cancelled',363.00),(50,50,'2026-07-28 07:47:27','Pending',400.00),(51,51,'2026-07-27 07:47:27','Processing',437.00),(52,52,'2026-07-26 07:47:27','Shipped',474.00),(53,53,'2026-07-25 07:47:27','Delivered',511.00),(54,54,'2026-07-24 07:47:27','Cancelled',548.00),(55,55,'2026-07-23 07:47:27','Pending',585.00),(56,56,'2026-07-22 07:47:27','Processing',622.00),(57,57,'2026-07-21 07:47:27','Shipped',659.00),(58,58,'2026-07-20 07:47:27','Delivered',696.00),(59,59,'2026-07-19 07:47:27','Cancelled',733.00),(60,60,'2026-07-18 07:47:27','Pending',770.00),(61,61,'2026-07-17 07:47:27','Processing',57.00),(62,62,'2026-07-16 07:47:27','Shipped',94.00),(63,63,'2026-07-15 07:47:27','Delivered',131.00),(64,64,'2026-07-14 07:47:27','Cancelled',168.00),(65,65,'2026-07-13 07:47:27','Pending',205.00),(66,66,'2026-07-12 07:47:27','Processing',242.00),(67,67,'2026-07-11 07:47:27','Shipped',279.00),(68,68,'2026-07-10 07:47:27','Delivered',316.00),(69,69,'2026-07-09 07:47:27','Cancelled',353.00),(70,70,'2026-07-08 07:47:27','Pending',390.00),(71,71,'2026-07-07 07:47:27','Processing',427.00),(72,72,'2026-07-06 07:47:27','Shipped',464.00),(73,73,'2026-07-05 07:47:27','Delivered',501.00),(74,74,'2026-07-04 07:47:27','Cancelled',538.00),(75,75,'2026-07-03 07:47:27','Pending',575.00),(76,76,'2026-07-02 07:47:27','Processing',612.00),(77,77,'2026-07-01 07:47:27','Shipped',649.00),(78,78,'2026-06-30 07:47:27','Delivered',686.00),(79,79,'2026-06-29 07:47:27','Cancelled',723.00),(80,80,'2026-06-28 07:47:27','Pending',760.00),(81,81,'2026-06-27 07:47:27','Processing',797.00),(82,82,'2026-06-26 07:47:27','Shipped',84.00),(83,83,'2026-06-25 07:47:27','Delivered',121.00),(84,84,'2026-06-24 07:47:27','Cancelled',158.00),(85,85,'2026-06-23 07:47:27','Pending',195.00),(86,86,'2026-06-22 07:47:27','Processing',232.00),(87,87,'2026-06-21 07:47:27','Shipped',269.00),(88,88,'2026-06-20 07:47:27','Delivered',306.00),(89,89,'2026-06-19 07:47:27','Cancelled',343.00),(90,90,'2026-06-18 07:47:27','Pending',380.00),(91,91,'2026-06-17 07:47:27','Processing',417.00),(92,92,'2026-06-16 07:47:27','Shipped',454.00),(93,93,'2026-06-15 07:47:27','Delivered',491.00),(94,94,'2026-06-14 07:47:27','Cancelled',528.00),(95,95,'2026-06-13 07:47:27','Pending',565.00),(96,96,'2026-06-12 07:47:27','Processing',602.00),(97,97,'2026-06-11 07:47:27','Shipped',639.00),(98,98,'2026-06-10 07:47:27','Delivered',676.00),(99,99,'2026-06-09 07:47:27','Cancelled',713.00),(100,100,'2026-06-08 07:47:27','Pending',750.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
