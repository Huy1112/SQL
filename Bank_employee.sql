-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: Bank
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `superior_emp_id` smallint unsigned DEFAULT NULL,
  `dept_id` smallint unsigned DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `assigned_branch_id` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_e_emp_id` (`superior_emp_id`),
  KEY `fk_dept_id` (`dept_id`),
  KEY `fk_e_branch_id` (`assigned_branch_id`),
  CONSTRAINT `fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `fk_e_branch_id` FOREIGN KEY (`assigned_branch_id`) REFERENCES `branch` (`branch_id`),
  CONSTRAINT `fk_e_emp_id` FOREIGN KEY (`superior_emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Michael','Smith','2001-06-22',NULL,NULL,3,'President',1),(2,'Susan','Barker','2002-09-12',NULL,1,3,'Vice President',1),(3,'Robert','Tyler','2000-02-09',NULL,1,3,'Treasurer',1),(4,'Susan','Hawthorne','2002-04-24',NULL,3,1,'Operations Manager',1),(5,'John','Gooding','2003-11-14',NULL,4,2,'Loan Manager',1),(6,'Helen','Fleming','2004-03-17',NULL,4,1,'Head Teller',1),(7,'Chris','Tucker','2004-09-15',NULL,6,1,'Teller',1),(8,'Sarah','Parker','2002-12-02',NULL,6,1,'Teller',1),(9,'Jane','Grossman','2002-05-03',NULL,6,1,'Teller',1),(10,'Paula','Roberts','2002-07-27',NULL,4,1,'Head Teller',2),(11,'Thomas','Ziegler','2000-10-23',NULL,10,1,'Teller',2),(12,'Samantha','Jameson','2003-01-08',NULL,10,1,'Teller',2),(13,'John','Blake','2000-05-11',NULL,4,1,'Head Teller',3),(14,'Cindy','Mason','2002-08-09',NULL,13,1,'Teller',3),(15,'Frank','Portman','2003-04-01',NULL,13,1,'Teller',3),(16,'Theresa','Markham','2001-03-15',NULL,4,1,'Head Teller',4),(17,'Beth','Fowler','2002-06-29',NULL,16,1,'Teller',4),(18,'Rick','Tulman','2002-12-12',NULL,16,1,'Teller',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 20:41:29
