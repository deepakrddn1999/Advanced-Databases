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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `chk_payment_amount` CHECK ((`amount` >= 0)),
  CONSTRAINT `chk_payment_method` CHECK ((`payment_method` in (_utf8mb4'Credit Card',_utf8mb4'Debit Card',_utf8mb4'PayPal',_utf8mb4'Bank Transfer'))),
  CONSTRAINT `chk_payment_status` CHECK ((`payment_status` in (_utf8mb4'Pending',_utf8mb4'Completed',_utf8mb4'Failed',_utf8mb4'Refunded')))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'Debit Card','Failed','2026-09-15 08:47:27',87.00),(2,2,'PayPal','Refunded','2026-09-14 08:47:27',124.00),(3,3,'Bank Transfer','Completed','2026-09-13 08:47:27',161.00),(4,4,'Credit Card','Completed','2026-09-12 08:47:27',198.00),(5,5,'Debit Card','Completed','2026-09-11 08:47:27',235.00),(6,6,'PayPal','Completed','2026-09-10 08:47:27',272.00),(7,7,'Bank Transfer','Completed','2026-09-09 08:47:27',309.00),(8,8,'Credit Card','Completed','2026-09-08 08:47:27',346.00),(9,9,'Debit Card','Completed','2026-09-07 08:47:27',383.00),(10,10,'PayPal','Pending','2026-09-06 08:47:27',420.00),(11,11,'Bank Transfer','Failed','2026-09-05 08:47:27',457.00),(12,12,'Credit Card','Refunded','2026-09-04 08:47:27',494.00),(13,13,'Debit Card','Completed','2026-09-03 08:47:27',531.00),(14,14,'PayPal','Completed','2026-09-02 08:47:27',568.00),(15,15,'Bank Transfer','Completed','2026-09-01 08:47:27',605.00),(16,16,'Credit Card','Completed','2026-08-31 08:47:27',642.00),(17,17,'Debit Card','Completed','2026-08-30 08:47:27',679.00),(18,18,'PayPal','Completed','2026-08-29 08:47:27',716.00),(19,19,'Bank Transfer','Completed','2026-08-28 08:47:27',753.00),(20,20,'Credit Card','Pending','2026-08-27 08:47:27',790.00),(21,21,'Debit Card','Failed','2026-08-26 08:47:27',77.00),(22,22,'PayPal','Refunded','2026-08-25 08:47:27',114.00),(23,23,'Bank Transfer','Completed','2026-08-24 08:47:27',151.00),(24,24,'Credit Card','Completed','2026-08-23 08:47:27',188.00),(25,25,'Debit Card','Completed','2026-08-22 08:47:27',225.00),(26,26,'PayPal','Completed','2026-08-21 08:47:27',262.00),(27,27,'Bank Transfer','Completed','2026-08-20 08:47:27',299.00),(28,28,'Credit Card','Completed','2026-08-19 08:47:27',336.00),(29,29,'Debit Card','Completed','2026-08-18 08:47:27',373.00),(30,30,'PayPal','Pending','2026-08-17 08:47:27',410.00),(31,31,'Bank Transfer','Failed','2026-08-16 08:47:27',447.00),(32,32,'Credit Card','Refunded','2026-08-15 08:47:27',484.00),(33,33,'Debit Card','Completed','2026-08-14 08:47:27',521.00),(34,34,'PayPal','Completed','2026-08-13 08:47:27',558.00),(35,35,'Bank Transfer','Completed','2026-08-12 08:47:27',595.00),(36,36,'Credit Card','Completed','2026-08-11 08:47:27',632.00),(37,37,'Debit Card','Completed','2026-08-10 08:47:27',669.00),(38,38,'PayPal','Completed','2026-08-09 08:47:27',706.00),(39,39,'Bank Transfer','Completed','2026-08-08 08:47:27',743.00),(40,40,'Credit Card','Pending','2026-08-07 08:47:27',780.00),(41,41,'Debit Card','Failed','2026-08-06 08:47:27',67.00),(42,42,'PayPal','Refunded','2026-08-05 08:47:27',104.00),(43,43,'Bank Transfer','Completed','2026-08-04 08:47:27',141.00),(44,44,'Credit Card','Completed','2026-08-03 08:47:27',178.00),(45,45,'Debit Card','Completed','2026-08-02 08:47:27',215.00),(46,46,'PayPal','Completed','2026-08-01 08:47:27',252.00),(47,47,'Bank Transfer','Completed','2026-07-31 08:47:27',289.00),(48,48,'Credit Card','Completed','2026-07-30 08:47:27',326.00),(49,49,'Debit Card','Completed','2026-07-29 08:47:27',363.00),(50,50,'PayPal','Pending','2026-07-28 08:47:27',400.00),(51,51,'Bank Transfer','Failed','2026-07-27 08:47:27',437.00),(52,52,'Credit Card','Refunded','2026-07-26 08:47:27',474.00),(53,53,'Debit Card','Completed','2026-07-25 08:47:27',511.00),(54,54,'PayPal','Completed','2026-07-24 08:47:27',548.00),(55,55,'Bank Transfer','Completed','2026-07-23 08:47:27',585.00),(56,56,'Credit Card','Completed','2026-07-22 08:47:27',622.00),(57,57,'Debit Card','Completed','2026-07-21 08:47:27',659.00),(58,58,'PayPal','Completed','2026-07-20 08:47:27',696.00),(59,59,'Bank Transfer','Completed','2026-07-19 08:47:27',733.00),(60,60,'Credit Card','Pending','2026-07-18 08:47:27',770.00),(61,61,'Debit Card','Failed','2026-07-17 08:47:27',57.00),(62,62,'PayPal','Refunded','2026-07-16 08:47:27',94.00),(63,63,'Bank Transfer','Completed','2026-07-15 08:47:27',131.00),(64,64,'Credit Card','Completed','2026-07-14 08:47:27',168.00),(65,65,'Debit Card','Completed','2026-07-13 08:47:27',205.00),(66,66,'PayPal','Completed','2026-07-12 08:47:27',242.00),(67,67,'Bank Transfer','Completed','2026-07-11 08:47:27',279.00),(68,68,'Credit Card','Completed','2026-07-10 08:47:27',316.00),(69,69,'Debit Card','Completed','2026-07-09 08:47:27',353.00),(70,70,'PayPal','Pending','2026-07-08 08:47:27',390.00),(71,71,'Bank Transfer','Failed','2026-07-07 08:47:27',427.00),(72,72,'Credit Card','Refunded','2026-07-06 08:47:27',464.00),(73,73,'Debit Card','Completed','2026-07-05 08:47:27',501.00),(74,74,'PayPal','Completed','2026-07-04 08:47:27',538.00),(75,75,'Bank Transfer','Completed','2026-07-03 08:47:27',575.00),(76,76,'Credit Card','Completed','2026-07-02 08:47:27',612.00),(77,77,'Debit Card','Completed','2026-07-01 08:47:27',649.00),(78,78,'PayPal','Completed','2026-06-30 08:47:27',686.00),(79,79,'Bank Transfer','Completed','2026-06-29 08:47:27',723.00),(80,80,'Credit Card','Pending','2026-06-28 08:47:27',760.00),(81,81,'Debit Card','Failed','2026-06-27 08:47:27',797.00),(82,82,'PayPal','Refunded','2026-06-26 08:47:27',84.00),(83,83,'Bank Transfer','Completed','2026-06-25 08:47:27',121.00),(84,84,'Credit Card','Completed','2026-06-24 08:47:27',158.00),(85,85,'Debit Card','Completed','2026-06-23 08:47:27',195.00),(86,86,'PayPal','Completed','2026-06-22 08:47:27',232.00),(87,87,'Bank Transfer','Completed','2026-06-21 08:47:27',269.00),(88,88,'Credit Card','Completed','2026-06-20 08:47:27',306.00),(89,89,'Debit Card','Completed','2026-06-19 08:47:27',343.00),(90,90,'PayPal','Pending','2026-06-18 08:47:27',380.00),(91,91,'Bank Transfer','Failed','2026-06-17 08:47:27',417.00),(92,92,'Credit Card','Refunded','2026-06-16 08:47:27',454.00),(93,93,'Debit Card','Completed','2026-06-15 08:47:27',491.00),(94,94,'PayPal','Completed','2026-06-14 08:47:27',528.00),(95,95,'Bank Transfer','Completed','2026-06-13 08:47:27',565.00),(96,96,'Credit Card','Completed','2026-06-12 08:47:27',602.00),(97,97,'Debit Card','Completed','2026-06-11 08:47:27',639.00),(98,98,'PayPal','Completed','2026-06-10 08:47:27',676.00),(99,99,'Bank Transfer','Completed','2026-06-09 08:47:27',713.00),(100,100,'Credit Card','Pending','2026-06-08 08:47:27',750.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
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
