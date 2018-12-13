-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.40-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema carshowroom
--

CREATE DATABASE IF NOT EXISTS carshowroom;
USE carshowroom;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`,`name`) VALUES 
 (1,'Max car'),
 (2,'car'),
 (3,'Motor car');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(30) NOT NULL,
  `productCode` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `unitprice` double NOT NULL,
  `totalPrice` double NOT NULL,
  `purchasedate` date NOT NULL,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`id`,`productName`,`productCode`,`qty`,`unitprice`,`totalPrice`,`purchasedate`,`cat_id`,`user_id`) VALUES 
 (12,'TOYOTA','T001',10,12000000,12000000,'2018-12-05',2,1),
 (13,'TATA','TA011',20,1500000,3000000,'2018-12-05',3,1),
 (14,'MATUTI','MA22TI',12,75000000,75000000,'2018-12-05',1,1),
 (15,'TOYOTA','T001',12,75000000,75000000,'2018-12-05',2,1),
 (16,'fard','FA77',12,8000000,8000000,'2018-12-05',2,1);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


--
-- Definition of table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(30) NOT NULL,
  `productCode` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `unitprice` double NOT NULL,
  `totalPrice` double NOT NULL,
  `salesdate` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `purchase` (`id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`id`,`productName`,`productCode`,`qty`,`unitprice`,`totalPrice`,`salesdate`,`product_id`,`user_id`) VALUES 
 (8,'TATA','TA011',5,1650000,0,'2018-12-05',13,1),
 (9,'MATUTI','Ma22ti',3,82500000,247500000,'2018-12-05',14,1),
 (10,'MATUTI','MA22ti',2,82500000,165000000,'2018-12-05',14,1),
 (11,'TATA','ta011',5,1650000,8250000,'2018-12-05',13,1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;


--
-- Definition of table `summary`
--

DROP TABLE IF EXISTS `summary`;
CREATE TABLE `summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) NOT NULL,
  `productCode` varchar(30) NOT NULL,
  `totalQty` int(11) NOT NULL,
  `soldQty` int(11) NOT NULL,
  `availableQty` int(11) NOT NULL,
  `lastUpdate` date DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `summary_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `purchase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `summary`
--

/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
INSERT INTO `summary` (`id`,`productName`,`productCode`,`totalQty`,`soldQty`,`availableQty`,`lastUpdate`,`product_id`) VALUES 
 (8,'TOYOTA','T001',22,0,22,'2018-12-05',12),
 (9,'TATA','TA011',20,10,10,'2018-12-05',13),
 (10,'MATUTI','MA22TI',12,5,7,'2018-12-05',14),
 (11,'fard','FA77',12,0,12,'2018-12-05',16);
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `userType` varchar(30) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `regiDate` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`username`,`password`,`userType`,`firstName`,`lastName`,`email`,`mobile`,`regiDate`,`status`) VALUES 
 (1,'mostafiz','1234','admin','Mr.','Mostafiz','mosatafiz@gmail.com','01633321732','2018-11-21',0x01),
 (4,'mostafiz','123','Salesman','Mr.','Mostafiz','mostafiz@gmail.com','01686239148','2018-11-23',0x01);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
