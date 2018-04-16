CREATE DATABASE  IF NOT EXISTS `cheapo_build_log` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `cheapo_build_log`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cheapo_build_log
-- ------------------------------------------------------
-- Server version	5.6.37-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'I got MSI GTX1080 Gaming X and it\'s pretty good. Very quiet (which I value a lot) and runs cool.'),(4,'Seems like this is a popular choice, I reckon it does not have the blower style cooler other people mentioned?'),(5,'I look for features. Do I use lots of drives? Look for one with more sata ports. Do I use lots of fans? Get one with more headers.'),(6,'The great thing about PC gaming is that as long as you have a keyboard and mouse you\'re good to go. If you want something nicer you can have it although it\'s not necessary.');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_permission` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_islocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'News and Announcement',NULL,NULL,NULL),(2,'Central Processing Unit (CPU)',NULL,NULL,NULL),(3,'Graphics Processing Unit (GPU)',NULL,NULL,NULL),(4,'Peripherals',NULL,NULL,NULL);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_thread`
--

DROP TABLE IF EXISTS `forum_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_thread` (
  `forum_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  PRIMARY KEY (`forum_thread_id`,`user_id`,`forum_id`,`thread_id`),
  KEY `index2` (`user_id`),
  KEY `index3` (`forum_id`),
  KEY `index4` (`thread_id`),
  CONSTRAINT `FK_FORUMTHREAD_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FORUM_1` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_THREAD_2` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`thread_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_thread`
--

LOCK TABLES `forum_thread` WRITE;
/*!40000 ALTER TABLE `forum_thread` DISABLE KEYS */;
INSERT INTO `forum_thread` VALUES (3,1,1,3),(4,4,3,4),(5,5,4,5),(6,6,2,6),(7,7,4,7);
/*!40000 ALTER TABLE `forum_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_bio` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_perm`
--

DROP TABLE IF EXISTS `group_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_perm` (
  `group_perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  PRIMARY KEY (`group_perm_id`,`perm_id`,`group_id`),
  KEY `index2` (`group_id`),
  KEY `index3` (`perm_id`),
  CONSTRAINT `FK_GROUPPERM_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PERMISSION_1` FOREIGN KEY (`perm_id`) REFERENCES `permission` (`perm_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_perm`
--

LOCK TABLES `group_perm` WRITE;
/*!40000 ALTER TABLE `group_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rig`
--

DROP TABLE IF EXISTS `rig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rig` (
  `rig_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rig_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_processor` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_ram` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_motherboard` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_GPU` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_PSU` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_cooler` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rig_case` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rig_id`,`user_id`),
  KEY `index2` (`user_id`),
  CONSTRAINT `FK_RIG_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rig`
--

LOCK TABLES `rig` WRITE;
/*!40000 ALTER TABLE `rig` DISABLE KEYS */;
/*!40000 ALTER TABLE `rig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_permission` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_rating_like` int(11) DEFAULT NULL,
  `thread_rating_helpful` int(11) DEFAULT NULL,
  `thread_created` datetime DEFAULT NULL,
  `thread_islocked` int(11) DEFAULT NULL,
  `thread_iscommentlock` int(11) DEFAULT NULL,
  PRIMARY KEY (`thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (3,'How do You Choose a Good Motherboard','All other parts of a PC make sense except on how to choose a motherboard. Like which are better than others?','default.permission',10,2,'2017-10-23 00:00:00',0,0),(4,'Which GeForce GTX 1080 to buy? ','I\'m going to be moving from the US to the UK in a few months and thought it would be a good time to upgrade my GTX 980 to a 1080. \r\nI got a bit confused with the huge variety of 1080s available and was wondering if someone could provide some pointers. \r\nIs there a particular model / brand considered usually the best?\r\nFor less than $600, should one just look for the highest clock speed when picking a model?\r\nI saw the \"Asus STRIX-GTX1080-O8G-GAMING\" as having the best score on pcpartpicker, but at almost $700 is it worth it vs a Ti?\r\nIs the \"boost clock\" an indication of how much one can/should manually overclock it, or the max speed the card will reach when it decides it needs to activate the boost? \r\nThanks in advance!','default.permission',5,7,'2017-10-23 00:00:00',0,0),(5,'Gaming peripherals','Hi I was thinking of getting into PC gaming and was wondering if I needed a fancy keyboard and mouse or if mine would do. I have a normal Microsoft wired mouse that uses light not a ball and a old dell keyboard that came from a old PC I had. Please reply. I would like to know what you guys think.','default.permission',3,4,'2017-10-22 00:00:00',0,0),(6,'i7-8700k 5.3Ghz at 1.32v Stock with X62','After reseating my i7-8700k, I was able to do a stable 5.3Ghz on 1.32v peaking at 85C while at 100% load with Prime 95 for an hour. This is with my Kraken X62.\r\nI\'m guessing there was not enough thermal paste, so I just reapplied it and instantly 20C cooler. It was at 5.2 so I decided to push it up higher.\r\nHere\'s the spec list: http://valid.x86.fr/wqak3t\r\nThought you guys might want an update! Thanks for the help on my earlier thread.\r\nCan\'t wait to delid and push it to the limit!','default.permission',2,4,'2017-10-24 00:00:00',0,0),(7,'What is the RGB thing about in pcmasterrace?','RGB stands for Red Green Blue and basically means you can change the color of a light on your hardware, often a logo on something like a mouse or the backlighting of your keyboard.','default.permission',0,0,'2017-10-24 00:00:00',0,0);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread_comment`
--

DROP TABLE IF EXISTS `thread_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread_comment` (
  `thread_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`thread_comment_id`,`thread_id`,`comment_id`,`user_id`),
  KEY `index2` (`user_id`),
  KEY `index3` (`thread_id`),
  KEY `index4` (`comment_id`),
  CONSTRAINT `FK_COMMENT_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_THREADCOMMENT_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_THREAD_1` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`thread_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread_comment`
--

LOCK TABLES `thread_comment` WRITE;
/*!40000 ALTER TABLE `thread_comment` DISABLE KEYS */;
INSERT INTO `thread_comment` VALUES (1,1,4,1),(4,4,4,4),(5,6,3,5),(6,6,5,6);
/*!40000 ALTER TABLE `thread_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_first` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_last` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_username` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_nickname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_password` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_address` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_rating_useful` int(11) DEFAULT NULL,
  `user_gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_registered_date` datetime DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_picture` blob,
  `user_age` int(11) DEFAULT NULL,
  `user_bio` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_rating_helpful` int(11) DEFAULT NULL,
  `user_rating_like` int(11) DEFAULT NULL,
  `user_thread_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_password_UNIQUE` (`user_password`),
  UNIQUE KEY `user_username_UNIQUE` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jose III','Occeña','grdgyyr','j','12345','granplains',0,'M','2017-10-23 00:00:00','1998-12-12','grdgyyr@yahoo.com','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0�iq\�\0\0\nwIDATx�\�]LSi\Z\��|\�i�-�������\��B]1#\�\�F�YG\�If&Y\�Y�L�g�2��Y�n\�7dܛ\�dՌza��Xu\0�u�`\�PP\�(D\n\�V[\�\��X���p\�9���~dW�\�{��\�}\�s\�\�\�I\�\�e5\0v\�\���t/\�\�Ӵ\�)))����\0\0�\�4���\�g~�LÏ�;���T.i�y `�c�\rA1�:u\�)\0_�)\r�ό!�\�il?,K^,U\�e\nH�z8̦���%�@�\�V��|�=.L�}	\�\�G��\"\�\�b�4g\�6�0\�3n&�O\�  TC�\�B�,�w\\�Ø�?*%�@����:\��u�\�c��\���3���\�\�~6h�~�\�.�G(�\�C^�B�\�vX�\�iǝ3[PN�B��;~\�X\�\�x	6S��d<\�\�t\Z\�\�f\��>��U~�\'pEyHK_F[��`\�;fǸm$��u���րAD\�b\�-\�S\�͸�el�X(H�3Y��|㖈�bu\���H$E\�L�w�\"0\�\'6O\0����>�tS�T	�OG`��44U{��\���	қ m���gx�nk\�~$2R%\�u\�4�/��vD�eQ	����e�E�գd�\\���.Ԇ4�Pz�n��A@�\��\�{-�&�|\���T�>:\��\'��\�\nL��p�>�\�M���\�C\���`3�\���\���`#G��\�n\�r�\�s\Z�\��1ؼ\�mY�\�\�W#K(ŋ\'?czj\n\0�r\�f���\"[Z\0 0yrY�\�\�(�e4�\�-�A�|u\�7�ŅT���1ԇ�5\�\�T�\�8\�K6Y\�s�|e��Ad\nD\�T\�\r\�m�\�\"�x�3&<\�P�`#e��lz\�LP�.�{�~U�:\�h��uh�\�	f;����xc��\�O��~OOO\�\Z _W�(��\�\�\�#5XP��B\�MB^>\�\�T\0�$��\�`t��á\�T\0��0^��\�J6\���Cס>`\�܏�\�/E�d2%I�\n\�iz\�?��֦\�uJJ\n\�\0S~��K�R\�\�\�\�Eq�f14n��\�r]L�E\�YP\�B]���QP�\�=� w\�\�P��	]W�\r+O�W��6�R\Z\���\�\��\rm�\�!��C�J�C�+(e\�\�\��}Kn=�n\�}>�6@\�\�B\�߶!�<���]kPV��n$\����b�<�<\';��m�� ��މY\��.ȥ4\�b�\�\�ɓ\0���\nTWW� ��/wo�7�\n\�m*5�\�ѣp�ݐH$����N�<w��\�\�I���ަ\��\�\�^>|\�n\0\���N�9s���P�T�\\[\�\�\�\\hV�`sz\�\�$2P��\0p�\�I�4:��\�DC}#��V\�ȑ#\0���Ehl{\�\�x\�m�yK,\�\��\�\�4>ȸ\��\�U2Z9�U2|��/��b\r�oۀ�6�\�\�W$C&+gϞEC}cX}C}#��g\�/L\�c\"f\�dg��[ZZ\�\Z��ׄ\�\�^hV�h\�\��\���<!/\0P__ϨSCCC\�:֑(�MQ�%�A�\�\�F&+1�g�$��m�f\�w��\��=&��\�#��\�\0\��gh~8\0\0���A�\�*\��>�� t:\�ݍ��o\�\��qԝ�Y�̰z�$Ǐ���o�mX��o\�\�ߏ9��}�\�\�Y�L|��A\�ٳ�m�`dv\�h��v*�\n�����\�:\�\�ւ\�\�\0\0�y\�n\��E\r�ҏo\���r\��QSS���p8�T*\0@cۣ�\�d&��\�p\�f\�߶.��\�b�J�\n5\�\��\�\�\���\��\�E\��9p�_\r�Z_�ʵ�\�\�t���h~8�[�|�\��\��ϊ	\�c3z�q�]t:	�@�bxl�y\�Kخ0\0d\�\nQ�\�E	��*\nr�\'\'\��` \�k��؇L��\�iJ�\'���\�\�?G\��ؼ(�M$����>\���1<\�h�\�,�\0D��*���z\Znb\�\�CZ:Ab\�YȖΜ	셵���n�\Z\��\�	(\�\��n\�%�\�U�eF:���ٸ�#0߿�lY!To\�HY��N�@����HY���\���:\��Kxn\��\�\���I!\�\��-�!|N;\�\�a�m#����r�D^�e\�K�/���Ḥ�$\�\�$\'H/zo^���+7l�=c\�i�DkP:���\�\�/i\�~:�\�\�2�Z��A�A�[��\�\�Q<a6�9d��{\�s����_�)\�\�]F�!\�\�#6\�粃\��!\�D�\�r�MTJ���>A\�Lpe$B��pY�)߻�r;�\�?#G�_��$\�E�\"]�\�,x\�\�\�uD)���cȄ)?	�ˇX]\�h0\�\'`\�n��Y�(���\�\n<\�h��ǀ>\�U\0��U\�m�D��D�;\�.@5@O\�7��{\���]V�`F�ل�\�&pDR�섌.\�0&IC���J-\0D���j�\�\0S~�MX�\�N\�?\�R\�\�+��\��1�\r\�t81�>w\\��\�:�-+d|\\Q^\�n�ӎ�{��G)))ᣀ��m�ŋzss��\�C&L\�\�&I/l�np�\�e�x�����b�x��7qDҸ�Z\��Ka�]�ޤx�a�!2�)?�{�\�\�b\Z_7\"\�Ah=`>\�:�z-)^�����`�נ��7��6�\�\�\�\�d��\�\�B\�\�}�/\�)#\�r`\�\�]x\�\�\�\�\����t\�w\�jh\�	�~��@^�<\Z\�\�v�\Z\�!V�A�qKT\�\r\�b�ۀ�;M�`\�(0�ē0�-+�D�g\�Zj\\\�aX�\r��b\�!\n&N%,iJY�Be�{�}\�[_l�\�X\�6�`\�T\�\�\�.�a��\n�x���´��9`\�F�(��y�\�s\�\�s9\0L\�N���\�\���\�νa\�6�X(`l�`�\�\�%|U\��`\�\0\�4��unc.�R�\�\'9u�\"}�H�\���>\0\0\0\0IEND�B`�',19,'testing my awesome bio','9778244557',0,0,0),(4,'Jake','Lawrence','LXED394','dudi','jake','Manila',0,'M','2017-10-23 00:00:00','1995-02-28','jake@gmail.com','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0G\0\0\0^\0\0\0F��~\0\0\0tEXtSoftware\0Adobe ImageReadyq\�e<\0\0&iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c067 79.157747, 2015/03/30-23:40:42        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CC 2015 (Windows)\" xmpMM:InstanceID=\"xmp.iid:0BFCE32D855D11E78DCFA65D9F0BD0CF\" xmpMM:DocumentID=\"xmp.did:0BFCE32E855D11E78DCFA65D9F0BD0CF\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:0BFCE32B855D11E78DCFA65D9F0BD0CF\" stRef:documentID=\"xmp.did:0BFCE32C855D11E78DCFA65D9F0BD0CF\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>j\�s\0\0PLTE����\�덵\�\�\�\�\�r����\�\�\��~��\���\�\��\�\���\�\�\�\����蜼㛾ꔹ薵\�����\��\�\�\�\���\�\�\��\�땺聝\�\���\�\��\�\�����\����\�\����\�\��u���\����ͬ\�\���������Ɵ�\������蓸\�\�\��\��\�\��\�듲\�\�\���\�\�����\�쎵瑸\�\�\��\�\��\�뙸\�����\�\�\��\�\�뇤ɍ�ѐ�瑷\�\�\��\�\���\�\�\�\��\�\���\�\�\��\�\��\�\��\����\�됮\�������\���x��\�\����\�\������\�T\0\0\0\\tRNS�������������������������������������������������������������������������������������������\0�m\�\0\0�IDATx\�\�\�g�0\0\�DQGժ��\�e�\�\�k{\����|�\�q$\�L\�w�#$��e� ��&\�\�@&���\��$v@\\�9\0�����@)\�0	Ș�ґ��\'�3�=\�\�^?�C�+�J4j_>���\�QK2pC\�\�Bs�\ZW\�]U�t-�x\�<˔U�Ka�\0\�􅌪�N\�p\�\�T\r2/�\0\�l�\�:\��\�\�\�Z�Q_^� t79W*�y�h\�D�\�\�\�wB�qK.��C�q�8\�-%��6h������1coN{\�\�E9��\�1\�iS\�\�XG\�g�tv\�:$\�:H\�(oCfMQ�kuGi\�z�A�qGQ����\�\�LN$�� \��U��h�|\�;�fw�ș\�\�:\��f���\�C��\�^5r*vl���*:\�\��\�4/E\�i\��9�\�\�\�\�\�q.\�{��S\�i?\�O\�\���F6\�N툞�ɩnQz�G��\\j\�\��n~�\�D��@#ڜsS\�2@�~1j\�Mξ\� ����\�\Z\�\�S\"қ���,žE�4H�Q��A\�d\�K\�\�ij\������%w\�_\�(:Q�\�5ӛ\��nX7���Q\�K��s\�;j\r\�{rc\�I\�@8�)Vnp�8g��3y�j��WoH�a7*\nhx�\�4bLuA\�\�ŎU\�M*�\\�ⶮi~j�\�@\�t\���\��M�\�4�\�\nv\npV\�s~\�\�\�\�\�bX�\�0;0Q,Ɖ���^IRR�%hx^�TdЀr\�ޮ�7Ze�lM\�6�u\��V�F:C\\Xw�k�G\�L�S��eә\�.>Z�0rL�ֶ�~?\n^w�0ӂW\�Z\�wL\�訨k\�۹(v�p\�j���<\Z�\��ح\��aG�b���u��u\�#\�1IX\�v�s�\�A{��b\�8��+X�Y�N�R��~^\�6\�\�ͮw\�m��c[�%��9�qבּ��\�}�(�v4�XO\�\�D��ڱ�\�aj�����u�r-��Q\�����J�`\Z~\��\'�\0u-e\'iE�\0\0\0\0IEND�B`�',22,'testing bio','9183099155',0,0,0),(5,'Lyndon','Ampatuan','Kola','Kola','lyndon','Mandurriao',0,'M','2017-10-24 00:00:00','1997-08-15','lyndon@gmail.com','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0�iq\�\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME\�\n65N\��\0\0\0tEXtComment\0Created with GIMPW�\0\0dIDATx\�\�MhA\��)=x��Ƅ��T/*֋1\�%�Qo��z�\"VP����E)(\�BojU�hb<hE{\�Xj�$�`!\� \�a\�\�̘�\�\�nZ\��.��\�ɾ߼yovׅ\���ɟ�dꕩs[~\��\0\�cCO�5��<W͟�?�e�\�?��oe�G1\�\�# G�g����e\�$I�\�\0�ͱ�\�\�\�\�\0��z*2�[\�N�\�B�\�	�c\0\�\�\����BG�\0\0aL\0v��N��k��V&@#�k�co\�]%�;�M�\�K\�\�o�\�q��\�\�+\�\�0\�\�_��j�qu\0`\�\���`\"%k>(\�:�E��\"A��\�eJ�6d\��-�\�y�\0`[�\�RC\�0\Z�d݀\����9\�\\*0�1k�G�үM�5>G���[a=_��9m\�\�G��+5&�i	�\�G\Z\��_Yhj��\�_\�Ũ\'�\���\0g	 ߛ�?��(p*)\�zc㙍2������Gt\�*PQ?�\�8�0\r\��T�(w�\Z�ۀJ�k �\�Z�sU�L�]X\�ȴo��_�z=+7�	�ԅ6l\�\0\0���C\�\�/cJ�\�֣J�\�\�%&�*�o\�d\�\�Ϊ5k\0=2=s\�R��6\0�\�\\f�\�����g��L�\�k�d�ŀ�o	��\�-`\�\Z��B\�#�?\�*J�.T\�\� )\� P@\�\�Z���{�\Z3иv�/0N\ri�.֪V~\��\�\�\��/R\�鄉��j��\�by=@�\��V\�3�S�$�\�\�I�\�+2v`�L�<�Q*\�<>]h��\�d��:	#�}�&�~�\�ӳ\�D\�E\�Q�|�8e~;10�}�\�{<^G\�\0��\0���\\��\�\�\0L\����3�p_��\�\��J�\�\�`v�7!�L@.���?:/\��j�vJK�\�o�}![w�	\��r�	( ���<�?�����\0\0\0\0IEND�B`�',20,'testing bio','09775488764',0,0,0),(6,'Natasha','Yogore','Shing','Nat','natasha','Sambag',0,'F','2017-10-24 00:00:00','1997-12-19','natasha@gmail.com','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0�iq\�\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME\�\r$qc�\0\0\0iTXtComment\0\0\0\0\0Created with GIMPd.e\0\0\Z�IDATx\�\�y�\\Wu\�\�\��^\�Wuk�d˒-�̀M��\���\�1��%3l�1�m�fafH▱;eH lɰ$-`\�\�`$yE�d������-���Q\�Bx��\��5:�\�\��ԫw\�\�ܳ\�s~\r\'\�$���t�N\���$\�\�H\�	\�.�`*`ấ_;}YU\Z\��|��PQ��\�\�Й\�k\��UM\�t\�F	�P\�}߽�A\���}�I�םp䢊\�dQ�����7�\��\�U\���K\��\���\�S��A+�/���\�蹣E�>\� \�]�\��]�^1!�`$9��_\�\0�\r\���\�\�\�\�0 (!�~�\�{\n\"��iP�V;���q\�@�����\�-=\�\�\��F0\'0�k1?v�\�^7�sU��*�$�9 B\�U�\�6=BV���\�\�m�$H�\�8��\�orB�\�\�.������S��S2��yHm�\�S3���\��\�j@\n�\���D�\�̞�j\0����̞�4f\�C\ZW?��ȯ���\��z⎯�\�1\\�m��=�p�*\��\Z-D\�M��:�5�N��WyT�x�P�m��?\�\�W\Z c���5�%T<�\�6ә=�\0���\��\�c\�O{\n�|\�#ȇ+ˋ\�\��аyf\ZՔ�|\�ܱ�\'��n\�\���\�\�\�o\��~s�w�$V���-\��eUA�qռ\�\�I}����\�\��f�Ԧ�\�\�\�\�+���\�\��\�	\"BXJ` ��=F�y\�s���\����y\�\�:�٦F\��\�_�\���IA^��	�}��^\�|g1\�l>tdX����@|\�FOX\�̞Z4�;�[Wn\�\��_�G�m\�H٥A@`\rA`\0�Q�A1��\�7\���\�\�\�\�}�M\�*�q�a\��\�\�g�\"\�E��\"T\�װ���\�d��o��{^i\��\\�J�\\��Ғy�\�\���Z�=����_9��\�\�\�=��@Z�m\�\���ad��\�k�?k\�.���a�Ze4)�|D`��z,J�#@9ﱏ\�Iˑëܹ�����o\0�x7PZ��jQD:�٦\�p\�tC:��\���i�\�{�\����V\��WοF\�\���\�?�ϾuM\�~\���ψC�\�\�@\��\�1�Ðe�;\�\�s@��\�l��\��m�\�\�Q�D1\�Q\nB��<�\\�E4#�੎�rʆ\�ؔ\'��\�&R\�կ|/]��We(�J^�\0Q1��aå3v\�uW�\����\'C��\�\������\�U���\�\'�\�\�\�M\��~�����>\�\��\�.�0\Z3�p��\'���\�<΄�i\�\\\'�\0! ��\rcQ,�`l�\�2��>C\���\�\��;vlgb�ʾ\�\�\n��\�Ɓ�\��U)�\�D$�\�.KewYB��\�ckV\�\�B=\�\r�w\��`�\�q\�D�� D�~)�\�g�	`g�\�*C)N\r� @2d�\0\�~\��TȂ�L\r)]?�\�$\\&��\0\'�\n���7\�|�ɯq�gpd�\�\�\�Ne�3��\�:|_:Ծ\nP���Qt`Q i�8�ﺩN�0u\�\Zm��8׀G��aR}ܔu֙\�y�\�\�Й=5)\�.��\�Z\�]\nNHW\�\��\�����,�\�fv�{>�U\�\�>\�\�<�	���|�D�\�1\�9D!0\n\�I�=\\�0��\�᳔v�\�ퟹ5*�c_�c�8\�8\\G B�\���,\"� ��a\�Y\�0�b	g�w|�)}V�\��	]hT��Z}��9�c�;�E\�h\���\�?ܜx\�=�\���Po���@a|\rr�ɑ�!�\�H�5!�\"�<FA�Γ\�1�jS\�s\�\�[\�\�\"\�3�~if\�>?\�\�\��+�\��;�H\�\�@���S4�\�\�\�z�g0 �m�(\�.\rRa72m&�R\�\�;⌓\�d\02����!\�оs�߶���\�2zGsL�J�޳~�\�\�e�����X(� Wfa�ET�@$\��I�@�%�� dX<��C4E4�\�8�|\�yl��wz\��\�m;\n#��L�	;\�\��\��}aw~6y\�\�\�wD\�ρ\�Eh����L��y ƀDB\�Qy\�\�\�`���\�>+54�)\�8\�\�\�M?7\�\�\�\�4\Z��v~��g\�\�\�\��$����\�w߽\\s\�Ѝy�3�&�2\�\�\�`2K�B�eX�b\\�\���\�h��)\�R<#Ő�\�۶\�03Q���vCi��N\�_~\�3�r\�N\�:p;�m\�\�?}\'TB\Z���\���a0^|/5�AXO\�Mz,+jLw�V�xIM\��\�\�/�\�X�x��FL�\�gR~\�#�G\rݒ\�Cw�\�\�	8e7|�QNE%B\�b\�(\�}F(`5\�j��C�\�\�S�V(\�C*\�<�\�\"@.4\�#\�\�j%\��oy\�s\�Eq���\�w�\�^�bv\�9���ގ�A{x�Bmno#ˌӡs�q��˝u\0\�\�]#�\�TR�Jf�0\�ݥ������e�o�\�\�^\�\�G�\�\�آk�\�\\�}�Ζ]�a����4�v�\���.b\�\�3H5\0�Xc\�[�@)J�<�(�x�X���@h��r���\n�Bn 4b\�+7\�I���\�\��O\�\��\�滷\��\�ѻI\�#�Z�p<���~�~�\�~���t�\�X��RZ\�]\�ƻ\���� p\�\�\�\�\�{U5o\�\�\�V�\�\�\�\�L�N�a�\���\�Z�\��a%\�\��L�N�u\�*��\�Ʀ\�%E�\�\ZC\n���`\�\��W�X\�Q�x��y�\�ϘP%�\��\�K_I\�y�P����(O�lݹ�;n;���\�=�\\�V+�>��?~�\�/���~�\�FE�\0a�dT�5�hdV�#\�\�Uu��jƫP\�\���e�\�K�B2\n�bF/�\���4HȂ��\�2��CP I���6��)���*+qBf.$g��\\D�\�#bȜ�d�$ˈ$�K/SV�	͵>m�\�[BE�� :iJcy��?\�\�0VB\�t#ORR\�AB~�ȶK�F�c�\�柉\�4�\�w\Z{\�fp�7Eɂ\�\�\�=5\�{�\"���\����\�\�Y�\�\�\�˖\�*Y��8�̭t�\�5$��K��!����$\� \�B����A-8	�\�\�]�\Z%?\�l�9V�bz$�R_\�\�Ҕfc�r�H7\��\\�B\�S��o�\����,H��&\�e����\0�?}E�c���\�##jE�i�%\�\Z\�����+;6\�+9F�\�X\rR�Pq��lg3\�X4���\��J\�i�-\�\"=�(���\Z�\�*X5�b�6��\�\��*\�\�~\��,��iwc\'�ޓ:�Y����\�G`[�\�]�Ѝ22��\�@,��\�l߶��>u+\�J\�\�ݥoY\�ݸtn�hj�\�0܌ȅ$�q�\�a\�K�t�\\�A�\��\�Y�1\�Hy\�\��\�\�?aqiU��Ei��!\��zO���\�g��\�\�8ڽ�N?�\�W\�XQo�\�\�&\�ӎ˫=\�:}zIJ?\�\�4!,���,s|\��c�Q<m+�U��x\��q\�t�.�xV;+P�\�U�\�F\�Hk�$h�\�r8\�\�\�Jv�Ƽ<��\�\�\�QX`��D�j<�\�\0\r!�}4\�P؞�\�\�O\�>G�Ԉ�\�<.K(�>STA��̈́�/�8����\�9�*�\���f\�\�Q����\�N\�Lṉ�\�\�뮤~�\�\�8\�S&!��84\��\�v�i���\\\�/{t\�S<��E9\\:��o^�ж�\�I];��e�\�\�\�ҋ�Y���\�\�.\�\�1��\0�� @��@\�)��JH\�=�\�p\��Cl\�~�\\ߋ�\�:\�e^<Y�t\\F7\�\�|B\��d)	NR�\�p&�\�8�\�굙�	_�\�W�\�߇\��\�\�Ll�!?Y�%Kc�^�	~5�;\�&�O��Rz+}JiDxN���q\�|��j.��m�d�,b�\�h�\�Kd���h(d��1\��@�%���\�(\�LR(���\�{\�#��O�F���\�r@�V?%��C��\�Y|\�h%=��\�CQ<i\�`#C\�JňJ\�\�\��h�M|\�m�\�\�Cu�\r\�x*3�m��]�q��[:k\\�Kg�\�\�UXp\�RXIiu�\�\�N\�X�xe���\�f���\�]�Y܏((�\�\�-�\���[S�:I�<B�\�\�@��03HO�\�7�\��y�4M�\Z��s	�X�a�X�L9�0YF���>���y\�\�γΠ9w���\�\�\�M7A�A�\�2��\�g\�d\�\�\�\�sd\�G�\�дy�~����\�+Ќ�c!V\�֘�����\�j�{�!�7Ԍ	,~ş���\�%�H-�%y8\�T5ҸKTLP���J�Q\n\�c���f	A`1\�I�a$(�\��[Ȏ4��A&P\��\�`qԁQ\�Y\�@3�涶�\�\�x�����u\�gh&���\��5�[�\�]�i.��#̕(��֑%t�\r=��W}]\�Kb\� s�5h^\���Kk9�\�v\��~��b4h���\�\�ёq\�\�H\��t�M2�D:�\��a���)>PV;+���S(���\r�S\�k~|\�+\�@=�\�a�-\�2\nq��\�v����b���\�X�M�\'BւVc�x�\rA��\�8\�Ç 0�yJQ@��b�ă3���r�o�*����¡�4+��\���\�����B�1\"1\�	탍Aj;^��֦W\��o���m�,/25>F���.#�B�\�Cl\��E;Yk㓔R�\�xG�\�%N��\���U\�\\Dk�B\�;\�NF\�\�\�^]\�\'��;���=�t\r����B\�H�>D�0(�B��7Ъ\�2���*\�\�;󰡓\\0�\�)i\\=\�6�q꫽�<\�19\�j�F\�-\�<<O^�=4�d-I��`\Zt2`$G\�.`ԓ\�\�X���:>A\��\�Z�\�dz=p\nan\�\�3Z��49K�\\bq��[X�v\�VV�\�E6\�Pȕ�\�\�Z\\�N�>x?4\'CYcJҧ\':\�Ղo\���\�p��4�YЍo���\�*T&rl:e��~r� Yg��Y\�̭�W�x�!$�PIa1fd\�Y+Ct\�b\n��$Y�[g�jF�\�YZ�vw�\\\rl\�\�أ�\�sd\�fee\Z�\�J5gT\�rH\�\�*VX8��� o�@I:��\�}�0>\"b����DD>]�m�ӗUK@l��\�j,��\�J���\�9|�}�\�\�\�aqZ0wh	�Y\�\',D2?(�h�⚒\\Aw`\�BX\r`HC&�\Z3�\�z\��\��#J\�>\��B�%\�\�#�i3\�tT�Ƅ͌|�k`�m!�l_ɫ%YmQ)\�ēv7\�c\�4�{����~X\�T\�Y�m�\�ch2}yU��@�d6�\�\�\�6�u�\�x\�y\�yP\n!\�@\�g���Rl\n\�9\n�bL96<r�.j\��Cp$!h�Db��rS(\��y\�\0b��4\0����vQ���y�z}\�T\�+\�2�N�S\��D�N\�<5M\�i1>\�C��0��~�\�(���QP�\"r\������p�Q�#\�Y0a�\�v����8\��*Q\�yן\\\�\��}�\�\�_d�R?F|ر\�<�\�8�XI��S\�\�;\\\� _\Z�-�e%�hi�NZ\0b\�9\��\n�� ��B�\�Z�\�Eh��(Z�P�}c� \��[n#L���GA-�\�O_\��\�g\�Y\��\�o�\��\r\�\�\�+�%�\�\�;\�E\�ʙ\�یu���a�\�	�\�g>/o~\�kIcG`BF\ne���?�ݱ���}�v��\�a9\�P\Z�0\�\�2�q��E��c\�\�3�����@\�8\�	�z�Y<y��tP72�BC81J�R!MS:�Z�R��\nEl\�q\�\�!Z����\�P,�\�(��}�\�_�jF�ʬ�W�ɾ}�����\�g&�Z\��\'9��qE�\��\��/��wܑl|s5\�5�7>�s�|�x\�\��yFm��o\�4aS�,Ԅ�M\�8p�>�\�\'?Ƿn�Ûrp,��\�\�\�\�^�\���P\�a,DQ@>�cY2�SL\�\�n\�Epl.�����\�\��\�B�\�\�8k\�+4\���CyJ♨\�5\�%/\�\�%/z&˝y4�,,.s�~\�Ot���°�o��Z@\�7�\��ڥS���>[\�\��E,ܓ\�X�O˜� ��uC1\�\�K\�屏{4�~_��7�\�o�#MG�Z|\n�8PUի�Ud\0�L\�c�G\r�E\�a�� 2\�T9��7��*�(G��\�\�\�aש+\"��\�\�\�\�ZK}^���pڢ/��Qg����R?��\�a�\�\��W�z}v�4�\�6u�����R�᧋�>\�c?ͬO��\"t\�z�\�\"�{��2�\�}�٦\�g�ÖUlG�\�(O\�sf\�\��\��a-\'��q�\�>⌒��SO���BV;T��w�2\�\�\��\�rg��[7_S;qm�\0O\�\�\�E\�*>m\�O�/�\nӸf\�\�\�\�#�6�\�u\�Ã@\�����\�\�w\�!�BU�dc\��s�\�/�\�^\�k��&t��<�X�vg������;w�c1��H�ޔ⇊\�̠4Ը�ۀ?v�\��l3{(\�\��\�U��\�z�l\�n\�\�i�\�#\�A\'\�\�/C\��3���xfO\�S��x�Ӷ�����\��7昚�\�7|��\�U09v\�|>-�k\�y\�~`�Ko}\��׉�\�h�\�\�Ձ�[w\����\�\�\�˫��:ŭ�Np\�Ec\��q-y���7\0�\����u��F���O4K_�\�k�\�\�!��O�6\�\�X��v�jm\��*�c�\�\�o}\�\�,>��\��Z\'h\�z�v�9��\��P;�ĵ�\�\�:�xpm\�\�ǖ\�I1�)Yd�U�� �\�D�G\\\�z�5G١/�>\�\\�\�S�h�\�\�%/{ه6}\�\�o6\��c�7(�\�0�L��\�<�\�\"\�����ĉu\�ة�O��6\�\rM#7������\�|��\�����\�\�\��\"R���D\�\�y�`�a��uO�+\0��@\�~.\0\��\06?\�\�\�\�\�s緹�\�a~r\�O�\�_n��\0�\�V8�\�c�\��C�\�v;(p��\�\�\�ށ_�~SU|��GV���@�\�q!\�\�O8����\r(@�>\�l=l�8�\��A��hOö��\�Q \�С\�̞�2fQ\�0�\�D\��?86\�	\�9�:��Փ�K�3�n�\�iw�;=\�T,w_L� kUi\�w\�WT\�w,:�p\�Lo*7\�	\�\�a��\"�U���CV�����;\�\�=`^N0N�E�7�^1�\0\� �u!��\�a\�\�L\�`G-20��\"�7dUUq�\�fw`\�_R\0�b=�\������\��ߧ�w\�|\��S#N��?�\��8�V\�DX~�ՓR\�]2k�ؒ\�H\�O��\�I:I\'\�$���t�NҐ�\���	�\�\0\0\0\0IEND�B`�',20,'testing bio','09773411367',0,0,0),(7,'Clint','Henarios','Clintsu','Clint','clint','Jaro',0,'M','2017-10-24 00:00:00','1998-06-15','clint@gmail.com','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0T\0\0\0a\0\0\0H܆\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME\�	\Z�\0\0\0tEXtComment\0Created with GIMPW�\0\0�IDATx\�\�|i�eWu޷�\�g�\�{���Z=���f�A\�B �\�hllO$�P\�68��T\\�r\�TReWʱ�P�+6`ʎ�\0�8Cm�\n\�2 4��[\�A�\��\�x\�=\�V~<\�\n	\� ���_�\�=�����\�^\�Y{{\�\����=\�a{\�\���\�|��^b��[/y��/�Mv�\�\�)B�\�M6�\0x�\�\�7~�RW�\�\r\�W���Go\�-9\��\�n�\�p{ʽɑ\�ۛ)\�-��}\�\��z��ֿ�RH\�K�\�E��3^u�\�Ǵ���\�}\�\�o�텯��:�|{\�d8b\0];\�(Rk]>ݑR��\�}\��=���\�\��\�\�\nN���\�7�����\�׎^�n\��K\�m�\�Kb�\00�\�A*\�I�p��\r=]\�<�Շ\�cW^1�\�\�/�歗�#�g\�t�\� vW��$@\n)�$��I��9�թ6��[s��i/\�\r�.]!���\�	3\�5�v�v�0`0�\�PV\Zhð�`kff�a�����\� \�N�\�EO(�G�@\�|\�Pہ��a\�Y�PW�AZc��<�4W\�\Z�Z0x\�4��Z�@�|�>;u��Mw~��\�rc%�\�\r_\�\�R\�0�]2;fNBE\�DB�\�CE䇄fC�\�!�\�\�\�\0I:˖}�h�v���8�GN���a\0�;��v\�\�(״ҟ��0��v0\�\"\�h\�z��\�7�\�M\0\�\0\��\�\�\�\�V\�\�ň��\�\�Z�֪\�\�\�Xl�r��[\�$�\0BDD\�̬>w�\�\��2%\�\�\0np\0��&\��G\�i�8\�C�����7XǏ\�Tc��5\�:W\�j\�L7\�C\�A�\�u\�{Ӟ�\�\��\0�:�ڗ\��@J\"�\�\�\�jE�?^`e�Q��f��-z�#\�M5<7\�\���H���\�\��\�N\�\�q�H��\�\�\"h98\�\�1�8TR5c4�:\�h\"i�hu�S>\r\'���-अ3\�ٕ���\���7뺾\�d\0p\�\��`��\�1����%2���b\��Zf�֘�$%��0(Rk\�|p�8|!l\�7	!�\�\�\n�D\�.\�R	�9�\�{I�0\�\r\\QV�u�D>�\�!�\�>�\"�ȇ����\�D\0� �?rɥ7��ǽ^-T\��\���{H\��\�|\��iH\�\�\�P�_r�ƽ��\'y��\�^R]�\�\�\�š��P�\�\�h|\�}�҃M\�\�UHS+]��\�\����۪\�c��\�\0@(����\rk\�\"\�7��<+>p��a\��7���`\�+��+�{b��y�9\�h�O\�\�ּ���H\�J�6��F9\�l��\�v&�a�&X| n{/tčrh�\�b\�\�6��q���\�\�WL�\��Cm\r�\�f���\�S\��\��	II]Un�\�\�;�\�\�MmguV�gX��|�\�ڍ�\�:�����\�>J~\�<r�c�yiET:!�K�CA\�\��N.\"\0!�/㖽rp>�\�\�{��\�+�b�����\�稡b\�\��\�r\�\r*\�\�	\�#\�2�/D���\�\�Z���\�\�\�\�č\����/�h	}\�O_�8;\��\�\\+�K\�.\�Ҍ\�\nL�\n\�α�j�,� )!\�af_ͩ�D\�8��\�\r�\����\r\'��<��\�6���\�O�\��>855\�I��\�	MX^/�\�\�9\�K~@\n� \nО�p\�`��5�\�6ڝ�� a\��O]�\Zz\�\��~q::\"�\\m�Y�P˖ͦ�\'(�$�ME�����F���O�\�)\"���-k\�\�h�N聄x���\�\�Ʃ�c�>\�\�3-k�?�\�fcPX[	vƲs�I\�!�� �\�\0�&H�|̜Nj�+E��=�zb`��$�\�wg\Z�\'t�{v\�I=\�V�eJe�y{P�\�\�&}��\�g\nZ[��Y�u�\�\�xT[\�K\�,&��\�9\�`�\�&\Zdf��ݜm~*�7�C�\�\rB�\�\�\�\�%o�\�۝�^>qr뜦���ѥP�I\Z\�5�Ҡ�yi8/��\�Zc�\�\0bQ�\��\�\'BW$gcj\�5+S�_��\�\�}\�{�\�ξ\���^��gs�L�\"4\�,���L\��R� AQS�	(�EQ[�J\�\�8c�\�X�@�2\�b�l�g\��\r�d���t\�*v?nh�\�׆q�:suQ}�{*����W}�\�?h�寎\�9\�\�F�\�>x��\�,4\�>��ڳ>�p\'\0qց\�M�\�CB\n)IHa\��t|\�\�N2\�\��ë \�\0� I^\�EAE��%HH�^��\��Ň\�|^k\�ҍK\�\�\��~�\�q61X\�V��\�@d\�Dd�������eY8ԅ�c�s\�DB(_\")%�9��͙N��\�֏	/�\�\��P^F!���~$��Em��1Ko=p\�\�//�\�.?���\�m\���h\�?r���\�\�\�\rS\�ۃ�\�/W�\�Y>���dJk�R:i7e\�\�R�G�ଅ��/@י�i��&im�\�Ue]�C�6\��\�\�\���9)�I)��\�6\��\r\�K�\n\"�$���sm�oq��\����\��E���\�@,Z�5oե��=q�=_��\�*��\�~�1\�p\"\�Wn\�k��[%M2\'W\�\��[��N�$n�\�\�N�0��c\0�	�O����\� $Ն�\�5Fi\�t\�P����vkcxC3	�\ZBFpn\�,}>I:7/�`�&`�\�P�v\�\���Z\0b<2�\�򄃓�����Z\�\�Pc�ZJ�\�\�\�\��Z\�]л6��G���٦�n4�_���T��&c��\�pm�5\0�\00�\�8̥\�_nL\�h��$h\�\r!��dm,[\�TAH!��1\�\�\�9���~\�L\�Y\r\�˳\00D��\�V�_�\�#���\��xN|\"/\nێ|1\�\r�8\Z�$*c\� �Y�T\�)k�<Ib�����u-���\�\���+k\�e/Yz\�5\�N�1\�\�xb\�I(E�-㚌a\�Z<�y:�\��\0�����\�ݥ\�\� R�J��\0\"ĉB�P�j\�ҖLD�Kڊ�tp\���\�\���7�\�\�||��\�\�~��{�~}\�e\�\�[\�W���0{J	ef����v����\�`<�ni.$�Y\���0�\�?\�\�F\�y.\�h���:<\�\�b]i\r�d���E:\�\�\�_پ\�Ic\���HI�� $(\��-^\�bmM\n\�DD\�D`��\�\�\Z\�酝y\n�\�?���\��̙�\����l�Ka���u\�,��P\�+��(ƚ\�\�\�rfa>j�m��R)s��mO\ZN;\�m�\"-4g�A6*]�?�@�dcO}i\�}\����1�AD� 8\�H\'\�L��\�A� ��1<�f��\���\��o�i��o#f-���{\�_\�{\'Y6d7ܴT\�5;g1\���u\�I��C�+�>��\�sƒl5E���\�hP\��j�K\���O=��|\��\�G\�c�\�$	�a�\�v;�c\03\0\"��?$rL\�\�\�\�l�ǖ\"n4�7\\;�\�J\�3_|�.\�/�z�g���JB�L�~\�F휣�\�ny}������ǣ�y��8��(��^\�^7\�\�j@��\�ǿ6x׷��|�c��k	\Z���cG\�a\����@`���d\�\�\�Ռ��o6�Fc-|_|��{^�z�\���\'7�%	Sն\0\�_�u\r&�Zk�ð�77��\�lq����\�gA\�ow\�\�y:\'�{�\�*\�K|O@AR;�~�pr��{O\r�;�\�\���\�B��@ZX4C	\�N\�s6��&�\�S>o�oP\0G��m\�m�䵦�>z�\�\��\r\0s��|\�l��tF��u]�\�neJ�\��/\�/Ħ��\�9S\�O�Om�~�A\�/�_\�/\�w#jǊH\0`�q�J[�j�4\�iqʧ�D�\'w����vf\�I\��\�&t�W[\�l \�3A\�,��ÿ�vo�ɾ�q&�X%��&\�\�PO�ZO��A5)�6\�\��톆~M�Y���88\�#�v����/\Z���RGQ\������f\�m\�\�򡍃�<I\0�\�n��½�P��.;:gHw擟��x\�\�g\"Š~��CO�v�V�35Uy\�L G֙�\�\�I���\�j~ս�S+>���\��i�-\�M$�@`Rh�e���%\�\�t��>�b\\9�\�!�NIDa��\�\�_��\�+\�NW\�\�\�\�^�l\Ze㼆�b\�֨\�\�W�{Υ/K�\0~\�#N\Z\����\��8G# Y!�@Q\Zd�Em��&(A���9\�31ڳm0�\��VA,�_޽m<쿣Ȋ~�V\�x�E���N��k\��ĉ�\�ӧ\�\�d�SL�0P�� |�ZХF\�\�p��12\�\�b�?D���<\��\�\�>&\�.�0ڢ.5{���S�\���\�q��;\�\�|��߷4�C�����=�\��\�������+&w;\'�fB䘪\�P�\����\�\'�2 ��KBF�B�F˃P�\�A(�2���V	(s\�ei\�\'��ݵ�R���Ӻ\�}A ~A�f�6#J\0��H��X��\�\�O]sۑ��Ϟ~��R`�ky\�oo:��y�\��CO\�V�X[+O���s\��λ׶>4��ŝ��G��\�V��Q/_y���x\�f\�h�;�\r޿�E\�V��^0\�ȑ�s�\�:�\�\�\�OW\�j\�̑�WL�щ\�i\'\�g/�\�hl;�\�\��n?�\�=�4t\�#\�;\��J�q\��}\��}\'\�+�OW\�8�6���t$�HqQZW�)/f���5\�Or�7�z�ous\�\��\'_b��\�\nj$ %\�G\�1�i�\��d��\�?:��`���+�\�0�Ld;%�>��0���t�\�\0<+�>\�ԳW\�\��\�\�F�x\�\�>Bw�ބ8�	Ų�+bg1�/\0)�aLb!�b�\�hǛ�:49~\�\�_4�a\�\�K�\�9��!!:MA�\00��\0�\�^��͕���AYY�I�ԓ�F���(\�\�\�m\���N\�h;�����9�]`և�p8)dt\�,]zd�z}\r#p�\�Z;_�2/�y\���;z\�\'o�\�P�\�\�3\�K�8�\��ְD+Qf\Zg\�a���~u�\�OG�\�B��$��0L��B	v�\�\�=��2~,]�o� 4��\�(���Roѹ{��\�zi�lH;��T� h6<�\�D2+\�6�\�j\�Jǽ�\� ��uP�0{�\rS[<]2`qq\�\'��\�.�\"ҕ\�IZ�\�\�\�\\�^?k\�\�w\\m:=)��`~1;��ͼ�ǒ&\�\���*$���<�\�1����s�\��l���\n\0��o\�=<X\�^\\�\�\�\�J[g�]Kn\�Dw<ٚ3\�\�\Z\����0�\�dTq��sO�|&����5\�����.����A��<_@�\�Az@�\�C6\�	u\�0��\�¿=:\�\ZR~�m�0(���°\�$�e8\����\�ӕ\��UW]#= AaC��HF^\�}��\�?yն*�x2��l�\�\�N&Yf_H\�\��	\��1�k�\�\�Pw\�;8=e�KzY񱵢\0喉��\�Q\�IN�B��4�}\�\�c\�\�?f���$Qg��\�f~-`\0�\��ң���By^��(\�N��\�\r\�2\�T�\�+X\"ڐ\'$AZ�\�t3�\�$�eA�:k��\0b[\�<5\��\�q\�g \�}Ua?u����#��\0\�ԳE\�w�bO$�\�R\�8����kz�\�s�K�l\0\�B��1\�H(cKE���\�TD���W�G\r\����\�\�~�\�\�\0\��te�����d]���\�iO�,�7&o\��|�f+�s\0=�9��̪F�7���\�e8v��\"_B�����b��\�\r�H\ZpQ˞�����q�Z\���\'���\�ά\�=����\0�\�&�*\�\nI>DD�kCR)\0\��S$ߙ�>���l�F\�,��\�\��L9)O6F\�A\�����.JTZ{��H|�\��:\�8/h\��I��)�n��n(ՊO�D\�\�\�\�,̾�\�\�\�mSQ�sR\�W�E\���\�b����\�%0�\�	�\"\n\�xL\�[n\�\�x\�n��\��&ȿ;l��ΑWx�?B{���_�\0\�p\�B\�b&�^4\�jb�ՀcF\�+�	R\0R\0fO	�R�� !��F�� S\�N�\"i�ҙ\�\�#|\�\�\�{\0�v\�[/R�\�\�7+%QU�\�.n)x�#g��ez\�\�wù�\0\�s!���-a�{s\�\�\���\��]�B �Q Њ=�� r\�\n����j(x�� xz�W�o\�\�.\r��O\��\�K�u_\�\�6`\r��D>�����/P\��>~���zB\�_{!��3\��\�O�A#z���2\Z!P� dE`)	\�1\���<�\��@3RHf�\�� ٌ\�\�3��K\�G\�:�{\0\�\Z��\��)�\n%�X�Rp��J	L\�KH\�	\���\�p|^k�=\���d\�\�]\\�xE�\�\�R�?a\�� ��ĝX����\�\�K�З�A!\n<%�Ya��P�/l\�\�\�t�ҿ\r\�\�˻o\�IA a�!�T�\��\�A(��^���#\�?X\����a�	\0+\�/B\��Zܲ\�82��\�h�t��,](}��9�7B)� 3�$T_\�J\�4��\�`RYT��B\��\�t�~dkp�v��=\�z\�\�t\�Lց�Gh\�5\"O�PB�Ă��e!��%z���\�\�B�N�ZOH	a-���\�Xd��ӼB($\rs�\�2G��8P4��E((�Cj^\���@��0�\�\�\�\��6�a�\�\�d\�<\�\"�@m�u0�����\�Sm�\�6Φ2�\�\��KC��ߪB�bfhc��5ey-�W���s�N\'�<��\�N\�\�UY����\�pg\ZÉaǌ\�\�Gm5c\�\��v�\��j�o\�\�\�\�\�\��F�k\�G謷U\��\�dȟ͆\�p\�//�r=H����yp\�p\�|\�î{�\�n8�\�G4�<��-�z�\�\�h-_�\�\�\�[�M�\�t3�֖Ҫ�v��\����\\\�	1L5�5CI2��J�c}f3��_�7g\��}\0��s�v��!r�\��\�UNm\��į?f��\���=�\�\Z��\�L3!B^iF\�Ʃ����\�th͇�IZ\�\�M�kVDv�\�O?d>+�\�3+�\�v�Cz(k\�R�ZB~�.��\�I\�\�*���4\�B+\�s]r�Qj�\�XV�d1��\�\�\\;�\�V�3[�y�7\�$�N\�_V��\'\�j�B\n\�3\�M��U���\�%W7�r\�,\���K����TY�\�aY�\��0�?:;�NBk03҂\�8�\�\�V:\0�=6��g�{\�sfp�j\��~\�\�}�\�|�<��~ %RT���>��mO6,n��ß�J�\�&Q[[�B�\�9WB꘤�FM,\�^^�\�6�zQ\�Y\��[��Jw*\�s\����i\�b{{�\�;?|�\�:}i�q��p�B��\�~Z��˫\0g��\�9\�ɷf\�LB9��<H\��$R6M�\��t\�?�e��Y\\\0\�U/o*�\�\0NQHRB8�@\�K,LE�7�\�\�\�y�]\r\��g\\��%�s\0ڱ\�ZMZ[4\"��\�]]��\r�O>_\�U\r={\��O\�5?:U����\�I\"��]�\�[yU���;\��\'�p\��O\�g��\�\\ $&��\�\�*z۵�s���z\���G�L�ib��\�Q3zy���=~(a\�۽p,�c�zi\'\�_\0p\�B\'�B9�\�\�_z�>]W��m:+���tl��\�T�&�k�{�.\�5\0\�\���|\�\�!�iNx.��N���=\�a{\�\����]\��K\�\�P�\�\��\0\0\0\0IEND�B`�',19,'testing bio','9185644993',0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_group_id`,`user_id`,`group_id`),
  KEY `index2` (`user_id`),
  KEY `index3` (`group_id`),
  CONSTRAINT `FK_GROUP_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USERGROUP_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-24 16:27:09
