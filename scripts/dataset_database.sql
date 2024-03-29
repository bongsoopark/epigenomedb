-- MySQL dump 10.13  Distrib 5.5.50, for Linux (x86_64)
--
-- Host: localhost    Database: dataset
-- ------------------------------------------------------
-- Server version	5.5.50

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ngs_assay`
--

DROP TABLE IF EXISTS `ngs_assay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngs_assay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(40) DEFAULT NULL,
  `antibody` varchar(40) DEFAULT NULL,
  `celltype` varchar(40) DEFAULT NULL,
  `mutation` varchar(40) DEFAULT NULL,
  `media` varchar(40) DEFAULT NULL,
  `perturb` varchar(40) DEFAULT NULL,
  `assay` varchar(10) DEFAULT NULL,
  `replicate` varchar(3) DEFAULT NULL,
  `genome` varchar(40) DEFAULT NULL,
  `index_count` varchar(40) DEFAULT NULL,
  `uniq_read` varchar(40) DEFAULT NULL,
  `sra_id` varchar(40) DEFAULT NULL,
  `read_type` varchar(10) DEFAULT NULL,
  `species` varchar(40) DEFAULT NULL,
  `publication` varchar(40) DEFAULT NULL,
  `laboratory` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

CREATE TABLE `regulome_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `regulome_class` varchar(40) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `regulome_genes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `regulome_id` int(11) unsigned not null default 0,
  `genome_id` int(11) unsigned not null default 0,
  `gene_id` int(11) unsigned not null default 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-23 12:09:33
