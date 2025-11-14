CREATE DATABASE  IF NOT EXISTS `eczane` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eczane`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eczane
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
-- Table structure for table `hasta`
--

DROP TABLE IF EXISTS `hasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasta` (
  `idhasta` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `hastatc` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idhasta`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasta`
--

LOCK TABLES `hasta` WRITE;
/*!40000 ALTER TABLE `hasta` DISABLE KEYS */;
INSERT INTO `hasta` VALUES (1,'Ahmet','Yılmaz','05551234567','12345678901'),(2,'Mehmet','Demir','052345678','22345678901'),(3,'Ayşe','Kara','05553456789','32345678901'),(4,'Fatma','Öztürk','05554567890','42345678901'),(5,'Ali','Çelik','05555678901','52345678901'),(6,'Veli','Büyük','05556789012','62345678901'),(7,'Zeynep','Kuş','05557890123','72345678901'),(8,'Murat','Aslan','05558901234','82345678901'),(9,'Emine','Şahin','05559012345','92345678901'),(10,'İsmail','Güzel','05560123456','10123456789'),(11,'Ayhan','Sarı','05561234567','11123456789'),(12,'Hüseyin','Aydın','05562345678','12123456789'),(13,'Cemre','Balcı','05563456789','13123456789'),(14,'Elif','Koç','05564567890','14123456789'),(15,'Baran','Toprak','05565678901','15123456789'),(16,'Meryem','Çetin','05566789012','16123456789'),(17,'Kemal','Yalçın','05567890123','17123456789'),(18,'Nalan','Özdemir','05568901234','18123456789'),(19,'Kadir','Erdem','05569012345','19123456789'),(20,'Okan','Duru','05570123456','20123456789');
/*!40000 ALTER TABLE `hasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilac_stok`
--

DROP TABLE IF EXISTS `ilac_stok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilac_stok` (
  `idstok` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) NOT NULL,
  `son_kullanma_tarihi` date NOT NULL,
  `stok_miktari` int NOT NULL,
  `fiyat` decimal(10,2) NOT NULL,
  `tedarik_id` int DEFAULT NULL,
  PRIMARY KEY (`idstok`),
  KEY `tedarik_id` (`tedarik_id`),
  CONSTRAINT `ilac_stok_ibfk_1` FOREIGN KEY (`tedarik_id`) REFERENCES `tedarik` (`idtedarik`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilac_stok`
--

