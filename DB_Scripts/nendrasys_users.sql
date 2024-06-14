-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: nendrasys
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `recentPurchase` timestamp NULL DEFAULT NULL,
  `highestPurchase` int DEFAULT NULL,
  `mobileNumber` varchar(45) DEFAULT NULL,
  `emailAddress` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Apple Apple',NULL,NULL,'08785787877','akash@skytech.com','Male','ROLE_ADMIN','$2a$10$GQkTeesl34DqIceAw35cMuqeKo0VOdIkx82RrLTfoX0UoyxK0fhLa',1),(2,'Banana World',NULL,NULL,'7895642','banana@market.com','mALe','ROLE_USER','$2a$10$qZsm.CDzyn1FpOEOKYz22u/nMr87P7PyIkcwnERD.aDUCEyVqvYnC',1),(3,'Cocoa Sweet','2024-05-14 07:38:13',NULL,'09876543210','Cocoa@jungal.com','fEmAlE','ROLE_USER','$2a$10$SXCdktH1p7wJUkfgNZPQv./Nr6pYO./yVIA8SZhwgLAPMA0v5LZv.',1),(7,'Akash','2024-05-16 12:08:29',2012,'1234567899','akash@skytech.com','Male','ROLE_USER','$2a$10$KmC7Be2eGd4jRy.BJNPHhuzVJMwEAETxuaXBTqO6L4n4Gj3NfiCBi',1),(89,'raj','2024-05-16 12:29:12',541,'9898767654','raj@gmail.com','Male','ROLE_USER','$2a$10$lXwRBCfOw07jYwrNpqYhfe.JONOYCuy.HsQdAZWYDf5Lhym8aI7pa',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 11:28:36
