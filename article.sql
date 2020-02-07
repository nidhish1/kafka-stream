CREATE DATABASE  IF NOT EXISTS `article` ;
USE `article`;

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `article` WRITE;

INSERT INTO `article` VALUES (1,'test','test',1,'2017-05-18 13:50:19','2017-05-18 13:50:19');

UNLOCK TABLES;



DROP TABLE IF EXISTS `article_category`;

CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composite` (`article_id`,`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `article_category` WRITE;
;
INSERT INTO `article_category` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,3),(8,4,3),(9,5,2),(11,6,1),(10,6,2);
UNLOCK TABLES;



DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT '""',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `author` WRITE;
INSERT INTO `author` VALUES (1,'test','2017-05-18 13:50:19','2017-05-18 13:50:19');
UNLOCK TABLES;

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `category` WRITE;
INSERT INTO `category` VALUES (1,'Makanan','food','2017-05-18 13:50:19','2017-05-18 13:50:19'),(2,'Kehidupan','life','2017-05-18 13:50:19','2017-05-18 13:50:19'),(3,'Kasih Sayang','love','2017-05-18 13:50:19','2017-05-18 13:50:19');
UNLOCK TABLES;

