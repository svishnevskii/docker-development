-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sailx_databases
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

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
-- Table structure for table `alerts`
--
CREATE database loc_sailx;
USE loc_sailx;

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,'Сайт приостановлен, закончилась подписка',NULL,NULL),(2,'Вам был передан сайт, проверьте почту',NULL,NULL),(3,'Осталось неделя до подписки',NULL,NULL),(4,'Осталось неделя до подписки',NULL,NULL),(5,'Вы с нами уже целый год',NULL,NULL);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts_users`
--

DROP TABLE IF EXISTS `alerts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alert_id` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 1,
  `status` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '1 - no read, 0 - read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts_users`
--

LOCK TABLES `alerts_users` WRITE;
/*!40000 ALTER TABLE `alerts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2018_11_08_125747_create_alerts_table',1),(2,'2018_11_08_125830_create_alerts_users_table',1),(3,'2018_11_09_160425_create_jobs_table',1),(4,'2018_11_27_154855_create_table_categories',1),(5,'2018_11_27_161656_create_table_categories_template',1),(6,'2018_12_20_133508_create_table_social_configs_for_section',1),(7,'2019_01_29_130652_create_widgets_tables_for_project',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `project_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_project_id_foreign` (`project_id`),
  CONSTRAINT `orders_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('hfash@bk.ru','$2y$10$Sykzx6upTarihLtTTwzk3uz4rGQezCAtvI.s3W9LfcoIsY7OtVeUa','2019-04-04 05:38:41');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '1-subscription, 2-domatin',
  `payer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_id` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` int(10) unsigned DEFAULT NULL,
  `path_dev` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_master` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_status` int(11) DEFAULT NULL COMMENT 'null - домена нет, 1-привязан домен',
  `user_id` int(10) unsigned NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_user_id_foreign` (`user_id`),
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `help` int(11) NOT NULL,
  `nohelp` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Быстрый старт','',0,0,0,0,NULL,NULL),(2,'Редактор','',0,0,0,0,NULL,NULL),(3,'Мобильная версия','',0,0,0,0,NULL,NULL),(4,'Домены','',0,0,0,0,NULL,NULL),(5,'Платежи','',0,0,0,0,NULL,NULL),(6,'Когда истекает срок действия бесплатного аккаунта?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',1,1,0,0,NULL,'2018-10-06 17:22:40'),(7,'Какая разница между бесплатным и премиум аккаунтами?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',2,8,6,0,NULL,'2019-04-10 12:32:25'),(9,'Как создать и опубликовать сайт?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',1,4,2,0,NULL,'2018-03-10 05:53:37'),(10,'Что такое Sailx','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',1,1,2,0,NULL,'2018-03-12 08:18:19'),(11,'Почему и чем лучше Sailx?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',2,2,2,0,NULL,'2018-03-04 12:24:10'),(12,'Как зарегистрировать аккаунт в Sailx?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',1,1,5,0,NULL,'2018-03-05 16:09:59'),(13,'Что я получаю как бесплатный пользователь Sailx?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',2,0,1,0,NULL,'2018-03-11 11:11:15'),(14,'Где найти примеры сайтов, созданых на Sailx?','Sailx – это платформа для создания сайтов, которой уже пользуются большле тысячи пользователей. Любой музыкант, фотограф, преподаватель, владелец малого бизнеса, предприниматель или студент смогут получить полный набор инструментов БЕСПЛАТНО, чтобы отлично представиться и продвигать свое дело в интернете. Мы позаботимся о том, чтобы все сложные технические процессы остались за кулисами.',4,0,1,0,NULL,'2019-04-10 12:32:43');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socials`
--

DROP TABLE IF EXISTS `socials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `socials_project_id_foreign` (`project_id`),
  CONSTRAINT `socials_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socials`
--

LOCK TABLES `socials` WRITE;
/*!40000 ALTER TABLE `socials` DISABLE KEYS */;
/*!40000 ALTER TABLE `socials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT 1,
  `end_time` date DEFAULT NULL,
  `cycle_type` int(11) DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 1,
  `project_id` int(11) DEFAULT 0,
  `tariff_id` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariff_rates`
--

DROP TABLE IF EXISTS `tariff_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariff_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memory` int(11) NOT NULL,
  `domen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad` int(11) NOT NULL DEFAULT 1,
  `favicon` int(11) DEFAULT NULL COMMENT 'null - no set favicon for site',
  `presets` int(11) NOT NULL COMMENT '0 - all presets',
  `price` int(11) NOT NULL,
  `price_month` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariff_rates`
--

LOCK TABLES `tariff_rates` WRITE;
/*!40000 ALTER TABLE `tariff_rates` DISABLE KEYS */;
INSERT INTO `tariff_rates` VALUES (1,'free',70,'0',0,NULL,55,0,0,NULL,NULL),(2,'start',4096,'1',1,1,88,323,380,NULL,NULL),(3,'premium',8192,'1',1,1,0,421,540,NULL,NULL);
/*!40000 ALTER TABLE `tariff_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'clear','Шаблон подойдет для тех кто хочет рассказать о своем деле','','clear/index.html','project.json',NULL,1,NULL,NULL),(2,'Старт бренда','Шаблон подойдет для тех кто хочет рассказать о своем деле','/app/img/items/templates/1.jpg','tmp1/index.html','project.json',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates_categories`
--

DROP TABLE IF EXISTS `templates_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates_categories`
--

LOCK TABLES `templates_categories` WRITE;
/*!40000 ALTER TABLE `templates_categories` DISABLE KEYS */;
INSERT INTO `templates_categories` VALUES (1,'Дизайн',1,NULL,NULL),(2,'Фото',1,NULL,NULL),(3,'Бизнес',1,NULL,NULL),(4,'Еда',1,NULL,NULL);
/*!40000 ALTER TABLE `templates_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates_categories_relation`
--

DROP TABLE IF EXISTS `templates_categories_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates_categories_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates_categories_relation`
--

LOCK TABLES `templates_categories_relation` WRITE;
/*!40000 ALTER TABLE `templates_categories_relation` DISABLE KEYS */;
INSERT INTO `templates_categories_relation` VALUES (1,2,3,NULL,NULL);
/*!40000 ALTER TABLE `templates_categories_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers_projects`
--

DROP TABLE IF EXISTS `transfers_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 1,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clone` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_projects_project_id_foreign` (`project_id`),
  CONSTRAINT `transfers_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers_projects`
--

LOCK TABLES `transfers_projects` WRITE;
/*!40000 ALTER TABLE `transfers_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introduction` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `url_referer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (323,'127.0.0.1','http://sailx.loc/app/js/vendor/maps/swiper.min.js.map','http://sailx.loc',3,'2019-05-22 17:44:36','2019-05-22 17:44:36'),(324,'127.0.0.1','http://sailx.loc','http://sailx.loc',0,'2019-05-31 12:08:55','2019-05-31 12:08:55'),(325,'127.0.0.1','http://editor.sailx.loc','http://sailx.loc/templates?category=eyJpdiI6ImIzaFBWelJLMklIckFTQmsxQmhGQ1E9PSIsInZhbHVlIjoiS3dieG9qUmdJTzdKUTRES1A4dmZGQT09IiwibWFjIjoiY2I0M2EwOTg1ZjE2ZWY2MjcyZWEwNmEwMTQ5YmNmMTNhOTJjNWE1ZmYyYTFjMTA0MGY4YWU1M2NmYWI2MDhlYSJ9',1,'2019-06-01 13:23:50','2019-06-01 13:23:50'),(326,'127.0.0.1','http://editor.sailx.loc','http://sailx.loc/templates?category=eyJpdiI6ImIzaFBWelJLMklIckFTQmsxQmhGQ1E9PSIsInZhbHVlIjoiS3dieG9qUmdJTzdKUTRES1A4dmZGQT09IiwibWFjIjoiY2I0M2EwOTg1ZjE2ZWY2MjcyZWEwNmEwMTQ5YmNmMTNhOTJjNWE1ZmYyYTFjMTA0MGY4YWU1M2NmYWI2MDhlYSJ9',1,'2019-06-03 04:41:45','2019-06-03 04:41:45');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widgets_project_id_foreign` (`project_id`),
  CONSTRAINT `widgets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 12:48:54
