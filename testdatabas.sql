-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                5.6.37 - MySQL Community Server (GPL)
-- Server-OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumpar databasstruktur för testdatabas
CREATE DATABASE IF NOT EXISTS `testdatabas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `testdatabas`;

-- Dumpar struktur för vy testdatabas.allprodata
-- Skapar temporärtabell för att hantera VIEW-beroendefel
CREATE TABLE `allprodata` (
	`TEXT` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`image` VARCHAR(1000) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumpar struktur för tabell testdatabas.orderrows
CREATE TABLE IF NOT EXISTS `orderrows` (
  `productid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ok_to_share` tinyint(4) DEFAULT '0',
  `text` varchar(50) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `material` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell testdatabas.orderrows: ~5 rows (ungefär)
/*!40000 ALTER TABLE `orderrows` DISABLE KEYS */;
INSERT INTO `orderrows` (`productid`, `orderid`, `quantity`, `ok_to_share`, `text`, `image`, `material`) VALUES
	(1168, 1271, 1, 1, 'David är bäst', 'jag.jpg', 'bomull'),
	(1169, 1272, 1, 1, 'Razer', 'razer.jpg', 'bomull'),
	(1170, 1273, 1, 1, 'Nike', 'nike.loggo.jpg', 'bomull'),
	(1171, 1274, 1, 1, 'adidas', 'adidas.loggo.jpg', 'bomull'),
	(1172, 1275, 1, 1, 'puma', 'puma.loggo.jpg', 'bomull');
/*!40000 ALTER TABLE `orderrows` ENABLE KEYS */;

-- Dumpar struktur för tabell testdatabas.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `packed` tinyint(4) DEFAULT '0',
  `sent` tinyint(4) DEFAULT '0',
  `delivered` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=latin1;

-- Dumpar data för tabell testdatabas.orders: ~5 rows (ungefär)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderid`, `userid`, `packed`, `sent`, `delivered`) VALUES
	(1271, 1288, 1, 1, 0),
	(1272, 1289, 1, 1, 0),
	(1273, 1290, 1, 1, 0),
	(1274, 1291, 1, 1, 1),
	(1275, 1292, 1, 0, 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumpar struktur för tabell testdatabas.products
CREATE TABLE IF NOT EXISTS `products` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `vat_percent` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=1173 DEFAULT CHARSET=latin1;

-- Dumpar data för tabell testdatabas.products: ~5 rows (ungefär)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productid`, `name`, `description`, `price`, `vat_percent`) VALUES
	(1168, 'adidas', 'hoodie', 200, 20),
	(1169, 'adidas', 't-shirt', 100, 20),
	(1170, 'nike', 'hoodie', 200, 20),
	(1171, 'nike', 't-shirt', 100, 20),
	(1172, 'puma', 't-shirt', 100, 20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumpar struktur för tabell testdatabas.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1293 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell testdatabas.users: ~5 rows (ungefär)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`) VALUES
	(1288, 'Jyoti', 'Ollarenshaw', 'jollarenshaw0@wikia.com', 'EyepxpnYjV'),
	(1289, 'Chaunce', 'Vatini', 'cvatini1@studiopress.com', 'iSNbZV'),
	(1290, 'Maurine', 'Gerardet', 'mgerardet2@boston.com', 'g9m0Yf'),
	(1291, 'Harri', 'Denniss', 'hdenniss3@twitpic.com', 'HJY8wAnQ9'),
	(1292, 'Nolie', 'Fabbri', 'nfabbri4@noaa.gov', 'y9Sjfx');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumpar struktur för vy testdatabas.allprodata
-- Tar bort temporärtabell och skapar slutgiltlig VIEW-struktur
DROP TABLE IF EXISTS `allprodata`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allprodata` AS select `orderrows`.`text` AS `TEXT`,`orderrows`.`image` AS `image` from `orderrows`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