LOCK TABLES `ilac_stok` WRITE;
/*!40000 ALTER TABLE `ilac_stok` DISABLE KEYS */;
INSERT INTO `ilac_stok` VALUES (1,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(2,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(3,'Parol 500 mg Tablet','2026-12-31',150,12.50,1),(4,'Dolorex 50 mg Tablet','2027-05-30',100,18.75,2),(5,'Augmentin 625 mg Tablet','2025-11-15',200,45.90,3),(6,'Majezik 100 mg Tablet','2026-03-20',120,25.30,4),(7,'Nurofen 200 mg Kapsül','2025-09-10',300,22.10,5),(8,'Aferin Forte Şurup','2027-01-25',80,32.40,6),(9,'Mustela Bebek Şampuanı','2026-07-01',50,89.99,7),(10,'Lansor 30 mg Kapsül','2025-08-15',70,50.00,8),(11,'Voltaren Jel 50 g','2027-12-10',90,35.75,9),(12,'Arveles 25 mg Tablet','2026-11-05',140,15.80,10),(13,'İburamin Cold Şurup','2027-03-12',60,28.90,11),(14,'Tylolhot Toz','2025-10-20',250,8.50,12),(15,'Rennie Çiğneme Tableti','2026-05-10',110,17.45,13),(16,'Betasalic Losyon','2026-09-15',40,65.50,14),(17,'Bepanthen Krem 30 g','2025-07-25',100,29.90,15),(18,'Panadol Bebek Şurup','2026-04-20',50,19.75,16),(19,'Coresatin Pembe Krem','2027-06-10',30,120.00,17),(20,'Aspirin 500 mg Tablet','2025-12-31',400,10.25,18),(21,'Minoset Plus Şurup','2026-08-20',130,24.10,19),(22,'Diclomec 75 mg Jel','2025-11-15',60,40.00,20),(23,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(24,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(25,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(26,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(27,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(28,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(29,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(30,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(31,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(32,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(33,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(34,'Aferin Plus Şurup','2026-09-01',200,33.25,2),(35,'Aferin Plus Şurup','2026-09-01',200,33.25,2);
/*!40000 ALTER TABLE `ilac_stok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasa`
--

DROP TABLE IF EXISTS `kasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kasa` (
  `idkasa` int NOT NULL AUTO_INCREMENT,
  `toplam_bakiye` decimal(12,2) DEFAULT '0.00',
  `recete_id` int NOT NULL,
  `siptarih` datetime DEFAULT NULL,
  PRIMARY KEY (`idkasa`),
  KEY `recete_id` (`recete_id`),
  CONSTRAINT `kasa_ibfk_1` FOREIGN KEY (`recete_id`) REFERENCES `recete` (`idrecete`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasa`
--

LOCK TABLES `kasa` WRITE;
/*!40000 ALTER TABLE `kasa` DISABLE KEYS */;
INSERT INTO `kasa` VALUES (1,150.75,1,'2025-01-10 09:15:00'),(2,200.50,2,'2025-01-11 10:30:00'),(3,325.00,3,'2025-01-12 11:45:00'),(4,100.00,4,'2025-01-13 13:00:00'),(5,250.25,5,'2025-01-14 14:15:00'),(6,175.50,6,'2025-01-15 15:30:00'),(7,400.75,7,'2025-01-16 16:45:00'),(8,225.00,8,'2025-01-17 17:00:00'),(9,300.00,9,'2025-01-18 18:15:00'),(10,150.00,10,'2025-01-19 19:30:00'),(11,275.75,11,'2025-01-20 20:45:00'),(12,350.50,12,'2025-01-21 21:00:00'),(13,125.25,13,'2025-01-22 09:15:00'),(14,225.75,14,'2025-01-23 10:30:00'),(15,175.00,15,'2025-01-24 11:45:00'),(16,275.50,16,'2025-01-25 12:00:00'),(17,300.25,17,'2025-01-26 13:15:00'),(18,200.00,18,'2025-01-27 14:30:00'),(19,125.75,19,'2025-01-28 15:45:00'),(20,375.00,20,'2025-01-29 16:00:00');
/*!40000 ALTER TABLE `kasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasa_ilac_hareket`
--

DROP TABLE IF EXISTS `kasa_ilac_hareket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kasa_ilac_hareket` (
  `idhareket` int NOT NULL AUTO_INCREMENT,
  `idkasa` int NOT NULL,
  `idstok` int NOT NULL,
  `stlnmiktar` int NOT NULL,
  `toplam_fiyat` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idhareket`),
  KEY `idkasa` (`idkasa`),
  KEY `idstok` (`idstok`),
  CONSTRAINT `kasa_ilac_hareket_ibfk_1` FOREIGN KEY (`idkasa`) REFERENCES `kasa` (`idkasa`) ON DELETE CASCADE,
  CONSTRAINT `kasa_ilac_hareket_ibfk_2` FOREIGN KEY (`idstok`) REFERENCES `ilac_stok` (`idstok`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasa_ilac_hareket`
--

LOCK TABLES `kasa_ilac_hareket` WRITE;
/*!40000 ALTER TABLE `kasa_ilac_hareket` DISABLE KEYS */;
/*!40000 ALTER TABLE `kasa_ilac_hareket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasa_personel_hareket`
--

DROP TABLE IF EXISTS `kasa_personel_hareket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kasa_personel_hareket` (
  `idhareket` int NOT NULL AUTO_INCREMENT,
  `idpersonel` int NOT NULL,
  `idkasa` int NOT NULL,
  `islem_tarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idhareket`),
  KEY `idpersonel` (`idpersonel`),
  KEY `idkasa` (`idkasa`),
  CONSTRAINT `kasa_personel_hareket_ibfk_1` FOREIGN KEY (`idpersonel`) REFERENCES `personel` (`idpersonel`) ON DELETE CASCADE,
  CONSTRAINT `kasa_personel_hareket_ibfk_2` FOREIGN KEY (`idkasa`) REFERENCES `kasa` (`idkasa`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasa_personel_hareket`
--

LOCK TABLES `kasa_personel_hareket` WRITE;
/*!40000 ALTER TABLE `kasa_personel_hareket` DISABLE KEYS */;
/*!40000 ALTER TABLE `kasa_personel_hareket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personel` (
  `idpersonel` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idpersonel`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
INSERT INTO `personel` VALUES (1,'Ahmet','Kaya','05321234567'),(2,'Ayşe','Yılmaz','05431234567'),(3,'Mehmet','Demir','05341234567'),(4,'Fatma','Çelik','05531234567'),(5,'Ali','Şahin','05351234567'),(6,'Zeynep','Arslan','05441234567'),(7,'Hakan','Koç','05361234567'),(8,'Elif','Polat','05541234567'),(9,'Murat','Kurt','05371234567'),(10,'Derya','Öztürk','05451234567'),(11,'Hasan','Aydın','05381234567'),(12,'Esra','Güneş','05551234567'),(13,'Kemal','Kara','05391234567'),(14,'Sevil','Eren','05461234567'),(15,'Burak','Aksoy','05301234567'),(16,'Seda','Doğan','05561234567'),(17,'Okan','Başar','05311234567'),(18,'Ece','Gül','05471234567'),(19,'Can','Yıldız','05321345678'),(20,'Selin','Ünal','05481345678');
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recete`
--

DROP TABLE IF EXISTS `recete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recete` (
  `idrecete` int NOT NULL AUTO_INCREMENT,
  `idhasta` int NOT NULL,
  `recete_tarihi` date NOT NULL,
  PRIMARY KEY (`idrecete`),
  KEY `idhasta` (`idhasta`),
  CONSTRAINT `recete_ibfk_1` FOREIGN KEY (`idhasta`) REFERENCES `hasta` (`idhasta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recete`
--

LOCK TABLES `recete` WRITE;
/*!40000 ALTER TABLE `recete` DISABLE KEYS */;
INSERT INTO `recete` VALUES (1,1,'2025-01-10'),(2,2,'2025-01-11'),(3,3,'2025-01-12'),(4,4,'2025-01-13'),(5,5,'2025-01-14'),(6,6,'2025-01-15'),(7,7,'2025-01-16'),(8,8,'2025-01-17'),(9,9,'2025-01-18'),(10,10,'2025-01-19'),(11,11,'2025-01-20'),(12,12,'2025-01-21'),(13,13,'2025-01-22'),(14,14,'2025-01-23'),(15,15,'2025-01-24'),(16,16,'2025-01-25'),(17,17,'2025-01-26'),(18,18,'2025-01-27'),(19,19,'2025-01-28'),(20,20,'2025-01-29');
/*!40000 ALTER TABLE `recete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedarik`
--

DROP TABLE IF EXISTS `tedarik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tedarik` (
  `idtedarik` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `firma_adi` varchar(100) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idtedarik`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedarik`
--

LOCK TABLES `tedarik` WRITE;
/*!40000 ALTER TABLE `tedarik` DISABLE KEYS */;
INSERT INTO `tedarik` VALUES (1,'Ahmet Yılmaz','Sağlık İlaç Dağıtım A.Ş.','05331234567'),(2,'Mehmet Kaya','Medikal Tedarik Sanayi Ltd.','05337654321'),(3,'Ayşe Demir','Global Farma Dağıtım A.Ş.','05349876543'),(4,'Fatma Çelik','Farmatek Sağlık Ürünleri A.Ş.','05341234567'),(5,'Ali Can','Hızlı Medikal Tedarik Tic. Ltd.','05343456789'),(6,'Zeynep Koç','Güven İlaç ve Eczacılık A.Ş.','05344567890'),(7,'Hasan Bulut','Şifa Medikal Tedarik Ltd.','05345543210'),(8,'Emine Aydın','EcoPharma Dağıtım Hizmetleri','05346578901'),(9,'Burak Öz','TedMed Medikal Sanayi Ltd.','05347567891'),(10,'Elif Şahin','İlaç Market Dağıtım A.Ş.','05348567890'),(11,'Hüseyin Çoban','YeniŞifa Sağlık Ürünleri Ltd.','05349512345'),(12,'Sevgi Ak','Eczane Tedarik A.Ş.','05340543211'),(13,'Murat Karaca','MedCare Sağlık Ürünleri Ltd.','05341567890'),(14,'Duygu Tekin','FarmaTedarik Sanayi ve Ticaret Ltd.','05342567891'),(15,'Cemil Arslan','PharmaLine Tedarik Ltd.','05343512345'),(16,'Buse Güneş','SağlıkYolu Dağıtım Hizmetleri','05344567892'),(17,'Cengiz Öztürk','BioFarma Sağlık Ürünleri A.Ş.','05345567890'),(18,'Hande Er','İlaçPlus Medikal Tic. Ltd.','05346512345'),(19,'Eren Uçar','Eczane Tedarik Sistemleri A.Ş.','05347543210'),(20,'Esra Yıldırım','ŞifaMed Dağıtım Hizmetleri','05348567892');
/*!40000 ALTER TABLE `tedarik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 16:38:19
