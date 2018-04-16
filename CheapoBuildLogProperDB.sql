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
INSERT INTO `user` VALUES (1,'Jose III','OcceÃ±a','grdgyyr','j','12345','granplains',0,'M','2017-10-23 00:00:00','1998-12-12','grdgyyr@yahoo.com','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiq\Ş\0\0\nwIDATxœ\í›]LSi\Z\Çÿ|\Èi¡-­´´¥ˆ¥­\Ø•B]1#\Ì\ÌF®YG\×If&Y\ÜYLœg½2“¬Y³n\âº7dÜ›\ÜdÕŒzaœ¹Xu\0™uŒ`\ĞPP\è(D\n\ÅV[\Ú\ÒöXö¢´p\è9¥¥¥~dW§\ï{úœ\ç}\Îs\Ş\Ï\çI\ë\Ôe5\0v\Ğ\ÈÁt/\Ó\ÓÓ´\å)))±ˆ‰—\0\0ÿ\î4¶Ÿ¥\Õg~ÁLÃ;œö¥T.iğy `Œcó\rA1À:u\Ù)\0_¼)\rŸÏŒ!ş\Şil?,K^,U\ã³e\nHµz8Ì¦¨ÿ“%”@ñ\ÖV°¸|ø=.Lù}	\Ñ\ÅGúÀ\"\Ø\åb¡4g\Ô6ò0\ã3n&O\Ë  TC¨\ÔB¤,•w\\®Ã˜¹?*%»@¯ıö:\í°õuÁ\ÒcÀ¸\Í·3°¯\Ó\Ø~6h€~‡\Ó.G(Á\åC^¾B¥\ËvX½\×iÇ3[PNBƒµ;~\ËX\ß\Óx	6S¦üd<\ê‚\Ït\Z\Û\Óf\Şş>Ÿ›U~ú\'pEyHK_F[¿Œ`\Ã;fÇ¸m$¢œu¿ş˜Ö€AD\Êb\ä­-\ÇS\ÃÍ¸ôel¾X(H°3Y|ã–ˆõbu\Ø÷ŒH$E\ËL›w¦\"0\Î\'6O\0±ºŒ±>¿tS²T	¢OG`’“44U{¡©\Ú—Œ	Ò› m—Šgx¯nk\ä~$2R%\éu\åµ4€/vD¤eQ	‘•¼•e¢EªÕ£d÷\\ş‚÷.Ô†4±PzŒn–A@·\ç¬\æ{-´&¸|\èö€T»>:\Í›\'ÀŠ\Ò\nLø¼p>¥\ÕMõöÿ\êC\Æù‹`3 \ìıƒ\àŠò°Œ`#G¡…\Çn\ér„\ês\Z¬\Ûõ1Ø¼\å‰mYŒ\ä\ÈW#K(Å‹\'?czj\n\0°r\Ãf¨«ö\"[Z\0 0yrY‡\áµ\Û(ÿe4À\ê-¿A|u\è7‘Å…T«ÁÀ1Ô‡¼5\å\ĞT½\Ï8\ëK6Y\Ës±|eœ–Ad\nD\ĞT\í\r\Ómù\Ê\"¼xò3&<\îP‹`#eºlz\îLP¬.‹{œ~Uñ:\íh»ğuhÁ\ç	f;Á´ú¾xcú\ÊO…~OOO\Ï\Z _W®(©“Â—\Æ\Ü\Ñ#5XP¸ÀB\åMB^>\Û\ÖT\0˜$½ğ¾¡\Û`t¸­Ã¡\ëT\0˜ò“0^¿ô\ÒJ6\æû·C×¡>`\ÌÜ§\Í/E¡d2%I™\n\Üiz\ã?…Ö¦\ĞuJJ\n\Õ\0S~¯œKºR\É\Â\Ú\×Eq€f14n³ \ãr]L‚E\ÙYP\äB]Ÿ†QP\Ë=« w\á\ÅPû	]W¿\r+OW™6—R\Z\îñù\Ñ\Øö\rm\á!ıñˆC¿J†C»+(e\Ï\Ç\Æñ}Kn=ˆn\Ë}>‹6@\å\ÚB\ìß¶!¬<“•]kPV”n$\Ì¶—£b<¬<\';û·m€º §¯Ş‰Y\î¢ .È¥4\Şb±\à\äÉ“\0€ŠŠ\nTWW£ —/woÂ‰‹7ó\n\ïm*5ş\èÑ£p»İH$¨®®†N§<wŸ\ç\ìˆIö¢ğŞ¦\ÙŸ\Ş\Ş^>|\ãn\0\àş½Nœ9sµµµP«T¨\\[\È\è\ê‚\\hVˆ`sz\ï\É$2Pµ¾\0pò\äI´4:±û\èDC}#ª·V\áÈ‘#\0€ªõEhl{\ë\Øx\Ôm‰yK,\Ø\á€\Û\í¦4>È¸\Ûòˆ\ÒU2Z9úU2|õÁ/±«b\röoÛ€6—\Ò\ßW$C&+gÏEC}cX}C}#š›g\ç/L\Ïc\"f\ädg…®[ZZ\Â\Z¤¯×„\Ş\Ş^hVˆh\ë\ç÷\àÁ·<!/\0P__Ï¨SCCC\è:Ö‘(®MQ‹%òA¥\Û\íF&+1»î£–gŸ$‹ˆm“f\Éw…Ÿ\Çğ=&›“\Ş#™ˆ\Ù\0\ÆÁgh~8\0\0¨©©Aõ\Ö*\Úû>ûü t:\ê®İõ¾o\é\Âó±qÔşYœÌ°z±$Ç˜ƒœoŠmX”œo\ê€\Çß9‚š}³\Ç\ÙYœL|öùA\ìÙ³m`dv\İh©»v*•\nµµµ”ò\İ:\Ô\ÖÖ‚\Ã\á\0\0şy\ín\ÌóE\rƒÒo\àÀör\äòQSSƒ’’p8¨T*\0@cÛ£˜\Çd&Œƒ\Ïp\ê»f\ìß¶.‡\ÅbJ¥\n5\Ü\ãó\ã\Â\îÁğ\Ø³\ìE\ÏŸ9pô_\r¨Z_„Êµ…\Ğ\étğøüh~8€[ú|óƒ\Ï”\ßÁÏŠ	\Ãc3zşqù]t:	€@ÿbxly\ìŸKØ®0\0d\Ë\nQº\ç“E	Œı*\nrù\'\'\Ğü` \ák‡¹Ø‡L¸ÿ\İiJŸ\' ÷€\É\Ä?G\ÄğØ¼(·M$”ƒ±º>\ç®1<\íh†\ç…,\0D÷¥*¤¦–z\Znb\Ê\ïCZ:Ab\ìYÈ–Îœ	ì…µ¯¶¾nŒ\Z\ÛÁ\â	(\Û\å¤n\ë%Š\ëUÁeF:Á¦„Ù¸­#0ß¿lY!To\ï€HYŒŸNı@À´Ÿ€HY‘²£\Æö°:\ãõKxn\êˆ\ç\ãóÀI!\Ñ\ê»-ö!|N;\Ü\Öa¸m#¡¼´‚røD^¾e\ÎKû/€ÀÁHÌ£À$\é\ë$\'H/zo^Á¨±+7l¦=c\èi¼DkP:²„ü\â\Ã/i\ë~:õ\Ä\ê2•ZğóA˜Aú[›ğ\ä\îQ<a69d€¹{\ås±™º_º)\â\Û]F°!\Ñ\ê#6\Ğç²ƒ\àò!\ÑD\Ér˜MTJ´ú¨>A\ëLpe$B˜ò“pY‡)ß»²r;†îµ \å›?#G¡_¦À$\éEú\"]\Å,x\Õ\ß\ÚuD)®œƒcÈ„)?	‚Ë‡X]\Æh0\Ê\'`\én÷Y¬(­ÀŠ\Ò\n<\íh†¥Ç€>\ÓU\0óU\ÆmD£‡D«;\ïœ.@5@O\ä7‡¹{\ĞÁ˜]V„`F‡Ù„ş\Ö&pDR¤ì„Œ.\ë0&IC‘®…J-\0Dô²¡j´\Å\0S~­MXõ\ÎN\Ú?\ÃR\è\ä+£\ĞÀ1ş\r\ãt81œ>w\\®ƒ\Û:œ-+d|\\Q^\Än¯Ó¡{³»G)))á£€ùşm•Å‹zssƒœ\íC&L\Î\Ì&I/l¦np„\Òe°x‚Á„Šb°x‚7qDÒ¸†Z\ãõKa¥]¤Ş¤xºa˜!2—)?‰{—\ë\àb\Z_7\"\ÍAh=`>\ï:±z-)^§¯œ‹˜`ô€× ¯™7ô·6¡\í\Â\×\Ñd—ø\Ó\ÄB\é\ï}¤/\â)#\ér`\ä\á]x\Ç\ì\à\Ì\Ä¾ªŒt\Ğw\ëjh\Å	Á~š@^<\Z\á£\ÆvŒ\Z\Û!V—A¾qKT\É\r\Éb¤Û€;M”`\Î(0¤Ä“0•-+„D£g\ÌZj\\\ÖaXº\r°ôb\Î!\n&N%,iJY¹Beñ’{…}\È[_l¦\îX\ß6…`\ÒT\Â\Ó\æ.‘aøù\n°x‚¸ŒÂ´î‡°´9`\é³Fƒ(¾Œy†\és\Ú\ás9\0L\ÓNƒÁü\ì\Ñÿ§\ÎÎ½a\Ô6òƒX(`l‹`ó\ã\Í%|U\àó`\ì\0\è4¶ÿunc.ûR¤\Ï\'9uˆ\"}şH\Ìõ´>\0\0\0\0IEND®B`‚',19,'testing my awesome bio','9778244557',0,0,0),(4,'Jake','Lawrence','LXED394','dudi','jake','Manila',0,'M','2017-10-23 00:00:00','1995-02-28','jake@gmail.com','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0G\0\0\0^\0\0\0F·ù~\0\0\0tEXtSoftware\0Adobe ImageReadyq\Ée<\0\0&iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c067 79.157747, 2015/03/30-23:40:42        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CC 2015 (Windows)\" xmpMM:InstanceID=\"xmp.iid:0BFCE32D855D11E78DCFA65D9F0BD0CF\" xmpMM:DocumentID=\"xmp.did:0BFCE32E855D11E78DCFA65D9F0BD0CF\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:0BFCE32B855D11E78DCFA65D9F0BD0CF\" stRef:documentID=\"xmp.did:0BFCE32C855D11E78DCFA65D9F0BD0CF\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>j\ßs\0\0PLTEÿÿÿ£\Ãëµ\ç¯\Ëî˜¼\é©\Ç\ír°¶\ç\Æ\Úó~š¾\èğú\ã\íù\Ô\ãö©\Ç\ì\Ü\èø’¸èœ¼ã›¾ê”¹è–µ\Üğõü¸\Ñğ®\Ê\í\×\åö¨\Æ\ì¿\Õñ¢\Ãë•ºè\Â\êñû\İ\éø\Í\ßõøûş\íóû°\Ì\îùûı\Å\Ùòu³º\ÒğŠ¨Í¬\É\íñöü÷úı„¡ÆŸ¿\çôøı—»è“¸\è­\Ê\íÀ\Öñ\Ë\İó¥\Äë“²\Ø\Ñ\áõµ\Ï\ïúüş§\Æìµç‘¸\ç\Ì\Şô\È\Ûó¤\Äë™¸\ßúûş´\Ï\ï·\Ğğ“¹\è¢\Âë‡¤É«Ñ·ç‘·\ç\â\ìù\Ü\è÷ª\È\ì\Ö\äö\â\ìø´\Î\î¾\Õñ\Ã\Øò\Û\ç÷\ëòû¦\Åë®\Ôõøıó÷ü\éñúx“·\Í\Şô–»\è¹\Òğÿÿÿ\ãT\0\0\0\\tRNSÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\0ƒm\à\0\0IDATx\Ú\ì\Øg¢0\0\àDQGÕªµ®\Úe÷\Ş\×k{\íõö|ÿ\ïq$\ÌL\Úw÷#$ñùe °Ÿ&\à\Ù@&•ø™\Í²$v@\\’9\0¤ƒÀ¬Š@)\Ò0	È˜“Ò‘¾¢\'ñ3ı=\Å\Ï^?±C·+©J4j_>³µ¢\ĞQK2pC\á\åBsÁ\ZW\å]Uıt-„x\Î<Ë”UœKa\0\Ëô…ŒªşN\îp\æ\æT\r2/€\0\Íl•\æ :\ê®\ç˜\í\ÎZ„Q_^ó t79W*‘yh\çD•\Î\î\ĞwBŸqK.–°C€q8\ã-%£6hˆ¹ğ†¥¨1coN{\Ü\ë³E9—±\Î1\×iS\Î\ÇXG\ágtv\Ó:$\Ô:H\í(oCfMQ¨kuGi\ïzA—qGQ¾–œ\â\ÃLN$ÿ \ËùU¹“hÿ|\Ë;©fwŠÈ™\Ë\î¬:\Ìòf§úª\ØCŸ÷\Å^5r*vl¾ƒ´*:\å\İù\Î4/E\Ñi\ìı9ú\â†\è”\ë\Ø\Üq.\ç{›¢S\îï—i?\ÛO\ï\ØÁóF6\ÇNíˆŸÉ©nQz‡Gøü\\j\í\ïón~‘\ÌDøü@#ÚœsS\å2@ö~1j\ÅMÎ¾\ì½ œ¢¥©\Ò\Z\É\ßS\"Ò›¶˜™,Å¾Eº4HQ’÷A\çd\êK\ï\Øij\ïÿ¼ ’%w\á£_\é(:Qö\ß5Ó›\Ø÷nX7£÷–Q\ÉK´ğs\Æ;j\r\é{rc\ì´I\â@8ş)Vnp‹8gº¹3yj˜šWoHa7*\nhxú\ã4bLuA\Ñ\ÖÅU\ÇM*¹\\®â¶®i~j\Î@\ät\Üú‡\ÊŒM“\ï4½\ê\nv\npV\Ès~\í\ë\Ä\ì°\ÎbX»\ã0;0Q,Æ‰®…»^IRR%hx^©TdĞ€r\ÆŞ®ğ7ZelM\Õ6ûu\ÍòV¥F:C\\Xw†kºG\îL»S»eÓ™\Ğ.>Zö0rL¿Ö¶»~?\n^wœ0Ó‚W\ïZ\İwL\äè¨¨k\ÕÛ¹(vŒp\ßj¾£µ<\Z÷\í¯Ø­\ËüaG…b¤½u¸Àu\è#\î1IX\Øv˜s˜\ÙA{’½b\Ó8¼ˆ+X®YœNôRµğ~^\Ô6\ë\èÍ®w\Ômš¬c[º%ùÿ9üqï¬±ü\ì }(§v4¢XO\í\èD±‘Ú±ˆ\âaj‡ú‰ª¥u¨r-¥£Q\åúŒÿJÿ`\Z~\ßù\'À\0u-e\'iE„\0\0\0\0IEND®B`‚',22,'testing bio','9183099155',0,0,0),(5,'Lyndon','Ampatuan','Kola','Kola','lyndon','Mandurriao',0,'M','2017-10-24 00:00:00','1997-08-15','lyndon@gmail.com','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiq\Ş\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIME\İ\n65N\åô\0\0\0tEXtComment\0Created with GIMPW\0\0dIDATx\Ú\í›MhA\Çÿ)=x¨µÆ„ŠŠT/*Ö‹1\í%ˆQo­…zğ\"VP¥ª¨E)(\ÄBojUŠhb<hE{\ÑXj°$´`!\æ \êa\æ\ÕÌ˜\İ\ÍnZ\Ó÷.“ù\ÜÉ¾ß¼yov×…\â„–ÉŸ»dê•©s[~\Èô\0\ÄcCOŠ5®Á<WÍŸ’?»eº\à?ÿoeºG1\Î\ä# Góg«ô¿¦e\Ú$Iø\Â\0¨Í±ö\İ\å\Ô\ê\0¬ôz*2ñ[\×N›\íB»\Ø	™c\0\Ô\æ\ìó–¬ı¾BG¦\0\0aL\0vƒNœ®k„V&@#Àk¥co\ß]%Á;…Mµ\ÛK\Â\×où\çq²«\İ\è+\Ø\Ğ0\å\Û_¿©j¾qu\0`\é\âõ¢`\"%k>(\í:§E»\"A£Á\İeJ¿6d\Õú-¢\âyô\0`[ó\ÎRC\Ö0\Z–dİ€\ĞôûŸ9\Ç\\*0ñ1k°GÒ¯M«5>Gƒö [a=_¨ı9m\í–\êG¢÷+5&Ài	±\ßG\Z\Ôü_Yhj¼‡\Ò_\ĞÅ¨\'ù\ïõ™\0g	 ß›¢?’™(p*)\Òzcã™2™Œ’ÿ”±Gt\è*PQ?€\î8‘0\r\ÖÿTˆ(w\ZÛ€J k ¬\ÙZ›sUóL€]X\ÕÈ´o³’_”z=+7€	¨Ô…6l\í\0\0ø–‹C\è\Û/cJı\îÖ£Jş\Ş\à%& *ˆo\ïd\Å\ÑÎª5k\0=2=s\ç†Rı6\0ø\ß\\fª\Â’½ûgõúL€\ÓkŸdôÅ€’o	Œ\ã°-`\ì\Zˆ¢B\İ#ô?\î*J‚.T\ï\× )\ã™ P@\Ï\êZ¥Š¶{š\Z3Ğ¸vŸ/0N\riø.ÖªV~\äø\Å\Ô\Ëû/R\Êé„‰ı€jñŸ\Åby=@Š\Ø¬V\È3ŒS$\Î\ÂI¹\Ö+2v`öL<¾Q*\Ğ<>]hÿ·\Ëdœ²:	#ô}ª&µ~´\ßÓ³\ÂD\ÓE\ãQ¶|ø8e~;10­}«\ï{<^G\â\0¿˜\0€ô\\œ˜\Û\í\0L\Úÿù3 p_ş¦\ï\íùJ¬\Ğ\Û`vµ7!ƒL@.ôõ”?:/\ËıjŒvJK½\ço¶}![w	\Èşr”	( üõø<‘?Œ¹ƒ³ø\0\0\0\0IEND®B`‚',20,'testing bio','09775488764',0,0,0),(6,'Natasha','Yogore','Shing','Nat','natasha','Sambag',0,'F','2017-10-24 00:00:00','1997-12-19','natasha@gmail.com','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiq\Ş\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIME\ß\r$qcû\0\0\0iTXtComment\0\0\0\0\0Created with GIMPd.e\0\0\Z‰IDATx\Ú\í›yœ\\Wu\ç¿\ç\Ş÷^\í½Wuk±dË’-™Í€M°…\ÇÀŒ\Ù1„˜%3l1‹m±fafHâ–±Í¾eH lÉ°$Â‡-`\Ç\Ø`$yE²d©«ª÷®õ-÷üQ\ÕBx™°\Ìü5:Ÿ\Ï\ëúÔ«w\ï»\çÜ³\İs~\r\'\é$¤“t’N\Òÿ·$\Ã\ë¡H\Õ	\Ç.‘`*`áº¥_;}YU\Z\ïÀ|®˜PQü˜\Û\ÛĞ™\Ëk\ĞúUM\İt\ÙF	’P\î}ß½şA\Öÿ‘}ˆIô×pä¢Š\ÌdQ«¯Œº7õ\Üô\åU\éü K\çú\î\ÙSÀ‚A+/±¤‚\Èè¹£Eµ>\Ó \Ê]¹\Îõ]¦^1!¦`$9’ş_\×\0ı\r\æù•\Æ\Î\ì\ì0 (!‚~÷\Ã{\n\"’…iPñV;©¤®q\Õ@‹ª¯’\Ş-=\Ú\ß\ïüF0\'0şk1?vñˆ\Ô^7õsU¿¼*¿$ó9 B\àU©\Ï6=BV¿ª™\Ì\ímø$Hû\Î8Ÿ\ÏorBñ\Ñ\Æ.ùüšŒ S¯˜S2ˆ•yHm˜\ÙS3ªœª\Ê\ßj@\n¬\ËÀ‡Dø\àÌšj\0õ«šñÌš4f\îC\ZW?ÀŸÈ¯«º¿\Îózâ¯«\åƒ1\\Ÿmú™=µp*\×›\Z-D\ÉM“:­5²N‹™WyT¹x°PŸm®ı?\ä\çW\Z c°ò¥5ı%T<¬\Ï6Ó™=µ\0˜®\Şı\Îc\å©O{\n|\Ä#È‡+Ë‹\Ä\İ¹Ğ°yf\ZÕ”|\àÜ±ÿ\'Œın\à\ÃÀ›\ê³\Í\Şo\à›~s”w—$V…-\éôeUA qÕ¼\Î\ì©I}¶©÷÷\ì\ë÷föÔ¦€\Û\ë³\Í\É+¯¼’\ì\á\Ä	\"BXJ` ¦=FŠy\æ›sŒ•ü\Ñ¾û´y\î\Î:õÙ¦F\îÿ\Ş_—\ÏÁúIA^ü€	÷}û®^\Ù|g1\Òl>tdX¬€÷@|\ÜFOX\ÌÌZ4¯;€[Wn\Ü\Âó_øGŒm\ÜHÙ¥A@`\rA`\0QA1¢¬\Í7\Ùıø\ß\â\Æ\ï}M\Õ*ñ¡qğa\ßø\Æ\Ğgô\"\ĞEµ \"T\××°ù²‰\Çdÿûoø{^i\Øö\\…J€\\ıÒ’yû\Û\Êö°Zû=º¾ˆ¯_9¯÷\ß\å\é=µ²@ZŸm\Æ\ÃûùadñÀ\íkŸ?k\ë.ı¯¬a¤Ze4)ù|D`ğˆz,J€#@9ï±\á”IË‘Ã«Ü¹ûÀ¹û¬o\0¼x7PZ€ªjQD:õÙ¦\Ûp\ÙtC:··\á¶¾i“\Ü{õ\ÑÁšõV\ÃõWÎ¿F\ï\Ï÷ğ\Â?‘Ï¾uM\Ï~\Í»’ÏˆCü\Ü\ì@\İñ\ä1¤Ãe†;\í‡\ßs@€—\×l›û\Ï·m—\Ò\ÌQ±D1\ÌQ\nBŠ…<¹\\ˆE4#Àà©rÊ†\ÎØ”\'¾ü\å&R\åÕ¯|/]ˆ†We(¯J^„\0Q1€®aÃ¥3v\î½uWù\Ê‡³\'C¿ù\Ò\îıù¶÷€\ßU‘…»\Ø\'–\å\È\ÕM\ßş~÷¸†¸¬>\Û\Ôò\î’.¦0\Z3Àpıò\'¦ı©\ç<Î„µi\Ò\\\'•\0! ˆòˆ\rcQ,ˆ`l€\Ë2¶Ÿ>C\êÀğ\Ï\ßı;vlgb²Ê¾\ä\Û\nœü\ĞÆ¾\ÈÀU)£\äD$«\ì.KewYB‚\âckV\Ñ\ÜB=\Ë\rúw\Äò`‰\Ğq\êDù Dõ~)«\Ôg›	`gö\Ô*C)N\r… @2dş\0\ì~\Şó¬©TÈ‚L\r)]?ø\Ì$\\&‡“\0\'©\n„¸ó7\Ş|ıÉ¯qúgpd®\Î\Ö\ÓNeõ3›¸\Ø:|_:Ô¾\nP¡«‚Qt`Q i˜8›ïº©N§0u\Ç\Zm‰8×€G¼öaR}Ü”uÖ™\Ây\Û\ÛĞ™=5)\ï.­§\ËZ\Ş]\nNHW\×\Çş\àÀ»€·,ü\İfv{>ŒU\É\Â>\È\ã‚<	‰‚|¾D”\Ë1\Ü9D!0\n\êIû=\\ù0 ˜\Ïá³”v«\ÅíŸ¹5*c_¼c˜8\İ8\\G BŒ\à¥,\"± ¦ a\ÎY\ï’0ñ¶b	gúw|¸)}V¦\Şü	]hT°ŠZ}°”9ŒcÀ;E\àh\ë†öŸ\Õ?Üœx\Ø=\áœù§Po—¬¹@a|\rr¨É‘™!‚\ÅH€5!¨\"ª<FAğÎ“\Æ1jS\Üs\×\í´[\Ë\ä\"\Ã3Ÿ~if\È>?\Ô\ß\Ó€+\Ğş;ğH\à\Ñ@Á«S4ò\â\é\äz™g0 ¡m‰(\ï.\rRa72m&–R\í\ä;âŒ“\Ìd\02³§¶®!\ÑĞ¾sÀß¶ö¹ó\É2zGsL”JüŞ³~—\Ò\Åe®¹ú½X(” Wfa©ET@$\ÂøI…@”%‡ñ dX<¨C4E4¼\Ô8|\áylš®wz\ìû\ém;\n#°¸Lı	;\Î\ÚÁ\Ñú}aw~î² 6y\Ù\ä\ÍwD\äÏ\ëEh©¢š™L¬·y Æ€DB\áQy\Ú\ß\ï`Šÿò\×>+54µ)\Î8\ãŒ\Ë\ê³M?7\Ñ\Ğ\æ\Ş4\Zÿ´v~§g\ç\ãŸ\Å\ãù$ôü‹\Ùwß½\\s\íµĞyü3&ù2\Î\ä\ç`2K¨BeX—b\\‚\Ñ«ƒ\Ãh†ñ)\âR<#Å™\êÛ¶\Ì03Q¨ğ¤vCi”•N\Ì_~\ê3œr\ÆN\î:p;·m\å\Ò?}\'TB\Z¯ÿ \Ê‡¾a0^|/5±AXO\ÛMz,+jLw«V¼xIM\êô\ç\Î/\ÜXÿxó¥õFLş\ÇgR~\â#ˆG\rİ’\á¶Cwó£»\ï„\Ñ	8e7|ó»ƒQNE%B\Õb\Ô(\ä}F(`5\Åj†õC¸\ã\âSñ„V(\äC*\å<ù\È\"@.4\ä#\Î\Òj%\ì¿ûoy\Çs\îEq÷ø\Êw¾\Î^ñbv\á9ôî™¡ñõŞöA{xBmno#ËŒÓ¡s¤qõ¼Ëu\0\ì\Ö]#’\ÚTR›Jf³0\åİ¥œªşˆüeıoš\Ñ\æ^\È\ÆGœ\Î\ÚØ¢kğ™£\Ù\\ }°Î–]a¢º…•4¤vö\ãù­.b\Ó\Ö3H5\0±Xc\É[¥@)J…<(x«X¢À@h…‘r©ñ\n¥Bn 4b\à+7\ŞIó§û¸\ë\Ø›O\İ\Äù\îæ»·\ÜÀ\ÒÑ»I\Ç#¢Z…p<“£¬~ó€µ~ó³ƒ\é~¥¼»t†\ÊXùüRZ\Ş]\ÒÆ»\çµöº© p\Æ\á\Å\ã\Å{U5o\Ä\Û\ŞVÿ\Ú\ç¼\á\ÖLŸNÁa\È»”\ÖZ\Õûa%\å\ÜLÁN²u\Ç*•ñ\ÍÆ¦\é©%EŒ\Å\ZC\n¹¢À`\å\çñW°X\ëQñx‡’y¡\İÏ˜P%Á\İş\ÓK_I\çy—Pª€ô(O„lİ¹ƒ;n;Š­–\è=¾\\ V+>™ú?~‹\Õ/‡¯˜~ö\èFEş\0ağdT€5ŸhdVŒ#\å\ØUuˆjÆ«P\Ş\Ñø‡eó\ÈKB2\nbF/—\àƒ”4HÈ‚”‰\Ñ2ŒCP I ›¦6)³–*+qBf.$gó¹\\D˜\Ë#bÈœ’d$Ëˆ$†K/SVº	Íµ>m…\Å[BE™˜ :iJcy‰§?\ï\Ù0VB\Æt#ORR\ÚAB~ºÈ¶KF¸c\ëæŸ‰\êŸ4ö\Îw\Z{\çfpœ7EÉ‚\æµ\Ğ\é=5\ë{ş\"¼³ñ\åğû\Ï\å˜Y£\Õ\ë\áË–\Ì*Y µ8¯Ì­t¡\ß5$©ÁK€µ!©„ô±$\Æ \ÖBš‹°¡A-8	\Ğ\â]Š\Z%?\Ìl—9Vºbz$©R_\è\ãÒ”fcr¹H7\î\\¹B\ìS¾ñoÁ\á½²ñ,H±‚&\Êe¶Ÿ»‹\0¿?}Eõc½ó\×##jEiƒ%\È\Z\éş…¯¬+;6\Ò+9F·\×X\rR²PqÁ lg3\ÃX4†¦\èí¡…J\åi¼-\á‚\"=ú(…¨€\Z…\Ğ*X5 b°6À„\Ä\âœ*\Ş\İ~\ï¡§,¯µiwc\'¤Ş“:ñ¤YŸ˜Ÿû\äG`[…\Ñ]§Ğ22“’\å@,¤\Çlß¶»>u+\å³J\Ó\åİ¥oY\çİ¸tn±hj—\î0ÜŒÈ…$šqô\èa\êKótû\\œAª\à‡\ÇY‡1\ÊHy\Ö\Úü\ì\Ç?aqiU‡úEi¡’!\âñš‘zO·³¶\Ög­\Ò\î8Ú½”N?£\ßW\ÒXQo“\Ç\Ø&\ÌÓË«=\Ö:}zIJ?\ë\ã4!,º½„,s|\îóŸ‡c÷Q<m+©U¼¤x\ãñq\ítğ½.™xV;+Pƒ\ÆUó\ÏF\ÅHk½$h£\í•r8\Ş\Ï\ÜJv®Æ¼<»«\Ï\Ä\èQX`¥¾D¨j<‚\Ú\0\r!õ}4\èPØ§\×\ÚO\ãŸ>GùÔˆ©\Ñ<.K(„>STA½‚Í„¬/¤8—‘¹Œ\Ì9œ*Š\à‚f\Ş\âQŒ’ùÁ\ÑN\êLnÌ±˜\å\Êë®¤~ó\×\Ï8\åS&!¯¨84\íô\ÂvŒi¶¬\\\Â/{t\ÉS<¯ğE9\\:¯˜o^³Ğ¶£\ÏI];«øe÷\Û\É\×Ò‹úY‚³–\Â\Ø.\é\Å1‹˜\0¬… @°¨@\å)“JH\â=\Ûp\çÁCl\ß~¥\\ß‹‘\Ä:\Åe^<Y¨t\\F7\î\à|B\æœd)	NRœ\Íp&ƒ\Ô8—\Ğêµ™¬	_ı\ÚWø\Äß‡\ÛÁ\Î\íLl™!?YÁ%Kc’^º	~5¡;\×&Oˆ—Rz+}JiDxN°¸©q\Õ|ú²j.œ£mªd,b¥\×h“\æKd£Œ„h(d‰ƒ1\Åö@¬%´––\Ï(\ÏLR(²ğ\ã{\Ğ#÷òO¿F¶ò¤ÿ\Ær@V?%­C®„\ÉY|\æh%=’ò\ÑCQ<i\Ş`#C\æJÅˆJ\Ñ\É\ÚühÿM|\ïm³\Ğ\íCu’\r\Ïx*3§m¢­]ºqÀ[:k\\§Kg°\Ã\áUXp\ĞRXIiuº\É\çN\è‚X™xe­°ô\Ñf¯úª\é]óYÜ((Œ\à\Ì-˜\ê¾½[S¤:I©<Bˆ\ë\É@ú03HO¸\ï»7¡\Í¤y¤4M\Zû¨s	ùXòaÀX±L9Š0YF–öñ>£üğ–y\ä£\ÎÎ³Î 9wŒ¯ş\ï¿\ã\ÈM7A–AÁ\Ø2½‘\íg\îd\Ó\æ­\Ä\Îsd\îG—\æĞ´y~œƒ\Ã+ĞŒ¡c!V\ÈÖ˜¾¢º¥€\Òj¼{¾!µ7ÔŒ	,~ÅŸ½ô—\í›%ŒH-%y8\ãTÂ5Ò¸KTLP£„£JµQ\n\Óc¤’‘f	A`1\ĞI‰a$(°\ïú[È4¡“A&P\Ü\Ö`qÔQ\ÈY\è·@3¨æ¶¶Š\É\çxøœ¾u\Ëgh&ô»\åù5–[´\Û]úi.¦¼#Ì•(øˆÖ‘%t®\r=±’W}]\åKb\ä s¿5h^\ÛôµKk9¿\âv\Ã­~Œb4h›´ú\ä\â”Ñ‘q\Ì\ÍH\Èğ•ˆtºM2µD:Œ\Ğña¥€ó)>PV;+œú¨S(³\r£S\Äk~|\Û+\É@=\Òa…-\Ø2\nqŸò\Æv¹ƒ‘b’Œ†\ÌX½MÀ\'BÖ‚Vc™x¡\rAò\Ä8\íÃ‡ 0„yJQ@šôb…Äƒ3Œ¾©røoª*€™ÿÀÂ¡4+ğ\Ùûù\ç©ª³†B˜1\"1\Ö	íƒAj;^ ·Ö¦W\Ê¶o ô°m¬,/25>Fšô±.#˜BÀ\á¥Cl\ÈôE;Ykã“”R˜\ÃxG·\Û%N…ò\Ä‹U\Â\\Dk´B\Û;\ÒNF\Ü\ê\Ğ^]\Ã\'‹´;°š¡=‹t\r¬õ¡»B\çH’>D†0(•B‚¸7Ğª\Ì2³§ˆ*\Õ\Ø;ó°¡“\\0ı\Æ)i\\=\ï6½qê«½û<\ë19\Ãj·FÂ\È-\Ò<<O^„=4ñd-I¡§`\Zt2`$G\Ã.`Ô“\Ï\çXš«³:>A\à•\îZ‹\Îdz=p\nan\î’\Â3Z¦¾49K®\\bq±[X€v\âVV¡\ÓE6\ÌPÈ•±\Ş\ĞZ\\…N½>x?4\'CYcJÒ§\':\ÒÕ‚o\ìÀô\Õp½·4®YĞo®Š\Ä*T&rl:eŠ›~r„ Yg‰®Y\âÌ­¸WŠxŸ!$ˆPIa1fd\ëY+Ctî¾‹\îb\n£†$Y£[g¨jF·\ÓYZvw\\\rl\Ş\ÃØ£¶\æsd\Òfee\Zó\ĞJ5gT\ÛrH\à \ç˜*VX8º½” o@I:ñ‚\ç®}ñ0>\"b¦¯¨¾DD>]Ÿm¦Ó—UK@l¦®\Üj,ü\ÊJ—¼\ä9|ğ}¯\á\Ì\ÓaqZ0wh	©Y\ß\',D2?(€hâš’\\Aw`\ÙBX\r`HC&£\Z3ó\Õz\Âø\Ñ¹#J\î>\È…B‚%\à\Ö#Œi3\İtTÆ„ÍŒ|òk`m!ˆl_É«%YmQ)\ÊÄ“v7\ï›c\ã4ô{ğş÷¾~X\ÑT\ÜYŸm¦\Ãch2}yUŒ@¦d6’ïŒ\Â\é\Û6±uó\ïx\ë«y\ÂyP\n!\é@\ï¾g½‰Rl\n\Æ9\nÀbL96<ró.j\áôCp$!h¦Db‹˜rS(\âóy\Ò\0b±…4\0Ÿ‡­»vQŸ “y–z}\ÒT\é+\Ä2˜NªS\ØòD„N\Ø<5M\Öi1>\åC˜0€¯~õ\Ï(–„±QP°\"r\à„–¸¿p›Qó#\ÉY0a¯\îv¹ğû8\íô*Q\èy×Ÿ\\\Ê\Üò}¼\å\í_d­R?F|Ø±\í´<…\â8ıXI·ŒS\Ô\í;\\\ê _\Zö-ûe%‰hiNZ\0b\è9\ÈÀ\n·¶ ´˜Bˆ\ßZƒ\ÅEh®¡(ZôP³}c… \áö[n#L¡ƒ”GA-¼\ëO_\Éö\íg\ĞY\ëñ\ío›\ŞÀ\r\ì\â\é+ª% \ß\Ø;\ïE\ÑÊ™\â‚ÛŒu™³ùaô\â	ı\ìg>/o~\ÛkIcG`BF\neşúº?Àİ±«¯}«v¸\Ña9\íP\Z«0\ß\ê2µqõ¥E¤c\ë\Î3ğ¡¾º@\Ú8\Å	„z·Y<y…˜tP72¸BC81J¹R!MS:…Z­Rò”\nEl\Ëq\ì\à!Z·ıŒ±\êP,Á\Ä(œº}š\×_öjF¦Ê¬µWùÉ¾}üı—¾Á\Íg&ğ²Z\Õ‘\'9„şqEù\â…\Üş/¹ùwÜ‘l|s5\Ô5ÿ7>’sŸ|¨x\Ê\ï½ôyFm—¾o\ã4aSÿ,Ô„ŒM\Ö8pğ>ş\ç\'?Ç·n¸Ã›rp,ö†\Â\Ø\Ä\Æ^–\æ›¥P\Èa,DQ@>ŸcY2ŒSL\æ\ç±n\èŠEpl.‚À°²¶\Æ\êò\åB‘\Ú\È8k\Ë+4\îù’CyJâ™¨\í5\å%/\Ù\Í%/z&Ëy4ğ,,.sı~\ÄOtóÿ¡Â°”o€õZ@\è7ö\ÎûÚ¥S”¿>[\È\ßòE,Ü“\ã…X±OËœû »¼uC1\ã\âK\Îå±{4£~_ûú7ù\Ço—#MGğ’Z|\nø8PUÕ«‡Ud\0šï›§L\ê‰cˆG\rˆE\Äaˆ¼ 2\èT9¤7ƒƒ*ù(G¤†\Â\Ë\İa×©+\"·¨\ê¶\äº\Ö\ãZK}^ğüópÚ¢/²óQgòıÀ­R?ú¢\ê±aó\ä\ÃÀWz}v€4©\Ï6uúòªø–·Røá§‹…>\îƒc?Í¬O¼º\"t\åz…\Í\"’{ò2ğ\ï€}õÙ¦\Ûg“Ã–UlGõ\Å(O\Åsf\á\êù\ÂÁa-\'–ƒqŠ\è >âŒ’¡ôSO±‘BV;Tı‰w›2\Ü\É\İÀ\Òrg·¯[7_S;qm·\0O\Ú\Ã\ê¶E\Å*>m\ìO§/¯\nÓ¸f\Ş\É\Ø\Å#6°\Ñu\àÃƒ@\Ùª›¬÷\Ã\Èw\Ä!’BUıdc\ïüsş\á³/§\İ^\ãškÿõ&túƒ<¨X‚vg”Š°¼;wc1«¤H´Ş”â‡Š\ÃÌ 4Ô¸‡Û€?v¨\ãúl3{(\à\Æô\åUÁƒ\ïz‚l\Ñn\Ô\Ğiˆ\Â#\ÇA\'\ì\î/C\áğ3xfO\í³S¯œx¶Ó¶‰Šü\Å¨7æ˜š\â7|Ÿ¥\åU09v\î|>-±k\×y\Ü~`Ko}\Ãö×‰›\â‡h¬\Ì\ì©ÕŸ[w\Éğ÷‡\Ü\Ä\éË«‚‚:Å­¸Np\âEc\ÓÁq-yø‹ù7\0•\à†À¨u€”F€û¢O4K_ø\Âk¸\ï\è!’¬Oµ6\É\ÈX…»vˆjm\Íú*£c›\É\Òo}\Ë\Õ,>«¶\îÀZ\'h\ßz³v½9›­\ïöP;ôÄµ\È\Ã:óxpm\Ç\ÂÇ–\êšI1ƒ)YdˆU¯¿ ¹\áDÿG\\\Îz–5GÙ¡/ >\Û\\™\ÙSûhò\Ò\Ú%/{Ù‡6}\ê\Óo6\Íùc«7(\Ö0¦L•˜\Ù<\Ï\"\Ş÷ş³øÄ‰u\ÄØ©ÀO‡ó¸6\Ã\rM#7³§Ÿ¬·ò‡\í|¿®\êõ¸şø\Ø\Ó\ßÿ\"R´¼»D\á\áy¤`aı‰uOı+\0’Š@\ï~.\0\çŸ\06?\İ\ä\Ï\Ü\Åsç·¹÷\Èa~r\ÛO¹\á_n¡¹\0\çV8ˆ\Èc†\ê³C¿\ãv;(p©\ç\Ó\ÆŞ_›~SU|¬¤GV¾´ö@¨\ìq!\ä\å¸O8ñ‰õ‰ş\r(@©>\Ûl=l®8ô\â÷A’¿hOÃ¶¤ˆ\ÌQ \éĞ¡\éÌš2fQ\Ì0•\ÍD\Ä¿?86\É	\Æ9À:¼öÕ“’K3¿n³\Çiw›;=\ÂT,w_Ló kUi\ìw\ÓWT\×w,:¥p\ÈLo*7\Ç	\Ã\æaŒ·\"¨UŠ½CV¡±·™­;\Ø\ãª=`^N0NıEö7§^1ñ\0\æ €u!´¿\ßa\ì\âL\Ñ`G-20‹›\" 7dUUqõ\Ùfw`\é_R\0µb=‚\Øõ„¥±·\Ùœß§­w\Å|\íõS#NÁ«?®\êş8´V\áDX~õÕ“R\Ş]2kÿØ’\äH\êOş‡\ÄI:I\'\é$¤“t’NÒş\Ïû	ò\ä\0\0\0\0IEND®B`‚',20,'testing bio','09773411367',0,0,0),(7,'Clint','Henarios','Clintsu','Clint','clint','Jaro',0,'M','2017-10-24 00:00:00','1998-06-15','clint@gmail.com','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0T\0\0\0a\0\0\0HÜ†\ß\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIME\Ş	\Z÷\0\0\0tEXtComment\0Created with GIMPW\0\0¶IDATx\Ú\í|i°eWuŞ·ö\Şg¾\Ó{÷ıZ=©»…f©A\ÂB \ÌhllO$¦P\Ù68‰“T\\©r\ÅTReWÊ±“P+6`Ê\0†8CmÀ\n\Ø2 4 ±[\êAı\æ÷\îx\Î=\ÓV~<\á\n	\É ½ı¾_·\î=ûœµ¿»\Ö^\ÃY{{\Ø\Ãö°‡=\ìa{\Ø\Ã¾ \İ|¸ø^bòò[/yû•/ŸMv“\Ô\ï)B“\ÈM6‡\0x\Ğ\ï7~ÿRWú\ê\r\ÊW¸şµGo\Ú-9\Ôó‰´\Ën¼\æp{Ê½É‘\ÖÛ›)\Í-´}\ì\ÎŸzˆ’Ö¿»RH\éK¥\ìE¹€3^uû\åÇ´¬ùó\ï}\ì\Ñoşí…¯ºö:ó|{\Òd8b\0];\è(Rk]>İ‘R€‚\Ï}\âÁ=ı¥‹\Ş\ä‡ı\â\í‘\nN¾ú¿\à7¿ñû¯¼\î×^¦n\Ñ˜K\Ğmø\ìKb¥\00ü\ÈA*\ÄI¨pú\r=]\ì™<€Õ‡\ËcW^1“\Æ\å/¼æ­—ÿ#½g\ãtõ\Æ vW¡„$@\n)”$ªô‰Iğ°9¨Õ©6 ±[s¡i/\å\r·.]!¥À¸\Ğ	3\İ5¼v€vŒ0`0Š\ÚPV\ZhÃ°†`kff†a‡©…„š\İ \ê¯Nş\×EO(ÀG½@\Ş|\àPÛ ¬a\ßY˜PWŒAZc•<©4W\Ã\ZÀZ0x\Ç4š‚Z³@òš¸|¥>;u±‡Mw~ùó\Ërc%«\Û\r_ï›\é\ØR\Ö0˜]2;fNBE\ÍDB€\ïCEä‡„fC†\ã!­\é‹\Ş\Ë\0I:Ë–}’h»v¶ùª8GN§¨­a\0ˆ;Œ«v\áœ\Ã(×´ÒŸ œ0³¬v0\Æ\"\ßh\Ózª÷\İ7¹\ÈM\0\ã‹\0\Ş†\ë­\å\Ñ\ÆV\Å\íÅˆ„”\Ç\ÎZğÖª\Ã\æ\êXlõr¤½[\ç$\0BDD\ÆÌ¬>wş\á\í»ö2%\à\Ë\0np\0ª¢&\éG\Ôi´8\ÑC÷ôñ™Ÿ‚7XÇ\ŞTcùş5\Ú:W\Âj\ÂL7\à¹C\ĞAƒ\Şu\ã{Ó†\î \à÷\0¼:ŒÚ—\Ì‰@J\"‰\â¶\Â\ÖjE?^`eQ‹»fšö-zˆ#\ÏM5<7\Ñ\Ú‰ŸHºô·\Î\æõ\ÅN\è\×q†H¼¥\Ñ\ì\"h98\ç\Ø1¹8TR5c4¦:\Ğh\"i…huºS>\r\'•°’-à¤…3\áÙ•“½¯\îºƒ7ëº¾\Õd\0p\ã\Ìğ`¤¥\ç1’¦À¾%2°¼¹b\ìöZf·Ö˜¼$%‰¼0(Rk\Ö|p¯8|!l\Æ7	!ô\Æ\Ê\nùD\Ì.\í³R	¿9§\á{I¬0\ß\r\\QV¼u¾D>¶\Ö!¦\î>…\"·È‡õ‰‹¹\ÚD\0‚ ñ?rÉ¥7‡‘Ç½^-T\à¹ñ\æÀ{H\Ïó‡\Ú|\àŠiH\á\Ù\áPó_r•Æ½Œ¤\'yş’\Ş^R]…\Ì\Ì\ÈÅ¡‹•PÀ\Í\Ùh|\äŠ}òÒƒM\Ş\îUHS+]ºñ¬\äœ\æíµ¾ğ‘Ûª\í•c¦ş\æ\0@(ˆ­µõ\rk\ë¿\"\â7€<+>p±öa\Øò7¯½ù`\ãš+¦¡+‡{b´­y°9\Æh»O\Ì\àÖ¼‡¤€H\äJù6ˆ¢F9\Ñlµ¥\Ñv&³añ&X| n{/tÄrhş\êb\Ô\Ğ6€ÿqøš…\Æ\ÕWL‘\ï¥Cm\r˜\Õf‚ ¡\àS\Üô\Ùó	II]Unı\á\á;£\Ø\ÏMmguVıgXœ€|¤\ïÚ‰\ì:¡ûŸñ\È>J~\İ<r¼c±yiET:!KòCA\Î\ØñN.\"\0!‘/ã–½rp>ÿ\ì\â{¤‚\Ğ+şbò‚³µú—\Ûç¨¡b\É\Óµ\å²r\è\r*\Ë\Î	\çœ#\Ö2”/DŠ¢¦\Ï\ÖZ¶µ£\Å\Ã\í\×Ä\à•‡/»h	}\ÙO_¾8;\åÿ\Ù\\+ˆK\ã.\ÏÒŒ\È\nLò\n\ÖÎ±«j¶,… )!\Øaf_Í©D\Ñ8«¸\Ì\r \æñø¥\r\'›<²\î6¡»’\ËOµ\Ô®>855\×I¢ı\Ó	MX^/Á\Ò\ì¨9\åK~@\n‰ \nĞ‰p\ì`‡ö5ø\è6Ú¯ a\êªöO]”\Zz\Ë\Ï½~q::\"ˆ\\m­Y©PË–Í¦¾\'(Š$šME­ş¦F†€O·\ç)\"€¨®-k\ã\Èh‡Nè„x÷ü±\æ\ÚÆ©ôc¡>\É\ï3-k?˜\ÔfcPX[	vÆ²sI\ä!ô„ ´\ã\0‚&H‰|ÌœNj‚+E´²=¡zb`´…$¦\Ûwg\Zí¯¤\'t{v\ËI=\ç„VõeJeñ¤¨y{PŠ\í\åš&}ˆ¨\Ãg\nZ[øÁY†u­\È\ÃxT[\çœK\Ç,&¹À\Î9\é `©\Ö&\Zdfº±İœm~*¥7–Cœ\İ\rBŸ\Ó\â\È\Ü%o¼\ÎÛ–^>qrëœ¦ÁšÑ¥P‘I\Z\ç5²Ò ¶yi8/›\ÆZc‰\á\0bQ—\Æõ\×\'BW$gcj\í 5+S»_’\èš\Ò}\ê{–\ĞÎ¾\Îõ‡^°øgsó¾œL€\"4\Ú,°±²L\Æ–R‘ AQS	(µEQ[ªJ\Í\Æ8cµ\ìXˆ@„2\Óbılÿg\Ùñ\r‚dÂ–¹®µt\Î*v?nh´\ã×†qğ:suQ}ù{*õ¼ùõW}ğº«\Ú?hüå¯\É9\È\áF¥\Î>x¤„\í,4\á>¡§Ú³>¼p\'\0qÖ\ÙMˆ\áCB\n)IHa\ëñt|\æ\ÍN2\å\ß·Ã« \Ø\0± I^\åEAE¶%HHô^“ó\Ş÷Å‡\î|^k\èÒK\İ\ë¯\ìş~«\éq61X\ï•V¨ş\Æ@d\ÃDdÁù¡©¤³šeY8Ô…c†s\ÖDB(_\")%©9„Í™N¸ò\ÈÖ	/‡\ãƒ\Ì“P^F!ù¡”~$…ŸEmº¾1Ko=p\Õ\ì//\í.?²õ—\ßm\çõœh\è?rù½õ\Ä\Ì\Ï\rS\ÍÛƒŠ\Ï/W²\ÎY>ø¥“dJk¥R:i7e\Ü\á‡R’G’à¬…ô”/@×™iÿş&im‘\æUe]Cô6\Æù\æ\Ê\àõü9)…I)‹¤\Ñ6\Óó\r\ßK„\n\"¢$‡„smœoq™ö\é÷§º\âµE°‰ô\á@,Z¶5oÕ¥ıø=qò=_¯†\í*¡·\Ü~ù1\áp\"\êWn\×k½«[%M2\'W\Û\Âòƒ[ŸğNş$nµ\Ú\ÍNŒ0–•c\0À	O„ô‰\ï $Õ†‘\å5Fi\ít\åP¶–ûvkcxC3	ÿ\ZBFpn\â,}>I:7/½`ª&`‚\ãP¸v\ì\ëÀ—Z\0b<2ª\Õò„ƒ“¯„‚ŠZ\Û\áPc”ZJ‡\Ú\å¥\É\îZ\Ä]Ğ»6½ôG®üÙ¦ºn4®_…¢T£¬&cŒ°\Úpmø5\0¯\00ò\Ñ8Ì¥\Æ_nL\íhªò$h\Ç\r!…¡dm,[\ÇTAH!‚˜1\Õ\ä\ë®9ü®÷~\èL\ÜY\r\×Ë³\00D•\ÇV_ı\Ò#ÿ ³\äÿxN|\"/\nÛ|1\ß\r±8\Z¥$*c\ì «Y—T\Ú)k˜<Ibÿ¾›½ªu-ı§÷\â\Ñÿ´+k\èe/Yz\Û5\×N¿1\Å\Òxb\ÛI(E­-ãšŒa\ÚZ<¶y:»\ê†\0¥®ôªŸ\Ğİ¥\ä\Ê RJ€™\0\"Ä‰B»P­j\ã¨Ò–LD„KÚŠµtp\ãÁ»\î\îıõ7‰\Ô\Û||ğ…\Ç\Ø~÷™{·~}\ße\İ\Ó[\ë“Wú•¿0{J	ef¹Ÿª¢v¡¶†Š\Ü`<´ni.$£Y\æ…ı¾0ğ\ß?\Ü\ÎF\Ïy.\ßhú¯÷:<\Î\Íb]i\ród¢¡E:\È\Ó\Ó_Ù¾\îIc\Õ­HIğ $(\ïÿ-^\ã¬bmM\n\ÍDD\ìD`Â‘¶‡\È\Ø\Z\ï½é…y\nñ\Ì?ôğû\îşÌ™¥\åóılõKa½¬u\á,°üP\Ê+¥(Æš\Ë\Ê\é¢rfa>j†mõ»R)s“®mO\ZN;\Ùm†\"-4g¹A6*]¿?º@ùdcO}i\ã}\éú£1ˆAD€ 8\ÇH\'\ãL³µ\ç˜A€ ¢†1<œf§£\æşù\Öûo¹iöo#f-„û“{\ï_\Ö{\'Y6d7Ü´T\å5;g1\è˜¤u\êI‘²Cµ+„>ö•\ísÆ’l5E©µ\ÃhP\ÛşjúK\Ë÷ŒO=•·|\á§\ÚG\çc\Ğ$	ƒaŒ\ãºv;c\03\0\"€°?$rL\Ğ\Ö\á\ĞlÀÇ–\"n4ü7\\;õ\ïŸJ\Î3_|´.\ë/Ÿz´g‰…›JB¯L«~\ÔFíœ£ª\Öny}¢µ¶ı¢¬Ç£‘yÿ®8¥²(¦ó^\Å^7\á\Üj@òø\ÓÇ¿6x×·®Š|‰c‹¡k	\Z”Œ³cG\ë…a\Ã²À‘@`‡¥¦d\Ú\Û\éÕŒ¥o6†Fc-|_|ÿ·{^¥z·\æõÀ\'7¦%	SÕ¶\0\Û_„u\r&¾ZkûÃ°¤77¹ª\Òlq·¼ü \ÈgA\Âow\ã\ßy:\'•{§\È*\ÛK|O@AR;¸~prµ¢{O\r¸;“\à\Òù¾\ÔBÀ—@ZX4C	\ËN\Şs6³†&ñ\ŞS>oùoP\0G®ºm\ám’äµ¦ª>zú\î\íÿ\r\0s‡õ|\Ül¼¬tF•›u]õ\æneJ\Åö/\Î/Ä¦ªò\Ú9S\âO—Om~ªA\Ç/_\Ş/\Ïw#jÇŠH\0`qŒJ[jú4\İiqÊ§©D‘\'wü¼¶Àvf\àI\Âı\ç&t¾W[\Ûl \é„3A\Ô,‡›Ã¿ùvoÉ¾²q&ıX%ÿ»&\İ\ÉPOªZOŒ¶A5)ş6\ï\×Àí††~M—Y¦±88\á#ùvƒš±÷/\Z­€·RGQ\è˜²Á÷€¢f\êm\Ğ\ì›ò¡ƒ§<I\0‚\În–øÂ½›P¡§.;:gHwæ“ŸÁıx\ï\ßg\"Å ~úCO„v»V35Uy\åL GÖ™\ì\çIº¯\Ìj~Õ½§S+>½®±\Øõi¶-\ÑM$’@`Rh€e­ ¡%\Ú\ît„Ÿ>Ÿb\\9´\Ú!¦NIDa‹\Î\ï_ú‡\Ë+\ÆNW\ß\ß\æ\é^øl\Zeã¼†b\ØÖ¨\ë\â©W—{Î¥/K’\0~\ä#N\Z\äùı¢\Æö8G# Y!•@Q\Zd¥Em¼&(A—«›9\Ú31Ú³m0“\Èó’’VA,ö_Ş½m<ì¿£ÈŠ~¡V\ìx²Eš«‰N“®k\ÇõÄ‰­\ÇÓ§\ì\Ñd‹SL„0P˜ |…ZĞ¥F\Ö\Ïp¾§12\ê\Úb»?D³ ˆ<\ãğ\Ğ\É>&\Ñ.À0Ú¢.5{¢¸Só‰\×ø¥\í•q÷‘;\×\Ş|¡úß·4ÿC‹­¤¡­=ó\èö\è÷‡Ÿğ‰¿+&w;\'¢fBä˜ª\ÂP\ÕÁù³\Û\'Ÿ2 ¦úKBFğB‰FËƒP£\ÌA(…2÷±™V	(s\Íei\Ö\'…şİµ­R•¥ûÓº\Æ}A ~A¯f¿6#J\0“šH‚ƒXµ³\Ó\ÉO]sÛ‘ô¾Ï~û…R`ky\âoo:°¯y \ÛöCO\ÈV¬X[+O®¼s\ÃüÎ»×¶>4·ñÅ¹øGŒ‘\çV¤‹Q/_yü¡ó·x\Òf\áh›;³\rŞ¿¿E\ÍV€õ^0\ÜÈ‘ösø\ì:\Ê\é\ã§OW\ßj\ËÌ‘ıWL±Ñ‰\æi\'\Ïg/”\Ühl;¶\Æ\è”n?õ\è=¹4t\Ó#\Ù;\Û¶J«q\Ëñ}\ì‚}\'\ê+÷OW\İ8¾6ö½t$ƒHqQZWÁ)/f“ø€5\İOr«7³zòous\ë\ì¥\'_b™‘\Ä\nj$ %\àG\Î1úi\ÑúdÀ“\í?:½ü`ÿ’¥+¦\ê0öLd;%©>±‚0µ©tõ\ï\0<+„>\ãÔ³W\ë\Ûô\ß\ÖF™x\ß\ß>BwŸŞ„8ğ	Å²ª+bg1»/\0)’aLb!„b±\ïhÇ›Ÿ:49~\ã\Â_4÷a\æ›\ï­Kó—\Î9²!!:MA¤\00œ³\0ğ\í^¼™Í•Á“AYY…I¿Ô“±F™šº(\ê\íº\Ğm\ìüùN\éh;şŸ£²¾9«]`Ö‡£p8)dt\ã,]zdŠz}\r#p\ëZ;_ª2/´y\ìş;z\ç\'oø\æPô\à\Õ3\ã¥K»8¸\ÔÀÖ°D+Qf\Zg\èaóü“~uÀ\ãOG¾\æBø–$‰ÿ0L”óB	v¶\ç\Ø=²µ2~,]¯o¿ 4ôñ\è(ÿ±¦RoÑ¹{–·\×zi±lH;óûÂ’T„ h6<š\êD2+\ë¨6\å·j\îJÇ½ò\Ç ´uP’0{ \rS[<]2`qq\é\'»‹\Ó.ˆ\"Ò•\ãIZ©\í\Õ\ì\\º^?k\á\Ów\\m:=)ÿ¢`~1;şƒÍ¼¬Ç’&\ì\Ü„³*$„ğ<\Ú1¤½s¹\Óôlû‡—\n\0¿‚o\Ø=<X\Ë^\\”\í\Ø\ãJ[g™]Kn\ÎDw<Ùš3\É\ë\Z\Ó¢¦‡0ô\İdTq™šsO„|&¡—¢¿5\Ğúªş¸.›°©Aù<_@Á\ÂAz@«\ëC6\Ó	u\ã0¸õ\àÂ¿=:\Õ\ZR~Àm¤0(‹ŠóÂ°\à$ğ µe8\çöı\ìÓ•\çğUW]#= AaC°ŸHF^\ì¬}ı…\Ø?yÕ¶*ÿx2¶ÿl¾\é\ëN&Yf_H\ä\Ğˆ	\Òó1©k”\Ú\àPw\Ê;8=eñKzYñ±µ¢\0å–‰ˆª\ÊQ\ìIN…B®­4µ}\Ú\Ûc\Î\Ü?f—®„$Qg¾‰\áf~-`\0²\ç¡Ò£õ­³By^©¡(\ÆN·À\Ã\r\æ2\ÖT—\å+X\"Ú\'$AZ‡\æt3²\Í$¬eA¦:küò\0b[\â<5\Ë÷\ßq\î¡g \Ê}Ua?uğ™“#Ÿ…\0\ìÔ³E\èw½bO$÷\×R\ç8ÿˆ³›kzû\á‡s­K˜l\0\äBš1\ÓH(cKEø‘§\äTD”WG\r\Äıò“©À\É\Ñ~Ÿ\è\Ã\0\Şøte¹÷¯ıd]ñ¶ğ\ÎiO¼,Ÿ7&o\êšó|‚f+†s\0=£9ƒ¸ÌªF¯7û§š\èe8v´€\"_B™‘„‚b–”\Ö\rœH\ZpQË˜™ûµqöZ\ãø¿\'øğ\çÎ¬\İ=ªªÀ\0¾\å&…*\Ã\nI>DD¨kCR)\0\æÀS$ß™…>÷´“lòF\Ë,ª²\Ó\áøL9)O6F\ÓA\îú›ƒ².JTZ{µ±H|‰\ïÁ:\ì8/h\Ã€Iğ¡)nú˜n(ÕŠO’D\à\É\Ã\×,Ì¾ô\Ä\â\ìmSQğsR\àWûE\Õğ™ÿ\Ïb”ø‰¤\á%0ª\Ò	¥\"\n\ÂxL\Ò[n\Í\Ìx\İn÷ğ\Øó&È¿;lŸ­Î‘Wx€?B{¾ş¬_ğ\0\ïp\×B\äb&‰^4\ßjb±Õ€cF\ì+€	R\0R\0fO	—Rø !£‰F¥¤ S\ÖN·\"i²Ò™\Ó\Û#|\ê\Ñ\Ç{\0®v\Ò[/Rÿ\ç\èµ7+%QU¶\Î.n)x±#g˜«ez\î\ä¹wÃ¹“\0\Şs!úô«-ağ{s\í\ä\çÁÀ\åó]øB ôQ ĞŠ=– r\È\n‹¬´˜j(x’À xz¥W¥o\é¯\Î.\rÀ­O\Ìğ\ÓK—u_\Ù\é6`\r“úD>‚•¡/P\×À>~š«©zB\Ã_{!™ü3\ÂÁ\ëOœA#z»±2\Z!P­ dE`)	\Æ1\Ë‡Š<µ\Ó¾@3RHf‚\ï¤ ÙŒ\Å\Ê3¾”K\çG\Ù:€{\0\Ü\Z·¼\ë)‚\n%‚XRp¤ÀJ	L\ïKH\ß	\å›\íp|^k=\ï»d\î·\Ú]\\¹xE“\Ì\ÄR¯?a\Ç­ „”ÄXˆ¨Ÿ\Ö\ÈK‡Ğ—ğA!\n<%Ya¡”P‰/l\Ë\ë\Õtò†´Ò¿\r\à\äË»o\ÛIA a˜!‘T\Â°\ÖA(Àó„˜^Š©»#\é„?X\æô¯²aú	\0+\Ï/B\ÌÿZÜ²\İ82š\Øh¦tó¸,](}”š9ô7B)„ 3$T_\×J\ì4ò\Ò`RYT†ıB\Ûú\Øt§~dkpv®œ=\Ğz\Ã\Ôt\ÄLÖ”Gh\Ä5\"O±PB’Ä‚ˆŒe!±©%z«½ú\ç\ÏB“NôZOH	a-£ö\ÜXdıœÓ¼B($\rs\Ú2G¤8P4š•E((¹Cj^\íô@¡µ0–\Ë\Ã\İ\Öñ‡6ûa‘\×\Çd\ì<\Å\"@m´u0–¹²–¬\ÕSm˜\Ø6Î¦2í§¿\à\äóKC—¦ßªBšbfhc‘¥5ey-–W†Ÿƒs—N\'‘<…´\ÔN\ê\ÔUY¶†ƒˆ\âpg\ZÃ‰aÇŒ\é\ÄGm5c\İ\Üòvö\èöjºo\å\Ñ\Ş\æ\Ö\ÆğF¾k\ÒGè¬·U\æú\ìdÈŸÍ†\Õp\Ü//­r=Hûú¿œyp\íp\Ï|\ÓÃ®{ù\Ën8º\éG4£<°®-z\Ù\æh-_ğ®\Ã\í\Æ[M·\ít3†Ö–Òª¦v ‡\Ô¤“’\\\à	1L5—5CI2¦J­c}f3¥»_ÿ7g\Òü}\0õsœvÿ˜!r³\Ì­\ÉUNm\äşÄ¯?f”ı\èı›=œ\Ù\ZÀ°\ÃL3!B^iF\ÔÆ©¢²ô\âthÍ‡¦IZ\İ\ÎM–kVDv¤\íO?d>+©\ç3+¤\àv°Cz(k\ËRŠZB~÷.û³\ÕI\Ù\É*ıñõ4\ÙB+\æ£s]rQjƒ\ÊXV‚d1°†\á\Ü\\;¤\ÙVˆ3[µy¬7\İ$¦N\è£_Vø\'\Ôj¼B\n\Í3\ÓM·²U¼\Í%W7ÿr\í,\îù¦K³±±·TYş\êaYı\Ñò0?:;NBk03Ò‚\İ8¯\è\ÜV:\0ˆ=6¯µgœ{\ïsfp»j\îŸ~\é\ë}ÿ\Â|£<»’~ %RTµûü>øğmO6,nÃŸ™J¢\î&Q[[‹B›\Ê9WBê˜¤¶FM,\Ë^^ü\î¸6¿zQ\ÚY\ßñ¢[üJw*\äs\ë„¾ğ¦ºi\Ëb{{ò\Æ;?|ú\éœ:}i£qòp™BøŠ\Ê~Z®Ë«\0gŒ\Ë9\íªÉ·f\ëLB9‚õ<H\ç‰$R6M¼\ßğt\í?–eŸğY\\\0\ØU/o*¾\Ú\0NQHRB8°@\èK,LE‹7¼\á\è\ãy†]\r\ì»ûg\\§¾%¤s\0Ú±\ïZMZ[4\"³\Â]]¶›\rŠO>_\İU\r={\ïùO\Õ5?:U®¬œ¦\ÚI\"³¾]—\Ë[yU–¦œ;\Øş\'ğp\İ¡O\ëgú­\È\\ $&¹§\Î\ä¶*zÛµ«s«¤z\áÀôG÷Lşib¸‘\ÅQ3zy£Ÿ”=~(a\ÉÛ½p,cŒzi\'\Õ_\0p\æB\'ôB9ª\í\æ«_zõ>]W¿™m:+¾¶tlöº\æT &£k§{.\ì5\0\î\Çñ|\ä‰\Ï!ñiNx.ü³N÷°‡=\ìa{\Ø\Ãö°‡]\ÃÿK\à\ÈP\Ş\Öø\0\0\0\0IEND®B`‚',19,'testing bio','9185644993',0,0,0);
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
