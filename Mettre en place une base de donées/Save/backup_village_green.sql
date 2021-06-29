-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: village_green
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
-- Current Database: `village_green`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `village_green` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `village_green`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `category_ibfk_1` (`cat_parent_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`cat_parent_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `cou_id` int NOT NULL AUTO_INCREMENT,
  `cou_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cus_id` int NOT NULL AUTO_INCREMENT,
  `cus_firstname` varchar(50) DEFAULT NULL,
  `cus_lastname` varchar(50) DEFAULT NULL,
  `cus_address` varchar(150) DEFAULT NULL,
  `cus_cp` int DEFAULT NULL,
  `cus_city` varchar(50) DEFAULT NULL,
  `cus_telephone` int DEFAULT NULL,
  `cus_bill_address` varchar(150) DEFAULT NULL,
  `cus_bill_cp` int DEFAULT NULL,
  `cus_bill_city` varchar(50) DEFAULT NULL,
  `cus_delivery_address` varchar(150) DEFAULT NULL,
  `cus_delivery_cp` int DEFAULT NULL,
  `cus_delivery_city` varchar(50) DEFAULT NULL,
  `cus_type` varchar(50) DEFAULT NULL,
  `cus_coef` int DEFAULT NULL,
  `cus_emp_id` int NOT NULL,
  `cus_cou_id` int NOT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `customers_employees_fk1` (`cus_emp_id`),
  KEY `customers_country_fk1` (`cus_cou_id`),
  CONSTRAINT `customers_country_fk1` FOREIGN KEY (`cus_cou_id`) REFERENCES `country` (`cou_id`),
  CONSTRAINT `customers_employees_fk1` FOREIGN KEY (`cus_emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dep_id` int NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_firstname` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(50) DEFAULT NULL,
  `emp_address` varchar(150) DEFAULT NULL,
  `emp_cp` int DEFAULT NULL,
  `emp_city` varchar(50) DEFAULT NULL,
  `emp_tel` int DEFAULT NULL,
  `emp_dep_id` int NOT NULL,
  `emp_post_id` int NOT NULL,
  `emp_cou_id` int NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `employees_departments_fk_1` (`emp_dep_id`),
  KEY `employees_posts_fk_1` (`emp_post_id`),
  KEY `employees_country_fk_1` (`emp_cou_id`),
  CONSTRAINT `employees_country_fk_1` FOREIGN KEY (`emp_cou_id`) REFERENCES `country` (`cou_id`),
  CONSTRAINT `employees_departments_fk_1` FOREIGN KEY (`emp_dep_id`) REFERENCES `departments` (`dep_id`),
  CONSTRAINT `employees_posts_fk_1` FOREIGN KEY (`emp_post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `ode_order_date` datetime DEFAULT NULL,
  `ord_date_payment` datetime DEFAULT NULL,
  `ord_date_ship` datetime DEFAULT NULL,
  `ord_date_delivery` datetime DEFAULT NULL,
  `ord_bill_address` varchar(150) DEFAULT NULL,
  `ord_bill_cp` int DEFAULT NULL,
  `ord_bill_city` varchar(50) DEFAULT NULL,
  `ord_delivery_address` varchar(150) DEFAULT NULL,
  `ord_delivery_cp` int DEFAULT NULL,
  `ord_delivery_city` varchar(50) DEFAULT NULL,
  `ord_status` varchar(50) DEFAULT NULL,
  `ord_cus_id` int NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `orders_fk_1` (`ord_cus_id`),
  CONSTRAINT `orders_fk_1` FOREIGN KEY (`ord_cus_id`) REFERENCES `customers` (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
  `ode_id` int NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(10,2) DEFAULT NULL,
  `ode_qte` int DEFAULT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_pro_id` int NOT NULL,
  `ode_ord_id` int NOT NULL,
  PRIMARY KEY (`ode_id`),
  KEY `orders_details_fk_1` (`ode_pro_id`),
  KEY `orders_details_fk_2` (`ode_ord_id`),
  CONSTRAINT `orders_details_fk_1` FOREIGN KEY (`ode_pro_id`) REFERENCES `products` (`pro_id`),
  CONSTRAINT `orders_details_fk_2` FOREIGN KEY (`ode_ord_id`) REFERENCES `orders` (`ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_details`
--

LOCK TABLES `orders_details` WRITE;
/*!40000 ALTER TABLE `orders_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(50) DEFAULT NULL,
  `pro_description` varchar(150) DEFAULT NULL,
  `pro_photo` varchar(50) DEFAULT NULL,
  `pro_label` varchar(50) DEFAULT NULL,
  `pro_ref` varchar(50) DEFAULT NULL,
  `pro_price` decimal(5,2) DEFAULT NULL,
  `pro_status` int DEFAULT NULL,
  `pro_stock` int DEFAULT NULL,
  `pro_cat_id` int NOT NULL,
  `pro_sup_id` int NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `products_category_fk_1` (`pro_cat_id`),
  KEY `products_suppliers_fk_1` (`pro_sup_id`),
  CONSTRAINT `products_category_fk_1` FOREIGN KEY (`pro_cat_id`) REFERENCES `category` (`cat_id`),
  CONSTRAINT `products_suppliers_fk_1` FOREIGN KEY (`pro_sup_id`) REFERENCES `suppliers` (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `sup_id` int NOT NULL AUTO_INCREMENT,
  `sup_firstname` varchar(50) DEFAULT NULL,
  `sup_lastname` varchar(50) DEFAULT NULL,
  `sup_address` varchar(150) DEFAULT NULL,
  `sup_cp` int DEFAULT NULL,
  `sup_city` varchar(50) DEFAULT NULL,
  `sup_type` varchar(50) DEFAULT NULL,
  `sup_cou_id` int NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `suppliers_fk_1` (`sup_cou_id`),
  CONSTRAINT `suppliers_fk_1` FOREIGN KEY (`sup_cou_id`) REFERENCES `country` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-21 21:04:28
