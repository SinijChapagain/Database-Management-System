-- MySQL dump 10.17  Distrib 10.3.15-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: stationary
-- ------------------------------------------------------
-- Server version	10.3.15-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `billID` int(11) NOT NULL AUTO_INCREMENT,
  `discountAmount` decimal(10,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,5,'2018-02-05'),(2,10,'2018-03-01'),(3,5,'2018-03-06'),(4,10,'2018-04-08'),(5,10,'2018-05-12');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_item`
--

DROP TABLE IF EXISTS `bill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_item` (
  `bill_itemID` int(11) NOT NULL AUTO_INCREMENT,
  `billID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  PRIMARY KEY (`bill_itemID`),
  KEY `billID` (`billID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `bill_item_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `bill` (`billID`),
  CONSTRAINT `bill_item_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `items` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_item`
--

LOCK TABLES `bill_item` WRITE;
/*!40000 ALTER TABLE `bill_item` DISABLE KEYS */;
INSERT INTO `bill_item` VALUES (1,1,4),(2,2,6),(3,3,8),(4,4,4),(5,5,1);
/*!40000 ALTER TABLE `bill_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Aman','Thakur','Jadibuti'),(2,'Manjil','Basnet','sukedhara'),(3,'Diamond','Shahi','Balwatar'),(4,'Sweekrit','Acharya','putalisadak'),(5,'Rohit','Gurung','Kausaltar'),(6,'Jenis','Ghale','Tinkune'),(7,'Pratyash','Ghimire','Kalanki'),(8,'Vipassana','shakya','Lokanthali');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `supplierId` int(11) NOT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `supplierId` (`supplierId`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Books',250,2),(2,'Gell Pen',20,1),(3,'Pencil',10,1),(4,'Copies',100,2),(5,'Journal Sheets',20,3),(6,'Geometry Sets',250,4),(7,'Date Sheets',50,5),(8,'Ink-Refil',50,6),(9,'Nepali Paper',25,7);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2),(2,2,1),(3,1,1),(4,3,4),(5,4,5),(6,5,3),(7,6,8),(8,7,9),(9,8,7),(10,5,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Ram','Bista','Sundarijal'),(2,'Shyam','Dahal','Pepsi'),(3,'Ravi','Shah','Kamalpokhari'),(4,'Madhav','Chaaudhary','Baneshwor'),(5,'Gokul','Bhandari','Koteshwor'),(6,'Hari','Tamang','Chakrapath'),(7,'Nitin','Koirala','Gausala');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-18 14:36:16
