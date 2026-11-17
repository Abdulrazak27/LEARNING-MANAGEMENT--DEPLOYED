-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: lms_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `id` binary(16) NOT NULL,
  `marks` int NOT NULL,
  `course_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrd2iqvu852eg13sql0micl26a` (`course_id`),
  KEY `FKhp7xk4630n3a1dtil022ews05` (`user_id`),
  CONSTRAINT `FKhp7xk4630n3a1dtil022ews05` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (_binary ';\≤ÉObì/╢ú\\R',67,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@'),(_binary '│ü7i&@ÿêƒ\ßnä\πe╖',33,_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'ÆåHÜSC\∩Ç√\▐Z\╓$',33,_binary '┬╢\▐y\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '!lçGF:╗╠òm░,F ',67,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'ìV\µ\≥▐öA╛\⌡ëZ\±0I°',66,_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '▒\δ\▐	ª°M2░x\╥Uv\π-\Z',0,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '║-\≥\Φ{pM░║ⁿïDª\r\╬',33,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '\╟,9-\αII╡èî\ε\∞$à\╒\n',100,_binary '┬╢\▀\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥');
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  `course_id` binary(16) NOT NULL,
  `certificate_number` varchar(255) NOT NULL,
  `issued_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (_binary 'åUo\┬\╚\\\≡½!|WXjJ\█',_binary '1D<SK\"╜ºⁿ▓\╞yC',_binary '┬╢\┘~\╚V\≡½!|WXjJ\█','CERT-86557b24-c85c-11f0-ab21-7c57586a4adb','2025-11-23 11:06:56'),(_binary 'ê\╟i\╚\\\≡½!|WXjJ\█',_binary '1D<SK\"╜ºⁿ▓\╞yC',_binary '┬╢\▐y\╚V\≡½!|WXjJ\█','CERT-881ece2c-c85c-11f0-ab21-7c57586a4adb','2025-11-23 11:06:59'),(_binary 'è\"mW\╚\\\≡½!|WXjJ\█',_binary '1D<SK\"╜ºⁿ▓\╞yC',_binary '┬╢\▀\╚V\≡½!|WXjJ\█','CERT-8a22743b-c85c-11f0-ab21-7c57586a4adb','2025-11-23 11:07:02'),(_binary 'îéù\╓\╚\\\≡½!|WXjJ\█',_binary '1D<SK\"╜ºⁿ▓\╞yC',_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█','CERT-8c829f39-c85c-11f0-ab21-7c57586a4adb','2025-11-23 11:07:06'),(_binary 'Å\╓H\∞\╚\\\≡½!|WXjJ\█',_binary '1D<SK\"╜ºⁿ▓\╞yC',_binary '┬╢▀í\╚V\≡½!|WXjJ\█','CERT-8fd65320-c85c-11f0-ab21-7c57586a4adb','2025-11-23 11:07:12');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` binary(16) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `p_link` text,
  `price` int NOT NULL,
  `y_link` text,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡','React.js Complete Guide','Master modern React 18, functional components, hooks, state management, and full-stack integration.','Abdul Razak','https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=600',0,'https://www.youtube.com/embed/bMknfKXIFA8'),(_binary 'K+w\∩TD\α¢ë°üä@ⁿ','JavaScript Mastery & ES6+','In-depth exploration of JavaScript mechanics, closures, event loops, async/await, and modern ES6+ features.','Sarah Smith','https://images.unsplash.com/photo-1579468118864-1b9ea3c0db4a?w=600',0,'https://www.youtube.com/embed/W6NZfCO5SIk'),(_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩','Cloud Computing & DevOps Essentials','Learn CI/CD automation, Docker containers, Kubernetes orchestration, and cloud infrastructure management.','David Miller','https://images.unsplash.com/photo-1667372393119-3d4c48d07fc9?w=600',0,'https://www.youtube.com/embed/hQcFE0RD0cQ'),(_binary ':RI¡\┘J+│⌐┘à.\≤:','Database Systems & SQL Mastery','Comprehensive course on relational database design, complex queries, transactions, indexing, and performance tuning.','Michael Brown','https://images.unsplash.com/photo-1544383835-bda2bc66a55d?w=600',0,'https://www.youtube.com/embed/HXV3zeQKqGY'),(_binary 'wcUWFJ@â╝5ⁿ\Σ\┌ │','Cybersecurity & Ethical Hacking','Understand penetration testing methodologies, cryptography, threat vectors, defense strategies, and security protocols.','Elena Rostova','https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600',0,'https://www.youtube.com/embed/U_P23SqJaDc'),(_binary '┬╢\┘~\╚V\≡½!|WXjJ\█','Java Full Stack','Complete Java Full Stack Development course with Spring Boot + React.','Instructor A','https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400',0,'https://www.youtube.com/embed/7WiPGP_0AUA'),(_binary '┬╢\▐y\╚V\≡½!|WXjJ\█','Machine Learning','Learn ML algorithms, data preprocessing, model evaluation and deployment.','Instructor B','https://images.unsplash.com/photo-1555949963-ff9fe0c870eb?w=600',0,'https://www.youtube.com/embed/ukzFI9rgwfU'),(_binary '┬╢\▀\╚V\≡½!|WXjJ\█','Data Structures','Master core Data Structures used in coding interviews.','Instructor C','https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgqqv_Rftp7wPUV1bK5JbuDZxY5jnDk0qqaLRRtadLftGjpjy3vO9QT2upRmUNFieaeoPutsMe4j6aUKbwQvZw504rIjvxNKaZ4WowsDeZ1W2oPM0oLBqFK6uu-bChL0bMnvuYM4eWlFb5gj0RDeODPCayM4Y2qJMAjoK_x7GYTI5Hp5ZigVbWDwyRq/w640-h320/data%20structures%20in%20Java.webp',0,'https://www.youtube.com/embed/zg9ih6SVACc'),(_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█','Python Basics','Learn Python from basics: variables, loops, functions, OOP.','Instructor D','https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600',0,'https://www.youtube.com/embed/kqtD5dpn9C8'),(_binary '┬╢▀í\╚V\≡½!|WXjJ\█','Web Development','HTML, CSS, JavaScript + modern web development.','Instructor E','https://images.unsplash.com/photo-1547658719-da2b51169166?w=400',0,'https://www.youtube.com/embed/3JluqTojuME');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion` (
  `id` binary(16) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `course_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdv9hrc0p26spp1wq1uox4lk7t` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-27 09:38:19.364160'),(2,'auth','0001_initial','2026-03-27 09:38:20.061583'),(3,'admin','0001_initial','2026-03-27 09:38:20.213521'),(4,'admin','0002_logentry_remove_auto_add','2026-03-27 09:38:20.223670'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-27 09:38:20.235672'),(6,'contenttypes','0002_remove_content_type_name','2026-03-27 09:38:20.375907'),(7,'auth','0002_alter_permission_name_max_length','2026-03-27 09:38:20.465951'),(8,'auth','0003_alter_user_email_max_length','2026-03-27 09:38:20.506958'),(9,'auth','0004_alter_user_username_opts','2026-03-27 09:38:20.516962'),(10,'auth','0005_alter_user_last_login_null','2026-03-27 09:38:20.594825'),(11,'auth','0006_require_contenttypes_0002','2026-03-27 09:38:20.594825'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-27 09:38:20.610208'),(13,'auth','0008_alter_user_username_max_length','2026-03-27 09:38:20.688499'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-27 09:38:20.784031'),(15,'auth','0010_alter_group_name_max_length','2026-03-27 09:38:20.805847'),(16,'auth','0011_update_proxy_permissions','2026-03-27 09:38:20.821447'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-27 09:38:20.910444'),(18,'sessions','0001_initial','2026-03-27 09:38:20.973740');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` binary(16) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `course_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKko7f08v61t5y67teh5jxxwrea` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (_binary '°Å░OTVJú\≡V\┬`','ok',_binary '┬╢\▐y\╚V\≡½!|WXjJ\█');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning`
--

DROP TABLE IF EXISTS `learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning` (
  `id` binary(16) NOT NULL,
  `course_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8wu0kdmwbk07jfi4alstbjp6k` (`course_id`),
  KEY `FKhp9a0w9eacsbhogjsixf1edlo` (`user_id`),
  CONSTRAINT `FKhp9a0w9eacsbhogjsixf1edlo` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning`
--

LOCK TABLES `learning` WRITE;
/*!40000 ALTER TABLE `learning` DISABLE KEYS */;
INSERT INTO `learning` VALUES (_binary '\Z\╨^.C╚àY¼Φ╡¢\0',_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '║·nlH%┤\═\═)H1╡',_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@'),(_binary '9-º\╙\∩A|┐\╚Jë:ç\Σ',_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'Y¡-S═ñBéú\αö\Γ\0▓╛ ',_binary '┬╢\▀\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'ïX\≡2\Θ@aÉ¡n╢{ ╡^',_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡',_binary 'ë\╠\ΦIEÜB\ε¥\≤D╖\╔\⌡\µñ'),(_binary '⌐W]_$\σL»Å\τ┼û|i',_binary '┬╢▀í\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '╜o\Γ{;m@cé3K▀▓tÖ',_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩',_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@'),(_binary '\╔\Γú\╚G\Φû>\πZ\⌠.1\┬',_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '\ε░ⁿIjäC╒öº₧\τ9',_binary '┬╢\▐y\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥');
/*!40000 ALTER TABLE `learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `id` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `admin_email` varchar(255) DEFAULT 'devtrio98@gmail.com',
  `otp_code` varchar(10) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT 'RESET_COMPLETED',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('REQ-1A4A23B0','devtrio98@gmail.com','devtrio98@gmail.com','242500','2026-10-18 21:50:41','OTP_VERIFIED','2026-10-18 21:35:41'),('REQ-25322B6E','devtrio98@gmail.com','devtrio98@gmail.com','523276','2026-10-18 22:17:44','OTP_SENT','2026-10-18 22:02:44'),('REQ-454EEC8D','devtrio98@gmail.com','devtrio98@gmail.com','992872',NULL,'RESET_COMPLETED','2026-10-18 20:59:25'),('REQ-4692FC74','devtrio98@gmail.com','devtrio98@gmail.com','289533','2026-10-18 21:36:37','OTP_SENT','2026-10-18 21:21:36'),('REQ-4F8D503F','devtrio98@gmail.com','devtrio98@gmail.com','609443','2026-10-18 21:50:09','OTP_SENT','2026-10-18 21:35:09'),('REQ-93AEDC11','devtrio98@gmail.com','devtrio98@gmail.com','637578','2026-10-18 21:44:55','OTP_SENT','2026-10-18 21:29:55'),('REQ-C2D6E7F8','devtrio98@gmail.com','devtrio98@gmail.com','263753','2026-10-18 21:27:52','OTP_VERIFIED','2026-10-18 21:12:52'),('REQ-C9F40027','devtrio98@gmail.com','devtrio98@gmail.com','242500',NULL,'RESET_COMPLETED','2026-10-18 21:36:20'),('REQ-D143F9E3','devtrio98@gmail.com','devtrio98@gmail.com','679054','2026-10-18 21:29:04','OTP_SENT','2026-10-18 21:14:04'),('REQ-F3E733FE','devtrio98@gmail.com','devtrio98@gmail.com',NULL,NULL,'RESET_COMPLETED','2026-10-18 20:50:21'),('REQ-FB98ABA8','devtrio98@gmail.com','devtrio98@gmail.com','992872','2026-10-18 21:14:25','OTP_VERIFIED','2026-10-18 20:59:25'),('REQ-FF669E37','devtrio98@gmail.com','devtrio98@gmail.com','471730','2026-10-18 21:42:55','OTP_VERIFIED','2026-10-18 21:27:54');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `id` binary(16) NOT NULL,
  `duration` float NOT NULL,
  `played_time` float NOT NULL,
  `course_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsyhehp7u3ky9phqokro91ih4v` (`course_id`),
  KEY `FK7fyumbty8qgbd7sfbbjnqdo62` (`user_id`),
  CONSTRAINT `FK7fyumbty8qgbd7sfbbjnqdo62` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (_binary '	\φ\▄bPEJÄ¿\±₧8Qªw',3606,98,_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary ']ì\╩\\«J╣ìd8¡\±\µ',287,97,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'HW╡°CMô╨é┴Coc\≡',24433,0,_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary ':\≡î\▄\╧\╟HÑ\╞9@H⌐\█',287,32,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@'),(_binary 'PQ%\▄C`ì╒│■g\╤',287,32,_binary '┬╢\┘~\╚V\≡½!|WXjJ\█',_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@'),(_binary 'gÉMr8ûHM╕\Θê*┤,Ö',42928,0,_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡',_binary 'ë\╠\ΦIEÜB\ε¥\≤D╖\╔\⌡\µñ'),(_binary 'q(-$0\▀N-┤\≈ú╗ô\▌\α',848,4,_binary '┬╢▀í\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'è,ⁿ)îaF6½\∩\╟\\\╠\∩*á',472,446.266,_binary '┬╢\▐y\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary 'ÄYH├¬¿Aì█î\τ@íà\╚',10766,97,_binary '┬╢\▀\╚V\≡½!|WXjJ\█',_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥'),(_binary '»çV~	\┼H·▒└\╥d¡\≈|',24433,0,_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩',_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@'),(_binary '\εwFwZH╗ç*\0Æ~Æl\±',42928,0,_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡',_binary 'ë\╠\ΦIEÜB\ε¥\≤D╖\╔\⌡\µñ');
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` binary(16) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `course_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqjlxbtg8i4mdn5cnm48e7cs0l` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (_binary 'U╦┐\≥@║º]íP&\█4','HAVING','WHERE','HAVING','FILTER','GROUP BY','Which clause in SQL is used to filter records after aggregation?',_binary ':RI¡\┘J+│⌐┘à.\≤:'),(_binary '>\▌X`JAFS₧\╤\εLrÅÇÅ','Primary Key','Foreign Key','Candidate Key','Primary Key','Unique Index','What type of key uniquely identifies each record in a relational database table?',_binary ':RI¡\┘J+│⌐┘à.\≤:'),(_binary 'GFìúV╣Bg₧\█2╜','Continuous Integration and Continuous Deployment','Continuous Integration and Continuous Deployment','Code Inspection and Code Delivery','Cloud Infrastructure and Container Deployment','None of the above','What does CI/CD stand for in modern DevOps practice?',_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩'),(_binary 'IÜúwM₧ûmph¿í\≈\┌','SELECT','GET','FETCH','SELECT','EXTRACT','Which SQL command is used to retrieve data from a database?',_binary ':RI¡\┘J+│⌐┘à.\≤:'),(_binary 'NW\╞Z\┘F\µÑÉ┐\∞1','useState','useEffect','useState','useContext','useReducer','What hook is used to manage local state in a React functional component?',_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡'),(_binary 'O└<D[BªöowÅ(~','TLS/SSL','FTP','TLS/SSL','Telnet','DNS','Which cryptographic protocol provides secure, encrypted web browsing (HTTPS)?',_binary 'wcUWFJ@â╝5ⁿ\Σ\┌ │'),(_binary 'R$y\"dO%ü#á│8¡Çú','Docker','VirtualBox','Docker','Vagrant','Ansible','What tool is industry standard for containerizing applications?',_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩'),(_binary '[úö6@îÅX¬\┼\Φ;┴½','number','undefined','NaN','number','object','What is the return type of typeof NaN in JavaScript?',_binary 'K+w\∩TD\α¢ë°üä@ⁿ'),(_binary 'hK½X\∩IÜÜY°\\\█N\Ω','An in-memory lightweight representation of the real DOM','A direct browser DOM copy','An in-memory lightweight representation of the real DOM','A server-side database','A CSS framework','What is the virtual DOM in React?',_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡'),(_binary 'u3p\╚[\≡½!|WXjJ\█','Java Virtual Machine','Java Virtual Machine','Java Visual Model','Java Variable Method','Joint Virtual Management','What is JVM in Java?',_binary '┬╢\┘~\╚V\≡½!|WXjJ\█'),(_binary 'u3è\╚[\≡½!|WXjJ\█','extends','implement','extends','inherits','using','Which keyword is used to inherit a class in Java?',_binary '┬╢\┘~\╚V\≡½!|WXjJ\█'),(_binary 'u3 \ß\╚[\≡½!|WXjJ\█','Polymorphism','Inheritance','Encapsulation','Polymorphism','Abstraction','Which OOP concept allows multiple methods with same name?',_binary '┬╢\┘~\╚V\≡½!|WXjJ\█'),(_binary 'u3╟è\╚[\≡½!|WXjJ\█','SVM','K-Means','Linear Regression','SVM','Apriori','Which algorithm is used for classification?',_binary '┬╢\▐y\╚V\≡½!|WXjJ\█'),(_binary 'u3╠Ä\╚[\≡½!|WXjJ\█','Model memorizes training data','Model generalizes well','Model performs bad on training data','Model memorizes training data','None','What is overfitting?',_binary '┬╢\▐y\╚V\≡½!|WXjJ\█'),(_binary 'u3\╬°\╚[\≡½!|WXjJ\█','Scikit-learn','NumPy','Pandas','Scikit-learn','Matplotlib','Which library is used for ML in Python?',_binary '┬╢\▐y\╚V\≡½!|WXjJ\█'),(_binary 'u4æ\╚[\≡½!|WXjJ\█','Queue','Stack','Queue','Tree','Graph','Which data structure uses FIFO?',_binary '┬╢\▀\╚V\≡½!|WXjJ\█'),(_binary 'u4û\µ\╚[\≡½!|WXjJ\█','Array','Linked List','Queue','Array','Tree','Which has O(1) access time?',_binary '┬╢\▀\╚V\≡½!|WXjJ\█'),(_binary 'u4ÿ╕\╚[\≡½!|WXjJ\█','All of the above','Inorder','Postorder','Preorder','All of the above','Which traversal is used in Trees?',_binary '┬╢\▀\╚V\≡½!|WXjJ\█'),(_binary 'u5Al\╚[\≡½!|WXjJ\█','def','fun','def','function','define','Which keyword is used to define a function?',_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█'),(_binary 'u5F⌐\╚[\≡½!|WXjJ\█','str','int','str','float','bool','What data type is returned by input()?',_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█'),(_binary 'u5HT\╚[\≡½!|WXjJ\█','#','//','#','/* */','--','Which symbol is used for comments in Python?',_binary '┬╢\▀\\\╚V\≡½!|WXjJ\█'),(_binary 'u5\┘4\╚[\≡½!|WXjJ\█','CSS','HTML','CSS','JavaScript','Python','Which language is used for styling?',_binary '┬╢▀í\╚V\≡½!|WXjJ\█'),(_binary 'u5▀⌐\╚[\≡½!|WXjJ\█','Both','Browser','Server','Both','None','JavaScript runs on?',_binary '┬╢▀í\╚V\≡½!|WXjJ\█'),(_binary 'u5\ß\┬\╚[\≡½!|WXjJ\█','<img>','<img>','<image>','<picture>','<media>','Which tag is used for images?',_binary '┬╢▀í\╚V\≡½!|WXjJ\█'),(_binary '~.î¼Ü\≡@╕ª-ÿ└ô,¬','async/await','sync/await','try/catch only','async/await','callback hell','Which syntax is used to handle asynchronous operations cleanly?',_binary 'K+w\∩TD\α¢ë°üä@ⁿ'),(_binary 'à@º\ΘA\╦@▌⌐68Hª╚¢d','Kubernetes','Jenkins','Terraform','Kubernetes','GitLab','Which platform is widely used for orchestrating containerized clusters?',_binary '.░ⁿbƒJ\0É╬èùTf\╞\╩'),(_binary 'ºO[M\█■Na┤Ç\╨└\╘∞»å','To find and patch vulnerabilities before adversaries exploit them','To compromise user data','To find and patch vulnerabilities before adversaries exploit them','To speed up web servers','To delete old backups','What is the primary objective of penetration testing?',_binary 'wcUWFJ@â╝5ⁿ\Σ\┌ │'),(_binary '\├cû⌐è»K¢Öº{kÆt\Φ\Φ','DDoS','Phishing','Man-in-the-Middle','DDoS','SQL Injection','What type of attack involves overwhelming a server with malicious internet traffic?',_binary 'wcUWFJ@â╝5ⁿ\Σ\┌ │'),(_binary '\Γ\≥\≈╕kGV░z║w\αS','Props','Props','State','Redux','Context API only','Which method is used in React to pass data from parent to child components?',_binary 'N■E\╓pOæ╠ÑC\Φ\Φ!╡'),(_binary '\÷p└\µ\█N.ÿ\╪\Σ|\├\⌠æ⌐','let','var','let','define','set','Which keyword declares a block-scoped variable in modern JavaScript?',_binary 'K+w\∩TD\α¢ë°üä@ⁿ');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `github_url` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `profile_image` longblob,
  `role` enum('USER','ADMIN','INSTRUCTOR') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (_binary '\┘q·\ZN╧╡Ää\Γⁿü¢@','2026-03-28 15:51:39.000000',NULL,'123@gmail',NULL,NULL,NULL,NULL,NULL,NULL,'$2b$12$CSDU1ix4XZgihwSAR6Qneem186l3NMbepZwh/HcVVIuOjhfZEPSl2',NULL,NULL,'USER',NULL,'123'),(_binary '1D<SK\"╜ºⁿ▓\╞yC','2025-11-23 15:44:11.310143',NULL,'admin@gmail.com',NULL,NULL,_binary '',NULL,NULL,NULL,'$2b$12$LV/RUNBvkrE1FBzj9EFZZOdI9bFPDS8GTRYUr6dtz1Tb1M3eZGwN.',NULL,NULL,'ADMIN','2025-11-23 15:44:11.310143','admin'),(_binary '%ùêÉ\π\δDS¼ú\≈╡x°\╥','2025-11-23 15:45:21.198396','','syedabdulrazak98@gmail.com','Male','',_binary '','','','9032018799','$2b$12$6AOhnN6qJv3a8zmGmyx3pejQazyJa3T08DZ2D3.cnMbEsfk2CzQOu','',_binary ' \╪ \α\0JFIF\0\0\0\0\0\0 \█\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342 \█\0C			\r\r2!!22222222222222222222222222222222222222222222222222 \┬\0T▒\"\0 \─\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0 \─\0\0\0\0\0\0\0\0\0\0\0\0 \┌\0\0\0\0╡\Σ\▐/ñy\╘wÄ^╡è71q⌐ôùB@▓[êZ│\Z\╤Të$╨èd¬É!\═1M¡#UY-æÆ╪¼▌Ü\╬s▓│ô>\⌡/\εF&\╞\≤\═=drg\▌R\±k░-Sf\δ6ö\ßóc}Xî\σÇ	êÇƒ┐>w5i─öIfl\╟Y\▐rf\╦\δ\══ä╣\═╥ªÆ╪éiPIBìN\╒\ΣW8t£┴\╓°\╔{N&v£Ev₧v√\'Åq\Ω?6\σ\⌠\0wO#«òûÜìC%C¡[XZÖ¿fhê¥C\'d░\Φët\█┴\r9\╪0[╔öt$\τ7+\╦A╝7.\ZN║3¼\εjZ5⌐┤í\0@\0\0Ç\0@Ró\╔`ü|v!\φ¥E\δ╒¥ct\±╛,√│┴\╥▀úèªÜ£\╓¬[éEÜusu\µ\▐{a\'EH9[j╘èvb \0╖\╟u╝∙fy·çÿ\╙\╥<\Γ_E∙\╒\╟1/A\╚\'\═\αTä25\╧L\Φ¿üiqÖmr5ìQÖáfh║	ú\Z╓╣\⌠\πnî▒¼û\±\╙«òCU\µ\σ\▀lL\Θmà7=1ÖK╖:èD\═σ¼╣,╤╗\═]9jÜ\≤ts\╟C\σ╗{úÉo¡r╣╛ô£:w╛>\Z\Φ\µ*`bdhêb\rÑVuÜ\╬i¼¬.k₧╣╘╜s5╙ƒK¢ 43e\"ÿ\0MP┤ì▒\╤o\╔X▐è½5╣ï2ïZôû\╪\┘WÄ\╓i╕╝\╤╬é\╤\µB\'sl4\╬\σ \Θ\═7pX!sóY½\Θ₧C¼t\Σ]ú|Gq5┬╗├ç\r╕3KÖÑ,óBë`\'H\╓\╒\τ\\\αYÖ▒3î\⌠J\Σ\÷Æè┤îué.XM\Zeò┴T4=r\╓5\'<\Ω\╘\σ/Uro.ä\φ.\╧\πn[\├S\"\\iq▒ÿ╗\φ╦╢u╤Ü%\╦>ê\╘/ö┼¼\Θº\Z\╓;\'Ñ\Γ-c\╙~[╜}C╠ª²\µ\╙^é\α\═:<\α£\σ\╥\═C\0┴╤╛\▄·cXe\εNàé:;N¡8Ü\Φ\±i⌐ô¡ñ#%ö\"\╨`*\╨╬»<\Θ\┼L╣\╘\┘W7\∩â\τ╨è╚₧]s\Θî\ε\≤sá\nªSL¿▐▓╝\δ\\oEj-a\╪\Ω╗7\╔V\╪u\π▒z`nµ╣Ä«î\∩\═├½╩Ö╣\█\Φ4\0\0åc\0û\0åñ▒låP\ß-╗L▐╡f¼\┼l¢á^s«NS⌐\╫6ÜÖ╘º£╖-\δ7d∩âù»<6\╙ZÅ\nZ\╠R5)┼Ü\╓fèöíN5ü8╥¬6\╩6\Ω\≤\≈\δ\╧G+º;y4\╒\╞k\┘═è\╦	¿\╧Nîu\╦5YI\╩╨ü4AAD╢`\r─ö\':ú\ZÆæªtôc1:	\╩═₧║─¡îCckY\µn\≤ôÑ\╬|·,╟¿ÆF\╨└¼Öç\"ñ\╟`¿T\┘cqE╠▒\▐-zsnuª\≥É\≈\τ\╓\╧Iπºº\╦]Xr\ß\╙\π_FzNx\µ¡5¥\φÑ╔à4\╘\0tMP&4Æü1Ç└ë¼h\0╪¢M┤╣ÆUE:åì\╦*í.╪╕\τ\╥j.\┬i^T\╪H┌¬¬ûV⌐s4¢3V╡ö\"┴á\╥eàMQ4╩í\╦╫┐\Z\δ┬╢╧Æ╢\σk\0ÜF¡\\╝\αX\╙Nò6	¢gx¥╝╡&ô«r7Æv\σÆ\╔|\≡yKû=\'DÜ\"\╔¿m%╣FÑ\α\╒ñ\\╡\ZLí2iÿ\╚Të`&┌ök4¬½:Ku/:\┘Yä∩₧º9s╙Üi╪ûÉ\r:w-/B\─\╓3íÆÜ\Z`åùM░\Φ\═\πuZôCzgy\Θ╜∙²qa\τ\⌠\Ω\≥\∞\⌠∙<╖k\╫\ΣâM9\\╡+$h║ôeK\▐dxtcP╪á@Å|\Γ\─1P┴i:\╩û3\█\"JÜcd║₧Ö┘¬█₧│zôJèù(▄│û:▒\╘σÄîz\≤àKxr\╦%înYb\⌠ì	½ÖHd	▒i¥ëî)tg½\╨<LK╗ƒú\╙\σ\Σ\⌡x\≤╜2áå|\δ╡Ω╡│₧6ìK25^¿ÿ\╪17+\╨\╬{\╒D5\╒c╛k1╢UUbF\⌡\╬g^å╛^Ö╫Ñ^N5╕<\Θ\'4e√╬╝\≤ƒ^w!╝\0X\0t\÷\╦h╔ôbacZ@¢bE═¿6.₧~Ä^ï\n\≡}}¥}ⁿⁿ]┤√∙\'ùL¢τ╣╜qL1X\0|∙v\╬f\Γ\πVÿ\╬t	üz╧á«w\╥\╬S»#3y\"4ë½DB¥╞èV█ûK%çZ\ε╡╬╢ì¿3\╘\τìW\\b∞╣âB▓¢Z\─;¥AöÜM½3I▒┴7D₧ƒ$r\\▌⌐\╒f¡º\\v\█\╤\Σ\∞\τ╥ï\Σ\▀\r?/_C\σ█ùj¬\╧\╫\≤⌐#Æ\╞HxT;ä:0\─0&\╨\╙	\Zª Wy╘ò«\Z\╦Hö¥║wû]M«-4┤┴g¥my╝δºúù½6╦ë¼2\╙3ªf\τ-gy\├k%Ä\╩\rNf\▐\±┤1ÿm\ΩIjôá[\σ\╙ \0Å\∞°£z∙║\╞\▌223oY╣½\ε\ß\⌠y·V°\φ┐?Ö\╔\▌\├\π·%IÄ¥ⁿ\▌|^ \0òDÖöJ,É\±┴L\ΘR\Ω/\np\═lº<\╨2ZÜ╚ò\r\nº[+\\²)┐?W\╧╬║·╣·%Y\ΦÄ.\╟\'?vræU4║ca╞▒¥r\π╤ÄªJ\δy╛mòÿu\ΣjM7añ\Θ\\m\δ╛d\δ¥┴\Ωp}&gâ\═\φ\≡\Ωgù\╥s\τ^╛╢6w°₧\τ.\▐\╙}╣Ç▒¬\╫=»½ù½\╥\π\≤\≤╜7\╞^=IÅ7\╥\α\ε\≤√ⁿ╢@┼¿\╠\─\≤\╫qï╧ƒS8ùs8Γ╕┤ΘâÖvúìw3ü\≈deƒáGsN┘òh╖₧]·∙;╕ï\▀-¼æ¼\∞û\╞\Ω\\uª6\Zä\\\µ\ßÄ°\Θ\r╜I($▒ │rl7£uÜ╣3\╥7\╦oó∙┐g\Zkù╥Æ▄£\⌡\\æ┴\╫\∩ƒ\┘\µ╬£ô»G^\\H\╬MI«ú;\≥}Xl\╟fâ£\\╬«G\┬\≈ⁿ\═\╫2\╫>ôòg ¥3ïπ¡î!zkÉ│¼\π\╨┌╣a{gæY\▌<z=ñCçY║╫»â\╨\τ\╓xz\╠t\╫\\6\Θ═¬3╝╒¼\Ω\nPüU╚╡¥$f8φò░\╥▄╢»6F\rAL@-\≤╨╝\⌡\╩\÷»f<OM\≥\╔\╤uå5\Σu\÷\⌠\⌠╧ò\Φt\≈¥╡ì|\≈/ú\τ·╕\─\╥k}╣zⁿ?IF:¡9y╗∙²Å╗~w\τ·^s3Yæäö╓ÜWâ╛¬!╕+\╬\δ¥\╬₧σ⌐àG1\┌\≥ê\▐1u┤\µ&\µ═₧\┌a«UsÄ\┘trt\⌠╞órñ\╓u(ÖáM5£°7ƒN8:\ΘD\≥»Z\Σ\Φ\╘\╒\═\πBjÉ\╩x\╬\πn£\≤T╖\╟\╪\▀╕n9=ná╬ä\╔@\0£,\≤|²q\⌠\≥ÉT╝\Θ&Ñ\ßv\≥·\▄\⌡ƒù\⌠╕╫æ=X\⌠\╬E-a=â#\╔\▐\╔E⌐\╠\▌ZÆ\═2£╔⌐ô│C2]	ñ\πfò\╔█⌐ÿ┤\╟n=\≡╓┤¼▄╖$╩Ñ─╢\≤,q3⌐Q<·ÜL:º5Zφåÿ▌⌐\nH\╓D.ÿ[σ╢▒ò.²\±\Ω:Ä(\ΦG₧ç?ƒ\╟\╫╫ƒ┬╖¥sò¿KRë▄╣\╘\δì\≈aìcS╙⌐\ΦzE∙║%Fº\'ï\⌠₧d╫ï\Z\╟~R2\τ\╘h\≥z)@iy\╞$l\±\rîié┤¼t\╬\"jd\╫1/S\Σi╛an%\τV┤æ,s∩ìÜi\╔U┤\ß-o8⌐m\ΓVåw¼ò\"jE-!j7;\δƒV[\π»>ºù\Ω╡}qç=\▀ù=╣∩ö«ÖÑ(ñëDÄv═╜î╝╜\▀OÖ;╟Ñ\╔\╬\Θ·~g¿₧\┼g\\:Q&\π\┬∙∙k\┬\╦\\}|Ç.}I\φ^/G\Φ\π▄┤╗58\δ╣\µ\±\╓\≤)ò└ç#y¬╓░gA╬úuï¡îCEÜ6\╧7Züh\╨g\═\╫\'.┌Çä\┌═⌐╣\╧Y│,\≈¥\πn\Γ«-@tv\±zZ\ß|╧ƒ\\_í\µ]▀╖┴╖ò¢ÆK╢ê\0\n\0\0éQ5\0\n·9î╜Y\≤Lo╗>a.d\╘X=\┘\╚\±zi\'T\ßv\∞╠┤⌐XÉ[\"z\π\╧\╤,\≥╢\φ\╦L₧\╫╢½₧ç9\╩y²\\╜q\╥run\╥	I⌐)ƒ?T\╦┴=╣\Θ\╧[ú7r,uMºWE^xi\╫\╒\╩∙╝■\∩Å`úù2\≥\─L└ö\0@\╤+1\─@\0\0║/tl\πÖ\⌠╣y¼\╠î╞╡èTÿ╞Ñ_*:\'\Z│C#SY\╔k+ô│ù«\'\╥\≤=\φ┤r\Ω\─@\αëj!+JjñVzìªUA^╢\\¥Xï┐╩ÖÅg├╝║dywny\╟g▓\─k,@\─\rÇ@\0Ç\0%\0\0\0\0\0{SgÅ|\╒δêñh)&&V╩ê║\τ\╒ ¡LMpW\╒\╟\╓H\╚9z∙½/O;\τ╘ï₧}3f│s2¬ZÇEûUK¬R\╒\╘UO╗\α{┘£╛o╜\╟s\µk:t\µ²?\╨\┼\╧\╚\÷╝]AúªüêÇ\0\0Ç░C@\r0Lä]ÿ¥[╟£z\Σh\┬\├\═\⌠╝∙j\Γ\σöjî\Θ└\├B ôT\ε9║∙\≈V\α\0\≡\ε\δ\═\╟\╧\⌠|~}╜\╔sìd\╩wI\═=Ps¡b\╪Vê¬(P┴\╦\╩\═=\╧\┌\╠qX╦»6·º¥▀░\╧\'ì\∩∙]3\╚^`\04!êV \0\ZñC1s\α#│NÑ\═\≤O`\╠\≤└\Θ\εH\╧L╡Ü\0!ê\┬\╠=│\╥0\╘\═oL\Φ\╘7\╘]╗.=å\┼\Γ{\▀=½\δ╝7\═SJjAXM$\╦=\"\╪\ZÿÇí9W₧│\Θ·|√\Γ\╞o=J▀ô½7Vó6a¢ƒñ\∞∙\∞~¥t\╟╠ƒA┼¼∙gF0Ç@\0z╛i\∞se└UtÖÜ\Σ\0\╥ⁿ╫╗¢\ΦÉg< n£╜\\\≥skÄ\╙@\0\0q╛%\─i\n\╨g»WÑ¥\≡\≈╡¥\π\╨£\≡∙\∩ñ\≡&∩½Åy¡\╘<\╥ö\'⌐î^b\0\0á\nSPô«^╜¥ôyf\µ5Yteñtgóèñ\≤Y¢ïpKö\Σ\∞5<Ä/ñ7Åû\Φ\⌡▒\╓|\▀GÅ╗9\µ\δ\ß\δ\─ùC¥w1\├h\δ«!>Ö\█\▌\≥²^ú\╞1╛└;q1\▀(\α\Φ\µ\ΘÜ@\0P&.«\▄\δ\╩\⌡;Lm79\╤5\╥y╢nK\╔\÷9q┐|4\╬\⌡¼\δ:ñ\0d\┼MÆ5@\0ÖS5_\╨\±wIT[5\Z\σ\▄h\╒p\σ\╙;#6\Σ\╦y\╪\┘2┘¢+Å▒\┘\π₧\╬7ƒ₧╖╦ªr\ε\α\╙y\δ\µxjy\╠u\∞╫¥ä\▐\µG>₧╚▓\Θ\µ\┌-_O7L\╥\Z\┼A<·╖\ε▀₧\≤╖<·RöROPïÇKóg^DSù\─\µ\÷╝^}nó▒½$) ö╓óÜTÇ░M¬\÷╡6\═NR£\Φ┤\╧L)ò*\╥(û\╨\\8q«@\0\╨Y┌╢êVÑ4í∙^╝nx7Y\⌡\πñ9▓N═▒┐/¢│¢R\rE\Ω\Γ\⌠<┘ƒG┐\┬\÷¼\≤║╣z¿@v\≈c~wúS╧úHä¿w⌐1q(\µì@\Θ\╠\╚\≤=l9\⌠\±*ù>ëÇ*D¬	TjAhÖ╡⌐\╒╒»2s\≈p\÷\┘Qy\█zFÿP\╠\╨\n╝\ε`L)┼¼+ê\0óñM$Ç\╥h▄▓ô\Θò\Σ{|W>f\╨·r\ε»7lv~og░åW│\Γ²û\╟\═tus\φ¼\╘\≥t\µ╫½¡cdÑì┤\╔@THíâóæs1R«ª\Γ\┌}0ÿXEy∙║y╛û\Θ╩¼\τ╣3tTû\╠\═B:║c,5\╞╠╖\┼\Ωu├⌐k\\\⌠\┼`\0sDü(╨ùK\0X\0<\⌠\╚\╪	jk;\nÜ\╥─Å\'ƒ\█\≤║s\Σ₧\Σ\╧/?¿\╫\╔=P\Φσº╝x\ε½;█Å_v8²▒gD╡ìJÑÜ╤ªí\0\r:jª\╚ASkM=\≤&╝┌╢ÅC\╩∩│ùO\═\σ\╤*\\\≈#\╙v\∩+;╟º9L╖7z\"┌î\┘\╥nP\0\Züá⌐⌐\0\╓u\Θa¥ó└ò\τS⌐U5\rK\Σ\Θvyí,╙û2z|²;q\┌°:\÷\Θ\∩\'\╧\┌\σ\╚\─\αA\╧r2ÉH4\rºU₧Ö\┘5+⌐\╠|\├\▐r,∙u\┘z\╤\╒═«Ü₧Q╫Åƒ╢Cy¿eomw\σ9╡`└z\╬╥╕\╥3iä\0└\0\0\Zdîò\0RVCUR19a¬\╘*\\4w\ZG\'\'Ñ\τk\"\╦TzxƒI\τzÿ\Φ\╧QIctÇñ\0£\µ⌐h`┬òY1Y\╤Qr░ R0Cè│yæ╢n\'a5├║\┌9\δÿuñeªùMfñ\╩`\α\0\╥\Z\0!\═Lá\╤4äº4¿hA661╦ÜE	D\≤t\'₧\σ\╠\╨\─\≤!v·9{t\╫.âN&4îm╕╣F¥)sÜÇª\'⌐£^p\\╥░ i\╥\0`\næ`Ü2╦⌐\δZgqSÑTM2PD╡C\0\0\nUdª	ìe├Ç⌐4ì¬ñ£E%t\r	\Zòli7ñ\Σ\τ\⌠|\╓l\╠O7\Φ~{\δ:eª│A\╒H\╠\ΘN5ú@ªÑP8\Ze\═╞│Θ£╡SJ└üºH\0iéj╞ÇM9]M&I▓\µ\µT\01\╘\═H1└\0U⌐\r\0TÉ\╙\═iáMJ\┌v▄Ä\╨	\═eôj ░╣\\°º₧H\╧7╙å\Γåt0ò\ΣPgJ@L!░½Ç\╓s\╠3néV\0BÇ0,ûa+á\"Çr4Rd%l `\0Sá│6R¥¡%l,R\╚U ëÇ]X$\╚Sá╘¬\═\╧ \┌\0\0\0\0\0\0!\╩▌É \0\Φ@√¡ü@¢xC \0Wêvp\≈┤ñÿj·£$■╬Öçê\╪M5\≈6JFnGÅ╜0MG!ù\ß9\═fo¬)M`\├\═ⁿ%ª\╘	╕┤0è^\nx6∙ôT¿ñ╗7┤G\Φ\┘Bw·Ñ²\┌\Φ?5ù\φ1Üu£4\δ:ä⌐èbk \ΦW{It₧_\αT\ΦH,	ⁿìQ[\⌡\▄IⁿUñô}│h─ÆpF\Zh\╟S/D»Ç½lMàI	Ü\α\≤╖\╪4u~VJ√╡Kùî2²\τ» \0╪ñfv\╦\α\0B├á\╩@;ç|Mú\╚wû\∞┐H░O\∞\≡_\╨+╖g\0\╦m▓*b\0@\Θ\τ╖\τ(.ÉíeD \Γ4\┼fûñ¢╗?`s\⌠\0O,┴D▓!U\▀6uM6x\πa├ñl\Φ\╩├¢l4\α=╦¢ë\╪\n\∩½\╬\≈C¼vi⌐(╕\╓5BuS\∩⌐\▐[Æ∩«ïzk(╩╕U\╫\≤\Z\÷╡╛┌úì\"╣\τ\π2\▄∙j\∩┘ü\\╚⌐¼\ΘCî2ôQæ\╧h∙oA0;╠è¢├╗\τ∙ráå)!bⁿó\µ;\±E=¿1\Φ3>┐\╩\╙\┘L\┘\r\┘sr4\▀2b\╫F\█ e▒/4:¢qï<D* \0▐ïª\α\≥\═1íZ╢\σÅ\∞\∞£{ï=¬\╞	·>\ΘP\±│&╪₧%╗╡.ÄT@\⌡\≡Clf\╓9»\Σ]¢]5╡Sv	Ch╤ºì.\╦@\╠C0ún■\╔\ΩHá-\π\╠bj\╧\\»eÑ\Z\nNç5╖╗åïd∙áF}Z7dh\╥\0pE>~¼G\ZH\╘jOñi\╠\╔\'\δ\≈╡1lha½N5D√\µ\╪\▐(\▐\╫\┘tZI-èbñû0Pº£{a¡6ÜrzTuô_ÿYÜS>\═kÆ╛─│\\╒ª1F¿│Y\µ⌐&Di\ΩC\├n\┼$a╣╣7\▌\┼å\┌\'aï┴/\═ⁿï▐¿\≡-àw│NF▒Ñ\╪\nΦöä_ï~Nf»ïÆ\╥SÉW\"\╪Eú\εN¿\╔$yr\\óyt\▀dâg|₧UG·╝G@\πèFr\┌\≤│¿Z^ⁿÄ▓■á└Öq\╙_╩äó╡æ]|à~\Ω\╪k\r\≈è Y╕₧\π°εéÜ{\∩₧2Ys\┼\╪\π\÷¬g@>├ï\ΓH\≤╧╜╠éº¼0ê ┐GO\≥¡\n/¼	ì)9N4¬\Z\╚·I\"ÜzS·\╧<ⁿsg(KL\0ìhÆ\"O(\µ▌Çx▒\τ|\▄J@2Yñ₧.ZôîsÄ┴OÄ║┴3O╛Åö\╨|«gàb\±zè\∞\Z»ⁿ\πD[ä3\╟\∩ëT√£K·\├\÷ \0X\█f│ü,°*■á?\─)£ñ+\σY╢⌐Ñ°í\┬\≤z\δ\÷ÅYª]▓O▌úíMo\▀\µ$&µ┐ûä²iÿ₧\╩UÖƒq8│\τK\Θ?D\╨qa \Φr\φkæ¿\█c\┌·\σ4Ö\0\Zt\Σ\≤╠ê\▐\n:\╒│\╙Rw\▀Eèza\\\∞{a■P┌çK▌¿_▀Å\≡M[ÑÜ=ü\╒.ÿù[\≥\Γ·\α&:í┤âw\┘G\ΘW<Au0æ\╟\╚N\⌡6εî¢B▒\Φé@_\σ_\Φ^\▐\⌡hqKA└└!aé\rùE¥·n╛─îªólM│╘ôuc	√%rå!yâ@¬»│e╣2ü~N;9ß¬¬n╘ì╦Å\┌\├SEÄ\█\≥▓¼qD─│W\Σ\▀]¼╝M)\⌠√┼ûï\█\ε\n┤½\ß\▀\∩\≡/\Θⁿo%&╕\εDA%\╙\▐>\≥²<\▄\ZÇ*┤\▀ \01\Φ\≤%\≥H\\VñY*H`u\╔M ~\╚\"■ \0\╟<ç\╚\±°²p/Çè8╜w\α}(=	\≈A \┌\0\0\0\0\0\0╞à\Z;Xd\╠√`\∩\≥zº4\┌\rT\╚}AZ\╞\Z½╜\╟òl▒|sQJ#Æ]\Zùgkf▒	\rGv╢\⌡SF2ï\⌡╞▒╛ⁿ\±\┌\"█Äo:\╤¡\▀ÆïÅ╗│GL=m.r\⌡i\Φú\α\≡\╬Ç\┼?\α\├W\█AhGâ«\┼\εryî/┴|úC\▐IÖî\'°¼₧FM╝fÇÖ\╩q\Γ\╚w\┘\≥\├;\0\┌p│wELY╟úÄ(é·\"?┴2d\≡\≤dZr}-║\Γ}ñ F&▒\╙b╠ô\╚l<(\φ\÷«\ΘÖ<î╚╛á╣\╚c\╨u\εî\±ô╞Ü\─²ZZÉ5\≤\┌■«S╖ëïZf\▐Na\0\⌡íPö\∩\═\Γ╢úevÄ\δS\┘■ÅÄ\µnn╖rÜ\═\▐t\╩\εXDH┘áiªlòª¡å \079\─\╤B│Ü▌₧GáW\ΘNöü⌐\─\⌠╔écé6║vó\╤fN)}:╗]U\δNêR┘Ö\╩■√½úç]┐7L;=ó<\ε-¥ô^\r\╧0·5gÅ \0F╝íä\┘|\\\α\╩y0ç╣@V\┼R╫æV\╩Z{ε¿É/░\réÿÇR)\⌠G▀öl\∩║nW2D\∞y	₧\Θe\÷\0j\ßeT~\╟╓ü\≥╢Y7\⌡:t\Z║\╤à.\≤*s\Ω(\├\εº\╙▀£Æ<O\╬#	√,oâ^,%6GvÑL=╝è╗\"¿\εö#\Z\τ0²▒\┌S[\τ\─M■\"\⌠°JéGÆ ΣÑ╗7;₧\Γp╛\▀\'αá£&░\╨UÉ\┼\≤JS░º¢\╦):\≤GP╥┐;\╬x!@\⌡\σ╬ï|╢⌐îC\r[(s`T$;	Nó\≈¼1\╩B_\±\≤√ú£Wñ!┤¿\≡\Θ{ì\δ\∩\ΓgLw,»°Tá=(	ª║\⌡Æ`c\╚fÆ(RÅ▌º¿└■P\╩ÖYè╜\╦/\┘\⌠\±h┴~\▐\Θ\▌+5\┘,á╕|äxT½&A\Σv~ å<LiÇ\rG░Ä=ì%0J¿\╘\φë\rS8sâ¡&╚¢áá+ç|AíâìQg\⌡│+ⁿ╔à\▀>\\\r┴-{┐J1#\╤C&\ZA<┘£\█\▀~m^▓[√\ΩO52\Γ«>=▓▒\┘unWD-Ö└CjaïRXúv¥\ß¬%\╓a√¬\±\╪C\╠╝░\σ\╪~█ü\╘zê\╧]\≤ì?ªi╬ú\n\╧I\0ÆÅÅÖWiO╚╝7┴\n2\╤\'nⁿRX9\≈·ÿr1_1ú┤/m_\0²╥╡2╢L╡{╔╗½⌐╝\'\≈\▄h½üºî$╝«╩Å\╩\╧\▀;+é°a\σ0`æ\Φ¡)\Σê\≈»/`\∩Ü\┼kN5╡\┘7è}}i\─S\Σ╧╛\⌠²n\≈;4\∞j╔ÑT╖\δ▓<│BµÅæÆñ╡ⁿ\"\r&£\≤/\╤b\┌h\╤x)m╢\╧$\╩-R\ε\▄Xàë\╪F?+UE3ôª▓■@É2H\'2{4pG\Z\0\─)\≤╢*²!VU&\╠yaa$_¢\"ÿOÄ\σ└`\╘dë\'╡«!E┘ñV	a\▌\α\▐\┬╡ªd┐nû#q╜╣É,\┌\═c\╔è¿dÿ¡╠ÿ\δ\╚/┴¼tm╛:▓Nÿ<\∞╠ÑÇ$.êë\┘·\█=djàtÖ8░┴X\rk_Bu\'┐\0p²Qs\πi▄╜ä\Ω,·,%¿A\τ\∩·?(\Γù\n╛\εÄ\±~\⌡\σü\╒@@┤Ä╜Dh\Z\0\nbm╢ ¡╝«e45$7\εu2\±°(+Vô3a╜\Σ╜Jà╣╜F\╒;3\÷M╗Wc¥.æ\αaW|\n┐s\▀_v\'ƒ╫₧\n0áé■7■x7á	\∩`ë\≡í\≈└ \─\00\0\0\0\0\0!1AQ\"a 2#Bq3í0Rü \┌\0?\0_M\╚╒ª?ªe∙?\█3\φ┘╛á╠ùü\Θ▓\⌡=,ï\╪\π?âî╛,ó┐ìïk-èO\ΣR\"\╔?Æ\Z╠░TÖ\≈∙ƒæ\Ωr>\┘\rDô╢à\⌡\≡=ro┤=UïQâ\ε\"}\─Z$3\Γ─║\φÆ╩Ñ\█g$tP\╥Dêóàò(*=qg²\╔h\╦.\─QHñqGⁿ£>G┴\÷╪╛┤\╞}₧3\∞áGA\ßô\╤F.ôù\÷=?\∞Zy1ir7Hç\╙\≤\╔]\φ∙╫░\⌠9ù▒\÷yk└\⌠\┘░\≡\═{£╛N_º/ü┴ⁿ\rV═│ô9\╦\Σ\⌡%\≥zÆY#╫₧\╘/\┘	R&\╙b \0\αCt,æ║µá⌐y%3&Z%æ▌É\╬\Γ√4X\π╟₧╠Ü/ú\╧l╦Æ·[Ic└½₧NæûJOÑ\╤\┬?Ñâ╨ï\÷>\╬W!\Θóⁿi\Θ\⌠Å\╪\⌠â\φº╗ä$èEq)ö\╩dñ╤¢3#7\'╤çP\α┐4O\"ùe\┘\"PMÆñì&╜\π\≥CW\Ω+LÄ¬¥Lyb╒ªE▀ô&[\Θo#▒\┬W5fl\∩+╢Z\┘öa\┌\φÆnN\┘[▓⌐òⁿ(lRTrEó\╓\▌l\▌#,Ö5bt\╬M∙#(Ñ\┘EÄ\╪q~\Σô\Γê╧╛à95┘ï4ó┼æ\╔nô}#Æ/\≥\╔\α₧ù}i\Θ\"}¬%ºQ+∙M■Eöv]WVR┌æ\╓\⌠Jⁿ]¥Æ╞æ)(°╛┘å.\∞Q\ΦqLx\Γdéhîùü@ä½¡¿ïîR°d\╪\≥ú\╘²É\╔\▄┘ô4º \0C/∙N\r\╠\ΓY~┼í▓2G8£ó\\KêÆ*#Ñ\αn\┘\"ë¬FD\█\Φ╞¢\ΘúRB\┌\╔+Y\┘\ß0`ûCû^dKF¢▒\ΦÆ2\ßÄ?$°F5]ù\▐\⌠QEmEDR\ZSt(#äN\⌠\╤\ΘíA]Öò\±\Φè\≈)ë\"\╪\≡;#j1┼¡\σ\Z\≡~CìcTA╗úóp\\b)j╛ST╜à⌐\╠\█]åY╛M\r|ëvW\≥¡₧\≈▓\ΦNÄ_íK\⌠_\Φ\σ·úÜFE\╬vGÑ╗Bìæè,LMg\n%Åó0i£mâ▒7óóÖ¬═æ╛\Θ|ÿ\≡R┐₧z\\1\⌠è?\Σ44x(óè▐╖o\αBh┤Z-\n¼┤dñ¼_\"C\┌\÷\Σ9ï ªAë(ò┤╖drZJIeP]\÷\╔\╬S\≤╗\Ω[\╓\┘\⌡≡½¢úúù\Z\╔\─ΦÆí╩╝Ö]lÅ·E\"è::2°╠¡Ö9P\µ,è\┼3R.\╓\╤\╤╪▓╕¬ë\τj(╚┐4QFLæ╞«Nì_\╓\Γù=■\╠\┘\≥eò\═\┘■¥\╩┌û2YÆ\╟\┼.╠ômìûè)\≡$q(óèLæ■i╠£■OPr\∞ÄJ1\ΣL┴Æ╨ä╢í$5\┘V\╘qE\Z¼\╦)O\α\╘\δ2\Ω%s{B¢¿½g\╤p\σ\╙jR╚¬\╠\≥ä¥ù│[!\"ÖOΣúìè▒Aⁿôï\±c^┼ë\ε\±&OLd\┬Γ¼í#₧Mÿ░q\≥╚íúìè\"EQ[}V┤│Hä%æ\±è│K\⌠iIºÖ\╫\Φ┼Ñ┼àq\┼ \0\÷gO\\mÜ«▓=\∩t&\╬\╩\"\∞K\÷$■N╫╣][\Z∞¡╣L\µ\╔MôùC]Éçf9R\ΦSb¢!.¼ïBB]è\'ê\╨\≥╟ƒ\∩iL\╒~xe\╤\⌠\╪B:d¬¢\≈ \0\⌠Åo■ìO╒û	╕\┼\\æ¿f\╘j \≥3U█î╛Q[\╥)R)mHJ\'\Γ$ÖHkg.\δd¢{%bIòÉD!\╔\⌠z||▒xí:\"%▌ë	L⌐¿╢ì$yd╢d┐bù╣ò\\ZG\╙?\≡\╩=¢ú,_.1>ª½P\╠P\╔²\╥\Θⁿ░\┬ER\┌╨╢╢vrh\Σ\╦b{j5>öxún]2RⁿÿºR\≈G\▄L\µ\╟+2<\ntc\╚\π+Cƒ?$_U╖*ëï╕┘¼\═,i(ÜmBxI√╛ñ£¬kú\∩q\Σn1^╞ù/º;~╜ñ\╨\Γ4`\╘B2\╔Ä⌐\⌠C$\┌\τ\╫\∞z,~ú╔ÜVⁿÜ\φNëπâ╗4ô\⌡4ægë└\⌡G⌐·Z\÷=G\≡s¬■m√ôñrbô5\╥ⁿ\╥1║Æ\'σÆôG¡\╤\Ω¼H\╔\α\╙°\Z,î\┌!ùí;C\φ#Q5ÿÑæ«&XKÖE√▓¢4\┌╝\▀%Tì)srj\╥2\Σ\┼í\'Lû/éXÖÜP\╙²BO\'è3}W\±\πî\╘\δ2j╦»╤Å\≥:é4X°`îÇ·\≈-{▒q~\τ(*8D\πqE\"\πt\╨\σ\╤\╧yF│ä\Θ┼ÿf\▐BDòìm\╦\┘\≡i·\ΦÉ\┘f2F\╥!·F}Z┴.	[\',Ü╝\r\±╢Ö~ñ!%Tj~⌐iz^\╠╧¼╔ò∙ñrmª\╠rîαñë\Ω,\▐uÆ*\╙4\▀A\╘\σ\εkè0}Kï╣■O \0Fªå┴W²\ZV╜5[-º,\∩ª\╧\≤┐sÄf√æé~ƒnV=Lñ\Θ1,\╠Q\╠ⁿ▒aô\≤&,\⌠#\≡<+\αÄ╜àì\╞vëöIè1╟æ¢]p╢\╔\πqt5\┘\Z G\┘#	¿RûY\┼#«Xp\≡\╟\µ╠Ö%Æ\\ñ√\▐8\τ\'I\ß\┬\n#&ô\≥63Yû*-Ü}Tq╟ïf<¬Kí;\┘\ßì\▌Æ°(ⁿ\n°\"\╥\Θô-Äp∙=H/,âï\ε╬îæ\Γ\─∙F╞åçb\┼Hâ\ΓFñEE¿\╔\╚\─╞îhâⁿ¿û_Kÿ\⌡\⌡\σ\σ\φç▓╦îQâ\Θôoⁿ╜┤qy\∞\ΘxDÿ\Σju8p \0\ΣÆF~ƒ4╕\πÜo\⌠fƒ9Å▄╖Æ~âx1M\Θ\≥\≡oªA\┌\█ⁿƒ\'√▒\πô\≈#ü√\╚√\┘\÷\╤∙ç\Z\≡çè\╪√h{t,Ya²$\'Ö\⌡:d/ì1¡óÄ-í\πGüEæM\r\'\ΣQHè1ÿ\╙\Σj\▀° \0═æ%\εb·n \0~─úóç!\╚l\╘Jkx╒▓\∩Ö\'∙TQ¬·6eKQ|ù┴ñ·NùI\▐(\÷}E?BTh╡0î8Hûº\Z^I╝╣▓⌐Eta╛\n\÷√¼fÿª¡ô╔å=4=æ\Ω╖\ß\nY>Y~\µ>bÄK\≥pù\╚\ß\'\εp²Éçⁿ\nl¢╡╨öê╣\µ²\╟(╨äcÜèvcôteç⌐ë┴\Z\\R\⌡9O\╪\σg#æc{▒Öbº2>\├\≡àñ╞╝\"8\πKeç#»DRé\÷=Oäs°C£╛Ö»1#¼╞╝\─Z¼5t=d\Γë\Σ\╘I\⌠àC\≥h░\Ω$╕╤ô▒u-¿g:ds/s\╒O\╪R▒+Bg½Ä\n\Σj┐\╘x0¬â╢}\δ\╓\Σi╞æ\╦\≥#.ï,╜¢╟╡╝pE√óqäôÜ9~ç)|\τ\≡\'?é▓?┼æÅMæ▓\ZY▒hfⁿÿ■¢∙q\╞\nóì|zOv║EDîDXæ>\'ò\╟)⌐·ôS┴q&â\Θ\±\╤╞ô2dî│eÆ6ï,l╜¼╜ƒ\≥_Kè\≤\"_N╞àú╞╜Å╡╞╜Å╖ç└\±C\┘R\≡p^\╚\±\∞UÉ■\┬[ƒö╜5\∞X╢q*äê¬Eû&jòI3O⌐Pⁿd)┌│U+ò\Z\╙EûYeùⁿ£\╥húεú┤\╫C\≤ⁿmö>ò\≥äY=\\ \Θv\┼∙\╔╔ìèg3æ╚┤s9	É\≥j¥\σH£Hf₧?\╬\σ+fôQ║ô»┴eûYceù╗─¢│?\ßI/ìª?\πV?\'òdIMB6╠║╣dutîô│\ΘÆ\┘2\─\─\─\÷L\╟^K\τæ╚£U#\"ó+½&\▌┘ïUù\⌡d~¡$┐$b·ª9║}\╔x,▓\╠·òë\╤¿A \0nîrSW5K\╔fó¬è{IÅ∙5]Æt║F|▓Æº╢₧?î\┌&\Φrä\φ▒1£╕\─└╗3\╚n╨ÑH}ö;)óº\Ω\╠_S\╔\φ┘ù\Ω\nX \0&|∙\╔>╟ô$ù\µ√%\Γi\σ,Kªc\╩\▄╒▒;5Zg¡│\≥═¿Ä>ÖôS)Gú¢2v\╔.\╠jóæÖqù#)g\"3íH▒ëÜW\╥1«(\╦.\╬Leî╗┘ò┤2J=í>R╢G+ú¢H╡.ê\Θ┤\Ω<¼â\÷5\ZN¢│\φ\'·Æ╟╝ñó¡Ö5k\─Lù7lM° ?\"\≥A\⌠fàó^)Æ\ΘûY&&&Zîlè╣[=ë╛\╦,}:\┘t^\═Pò▓öcBò\Z|ì\╤Ü\Φ]*\'⌐Qù¥\≈g6J\\Ö═ñ\'╛úTú°─₧YK\╦\┌\─╚₧\┬}É}L░ªIS/h║\╤ævI█ó*Ü&·&┼┤╛vb{>\╠Q\∩▓N\┘.\┘\╞┤\Θ\φôL\ε╤Ä.1I\φ<\\Uë₧<\╔s\╔\⌡\∞K╢xe\⌡┤E\╘G\αï∞çé23┤╠ÿ¢ìí╦║9\nh\µ¼S0/╟ô\"╗\ZΦ£ë?\Σ\▌=\╫\⌡,\┼v\╔╩æì\█!₧ò3\╫_\▄#\╓Np┤S~	\ΣmnfK]22ª:{í°Dê.╚╛çÆ╝\σ\█ú]ª\α∙¡╣\nL┴ï\╘\φ°<*B\Φr\Φs╢6^\╠;J$ë:TUÉⁿbJVb\≡_\├M├▓\\a\┌3I\╞CùVçY2q\Γ\─·\▐$\▀tH\╟\Σ\Γ╜─æ9%\αî²Ö:╦ìú&₧Q\φlò║F(péE|\φÆH╜\╨╟╗TAô ëIU	[\"⌐ƒbN»|j▒úSôôΓî░Rê¢ÅG.\╠\╤\Σ╣[b]Æ\≥Kke▓\╪√VFMï~	\Θ╣{\Z}<ú;ù╢╥ÜD▓ⁿ\r\█\┘m#]öIe\╙&Gñ>\┘DªE[\⌡\▐Sⁿ	1K┘Öa\┬[E┌í«╟╢>òêùÆ┼▓\┘\⌠C%y%Æⁿ\≥O \Σ\▐\╘=\αå╗\Z▌½\Z\┘*\δe\Σ^6▓SⁿhÉ\┘\╓E┼ÆïïªE\╨ⁿÅg\╘hC\┘l╢ùìæ-\╥\┘\∞æ_\Σ4?$û\╚~H+\τh.\─\╞\÷c\≡LÅô?\÷\┘\φ&_=ù\≡\┼c\╪\╧∙$=É\╚\≥{ë∙\█ \─\04\0\0\0\0\0!1QA \"2aq#Bæí03bü▒\╤\≡ \┌\0?\0z\Φ\'M_î√\∞g\▐\π││\εq√|o\├;░\÷w#\∞▄ï_∙QH┌ì¿\φ\╟\╤-.9;h√<K\┬₧ü\Θ\π\\eb\╤╫å-5.	iñ╟ñÿ\⌠y\Θ2>\Z!\αÅ\δ\Σû\Θ;cLhΣèíçì\╩L∞│▓═ò\Σè[F+-û\═\≥\÷)\╦\┘▌Ü∙;\≤\÷}\─²ƒsô╪╡Y║ÿ\⌡▓Durj\┌⌐·{WG\▄#εá╝Å[ë:lZ\▄>┼½\─■O╣\╟\∞\∩\├\┘▐â∙;æ\÷w#\∞\εG┘╜XƒZF\╪·6úb8┐\'bè\Z*ëGåE5G\╤~>ë_i«G\┬#\r\╬\┼1cD`Æ%üIpj¢î╢tDYMùD#\≥e|\σ·▓\σ~LR₧G╢HCli\⌠LV°CäqGvO·\╧LZô\εE¿;¬ÄⁿM╠ït7h°c\≡[│s7ì╚┤Z-éfCèH╦üO°æå\▐\ndd\─j4ï\"%ñ\╪ⁿ\╥┌╕╣G\╚°\≡F%ôvîK\╩\'º£úQ\α\╥\├\φèX\╠bû3\ε1\π\µL║ç\'ln\▀Kv║\╟\╟Oå6Ä█│c6▓Ü\Θ\╔\╔l\╟æ¼ñçI4F^\┼$Eú\╚╩ëôÆ\'ìA\⌠rDΣÆ▒\Σôk╢aûE╪â┐$T~J\┼\∞¢Kä;\≡mePê«\nf\±Mæ╕\▌L╣3\÷72 \0ó \0ó\═\╚\╟DY╛╝\╚╪ô~G┴6?\"t)2#ï/â&-\├\╞<u┴=,\≥d²ƒ\Ωc\█I£~Q°ùöj╡_¡bDS\\┐#\τ\±▓\┘	ÑM\╚\φ?gkæΓÉ▒▒\πl\┘#d╤╖!Yö╩Éú&╚¬\\æ\αlà\┘\n«IW┴æ▒ûxDeLLô(æ¼\╘G\n╖\Σä\≥N[\≥:1\ΩU\╒┼┐uÆ\ΣsûYn\\Deï\≤╛¢J╡vNRNæ▄Æ\≥wdwdwÖ\▐gyñw▀ú╖+$\╦ê:\Σ\εp9òìtâ\÷~óc$╛L·lY∙ⁿ\φJ\╙√\"░¬\ΣK\nû\τ!r|t]\ßc},lTòz\Zï∙6º\σ\╤█Å│╡²ú╖²ú╖²ú╖hXY▓47╚║E¢¿╢$P\╒\nCòæ¥1\═P\σLs\αi8┤e\╟(M\┼#7K\╟ \0â₧\╫K\÷ù \0\▀\⌠!é\▐ⁿ£┐√!ò\╤t\≡_K<ëú\Γ&\╫\≥8╗\≡m~ì»╤╡ƒ\╤L\┼ⁿ¿▒√DG\╒Eæ\╞<d▒\╫$ú]<¢,\≥I~╝░7ò\╬r¿æ\┬\≥4╒Ñ \0s8\πU\╤┴b-┐FùC¢R\δMNûzl¥╣∙▓1\÷mB\≤CDñ╙ñ[oÆ▀│s\÷[$\┌Dmr[1╖\≥7\╚\┼┴}!D\┘└\αO\Γ\Γ\Φgüæt?░)Ks\Σ|t]\"°&ƒMù;█ìYá \0Q²\⌡\⌠1bå%╢\nÅ\≥|U<y·6\σ╚úH\ß\╤\▄\Σ\▐o╖\αî½ædF\∩\⌠_·/s \0F\τ²ƒ\⌠B\\î]Uÿ\ΓF\"ÇÉ\ΓëFî°\╔*ⁿ-èTë;\Σ▒3r\⌠\▌/\▄\Ω#ì°4·\\X#╖\Z«ÄJ*\▀ \0!₧<\┌Eô╜¼N∙\╤F\σ\ΦñI*\≡\\}Gqz7»B¥*ú╕╜\┼\Φî╫Üó·%\╤>H\µhåáåT\╦ô2H╦¿┐r╛ù\╙uC\≡E\┌]lG\╨&ú¼ìÆ£`«\\#[■Cº\├\╞/┘Ü╧¬\δ5Yoè\≡ì& \0äe╖|ªG┴CE3rj\Φ▄å\╙K\αr^ï^æ╗\╥7 \0H▐╜#╕ƒì\▄\≡ä°▓\"ç$`Éáàd\"dƒ╒╛N\╘Gè$í\═\"Jå\ΦmQc|[|#\÷∙Ty#\Θ▓┘⌐â■╧»\µ\╩\⌡2â¥$╝\Z\"\╘eÑ\ßªi?\╟╙Ä<ì\φ\πöj4X▒i2c─¬\╙1\▌r>«R»\÷7K\Σ²ⁿí╝₧ï\╔\Φ╣°g\ε╕E\σ/\'í╣╛Q \0#\±lT6ú\╔\▀\"\∩æpA\┘2D\≥(.\ε\Z²¼q▓\\\rñ⌐F\πqò$╤û;ó\Σ\╠u\Σ\▌\Φ\╙\╔\╟$d}jZX\µ┼ù,m\╥\'¿╔Ærî?è\⌠}NZ,m·&öó\╙∙+lÑLll╢W■Γƒ▒\┼\▀?∙?_ck\┘┼ò┴%\Θ	\╞ⁿÆqFùJ▓╜\▀úNú\╠HG\⌡61F\╓╓àªÇáùüD╞îæLÿöò2T<<\┘\"8\▄\τFó*qFK,┐o₧7¥┤OG(½ï>\▐qèö╜æÄ°8N2qbÉ▀úU\⌠£║¥.çƒg\╙ \0\╞V\▐YZ-<0┴cç	\r¬ú]▐½$▓\╟*7┤lGm╕Å\Z;k\╤¿°$àì⌐|\rMàAÖcqdHîS;&\├h┘î╚è6Å,DúF╒│V \0\Γ│\Θ╕%û\╘M╖⌐Æ\⌡└ÜK²╡8\σô\≥b\╒C\µUfYJsö\ß\╩\÷C(ºl·<ö\⌠0f\µ%Kûe\═Q\▌7H·åu¢Q<½\├▓ê╔┤+ùó\σ\≥?\φ\Φ╖\≥+63dù┴┌ƒú@\σïFhÑîëE\⌠|	_$|ô|E\"fDnª\╠\╥M\█4\╦+²\ß*Xs■\╥°Σ£▒\╞2Æwf┐°₧(├Ñå5\φ¢Tb\╘Q\Γ\┌~H│ⁿgW	\Θ;w\╠MG\╒\⌠╕25?\Σ«\\bFMv]D \0wfV\█\Φ\┘bI|tªJ.\\Ü\≥mÅ\╔p_\╦_\┼<\╬\∞²Å.Of,\╧r▓Y\ßLï\ΣR#!2L|g\╧&L╗UÉ╔╣XÖd┘æÆu╠¼\┼(\╞0ô|S\'ªY2╣K\┼\±Gv\┼ñ▓F+ûn╣7\∞F,│\╟\╠r~H║1BW╣\─\Σ╠ÿ\▄|ÅÄ¢Ö╜Ärñ5&lf\╓læ█ùú╡3k^II»\├=\±CU*##}/$û\Γ£G)2/Æ\αr\'##3Tq6\╟\≥QGb\Zä|.Ör\╟mÖ╡⌐ \0â&ú&O<!\"(\σp\Σƒ\≡D\⌠Öa\╥F(\∩ò\╚\α╢\─\εK\┘}\╪S\≥dT·nÅút}╫í\╧·;î\ε3{7\╚\▀#╣/gyùÄ\\┤BPâ²M\╓\∩ód╣Æⁿ\"ƒ\╩ÆL╢╝¼æ⌐Üäƒ└│\≈Uºh└»*\∩ \0óâ<\╤=^Yx\π²\r7╚óWL*╥ƒ▀áè¬▓?Pû+å5┴ù]ù$v┐ù \0Q1\╩┼èo\αävr\═CNnï\ZD\≈\╩F9_æcƒ\╔\█\÷8\─\┘lQ·E\╟╨£}╜┐\r¿\├*òy$\Γeè~	&xâ\δ0\╔<[1½│MÑû(╘⌐\σ▓iÖ£6m\╟\≥∙*è\δ]à┴╕╗B\╓Lû½#∙%ûR\\ìûnrô.G&\╙j\÷l^\╬▀ªK²¥ë▓:i_\∞\┼ù│4\±G\╦1eî\╫\⌠F\█Câ°\╒\r\╤c2\┬y%Q!\⌠\εc[óÄ(X╝móHó¿í.ï\±╛╝,\╫┴J_2Ä=ƒ»│\⌡\÷7wbÄⁿ	j!\≥}\▄=l \0\σ▄¥│B∙k¬bf\πp\Σå\∩ú2d£ax╧║╚┐ƒ&mS\╔IæW\≡f┼▒\≥QE	t■║/Å\╧G\⌡	|\"\Z\Θ\╔\╤\≈y\≈3\÷,\≤\÷<╙▒dÿ\τ&nbæ9~╜\Z>M*[ÖC,Rç!▒2ªf\┬\σ\╩2┴\─\┼V┘⌐\\&W\π_ù₧¢Hq$\"ÉÅ<t╛▓■#úÜR{ƒéñ!\─qF\╙h╨áR(ƒâ²oñ\±C\'æ\ΘRNìF₧N\n╛╝öQE~5\╤pEG╔║=#─ô+ºÆä>ïÆ_─ä\▌#Ü0_┘Ö\φT5\αHJ\╨\ΓPæ]>:d¿ñr!ëpO9 \0$K\Θ\╤oåd\╨dÅ+ÆPq\ß¬9(ó1▓X£ycip&¢»B·6\⌠\\I~!êKÆ8-\\îè\±\╙<«d]\┼2\n╨É\╨\╒u}<!∙║WKtû(K\╩2h1\╦┴î╣\≡d╟╢m$`ù.ⁿô\╩\▀Qm\╘\┘{xCï\\3\nµÅ▒}Æå\─QG-<▓x1i\π╔ù\┼#¿ë\≡d\µVi\σjê>▓ë╖½$Gùc_àWD·Q(E∙2²>\r\εÅj╕h\╔,ÿgìQƒ╕\Γ\╫╣fj/sgrïb\ßÅ\αj·/\ΦX\µ\▌QÅI_\╚\╟QT4ë°#┬í°$╣1Kk \┼π¼É\╫Y╛ià\╥=(]]\α╗eq⌐ïª?f=ö71E«F8Th╦ìy+\╟Di\⌠\╬\≈20K\╟J\Z\'\δú\≡Mrx0N\╤k½E#T]\≥\'\╥=P\─>₧	>à└▌│QïtmïY\nªO\"£¢Eÿ2[ó»ü\╞\╚`r\≥c┴ⁿU╥║1 \0!\≡MrIN\╠yû\╓(\≡m6¢\råys▒└ä/\╔r┐I\╥%\α═â\÷┤vX▒8¢í\┘╦▒£à1~ñ)\≥å╕<ub\≥\┘^	.H\Γ┐\'äd\\Z4Zì\δk\≥║QFl╗/\"╢φî«Dà°.êhb\Σnç\╦!½CU\╟J5Ov_\╘\╟\╩^LII\n<\╙9â┤FV¼kó┼æ$╕\ΘlHq ₧,ûêfî║>│$╖I▓\Φ▓+¬E\╒2DI1#\╟Dî½₧ûë╗\╚\┌1Fóbôîå»Æîn₧\╤\⌠FGHèñ.öè(^IEHNêf\┌f╬£*=*\┼½ÑÉ╝tïG\╩\"?\"\±\╤!ÆV>ÿ\ß√r#oîS▄║Kçe\⌠D∙u\╤uC\Ω\πbày(Q\π&\"\┼\╓\┼\╙╚║|Üºg\╩ΣêÉ╙â┤Eº\╩\ZT\εW\╤t}X║1uo\±Ö\\	\⌠O¬╝:6x$¡Y!ⁿ\≡`■=G\α\╟°1Å\±]\σ3■R\"F/ê\⌠}\±\╙ \─\0>\0\0\0\0!1AQ \"2Ra0Bq#3SüæCb$4@círPdÆ▒┴\± \┌\0\0?\▄\╘7S\Φn\σ\╨\╦/IÆ~ô+\Φe}{,X▒a»¢m╢\┘r\σ\╦\\\╚eFTeEî½íÆ=\r\▄}&\ε=\r\─:êävu╘ì)aB╠⌐Jr~\╞\Γ}\r\╠·ó\█\╒h[dö}\"ªƒTk¼\╫[\ΣFDê@Qqf¬\φE╥Äân_\"\╞X\╟Y\╩╚»è\╧ßåÉ\εS¡[Ä·\╔\┌+º∙\╥;^#\⌡X▒°Å_■\╘1cⁿ╘½\≤\╩K\Γ#o\n?⌐\╦\⌠æ²I~æ²F√L■úI \0m¥║ÅÑ¥«çGⁿ½\╘\φOY╜┬┐\ε\"\⌠?U%⌐r¬┐ô*\⌡úw■H\▌?cu#w#w#,║}\rz\Zⁿ½ù._\Σ_\Σ\ΦYFH\⌠E╣£Eàtg}\rτ▒╜\÷7ïíu)x╝ª·£chô\µ]u.║\≈\τ^4}\ΣU¼\Ω;═ù╣d-┤ûb·\±\ε\╘\≥\├\φ▓^R-ïb2ú,Qò\"dëæ}\┘\Γ\⌡\╦∙3T²Y&\÷╖\Ω\╚\▀\Γ?P\φXà\⌡¥▓┐▒\█ktë█¬~Ü;t┐I╗■ú╢\╟\⌠\┘\█iz$v¬\≡vî9╜á∙ùí\δ?òDeç¡╡\Ω7^\µσ¢ªdfF82╧íg\≥2ÖLªS)m╢█⌐⌐»M┐╣w╘╗7Pgfªvhò\╘\▄√Äå╝M╧╣J╢\ε·h╦Ö╜ïÖî\┼K\ε⌐~óI\σ!╢?\±\╘s\╦C?ó<\╒9»¿ï⌐-s\╦∙/Y}r7\⌡»ÑC┤W_\▄;]n¿X║∩à┐é₧&ññ╘Æ7╧ó7\▐\╚\▀/I╛Åñ\▀Cí╝Ñ\╨\╧H\╧K⌐ÜÅ¼╜?Y\ß\⌡ó\╦\╓d\≈7~\µΘ¢⌐╣%\╨\╚·ö╢\▌6╪▒mÜ\Z\Zm▒b┼╗\≥ \0mMïêⁿñ8£\÷}?\≡₧¥\╧neY║Q▓\≤=û╕ö╣\≥^\╥W)\╙Q√╒┐\⌠\▄xnJ6-wb1╩¡\▐·v╖a+\Ω\÷=ö|ê╢î\┬6\≤&╚╖╘╗3\ns¢┤M\Ω√║t4\ΦhYÑÿôº	ZR\╘\═K\╓~¿\╦Qæzì▀╣╗f\φÖ$d}»ºsû\╫■\╬ⁿê?\┘\'=Öùⁿì\⌠%l\≈\▌\├;\ΓI╖+▒+êç▄îi╕\≥e▓?c\╠)eòÜ╨¥:S\\,\┼K\'┐\Θ{$\∞%\╫c\█Ax\╠6òªä7aE\╘\÷B┤XⁿòµÖë\╟f\≡\╙\╥#ò\┼\∞╗\Ω\╠\≥\⌡3y?Sz₧▒V⌐\Ω%ë¬╣¥«»▒b\╟\"\┌ \0┘»■E?9\⌡\┌R\╒\\▓2\▄\▌\⌠fFeæi₧2\≤/#3\Φf3Ö\╠\µs9Ö\"»í}$R║║EHóñ:╫Åò*9O2\α4ƒ\╓3è\∞ºVKFo9)O1ÜOç=ù]K«ª\εV╛▐Ñ\∞Ä:╜ì\φHú\σ9ö┤┼▒╗]ÉÑ¢\┼\"■E,X▒b┼à.ÑK»9jbqr¼·Gí\µ▒æ>\╬B┌┐┘┐■E?2>ú\Ω╪╕|½FTdFDn╨óêi\"ì╕Xt┤\╨\±Sæ╜ \0¼╔╛vα╜èö£V[;!^\▌Q.%\┼\Γ\α╕╘ô╜\╟n\'ü\≡,èq}I^ⁿG+q7P\Γçrñ╝┐└Üÿ\Γ\╨▌à▒╜ë	)\╔,╕¢\⌡7s\π╝?\╓\▐\Ω\╘g\─\┌²\r²oA\┌jz\╫/\╙;_°1\Γ\φ\⌠2y-N9IM\╔\Ω\ε(ⁿ½\≥$╝=\╟┴w√I²\╩~sÖ\⌡■T╡#%{\┘┤\≥ÄúOM\εFK{¢\╔E5\σ*T¥Ix╡e▌┤c\÷╒É¢\╠*Üû\▐s\Γ^\∞│8ÄW╕ªùf┐\αûe\∞BVô╨ô▓║%¼«_û╘äà▓ƒÖ║\▐-tW\╥Geƒ¿\∞╡}Gg¡\Ω7·¢£A╣\─îA╣»╨»RW┤Ü╙á\Σ\Σ%n\≤\ε\┼s%\σ\ε?*\εS \0mPª╛«Cº-ulmt7╢\Σff\≡▐úzì\ΣM\ΣL\δ⌐t_╜\╚\ΣNJÑ5a!U│#i\±<╝\Z4\╓\≥╘Æè■\α\Θ\▌\ΦG9j<<\█%N\┌sS\≤q4Fb\÷L\╬g╝u# \0·nSL¥\rnJR╖S<e╟ë¬^─╕Å═▓┬Årì9T¥óëQt\τ\≥.^\╩\φ\┘£}╙à/\τfoc1ÿ\╠f3\rìù.\\╣J\┘	kÖ_B\╠·│ÖO\≥½7P\÷+2Q▒æ₧#^åW╨│\Φ[╣r\σ┘ÿ\╠\╠╠çû\Σ-\─|.ç+\nv7\▌\r\⌡°▓S_IN-\⌠\"\≥∙ñ«:\╤═ªñ\█\ß \0Φ¬¥\╧+7êR┐\▄UZ\╨\▐\\\╬∙æò\╚J\╧Q\╩\╧\┬\╔T¢M339èvV\Γï\┼\┼\▀\÷,\Σï	w(a\τY\Φ┤%ù\rK,tæ\≈∙±æª¡\rdN┤\τ\╞LKe√\╧eï,PZ2~N\πWBè2í┴cñ\╙,╖ù\ΦKYò5fs1£\╠f3ïù.~╞ååéèg;▒ÖªJe\╚²ànéHî▌╕└\▀kñG^R╨öƒQ╗êj\█9\\B!/bΓöïfτöò).àÄe⌐-K│4î\╥/.Ñ<ezQJ2\╤^R╗₧ºl¡\Ω;uoc╖\╓\÷;}^ê■úS\╙·î╜■ñ \0L½ìòH\┘,ªàóxM:Üu44∙6(\╦+╘¥Uk-û\┘▀à\╬eÄd_è_b┤U8⌐/,à═æWZÖWC$z#\╨\▌\─▌úvì▀╣╗F\∞▌¢│vn╜\═\╦|O.¼\µI\∞ù)Wà6ƒÖ\Z]╬╣è▓Å \0àZë\≡%#ïù\┬X^[l\\H│R7CÜ╢¿╜»a;ì╨▓bº\⌡\Γn`a■\ZƒèE\\>;-Gåñ\╫▒R;\r>º`º\╘■ƒQ²>>ú·r\⌡£5:+═⌐╗\≈-\εYu-\εX▒c)ö\╩e2ÖK-╢┼ïfg\╘\╧$f}L\≥\Ωo$╣¢\╔∙\σ\╦}:╟û\╞\±\╪▐│|·\τ\╨\▀{\∩c}\∞oùC|║\Φ¢\Φ¢\Φ¢╪¢╪▓5RÄà\∩6═«\╔8╬êçïä╡\Φf╩╝Q┐╣╜Å[¼I;∙]ë«û]ë▓/MÅåä┤\Γ\"Γô░¬IóMr\n\ε\╫\'h\╩╔₧_░ú¬e*6weJ\φ¼▒\╤wo▓4<ª\∞î^64ⁿ╕\⌡Ñ9]╗ïÇ°ⁿ╡└Å\╚\≡[Ö\α\≈<Y\ß|\╔F)\┌\σú\Ω#\'e#u\╩\µ\Θ╖ct\═\╦\ΩnY╣fΘ¢⌐⌐╣%\╨\╚╠Æ\Φe}¼îe~\≡£b-8ƒQ#ïM.EDR╨ûW\├Aí6╣Än\▄I_b/▒IeHq╛ª_c\"\Θ╡\▄b\╘t\∩\┼\⌠▒JªOu╨û*\╦H│╢G\╤#╢\├\╙#╢\╙\Φ\╬\┘Kⁿ┐â╡\╥\≈;]ÑV\═)\≡\Σb■#:\≈î]áZ\σ╝B\αT\≤	w4\∩.$|┼╗ \0N\╒\µEo╬æ└├«,ÅÜ\Σ\╘=>L-½|\╫m\∞çM\Θq\Φ\╠┌ë┘ìö\╒\ε\╧3[ƒffcƒ▒ÿs\÷╗Q╚ÅB7H\▐uCÆ\σ▒╣┴\ΦZ·É¥í⌐+q▒╝ü\┘en\'dùS▒╦⌐\╪\σ\∞C\ß╡f«æ,╙╢çc⌐\∞vJäôï▒╠çö⌐\µ\█\⌠ⁿà─╖~\╟\'▄»∙╗\"▓S√ï\╩_K\Σ¡{æQ│oæ)\µH\Γe\±loBB/\╞k{Üt43╛\┼▄î▓│G└M«%\╙╚╗£c└Æ╢\─\─∙Z\π!\µ│\"\≈o┘ïå\┌8o«ªê\╞|UAn\Φ$£\Ω╦¢ô)aò8\τ¡+{▒w\≡\╥\≡\╟m?)WÄ\╒├╜kÖm≥¼║₧Ñú\Ω,║Æå^,Q┐nº\╘Tª°3\Θ╙ë╗⌐\╘\╔S⌐ÆºS-NªZåZºΓƒè%Q\±%Ö/	Ü¬º(√Ö\Ωt\≡j=\σ╠╣}N\"~üw\'\φ╢²┼▓\┬\∩ªFí)ìê║Feb£∙¢\┼mJ5côVo⌐·æCB/4ªîw─¥_=\"R\├╬│┐\⌡JXEh°ªT⌐*▓╝₧\╬[)p*\φ]\╬&OÖ=\╩ \0C\÷0\╦\±/╨ùÿåÉrôº▒l╜\αI>7¢2Öb■\µ\∩R\┘D╒╕\╪\≥\╙╨┐z┼ï|àaKA╖╢G▓#\╩F*T\∩√2╝p┤#\╒\⌠ZRòòÆà(\╟5H\σ\÷+\Γ\▄\╓Z~\≈⌐v«;l[╜n\Ωì\═╪╕«\σI⌐BíJQî║Ö╒╕ì°R3.ªe\╘╠║ÖùS2\Ωf]L╦⌐u\╘\≤2\δà╦«Ñ\╫R\Φr\╨·LⁿÖ%⌐\┘j7q\≡3m┐R\σ\÷Xè2ÖKv[┐}£╢[á╕q\"∞ñ║ö\Ωnú(\⌡#Fu\Ωfz.ú½K\n▓\╙\±O⌐Vr⌐+\╔\≈\Φ∙è\╦├╡q,%\▄Hì°\ΦG₧-\╞Z«D\α\Θ╜L║KbìÅ▒Æ]gm	Z2h╙í\ß\Φh:Is7:Æ\╥&X√Öc\εeëû%óZX{è4\▀S\├N\ZçVeçVeÅS*\⌡	Z\"╣\╬\Σfñ¡#DJ9ï[╜më			&Q─░\╨√\δb%ú!ù.r«&MdÅå#9wÖG\╬W\≥l▒ù╣b£ê╙îvaτÆ╝Y\±*J2\╔KXÄ%Æ>\─iuKå\┼└½∙Åm%yóVr)²LƒCS\─xÅC^å╜√Å2r╝ì:\┬xNZⁿ┤I\\░\µ)\⌠7¥M;\╔\n\"êó(#N\σçHe╢\"\▌─«-*\Σ°\"C.ñùê·{\⌠┐1╝éÄ\╦lHì7\"4ó╜√ïFÖ\±)╦¼JTⁿ\rì\nƒQ+lT\σ.:ò\╘\╩\∞5&efVG:\╒#\╟╨î^\∩S,î▓2L\▌\╠\▌\╘7u╡ò\nÄ\╘\≥╟ëÆeªZeñZ]i⌐.Ä-╡-6▒\"\─bê─░æ\├HÆ-╢\π╪╢\▀BOé Z╚ô>ⁿ8\▄rr\εF7v#IGÅ~┐ÅN]\nQ\≡9\Φ*m\±R┌ùÇùòLó\≡╨╖╕ò\┌*∙L₧\µFefW\╘\╚·ÖYûDtê\ε\┘fjxÅ¢╕ⁿó\µs\'└┐#û\╚	h[SÿæD\╩d2ÖKLñáJ$ó45\▀[2\≤!í<\≥Å\"Dx\≈l[B=\┌ï\∩E9;\"XZÉº¥öⁿ~╠ï▓▒æ╛:	%\▌\═+Z├££l*▓è╢S|²&\÷M[!FW╜╒èò^}\"gùá\╧/A₧~â<²i·K\╧\╥,\φ\≡\'Öhæy·L\╙\⌠ÖÑ\Θ3\╦\╨o%\Φ7Æ\⌠\ny\Γ╙ìàÑåL\µ5ª\─r.\"\Σeæ\╦m«ëÖ^\▌·û$\╟\≥W╗├å\╠\╥\µ\╔j.DòÑ╢\█c╟╗K\╚√ë9pE<Öº└úBYöl╩½\≡\ΩG\╪┴+\ßk@Å~\Φ\╚▐¿\▌K\╘n\Σƒt4î~G\─\╔\"\πE╡$[e\╬[o⌐¥èMèú╠ÖJÑ√ì\ΦJ╡ñT¬\╟&√£╗⌐	\├m{*-S-╢\█\φd!*Æ\╦|O\÷%N\Θ\┘+2)¿√#yÆ:òÆÆâ\Σ|;ìH[\∩\╞s\\àR}\r\⌡OI╛ƒñSnj\±\'6╕D\╧?I₧~ô5OIz╛Æ\⌡}\'\Γ\⌠{\ΩKy}°╜\┼\Φ~7B\⌡║»\╨\═[á£\σ\─N▓\σá\ε4D╖ê|X\Γ\÷%s)ö\╚e7bïEè<v\\╣)hOê╤╗2âV-\▄D|$¢╣\╟jGw-▒-v┘▒+∙ÿZ;\╔6∙#▐ûh■\≤√\r\┼\Φ°\≥3\ε\δ¬\\Ü╣]\╞*Rù\∞Kºé&\█\≈D\⌠\─M{\≈\Σ¡\ΩQ^╡\≡∙W\▄²\÷\╬z\┘V^\Σ¬\┼;\\RR\αpû\╠╓æx_\─<£ñ┘öZümÖMPÖkÉV\╪\╞\╔1\≈,\÷Oü\╚\╩[dD│jOÄ\╦\╨]─î?\├wæ╝┤+\ß\▌)4\╬H░ôbü\'├¥º$n\∩);æ\╫S+Uª\π½F.│⌐Uiù(\Σ\σ\┼\▀f\σ\─D┼½be\▀qù6(T╢Æ2T\⌡*zî»-»⌐╗ƒ¿\▌O\╓ne\δ7\⌡¥₧^││┐Y╣\╩ⁿ\├\├\▀\Ω;/∙¢ⁿÄ\╧■Gf \0#│?Y*9~▒R╝8╪¥<┐[2ó,\φ\╘búï\µBô\πú7-\┬\∩C)i\▀AQù\╘nΓ╣Ü\Z\≥ddEæ\╪\╔\r\∞f»üù\▄²\╧▄₧¿çäê>EU\Γv«\µ₧\≤√æÄXñ|K\≤\╠Q%^|8\Γô(K%w»X£ö┤\╓DUI┴gò╛\─)FD|E[√mâ┤\╙\≈1\╦\±#.¿┐y╕╛bÜ\Ωo=\╩r╝çQ&oæ┐]\rⁿN\╤┤«çi]QFWgj]╘║Ñt7■\╟i\÷;C%+j\═\≡\µ_\╪╒╗\╪═¥p│òë\▐HíB5ú,\╟c⌐O\≥\µvz\∩\═5csùÿ\ΩSª²\╩t+bVo,JÉt\δ4∙Wí\╦wÿR\ΩE\\Ñí\≡$=û\Ω&▐æCö»½/\"öít{3(à└|E\─N\├\╫eï	,X┴°qP~√1\┌\╘d|\µc\─²ì\┼\σ½╩¼GëN)\ΓU\═╧ï┘öö│Y\≥%U)\σ\µ|K\╧\▄\┼kFö╗ù█òe\αe]Sî\≤{èP╕¡+\ΦnúcurÄ╠║¥¥u7qÅ\▄▄º╠¿íOåªu\╨\╧\∞9X\╧\∞ycqp╣\'í}\'Ñ«SºRkNJy╝f\╔-«7%çî]\φvS\─G-Ü▒îÑÜy⌐Ωàç¬╣XÅéû[¼ⁿQN.₧ù)\∞d\╞!┴╜J.0\ΣVÑ\πn<Gòê\╩\Θ╪Æ\▐HJ\┬D╝╠º\µ*C+╙â╪æä°r⌐MN|\╠N╤¥ï┴\╒t\≤\σ\╨\╦a\"ûòí\≈>ô₧}H\┬\∞I.\σ╗╒ƒ\╩bºMTºÆ\╫\÷)\╦┬äV\─╙ºUÿè√∙▀æ\╠oÄ\╟\π°t_CÖr√.\\\╔;$B5Tdúks%uO/2*\\Öj₧ó\╒=fY·╠╡?T\╔7²╤ª╫ÿqù\Ω\r_ÖÉ\╩d]H\╥\τr^)X\▌√ÆéQ╣ªFöY\Zö\╘zÄ¡<:P▒8F╡;«d\α\Θ╗?\╩}î░╓╖$ë+\r▓\╠\╚\▀4êó\┌*\rfk▓┼ïD\╫\Γ20\╩Tⁿ╕£èQ\═$èq\╦N1\Φ|I~f╛»»ò\╥\╞#	\Z▒J)\"Ä¥)\µ\π\≈*╙î1\⌠\∞╕\∞\┼\╤Xê^<P\Γ\ΘT│\█r\σ\╔},x\┼\ßZÆ»Q\▀\╞\╧Q\⌠û╨╢╗0\∩7\├\µ║\≤.f.\\\╧╢▒Ü=\n!iF\▄JÆYî\Θ}&u\╨\═\∞g\÷3 \0ëx[╡î \0\Γf~é\∩\╥x╜\'Å\╥ZOîI)}0fJÖ╝î\╦[\╨\╟N│^FFìnQ2╫Å▒ääö╘ÖSZ╠ä2╤ëÄJ\╤|\╠\"╡\δDón╠ñb%╢D╢[mï-▓\┬$┐eO╦ïG\≤c\≈\Γ\φL2as[V.\Z\φ\─\╔vÜ+¥\÷bd\ΘT\╦¡∙╗Yr\τ╨à┴£ï\rEp\εa4┴\╒e_1r\σ\÷\σú\╒h\⌡D▓/-Å└\ΩÅ\⌠\▀\Γf\├ëƒ■&\≈\r\╤\▄<╝⌐\\àZI╜\ß\┌0\▌?\≡\φ8~ƒ°v¬?\≡\φt=/°;eK■UJÑ\┌\≡√╢ƒ\Θ\╦°;lN_┴█┐\ΘÖ\█\Φ\╚x\╔/\∞\╚n¼\▐}█æBÑY;J₧Td\±û\╨\┼4\πú\αa╒¿Gm╗û-\▌hæ-╢\█b┼ïlƒ\µ&>ⁿ»\▄HÄ£b¢ñÖÄ«¬FO\εPVí\∞9x\╘zÆÆä\\ƒ\"ù\─!æ\τ\ΓO\τëUS{\▐{\ΦO	\╫\╠\╙zr7o_*V*ⁿ:Pì\Γ\εKA\═\─oQNYá√\⌠\≡\⌡*╜ë╢\ní╦Ö:\≥sl\▐\╚\▐H\▐H\▐K⌐₧]Gä├»¼\▄a/m\µªJ1y%+D╢\╘ó?\╤√┴ù\┬rH¢ñÆiX\▀aÆⁿ│å\⌠º·Gjí·hx\┌_óJ┤\'\αQ╣\┌\Θ╙┤cN\τo \0⌐╡\≥ñv\Θ~Ö█º\Φ*T£╝M6,UnT\▀\≡CêsWåé_èU⌐½\'═ö┐*\"\ε[║î\█2]\╦\∩TΓïÅ\╦(£\nsÜïQì╟å½║\▀>\n¼¬QWÅex╓û\"ƒ.f&?\Θ%w▓8,6\≈ƒCâ⌐V·╕─ÑâÑI\▌-EF*│¿ù\"^VW\╓r\▄?>ΓäÑ┴ÑjJ\├\┼PÑ\σì┘å\╟T¡{xl|JuKJM╟º}╪ÑO5K\⌠*╗\╘\Z√▒ºC\┬Pì9\╦─┤\'R7╖#4}#£}&u\Θ3\╞\▐RöU│Ihoùä+\┬?┌╣\█?√x¥╢|¿#╢\╫²ⁿ\'VJ\ε■\╚Xî\\Uò?ⁿ7\╪\╫\⌠K \0\─═Å\⌠\╦°!{A\╔xèè\≤*SQ├╢Qⁿ┤/ô\∞XKd╞«XB∙\Γê∙ë4Ö╝\Φ|:å·¡\σσêúI\╧H\┬\πcJÄI\'rÜU╘îl\τ*Yiºg┼æ°}-\╥O\═╘Ñö\╘zw$│F\╞6äh╘┤Y-┤ºÆe¢zjn-\τÆC»çÑ\├\─\╔\π¬Kåêrö╕╜ƒ\r■\ß\±(\Θ	w \0óR²FC\ßT\αÜSzƒ\╥(\⌡g\⌠£9²/\r\Θ?ªa╜\⌠\▄\':f/\r;aúº2ù\┬eUfn╚ç┴\ΦG\╠▄à\≡\▄/\Θƒ╙░ƒñÄ┴à²v*ñÄ╟åÅ\╤uà_█╣zK\╦B?╣ƒⁿ!ⁿ\n┤ù\╙\α\▀M\⌠■\r\Σ\═\Σ²F\≥~í╢▐¼ù£╛hJ>\┼ß░╛LR\╦q\╬(U/└ô$\"B∙\≤\π\ΓD\⌡mê°j╢\ZL┴\▀t\∩\╘°â \0LR└JÑ\≈│\Σap▒ÑVb\█w<\╒\Σ>\Γ⌐5\┬Lrô\Γ\█\εⁿ;\╧?▒ìÄl7╪▒b\▌┼îù8ú╢ü\█í¥»■│╡T|)Ä╜w\∞5V|s3wS\╥\╩qº\Γ╨₧#O\═V%Oè\ß\ß\σND╛37Σáù\▄X╝\╔x┐ü\Γ#\╬l\▀\├\▄\▀G\▄▐«î\▐ \0ï7Å\╨\═\π\⌠3y/\╙fy┐áⁿ_J?\ΩHN\≥%e=&\÷.\π\╫<▒+*╡\τhö)╫úS╪⌐3=\╩\⌡%\'h\≡(JI┘▓r\αê=>G2ùu\≡\╫|3^\τiä\'║·è\╘UhedVXÑ\▀\╧╡~\\e(S║ûÑI\µôc\εGê╒ƒr1╣Ç\┬╩Üô£xÅ\r¢₧à_å╡¼]\╔\╤q╤í«\µ·ºª\÷»°»\╪\═Q²°^º\Ω2\⌡?VGï\⌡$Y·ÑⁿÖ}\σⁿ¢╕╡\ΓW√èò5┬£â$=(\▌\╟╥┐â\"\ΦdEïl\╨\≡\⌡/=5\╞H\▐\╥\⌡úO╓ê\╦:\≡╗û╘╢Ñ▓UhE\╦\φ{\╔;ùQ\'V╠òD\╟>à╟¿ê?Éè \0läÑe\─┴a\τçO72╜/\⌡┤º\▄n\█\'êî19$\∞¼U\╟Rª┤yÖW\Γ%<\╨\≡Æ½)6▄╕ìì\∞\\N4sGjG\├\≡û[┘¡y\n&R\╞\'¬\╟▄¡O$¼╟╖:7ê\╧\∞g~ô;\⌠Ö\σ╨╝\╧Ü}K╧⌐\Γ\⌡\Z·Öov~∞▒ö\╔\≈2{┐\±7O\╥\╔Qï\πX*O\╪\∞	N∙┤îad)▌╜,hæU■%\╚\≡ε▒╗\ncc8ò\"\∞jYû╪ä&\\┐qæ!ó╣\⌡ƒÑz«}\═JN+æ(▌º\╙kÆ\\Yì┼¿\╩*\φ>\'Q┐ä\Ω9\╦4₧Ñ╦ù/╢·Æ\±»\≥4*>b\┬\╒\╦\σ+╤ò\'\Γ[0ö╖╡\π*\▌\╞|FÄÖ\╤-╜û~\▀\╔┘Ñ\Ωç\≥nZ■\Σ?ôw \0dM\╘V\"úO\⌡╤╗ú· \0°e├»\ε3²7¬_└╗7∙\├·Y╝├»\φ3}Kò╨ê½ \0\╒b?\δë\┌%\Θç\≡o\τ\∞o¬uF■¡ⁿ\╟h⌐\╧+7\≡~h[\∞fí/\ε[\εnS\≥\╬,tf╛æ\┬]VâP╜Ö┘╗\εDbe╖┤f3Ä1gàpCh▓2\∞R/▌è\═4îÉ\⌠ó~a∙╧å/┬¢\≈0ƒ¢Y√\∞₧*î/y½ó\⌠C∙\'ê£\∩yq.\\╣~\∞b\µ∞àü½/ñX\n╛\┼\'%w╜åc·Ñ%┬¢%\±_M2╛&u▀êG\┬U\δ\╔⌠ê╗î»╘Ü*\Θ\'\▄iL╛┼ï|\δ,YVq\ß!╫¿■óUï\±zwjû]\Γöea\╓\╠fmhï╦í);¢\├1£\╠)m]\▄4oW\φ▓~b~cß┐æ/╣\╞+C,┤\ε\\╣æç─╝;mE?╣²V»(─ù\─q\µæ)╣╗\╔\δ\▌°G\µT√l╣ÿ\╠9\┼qÆELv╬ƒ╪¡<\⌡\\6\▐>ño ╛ño\Θz╤╛çS┤└\φ\Φ\═\πC\±²a6*$ûY4YÖ_C#\ΦefG\╨Tñ\╬\═?o\Σ\∞\φ}Q7i}q2\╟╓î░²DZù\Ω\ßz}YÜù╣₧çINZp\ε\╘o\─Xh╦ëNÆª¡a%\╨╔⌐8.åHt8t8▀ü╗ê╙ë╝#1w~\≤\═²îU¼▓V*û│Å\ε*2Xç<\▐ç\┼+xò5\╚\≡\≡╕⌐af\σ{ƒ\╒\τ·q\┼*╛I\Γ\▀\╒a\Γj╛5\τ~,┐s·^ú■O\Θ8g\╩_\╔/â\ß╕\µk\≈%åW▓ÖKN╥¢!éó╣\näWÖb╣ú=%\⌡#┤\╙\\c\╞?ªÿ▒53_\├ⁿ[ⁿâ╡W²K~├½R\\j\\\═?S.·▒7╒ƒ╗\┘b\▌\Φ┐uÖQm╣╜\╟31t=╣Kw⌐x)F<\nò\╘}\╔\╫r.\▀û!\ß\δ)!ⁿN.¥\Θ┴╢VöÑ<\╙\Γ\╞\⌡ \0¢\█g\∞<UG\⌡?\╪u3q\╠\╦\├\╥\╚\═E\▌@xè£¼ëJñ╕\╚\╦\εe-\εeEæ\ß<=!╖\╔¡U²íΓ¬»\φ╢Ñ\⌡ü\\e╔ú}q\╩S╥û▓)`12W⌐%|3\╒ZB°u.nG\⌠\Ω_çà)5+1Rqzç╚Æ&ñ52\╙\Ωx\╧⌐n²=g╚û&r\ßíf▐óª\┼Eò┤æFmS\≡ó╡\∞» \0:╧í»B\╥\ΦeæòÖ_Td \04Z>ú┴╘╡>¼╡?s\≡╜,\═O\╨*ëmΦ╡¡ë\╨|b\╤l3■\π_sqσ¬ë\αñ\╫û\▄e│\╙\τQ\≥Q₧h\╬ \0▒\█Q█ùñx\εæ%î¢\ΣK\╞\┼LuL\╧#V!ê£\Ωx\σôöp7l\╩[║╕\≈2r!G4¼,\εFû\φ/\─\▀\╙M#\Γ£\εa\▀\ßq+k?∙╣\τ\Ω/.¼╗\Ω_f╜\╪w\Φ]₧#\┼\╘²╠ªO╣╗ù╣╣ƒFvy·M\├\Φê\ß\Σ∙ñvn╡b:Q_\▄Eí\Ω?½?▄╜5╔¢\╪/\φ \0\Θ^*╝ô╡å▓╗FÄW∙\rìù~\Ω╪ï┘ó¢Ñ*Y\╘.╟Äè\≥\╥Go⌐ÖY+q¬╕┘ô\▌\█╠ô1z\▌√ö*(Cü:╣\╨° \0\═Q¡\∩\πnû3C▄ºMUì\╤\┘▀ë¥₧1\ΩdäyúyIs*Tñ\πk2\≡\⌠│y²┐²7\╦\⌠óvë~£^~\╞\≥}L\≤\⌡3<²r■K \0¢■K«l\≡uó:▒M.úv3\╦\φ⌐∙Åe\'zQ∩▒▓\µmK\∞╛╒▒║\Γ`j\σ«\π}Eh\≡díö║\ΩgÅR╢┤\┘B.¡E`í»⌐èÑ»\n \0¢:Æ⌐\µ\╠\┼nt\█#U┴Z4\╥\'Ä£gæ┤ÿ\δN|f╦ù.=¢\ΘvàM-.Bo>Y\r╔⌐[íN┤╖r┐E╜\┘)fé*\╞Y╘ó\╟┐\╠ⁿ¿à7\ZùÄ⌐Öò;⌐s>Y\╔\≈½~c╗▓\Γ*.äTe\─\╬c0\╪\▐█ù/▓√/▒¥▒╕╝t\╠djⁿâ\ß\╩\⌡▀░ⁿ\Φ\─G\≡\σ \0\╨1zc╪çy\╙Z\╩<Y$\╓~#\±y8áú+\Ω╠Æ╛|■ú¡\┌\Θ\╘^\∩╨¢\╧\─ⁿ╢Æ\Γ+T£ö╓¿═ÜùDñç├╜_\≤çP\╒╫ù\≡7¢╩Æ\╪╟▒H¢.6>\Ω\∩\╙╓╣G╩ë\┘°d«è\╪ⁿTü\┼\┼┘½2û╧å■l\╧\ε\"┐ÅⁿuJoÉ░\╙b\┬\⌡e<-3▓\╙\⌠\≈1 \0\ε`G╜Vª\ε▐óJ\╒\≤╧é)\├\±ot\┼ôï\Γ┼ç{╣ñ\⌠2\╟.N]GO%%}lB½¢┤ù\∩╨«\σa⌐F\≥wÜ²\╩\Θ\╞:yn}╜ê^$e\∞°%bä\∩Y¡¡lq╕\π.·-\▐l┴½\Γ\╩~R|\"pº]~\"²\╬┴5|«\Φ\├a\Ω╤½,╨╡\┼\╠OÆ\≤?°:wí8¿yÉ\δ\╙_P\±t\╫VB╡g\Σú&_·=╧ê»─ª\╚w¬R\═%7»░\ß╛\≤q\ΩB*£╝\╔\τmKè)╘ö│█ªé~∙ò3eM\═8\┬\▄°Åèi\▀\∞7π╣êM\╙\≡\≡!∙1√wiagS^åî\φÜ^\µ9■0╥╡u\∩╡\≈,8.âC∙Sg├úz\≥}\█G\┼VF\σ\÷Tó¬F\▄\n°\Z\╘\█v╠╜Ä~}■L<\ΦÑ\┬\r.1-\▄°Åⁿ½┐─▒Æ.W|L╣<╝8ew\Γd¢ûl\┌uÑJ\▄=╠╗ùv■\─\Ω^væQ╡Qⁿê\φúçò^:É\├RÑ\╦3\≈.#¡6Sò▒	\⌠½╛\╔\Σ╢Iƒà⌐J]v7⌐]\ΩÑ╘â╕ój╜\╦\▄[*a\Φ\╓^8/╣S\ßÑS\÷eL-ZR┤ó╠»ú \0ï\═Yf\├\╥~\▌▀ê~J√ö╝┐)\≡aZy▀ÿÑM\ε\σmPÜ╢RÑ;(\╔\ΩE\∩^▒²\╩\┌^\╞\≥\╠6}+┐*,Æ▓VG=╕òx╪ç\µgÑ╗\∞c∙c0┤╖t!aÅëW╩èoR&B\\╗\┘b°\╞?┴<%	\±ª┐b┐┬╣\╤│7;╝╩┤dƒ!\≈\Θ\╟4ê\Σ\π\δ\╨qìX\┘┴pæ⌐/┴Iïä\≥╛$\Φ║q╣Jû\≥-\▄\ßºsSwåéÆ\╓\µ\≥=\╠√rùò|¬╡>R0U|R\≡ \0²!┴Ñ└⌐,▒║\ΓG6\Θ3\ΘEE(\╧2\αaò-2û\nr\╓z!(\┬9c└┐▒Ö\┘]hIe\─M{ö\┘_╝\╞7\≥Yäú╛\─Gó╒ë\╪\⌡ï \─%\Γ5\\.ⁿú½I&T°e	\≡╝Jƒ	¿┐.JH⌐BÑ\'\πâ[(\ß\≈ÉR╣RÆÑQ.GdívèTó½]u$óñJqî╫ïFJpÅæÆäwïMYRÜöl\╩x}\╘51ÉèjQ\\v\ß)\∩qPÅ\εn\∩S╪▓\÷\εc\┌╚í\Σ_.*R»«æZöó\φEù#\╧\─Z;▓Ub\Γ╜∙ÿ\\ºπ₧É \0\÷B£)½B)w\ròU\Γc!ù~ñ\┼\"√S!ⁿå3\ß\╘2Q\╬°\╦d╢G\╩Xåîë\┬lR\Z╣fî\╠\╬gFe\▌iIZJ\σ_å╨½\┬\≡~\─05(ª«ñîd%Öh\═\Σ9ª╕\nÑ₧nF\÷çôvïOüò]>»╝Æô\Γ4\┌╬ÖFjºéW\╠▌îlw4úmR3\τ\┘\≡╕x\τWªâò⌐NL▐┐S\εb┐\█L\├∙>[\ΣF2ìF╣â\╔,\▄dCRppè╛ª\ß╨ªô½f\╫-ëX\≈╪Ö\╬\█_\Γ4oO:\πB,╣~\σ\╔\Σ2à=\÷\"·╜D¡C%\σ▓,\"$╕º▒=ì[║ƒ╣⌐¢┘ù]v╕\╞K─ô1\rÑUxF?ç╓ºM\≤▒JÄ}%í,$S│z₧Ü%ê\ε#à\≤X]ƒpº¼\╚\╟UºS╥Äñt\┘\≡\ΩI`\╫∙\╧5\≤2╧ºr┐√y²î7ù\µSîÑ;%r₧7\═S°#\┬6è▓╪å\ε\∞1\∞·√ò\Θ\µMu2║sp|ä\╦\≈ƒ\╚c>à\▌\╙\▐K\═!Æ{¡.\ΣIyvª2\├\ε\'│*2₧.Ñ\▀Al½F\\-/bR╢Æ\ΓJgÜz\≡*^t ó╡!K│\τU4╝nd\▀╙¥╛Æ\╓bWvI\┬\n*úC\─\╒\═w+¥«»╖r«┤Ñ\÷0ⁿ■]<%Z£¼║▓ì╤ìù╗nj²Äc\┼\τ\εM]ÑûJ¬√2;\ε?òà├╝MuÑj\╬\n╚ô\█\rd\▀q\α\÷\±¥\Σ√ÄV8ùhEJq⌐3ƒ\∞\πºQ╫ô7\╙\╥╚òZ\╒\▀K\nU5W░\αe*C\┬X\╩\╟h½╖d,U	=&qWD╝Æ√~2\∩╬ñi∙êVàN*¬ⁿ%,-:^\≥█ÿ╣}æ\Γ=▒\π▌»IN./Öò╙¿\Γ■}⌐Wèj■\┼5╕º\Γ╢nvB\─BN\╔\ΩKd┤E5á╗êƒ]⌐£Qoô\╠[\╓╩Éìh8H½åt¬\σÉ\⌠\╨W╣åíƒ\╟2╡<\╨v\\8\≥╡\╧o─½╖-\╥\αBñí	Apæ\≡\∞E»F_░▐î\├■d■²\≈äxùßÄ╜L?┴⌐\╙jU$\█\Φ$ó¡e▓µ»║╕l<\▌┘úG√ï\≈\╬°}\≤\▀K\╦jùîN\±\┘Sàà└Åqb-⌐\≈\╓\╔2\"╪å\┼─¡K}u└⌐6ƒ/6\┼R1èHS╠Öëèzî\╘°à+\┌h\µF[║æÜ\Σ)gånÑ=+\╘9wp°<\╦5MA%h½-ù\ε_╣\⌠Ål8\≈º$\╙*\╥t*┤°r\∩╪╢\█lîI¿Gï╨ö#Bîi@¿2¢╝╟¡O╢\╚\≈P\⌠ùu\≈«Mïb\╒\∞dvc¿6╖æ²\╚\┌\ΣƒA9uKGê\δ\r\ΩjWÄjeEiÅç\╫\╙t \0aiî¿╢╢ú\┼╪ú■óyi\'/rÄ╡z\╦e\═v[┐!\φçzH\─QUane¼\∞°ó┼╢[mï,8ÿ<>\Θoª╡·I╗▓dî4┤\╩2₧«\τ1w₧½╕╢>\≤╓¿åDodv\π(║5¥╝»üÖù}M_20dó\≤2╠ùE%¥Ñ,òS*G./?)½ÄQäo\'í<[~Mä°uL]ºR\Ω*PúO%8\┌;\╩\\F=░\ε\╩J\n\≥\'ïsùçDQ⌐\╩F.äö│Ñu▓┼╢╪▒b┼î-,\⌡│?,5*J\∞ô\╩ZT*=,SZÅ}q╜OY7│ï\÷-î»F5⌐\Ω╡CÑ\≡(zQ║ÅAAXPì╕#wà\≤K)îⁿ╗ÿÜ╨₧\Z¥?¡\r╩Ñû¼└|&R╡Z\Ω\╤\σD¼╕|\╪\±!lÅΣªá«\╩\╒]Y{YYAº4ñh╫▒êí╗ûe\├m╗╤ï¢┤H\├sG/^$ÿ\╟\├dS\═qE\╩We¼êⁿç¬\ε-ìwÅ\rêg=ïj1T\φ,╦â\∩a\')╫ûg\╚┼¡	┼æú;^\┼U┴[S\ß\▀Ä\ZÜ⌐=j?ⁿ/\≤ù1ïbß╢╢*0\╥:▓u%Q°ÖP\πt-N▓Ü\╫\╠8╣╙│%Æ│\∩\┼9IEqdr\╨Vè╗\ΩNn|G▓┼êDè%└è∙z>\Γ}\┘yYO╔▒┼▓√%\±iÅ\├<¼\µ3æs∙\≥*\╞ⁿM\╘:âFù\πU^.Hn\├╗\∩╗\⌠\∞{s\┼s\'è╖ÑI\═\±,XBºÖ\\½F┌ó\╩\╚\╦\├\∞b⌐\Θu\▀\├GìG\÷[$√êè\┘.?+è\εí\∞Dⁿ¼çò\\	q\∩!\╩\▄]\▄+s)\▐èƒ┐\÷╟Ä⌐\╔$`)\╒\┼OyR_å╣ld]\╟\╟bw∙r┼▓º┼ï3+OEaóTm\"Åç\├╚⌐Æ\µ\ε3\ΣNäíε╗ë9;.%▓EAlù\ΣQ│ƒ\╩C\╤\≈x¡êƒöÅò|╡\φ[*xó\π╘╢╢9ÅÄ\╚\≡c)\╙uj(.e*QíF4\π\╦oò£v╜Wq\≈WC╪╢X╩ï,[kW\┘)fª\π╠Ä╩ÿx\╧┘ôº*|va╫Ü}4[$\÷╪îî]\σ\▌zíwëp#\σ9Æy+l~cO,\≤.\µq\┘l½g\┬(h\δ\╦∞╢╜ë\█lv▒\≈b1ï\σ-ì\Φ╠ô╗7\╤7â£Z│%C_e\ΣCc^DPmb\∩!\≈Z│\∩╦ü(ç½\┌\÷í╚╣.%Hgñ\╤,ï╘╣\'¿»9¿.e*jìS\\ùuë\▀l║\∞}\εc\═höê½¢ƒs.\∩R\σ«8xPú\≤P√╝V\╫\▄|∙└]\µ\∞q\┘!ÿn\Ω\µ\Σ\÷f/í\≡¬\▄V{i\Γ\╪√ï\╦\▀\\Ib∙k╕\ΓÖÑ▓z╚▒\α╛r\▐[_yæ≥Åê╗\▐g╡\±\┘^\╩-s[b\⌠>Kwâ┐9k\▐kdvsz#\┼\≤\╓\╬G&/\╠_mÆ\ß\≤æ.\"\┘╦╜\╧k!\σy╝\╬\╚Z.\Ω10\▌╒┐&\\ñ│╒îW6F9!\⌠]∙!;m}\εC\╚ \0┴~SÉ╕\▀d╝┐=\±\╬]\ε{Y\"ç╢ñ■öB9W╕û█ïf.¿▀ª╧å½\π\Φ▀¿\÷╛\Σ╕ëyîc\Γ/°/üm▓\α.9æ\╪\╬}╫╡É\≥í∙J~b[&\φè\τ\╠\µ2√\─5x3w \─\0)\0\0\0\0\0\0\0!1AQaq üæ0í┴▒\╤\ß\≡\±@ \┌\0\0?!âüè\τl.WD\╔v=0ç\╞!\Γ¡a\"HXé0ü¼\π\Σç$&\╚w¢q\Φ\⌡;\≡l\π°x|ª\r&>\÷N5√╞¼s0sXçÖó\╚\'ZT_\')~ï4┼┤}\┬Eöê\⌡GAA\0░2\ró\≤({7Ä║∙B!`╨ä]■\─=\n\ΣP╡åôaºÇ╡ \0R9è\┬P4í╣B\Σo╪ÿ»√\'√╕▓]■$¿S- \0	·²K\÷\'╨ô6\─·g\┘6A\╒îh\αÇy\─wÅ╛/XƒÇÇ\ßÉGî╚Ö\ΦH∞àùò\┘D─Ä(\├B)C*╨éç\0áI\▄\≤	5\╩2^å\⌠╝7ÇWg\┘gXï\Φ▒Z\╚ydû8D%B╗B\µ7F\╫ahh\╪cn░T,í\⌡î]pê┤y\ΘW_▒]\'K	$ò\╧\≡\\·;[²	\\\▀D{\═√\▀\≈9I╡}p	∙ÿY╕■É \0\Σk\⌠%\π·x¿°Z<!\⌠4DG┼¢\Z\┬8╘é0üºÖ\'┴>2ú¼(√%\÷<éìì\╔j\╞\ε╚┤\┘!*<#.éæZ5¢\╥Pzú\∞K\╚\═|SB[\╨\▌5LX╖c■*$Ær░Åú\╤Ææ;½Æ; I\═HûÜ=òä\÷=ª9\'s\÷êy╛åpÄ1\▐\╪\Zb^╔╣~╒â\Γ~ëÜLOR\Γ_ü\╓\╤\Ω<Xî^]cóD\δ$A8=è\∞cσïª<FÉπí«å√îyíW░┐°Qä\≤¬[	ÄÄ$ÿYU»B\┘\╦\⌡\├jx₧\nIpx\"dª╪╕\█\Σñτ┐â\╤po╝2! !\╓I4Cgb	\╦l\≤\r\╫&\├\÷\═&èΦ«ê\Φ #ª$ÑêU\∞OP-─ôë╥çè₧eç\─?é\╓Hô\╨ \0á½D▓╝\π\÷8\nI]è╩æ⌐ \÷\α\ΦZ P¼!¢·C╛\µuhT⌐!Æt\δ╨äí¥\≥4SN\╥:j₧ÿ\╫\╧»yiÖ|\╫\÷å;┴ª░æ·D[CüF─ì_┤º~\╔$ÆI_	╢Æ]Ä╜\Σ\⌠r▒jìjHu√■\\K\╤\"\÷<\ΓdåÖÉùDù╝CA\╦\╪\∩╝9\⌠.\'Câà│⌐ïê\ΦA┴▄ï\─·<\╙\╞$,Qb₧K\∞Dq╣ÆHçóu.VäN\┘QñZñ4ì₧ÖwäIlPΓå¢ÄÄSBÆAù\"JFƒ\Z⌐\Z╢\├E5àÑ*ëKä░\±∙h╜Éü¬┤\⌠Bò.■\Zd╔ÆB8·æ²\Z\nBl;%ⁿ┤4\╦2<å·\±_\µ\"¢e=\≤\τ8!tB\ΣL\⌠x\╧Oæ1╓å╙íÖ[\▀e/\∞N\Σ»#G_⌐▓J╤Ö2╨É(ê-t8\╥_\╤Kr0çB₧G\╥=√7e+\╦\╚╩ª╔ù7│MÄ\\\╥\Σ,ÿç\╓S─▓rIì@jk@A:[\Ωt1╨₧à9LÅâ\÷ä[=\π╠Æù\÷Ä\φÅ¡î∙d¢4H\≈ëéI&V┤ôQ8⌐%\╚\∩\nÜ:SP\▌²£^»\µD\▌\Φä\▀\Θ\nh║«┐ñ\ZB]\├R■Æ)bx,ª	Túíè┤+\╦c\π\Σèv\Θô\ßQ^ú╕7U\nSD┤\█ε▓╕g°DhùN╢╗~fJJv\Z\σnâsë^Bö┤\rlIi\σ┐╣╧ï└ä\÷⌐E\∩0áHì\ΣÆ~Nr¡ïjN4M│)Yo░Xâ┤0\┬u┤Süs#\╞\±y0ª\ΣHJ\∞ò\≡CQJ{\"ÆU\rI\⌠ç@B┤1\ß┴i\▀C\≈d\╒\"¿Z\Φs░h¢B\⌡╚ò▓E\╥bÇìëªñ░àLm$\█\α$º\∞ \┘bojlV\╥9ò╦æU»\─√\"\─j\╩√\rv@¢┐d8y▓\╔x4\≥!▒Z%▌▒AS╘üñE @bâl│Dr<Lç/\r£ítK\δ)?╢H\╥\Φr⌐DëPá┤9ΓÜ╣\ΘÉ\╓\≡Ñ\'\▐)vyÅ0\φ\╚\╩$ \0Jc5\╥\∞é\▀┌éƒ\⌠F∙7╔úRφè┐áT.ïC\⌠Ñ\╚j\\ë»N$-\╩\α0òÆ\Σv(r\▀e\"Q■ê>Iê⌐í8╣\0└âÄapl JCô╗║\╘CwfAAp8{\εF\≥\╔+*!\╤D\φì&æ\╨°\╤\≡\σ╬ê║\╬0ë< ;\▄ä╕B\≥\┬d\≤_é:%	nB\├╤ñ&ª╗$í╨¿äánI║\n\═-─¥(b╧▒╗âUA\Z$ïôa\╠!\\╨¢╢₧ç\Z	q°2^=█åå╧üªíJ\σwv\≥ç\r\ΣVÄ\rÿ\φ\┌H₧\┼\╪\┼\▄\┼\▐ ÅápvBOⁿyⁿ \0╗▒\'n\╟\≈\'\Θ@╫╕c₧\█y=ê((\∞Gbd.\╚]ò	IA)$ÑLæ▓q\"⌐╕JXL+╛ìB\rvS2*p\▄d%|qä=₧bv\r\'▒.\╦\φÆP{Y\"ïí¼è▒Éq\╪╫ÑI\╘√;8W	\█8²á│Ç\÷!U\╟\ΦÜ\╟h6ì\"¢iè;\╨╧¿âP\r\├\╔ m▒d\╤\0tHS%\╙\ß¢[äS I\┘\σA\Σy3óà~\rdG	\εWö{Ümaφäë	°\╔$H\≤\ß%)\╤#\╚ÉKmº▒ZHúdü.x\╤\ß	#\Σ`|â\╩<]\÷₧\±%▒6\\\╪╤ÄbI¥4$7.└\φT]⌐\─Pä[\δ░LÿSáö╖Bªƒírƒ\r\rKÆ\µe\╙+åJ,P┌¢╨⌐IoF[Bt$Æ┼╗jH½┤Hë\"\╪QÄ@¢d╪æ\┼E\╠n1$▒	äô╕_.úïL\≡¼6_\╞q#X│cbÆ><ÿ\╫\α$\ΣÑ#[]x+ƒ\⌠Éí%(â▓\÷£P║\├\φGòÅá\≡\r\\bWólà£ÇöÜI\÷ä\εj\╞Rm╝	2¬D¿lF`í«Ö\╧Oó	 \0G▒\r\╔\πbÄ\▄\"¢ºEi¡èì\ZΦÅü\µ└\Γ!*╜mJöìH&Qºz7\≤OÆñ\∞å\╞vço\πî] \0â\═ⁿnwGÜàw\Φ%S$)\┘Wdåû╔▒DQ╣\±Q\≈²$êIgîIƒïô\Σ\─√┐îôòúáë\'\█Y\α½L░Öq-\r(&\═3┴xü\Z\Z!GI▀┐yáà\╪L\Φh\╧8¢v%W\"\'\╨\µ\╔\├v=êúD@▌óÇ╫ªö$íhä!jD¿ƒ\≡(|á=\ε^G\┘√\\?Cô\φƒ(╛<è\∞A| î@Yò4\═\╤╤┤░G|68\"\"\╧°à#F8\Z\ΘR\"0\╓\╟D.U┤ó\╒D9æ┼ó£\r┤\∞pÜ▒\╔┌º\αöt\α|F%öcè\α\Σ[h \█Æ½âÉtÅe&ê&h2ç5=\╘2h°\┬SHôà╕vj╛Dí\τ[\╔\╦⌐vr9Jgf_G8NaîF#	ⁿ\╚ \0\─ \0ía╢·%Bdzñ■┴╠║  \0¡ƒ\÷3\╩²<\π\╩yLFúñû∙%\rJ!▒PÖô░îèI\Σ6«\┘fR7(,vxT+äÿòv1\┼\ΦlpBèÆB\ZQóRókrMò6\█!⌐\╩·&\α{\"Q\ΣHÄO\nóé55\ZI\Θ\∞\φ}ö╟ÉU^▐ë\µ~:\┬f├åy\σæ*7ê îAK)²s`%╔í∙\r\┘?ü?\ßH\╒!╗FåV\╚Kí.Äe=Än╛ê2\┌\±4<0\α¼┘Å║\Θ▒\█\"0É«(\╨\εAtC4L/8d\÷#ûÅeèyÿ\╨-)æyö┤┴Zou¢└«ñmJ[ 7∙KyZ\╬b\╥∙Jj\┼\rÿ##,\╘\÷CÑ?\┘\╬P\rÑÄG`\┘\╪\╩\π9^çîx╟îx╟ê-Hi\╤<₧!\ΓdEGoó[ÅB\⌠)#P▒/0å\┘ä\róz6ñæ¥\α\┘~\╤A\≡d;\╨\╙\┬JlöJcjï\╚D\ß╖\"ynöFDg3a▒Ü!6─ó\├A~Dé¿º!\αN▒nô<âü`Ü\'╗\⌠\÷\φ$¥ë¡äìeä²V@\÷┴y\┼\╬\┘\σ\"Dy┴╣▄ÿº<üQlæH\Θ\ßéP\┼m▓c╢2\π ½G;)\╔J&çü╕\╤,Xë\Z\┬9a°\ΣT\\╧ü\"i\╙\ΣHY\∩â[N╣æ\δìe`\σ0L─ï	aÄ6_oM0\╚\┼SP\╔\ßnÉÆ╬òxƒLPXE/#\╤z4\φñ3n\÷GÇƒBBM░ \0ñI	é)^îm8b\≈Af<F\╤lGÆ-NêK\Φ~~(p¬tZv\rLK,F\Z╕ÿ\▌\╞Z■ë╢t\ZkñRBôIA-\">\ΘⁿÖA╣B\▐PHqå\╞\▀\±ÄE\Θ 1║G/\ΣBRé~╟Æ\╨<ó\╘hi/*ƒZæ+\÷XCCò╕■\╧7\┘Oⁿƒ\⌠Æ \08ôH{╝ú└å▌ñ){Ü\αp⌐╖}*F√ z\φ8┤+b\\┤$èuÖíqÖí J\╓\ZX\∞hAnpÆJ╘ët(A	Ä░\╤\⌠_\╪\╩\'Ct\╚\├ê\φÅ\τ\Σ\═{r\αÆoÉà\⌠│F╜\"√·>\ΓJ\ε▓\╨M\╦%\╪\≥\≥\≥ù£\≥\φ╛B;ö\'íá^eƒá\φ_éIç\╚w\'\┬\αVA▒%ëáXSô!\╚╨ªÉ\╘╩ÖEÄpëÆ$\╥uOB∞¡î╦éì\rQ4%ä\├I\ß$\'\╤\≥à2╩ëhÑ\ΣôZX¼╝:\╥\╩Y\"¡rTF.╗¥¬DéÑfg\╪°/\▌\π&\Ωdh \0┌╛é∙\0ï¢íê\╤	e*~ù;─ê?\ΦBeë ál₧ä¢\ΓHr\╦AcPDö⌐kæGbåQΓôÅU(\αûò+X\█ë4$,b░@ÉÉÉ┐\⌠L6\r\⌠DQh\÷║î@ù\┬\═1\┘\ZùÇÉ4Ñ(û\'cd╢}I9r\▄\"\╦,B\≡7dÅHü╕╨¥WÆT\┘\Γh(;¿¿öÿ▓\\ÆV│6ë┴\╪\Θ7╚░\┘tHe\∞\σ`╢╚î╣=É╛I\r¢àú\▄)ä\n ü#£ñ┤Kc╥╣úh*)\α(É\▌C¢½zF\∩mì{öD/\╦∙Pò\φ=ú\╔Y \0B%\π°Uñt<ëºº%ñ─╛¼!:,RI\÷~a∙┐çiZ\ß}╕·îæ\╩i\≥+æ$âÿ½qp\"<W\╤╞îáNå!ƒ\∞{e▄îYahHIl¼Zh▒XhÅèD	ä\nÖë\┌\┼o\┬(J\α4#@êâCR\╚^?\╠!H╙éU╢oA_P╪ÆI$æ╜º,\Σx\≥bPê\┬^Å┤}í╕[GmA\÷Å╡·}ê/h^\╔\σ√4╪Éª\╪ci╕Y│K┴-G\αI2E7$.\╦hMñ√A;\α*v1▒`êAë\'\"╢9ƒÜô\"û\rê ¥íφûöq$@5ëWôBà-\╪\ΘC▒-å\⌠╡\╥!\⌠\╥c\╤|Xn»lJⁿ₧\═ÆI$£H4│■å&\n\≥#\╧\±$wÆÄ<\╨lfîî╧É:2\╬|Å\Γê{>\╧`Äá \0H\φó+ë#\╪\Θñ\╙4eXÖk·B\≥WÉ[ºLëó,HZ)ë╝┤¡ûÆ\╙\r0\╬Ä[2\┼$╬å⌐\╚\"ä ü\"g╙▒v\╠\",í1vm£⌐ºaFm\÷\─═éí$¡jñ└FZ9!\▀yx8EêñÆI\'Y┘çBÜG>\╧\τ¥3└\╧(LñΓò₧Å<\≥I9\∞{	4Ö+kdºÆYªNv%	h\∞Q²ÆH{É¼ßí╣\╟\╙\⌡@hæh╣\ΦOM\├\╪F\╟8å╨¥QÅIC\⌠\╚b|Uìû\"i¿â\╠lùéne5àå\ß\Σ?Eeô\╔\╚,à#\╔b&ÆAQ\αJ┼Ñ1,ûÖªêsê,\╧B■&]A\⌡ⁿI8N*╕Ke:\ZBPÆ)V\─x\'J1\'\╥b \0└▄çE[\α\÷,*\╨\⌡⌐!3\α8Éöô¢sí\╩kb¥│TÉXÑⁿ>\╚%\αH\÷aÑFi%\÷5I<°Gú\─·;╗îï┤²Æ┘▒\\	f\∞úIÆSf2\\f\ßv*Xä:ºæº░I\± ¥╡	Q-B┤C*\α\▄sJTì─«\"\┼oEÑí\▀\╨qÜ@ªO╡b%¼bû?\Z[▒!╢ìF\▄p1ä\╤1\▐	ú═âp\┘\'#è¢Q=£rï¡)Dè	M\\.╕╚░\┬{ô Tkæ%<F┤╣\ZlSq#CP\⌠D%6CS-F\╬\─\▐Hæ\'-╪║\╬æ\╞&¡ïwbíKå┤å\─\╬E J└ÿs\┬J\Z	üe─ïkOÆ4\≥ky\╧#8úä─┤\÷-¢YEtBí{KüÖ╡\╨m└¢Xöyë$ªWⁿ\╔cƒq7\"\ß\r\─\╔3N\╞\╤\≥áⁿ¼h\╦}3╕\╥~a┤\ΦJª¢üsw!/|╝.	ûgL\╙sFô\┘Y1.H)0╜\╓Emâ\╤\╩A■äƒ┼▓N╛\─D\▄X╥╛O▓ë\╚╫é╝$Gü,h┼íÄî\\⌐, X 	I·X-+íDCñ\╙\╦PR9dú\╦)G[19\"\╚d\╔$j\╚▄ô¿\'âiE¢E╛	)\╚\≡^DÆzƒgg\ε\"\µº\╩!w·ô▌╛\╟k╪Å²æPoì\r½=%\Z\"¿╝▒zH║▀éR\┬$8g\╤&┐3ì╜ë/#âCQw₧\╟ùåu+b\αè\"GI\Z┴`┤:╚ª\╪Jçé┴êöªi\Z\├b{#öÉNy½\nA╩É\≥)$æ╡].\╩~I!tìz╕H═ª~¥\≡EÜÑcMº\╞q\∞ó\αQ╚½_d°\φÉV¢\nFç\┌y\╧8\≡┤º\█8éfÖz\≥E└\≈_éåà\┌_â$Ä(\▐ⁿréïREº@î\┬8Iƒ\Φ4*V\┘\r o \0dào°y½\Φü\≡Dêi ÉÉ+\▌ù8╢â·┼É\Φhhb\╠Æ\╠NQa!ê▓ù\╦b\┬R\"\▐\╞=öö>\╩·\╨\ΣP┤bT\≥D sL\═-æb▓>\╚(ñ8k▓\╟\ß╚ñ	╕\r}yv┼▒\ß\φ||7▒/=ì½\ε+$¥╛\ßÿ é\n\µdè\╙b[BU\╦(8\Φ6½VqÑÄ╠Ñ4x\├\r@\≡\╦bAHÉ\╩$╝▓║°ññ}ä╖]Z$▓Æ)Z$\┌$«è$°ülçhk,æª╨ÿ\Σ░\╥╚âxçö\re\ßè╚çyz┤\╒\╩&;NúºRÑ²ë\≡└║ƒª-:tI\╥XB39▐ïÇMI╢Pû\⌡ª*ì╡\╓T\π£\Ω·\├\╔{\╞\╔\╤\∞F`H[~Å¡Ç)\φó\≥w\ΦÆ\Z\φI.\┘EN╣lYL┐\╘Qj-ƒ\▄@\ΦgQOMÅyë\⌡\⌠,8úöD╘É┴y\╥·;\┬\∞\n.G\ΣÜeG\'▌æ\εÉ\Γr@\╨\╞1Ü▓\ßìE`╚░0\≥ECû_├æéS\┼\÷éxeº\'é&]│så\╟qúP\⌡Ä~■+ì\┼|,[▐ú\─A_8çqmï,Aò\ΦI\╦■\α¢\≡\├!⌐O\╤\ZN\né%;fÉ·bk?ñU\█H╟Üª╒ç╢7\αº_ôº\≤°{«á╨º\┘\ß√\nK┘░/h\φ	ìû\╞E3,$\≥\τÆe	║┴o\ß\╚\╬\╫\┘:C$■II\ΩI▒\▀\▄A\\Ü░û2jq▒\≡ú\τ¬ga\σF\┌HkX\▀²Hô	K ╥ç+M\╙p-~ÉcAæ▒í\ß\─\r\┌d{E \0É\∞æ \04ôo√₧pL\≈Iº»\±ÉpäⁿBⁿ#\╥!\α«\╚\εWç\Θ\Σü\÷╚»√\╧²\±p<\±8;,│A[\┬ppä$P\\í|6%PJÿÆ¥1	\╤8æ╝7B\╦(╪è%\╦pW(\Γ╕%CO2₧p₧ï9\÷?B₧₧╚Ñ2â{9\├ ╪ô╞¢Cù╩ày▓	Äh╡giåú¼\"\÷*╨░<öiëÜö°\⌡1\≡í/HOeà>ë7²DP\╬\≡g) \0ÉR\σ■ƒ\▄^\ßO£ÉW\⌡c²Zm\αH\ε\µê\▀└\µÿQ|\α₧DÆH\╪\─!:\∞cº▒\╟aèúg$\╠L╢à9i\≡ÆrQ%ni²-h█ªτæÖG(HN╢%└Ç\╤,Zñ0\╦└\≥ñû\╞S\─\'\÷,┴lkoΦóÖ-éq\╘S,\\\╥°É\╤┼▒\π╬ú\╞{1a²\"?\≤ë\█_\Θ\╔ⁿN\▀└\ε_Dw}1\∞ÅOç\▄\╚\⌠J√Äæï_ë╘á\▌\╫\Φë\╩ⁿ\╔m\Φ\\Oi\▐]░ÜïC■«│╗z\α·»vi\─\Γp9º╩¼å┴>£@\α+míHpëI╟ü8#,I8¢<▓╦æ%æTd]í6\µÜ\r\╞\╧[r\╤╠çr!ªÿ─ôòU╢\▀DSP% ƒ╨à	┌ú\φê\╙P┤æ╢7°0│C\─yúHÅED║%Åíêd>ï%û_eù\┘\∞{°ÆM)¢d\┌\πg(√Z\┬Hª^\µú\⌠r;\αKª\µ┴4:\π\┼>H\╟\ZÄ	\┼\▀I=¥e\ßùckp\█\╥\▌\Σb~Lô░Å\⌠êçWs\≡N\╟ⁿ\"b^H\\(\≥\╟T\▌\Ω\┬íÖ8ï²┴\φÆáy\╪\╤\┘6ƒ\⌠-c\≡+C\▐\╞tñ£3\╬<ú\─\╔y\Z4w5k\÷\┬■\╧°qrä$\╤\═\⌠w┐\╚╨⌐éi┴ïB\╓╗\r\σJl\╤└A#î╕h\╔\÷x╕q\≡+Uôì1ìkä#\╘T▒JEê?6ä\α\≤^d\╬4▒¼lÆI\─ \0*!A\r2^│Ho\±q╜?c╢▒å≥û╢å ¬\╤\÷\'h\'░p ö\ε;4b\Γ>╟│\⌡Y■@åÅ▒Vìçá \0ÇAö░\φ \0╛╚å¢ \0xÅ,â\αè\╤\r\Z₧Q&D\≤\"\╔#)¼JCQ\Σ 2d\╟é\▄\n8Z╧í\Z\╬\╞n-\ΣhsG\▐2\∞¢\╦\▀\'pX$Æå~Së%ÆI$Å-║ç╤░·7\εg■æ\nSσîâi²\r\╪\÷\"<çö«%┬áG£\╘\╦Hº\├\Ω	ⁿ■6\ΘF(k¡xJ╛\╔v▀▒ê\π½ëA║8\╦\╟\⌠^▓V\┘\Σ│bE)	9êpµóó\╩\├GDV╣íUIc╗V┐■I\'O\┼p;·#╝N+¿\⌠■ôm_d9A\█°\Σºåï\∞+╛í²\'1PBs▀▓pó\∞ZB╕ \0╨èJ!▄ñ\≥\≥îj\╪\╬/\≥3\ß]▄í2r╘ïXi▒çìÅéà0\╔\'\"m\┬R;4	4╣.~Ia+Nä\╧\\7í\╙r\█\≥5ⁿg3ë \0\πìBt7l╝┴∙2F°-YüInr$∙,\\$\δ▒\÷4\∞8¥\σæH»\ΘD| \0\n`{\╫\╪▄áeV*([å4«Ö┤NP₧${+\Z!╪¥a╢c\╬lY\┬\ε\╩t╢æG\≈êó}æNT\╦\═√ü\Σç\"╒╛\┘\\\╥CÖ■F?\µæ\Σ²«Rà0)\╞∙\ßpkG│d;X\ΦE·D(\╙ \0l \0ò	Z√╘üÄƒX⌐nÉI░I╕òr∙kR\⌠\"▀â\╤\Ω\─z4░àî2Oº$ªH\─6?qy;49I#\rÆv\╟f:F6C╨à²\╤h¢ó#F\╘d\≥º\╔$ëD0q\≥ƒ■M\ΓWR\"┐\∞_heD╣äåûôm▓\÷>\─▌ìT$√\÷\▀@\╩°w\╚╩╢\▄\╚\─V\▐\─$Q╕╕¼&╡╜	\µn₧è\∞┴\ß\±BA1Jûñå	61$n9\╚┌▓L\≡99&\╙8n░l)a6áöå\╠F\Σ\╨Z6C¡ª}$║&ò\n~¼I?ⁿ\╚yûK9_a1aí\ΣBI<;\ZJR»Kü║Bi@╛\├Bi£@Töú\α!ÆXòBRÖ\Σ\╬Xw+Æn¬\".äf1■Éª│â\▄l\█\╘\╨─í\∞\≥aÿ\╠&	8p9\r▒║à√ë┬í\Ω\≥S\╥[I╜ï>\πïH\ßú\\ºáVⁿM₧ \0∙\⌠#p\╥<╡\'ä@ê(\▐╤»\┬0₧\µ\╥\Φk¥√c₧\╓WEÆ\╨\πé(5}√ä╞ëR)u.Ä\╧}\▐P╗\nQÄí9oî\╞í\█│\÷ta¬└\╤\÷⌐\Zº2p\\ÄIc╨ÄE&Deb$Yx(₧ç▀íïLî!╛9\Z)Ü%Y4eNx\φ|\┌KO\ß?(ñ▓W\ΓIA\┘M·å+Y\'²o\ΓM>H╨è\⌠ⁿIÑ\≥Ñ9\\èu$É√\▌J<ïwö\╪╦Æ-B\╩PI0Å]╢c\╧\╟.M\∩bD\╙£\r\µâBC\Z=¼Vé\╩J\╟qíáÖ0ÖƒÉ&à\Φq\ZC:╣>E\╟\═\r:#L£I9dⁿñäj\╟\≤ó\÷\"J	|B\▌\Σ╖\╚N\ß¿DèZ!çRO¿Ñh\⌠Ræ\⌠:\"╜ ⌐Åé║¢J╣~X\≤\δ\╦9ºqq\∞ïzæ\Z\τB0\╨>\≡╞░\╚\┼$R?ê+²\ß\nææ,┤å5mè▄▒G-\├B\─bGJb¡²\φ\∞É╙╡}\Z+°■┐ü8wô\┘DG┴e╜\r^ë■q«\╨*\█Ké\┬Rº\'∙1⌐4┤èMZN\n\'ö\÷\╨\╙πòåh7>─è1\┬\"BI╕ü\∞₧NJ7▓i~lF╣ Åô^û\╔j\├@\≥\─\╪A\╔9:%B!\ΓI¥\├\÷5¡}p╖Ü\rï\σOâbZ∙H\╒┬ö╢#\┬\Θ6\╚■Üä*cFúüU\┼╓Ü\Zô\Θû5╕╡&x╛_æ \0/\ßtä*\╞\τäQÆ\r╞óñR\█└«\╘╠╣í-½6ò└╨£\φí¬		£\"b₧FMI\╔e₧=róÆH\╪▌ïFú \0\0\▌¡\╬å,nê	Æeæa\n9▓Θêÿ\╙¢eFÖ\σªoü√}1\╙!ƒDXÅ┤3ûjG\naë\╘\⌠\┌P╗\'T[\╓h|«I^Jª▒êñmæ\▐Ytⁿ\╚hù\╟H\≤ⁿ	>3·\─\ΓjP\Γ\∞▓\╠4ê*╕\╚W|\╠\▀Lé\Z╧ä7\┬èF\╓\nc:x¬\╚\╤\≡âc úA,\█\µ\╞⌐9Yn}│l┼æÅbW\╔\┘d+r%\σ&O\╔)\Θⁿ\"ü<ù\╘▓JSCP║,¥\╚\╫tbv╖\"\0Zæ╢\╧D4-FB=`\r\",MfÆîz2X8à\±ƒ@\╒═ùm\Z½yh╕²[ªàñ\r\═\"│░\┘i0├î,₧\ΣgΦ⌐èƒ\ßgⁿâb+\≡	RT╕\Z\╥47\ß░A┼î\═\┌%VäÑì\┬\─°\├\"zªê\≥ü;	é$ô\╔ká[$Æ\≤;\╔\╓$åéä\╚■\rⁿ¥\n\█	oÆ\φí\\\Σ\αx7\rñy∞╢ƒïYù°╖à╣A9·H°åñH+\Z4┴Cî⌐¬ñåry▒ ₧$c┴ⁿ\╪ahU_ï	ÿ\⌠\'╢£@û)>é┤háÇ\┼2ñ\π8ö\╙hP\∞v~O£Kí\─╞╝\╥v#ü\≈óñY\0\▄t3«BR4âæ#·┬êúÇ-I\µ°æ¬y■\n\▌\r\█\▐M\╬8\Z$vP\ß°¡OGÇö-\"x$ÆMG\═\ΦP;-díÅGóR─äè2\╚╪░£0n^dƒêÉÜ\╙c\≤j▌▓\▀╪╢\╨kT$r\n\πa9Åp1hN╕â╡í╝\╓edm▒\ßIqBiö\⌠\≡\Z~N>K\∞>ç╛ÖJ\σ▒D╡\µd\ß┌öì₧\┘,@\█5\±▌í[Rê\╠B&▒#\Z┴É&7\÷╜«äaP≤åòæ─ä░\ΓCY@8ê\─\≡\▄!\▄\nÄ#└■DLê&S╫ü⌐S\∞F\╨0ñö! ñ\ΘT7└+LPJ*U/\╚\┌1û\▐\═$prD\╤?#\⌠\Φ°R#√ía¬\≥>ZCU_çx<l°╬å┤ùjà\╤^åN╚┐C/#^¥ó!\ß⌐\╪H+$|\rU\±MJ\Z°╢K^\r╪öD;å╒êá\╒%JF░ zöùyD\╓4┼íá■\\ä\╥^E\±1R\≡\÷\╘G\rS\∞m╜╕E-!▒░\≈ùA½;>-J5Ç═▒vüó2A\rd\αhIo\╬$¢\╞)«ç\╫┴\r·U	╨┐FäI.┼äp :Cê\"\'\┌\╒	ceAè\rr╪ÖF\±²╗ñJÄ\╩\█p¼,ò\'Ænåoé$∙ÿ╞│V9r@âdì\ß!+°╗1|╛öiÆf\≥\r0üê#/«d\∞.\'┴n4╕\┬Wnä╪│\≈7½\Σ┐X▓\─	*K¼4\Γ\█\╩V₧ê\nòí-pG\─\÷▓à⌐\╟\╥kî╒│`\╘╝âû╜╟▓i\÷_\"2\╩\δÆz\╪▌▒;\─aÅ\ß¼\▀ì\≡ƒ╨ç\σDSoƒLY£+ü.>B\ß½\Γi{9\Ω\"Q╚é\╔TÅ\╚@nW\╔╞⌐°4ë#°²¢\ZD0û3),Bpj$\r\nö\αÉ╪╝1╗~\┬\╦ö	,Pô\φitÉ≤₧Ö╖∞ñêM$61¼&N\'¥Åçëfn┴0·ó\┼iûìH\⌠$6\≡╘Å\"p₧⌐co)ibl0üdE$|Äämà\≥B{PçåâdYE╨ù~q╕\µ\≥│y<;D\╘	\┼æ⌐óæ*æ└)mr~à@ù¢▒#\─\rbp\╞Nj\ß▒\╨b\┬m-\╤²\0_ú░ƒ[DM4Æ5┐W┴\"\n:Q\n╣\╩HyxtA\┼G\≡0₧Åê\φäW\╨, \Φ╗\Z╔¢#¥![╢\"aJ╣CfC╖B)$8\Z({a╛ñl^\═liaíσ░│ñ░┤r=\≡åàÆ\╘\╤\╥\╧Wî==m\Z\╪CuZ▒^ î\├\╘_`\╚$$\αTï@J┐ü\r}\"XH╞óéÉVcL\rcHo\α&\═3m1\┌$ün\╧zs1\ΘW\╪├ª\π7JÆh^D$\┌4ºîh£úúÇ\╞\╦%>úv⌐#\┬:\⌠%éaR¡1╢\φí\╞g	\"┴\÷äü@░⌐b-ô~F4ä╛#ƒ\Γ0₧ç\≡N╝w`]└\┬═╝%cà▓Nx@á\═└ªaW-╢#â~\∞(I~┼ç!0í\╒\Zf\╞7\rc¢y4{<I\╤êë:D(#å1á\▄QÆ\÷!╡+╝o°}ÿíï	\▐▓_û\├\╩\Θg$»\r\µ£Z\r0⌐\rï\═X╪ÿ,j>╟í-7\"╪░váæüÅp∙4\αx6tl{╠┐ü¥H$└Q┴%$\┼\Γ\╞+óú▓\╤├╖\█8░\'\├\α¼╖╧╣╢PÅEû▒└░k6o!)cx^D!L\╨wdJÑ\Z\'áû\╨rU\α\╓A3C┤5D\≤ì9?░Ü\α╛KY_3üêh¬Q¡Üªúk9\ßô╪ºÆ?q1k\Σƒ\rÅ\εB°▒h /8\╥°B$!¡VÉ\Θ\╔H▓D»ƒ#\▐\├B	├ÆN2\ΦæⁿÆï&°¼¼sö40\╔\╟c\φ╫ónÄ	2$#√╛O	|VH\╔\∞F\╙\┘┴└ä#Q\σ1$,2D7M°Æ┼é=ê#ç\┘$é;É\╚t\∞n0┐░û<íÿ \02╛+\ZxyrO>êSv\'á%\╓\≈\≤YCíç▒\╘\═\╬,╣\├\├\╞E#▒▒,5òÄ╒â╢d!KiAêó`ÆM\αÉMàä*UôcOô°▒%Q\Φåo\╠1ï+(Z\═ha\∞X\τù:1A(SÇ½\┬-\σe│\╪\Σc°ª½\┼Khv\├▓ä\╩/B\┌6 \0\α\╧9X▒êÆZ\╞\╙@ä1\∞b\╩à│âsa\α\┬\├ìE»ü<P╛=¡r\÷6ú└╪û\─ \╪R/Px \─\0\'\0\0\0\0\0\0!1AQaqüæí▒┴\╤\ß\≡ \± \┌\0\0?xê!\σ]\╪\≤CdBW»ªÄ\τ\αò_\≡@£«\'f·ù!+\▄zäsQ+x¥D╠▒\├2ébô\╞&XóQ\─\█Jö8ë\\Duq(X+╘║\Γl*\rQD7J╨╝\Γkj\═·èU£HU?ªæ\ε24·ì╖\⌠ôw&]░^ÿ2┴\≈É%\\2\α╜&°Ä%8ïIå\Ω>k\r9,I∙%▒▓)\µ\r@|%╩┐æä\╦[ü\╔(@»[\═n8B\▄LB¼\nQ\n{èZ	N¥\├\ΓoÆ\╟3{>(öJ%\┼\±Qó│\┼CyGi\Γgª⌐▄û╣s\±(\α╚Ü┤■Öö>«ƒ\ΩUÑ\⌡─úTÿ╚ì\0ü\▀√B \0X\Ω\σRå#│²e╨çÜïV¥Çöv╛\╞ú┴}I\╠WX°V èó\≥ª▒>i\r\∞J\╤äÑB²\├M▐ÿ\∞│\ε%\├\≤\≡WqU9»\╘z²\─\┼fq\Θ\⌡tQ\─K2LuÖkK\δR\ß╢\nbûL∙\"óê\≡⌐Ä\π:	ocÿâs\╬║ÇQ j5V\ΩhèO(ò\Γh╣w\⌠ó║?bö·ÿt¬	JO─¡q\ε\nLÉ.\≥ê0,ñ\"x▒àüGhª\█\µ]í\╘-hJ\≡ÖK₧á7A5ç	┴2°║tD└ⁿFÑs+o⌐mª^X╚«ë\╤7\r\≤d*\±,ùdU\▄@!-)ÿJ\█j¿D{é\╫Rá\≈$fQ²:k\╔S\Γqí\0\α\⌠áü?º:xS\⌠\⌠\Γ°Om\╬U\÷\"Y\Φ	ü\Γ\"²Ñ\rèWYæ\δ²b\Φ1\Ω\0Q}TNwV╧┤íÉç\▐\Z\⌡<ë`\αl\τ?\Θ\Ω\"6\α±ÿì╕S½¿ihV\╟\╘ctƒR\µ\╟\±\Zàu(╝Tí°BhJIJé₧`+│─¡yâ5√ÿ₧\⌡\╚\╠wlT\╚XJLA@╧╣G0╝3PS┤ÿ\╬_L\α?$ Xï\µ:B╢\▄n\╥■-½!*¬·ña f■º\╚D\╠M\÷ÿö¬\╔\▄@╤ôD╕QO╣qÅ\▐\"\n\╚åCñ\▄X[ó%\▐\σ\╘5qk3KpU\µ\α>\ε9Ní\╨\╤.ì\├▄╝f{ÿ╛>¼╠╕ì\\│UëÅ)à┬ó^ò╕\"▄╖()Wd\τj\Θc*╜B║:\┌\┌ⁿ╩ó¿\αc\⌡\r\─\⌠0u>s.)fròS√!+\ε\Γ;·\╓v}╖ç\±J┴)f╗\Φè\∞ƒr\σ*N\╠U\≈\Σ▓[Ñ√&\┘\\x»ÿ2}2î\Σ{ÖYe╜╚ïù\0\σ\εª5\Σüi¿ñïçë;à\╩▐ónó₧\αç,╖¿\±òèÄ╢\▄V\ε7┤╝+d#wx\╘B(T\Z┐b	w¬Å{é1r\╞\σciLnd»\Ω\r╕\'\≡éï¿╣│\σoÅ╕\αù\╤MJ_78¢%ä[╓Ñ╕èñ▓á%½Yè :ñ╝\╔┴eò\▄í¿\╨└C_ºEú;▒åL B┴ìs0╡\▄b*»âr\ΦT┴\'ô╢\"\÷ÄIæè┬«╖[û╪┤3ÅÇú°\"\±L4U⌐G0░\▄u[\╓\αÿ║t\═2f\⌠å(t.oS_Hv\╩`ükCl└\╠_\⌠▀⌐ƒ \0╚ç°¥º\ε#@r\╟─¢)C²├Å\≥└O╕7\÷\"¥ç\▄%\▐\╥\\|ÿ║\╦\σVa|KU\≤5⌐K╖╘⌐9\⌠╣p┤)ùîìu\ε√ äá¿Q─╣pû0æº$¼¢&óf]ä\±î\±L;ⁿ├₧ì╞íNäü{\ε\µ	\╪\▄\'\∞e:ä&╝░{╜9,5K\╧{╨▓º╕%\\\φ\rGëf\σè\ßXAíu!åVî7>ú?\╫\∩\ßùSê,₧ lzüMτ¿ÅQ(┴5«%båe	èuxU(][\0çòä¬\╨E\├g<\δ\─\╘└\┌\µ\0╕└b>$\╤9+ó> ],%Z╙à\⌡Um\╩\σb\╨7\ΓV\π¿\╚zYZ┴\ΘBh>\≤∙f└ƒ\┬M#}ÉÆP\∩ \0Å?╗p└è\▌\╩╦┤(ì!▒\╩\╠\ε\αe┘º)nU\rT\σÑ\ΣºPR(7+öGw─╛ùÇ\╪W\═.$/\δrôAU\▌@T\Γ4╟æÄ║öz\εe─╕7\n2\╘(╕\0\┌8ïÇAnQ\╘GJöÇæÜ\╠1v9bEy\εU┴\±Çç«╨óf\n3î┤ºr\⌠*½F\" \╒ \0pkÆípä\Zm1ê\µⁿEE*\÷uá╛ó\αS½¢═╜ìæì\═2╧æ\╔\╓#\≥\δëEìr└\╦\≤R¼ñ┬«#╖Öºr`,ij?h\≥x∙ÖÜ\π└\±\Z\╤q<\├<│$:\╫\╧OZ`╢»éf\'I■X9;ê(\╧r\┼jX\∩$áùî\╦H║ï>Ñ*°Ç#Äe\╠\█ö\╟u\"ª«Ö{╕[v\╦3\Z+\╪JQ\═1\╩╟ö⌐C╛a║1(\╧:C\┼\\A	R\≤,-0\σ5╠úiåëëå⌐E\εf\┬²F╥╡\╘Q░$7\ZJlNG3,\rb╩╡G\╘$-g\\|(w\σ\"\┼\╠\τv\╦\╘	na\τ\∞ÅAt█ê;┤╦üb▒|\α\π\φVéj╣\≈.á1├¿<\╘1TL1ó\∞mc\▀1t\ΘH½-╦å(╡a║\═Ow\╘C\∞\╘└Φê┤jR╣£⌐ùPFIA╖w5$\╠\╙\≈R╛î\ß▒+t ╘ú\Ωm}╩å\≈╓ÖO─åp?p,~²C¿\≡LazTQp){=M\╚	.6X\╠PQ?H¼A¬\Σ╕\δR\∞N%\α\╞α⌐ÄYí¬\▀─½h%ÅÜ\rSàC\╞!¬£\─W\ΩE└Gï2â┤\▄\╠╞úá\Σê2\α\τ$0│¬\'í\┼FfZ2\Φ╘╖Pª.j%╓É\═\rï\┼å1e£É\αK½\├)¬\┌s\≡/ï\≈\╨\0ƒÖñg\\F\├4\╠!l╨ëè%\Θ╚¿¼ \╪j│(tσèÿâx9Kåí\╪*PYp╕/¼ü\µT¿F\╔1║67\ß.\Σ╣-#\ßùV\╧#,\≤┴[U\Z¢░9▓\rp4jU¡│RmÖ)¬\╚$!çs[R\αÜG\φG<░\≡╛\π╜\┼~_rè»\▐5j√f,╫íê\≤}æa;]«Ñ6\0\─pí\▌@▒èwÿ\∩ÿt\─\╔\Γ;°U|éqÿ\ΦÖLs\±╠¼û\'i\╤,\n\σüA`BK·àáJá\÷└«é\0╜1╕\╘\\L \╠WÄ«┴\╪\r\╩Az√&]=J╕0&\╚p	\╔╕\'r╩ªíO9ù░²L=\┬\rë\╠BΣ⌐èV╕c)I\πQü▒vë\╟HåQ@²H\╨L\≥àg╗\╒\─╞╜òéS\╨%5\╠]î\▀\≥@┐Æ	─ù\≈>í┼çÄóö-\δ\0î/;é&öå>ª\≡ºoåù½ª5½₧=Odiö├ªtzâ\Σá¿ïC▒⌐ëY9~├ÉF╪₧¡\ZF=\╘&XçÆZ╖E░ay\⌡r-\█R²τÆâe&}LÇ@QKömTÿàffID│KtlTW\n\≡mlfoPpF\∞..\▄\▄\╪C4╡WÖBT7W\Z]\α₧QÜ\Z\0╣╢üIc\▄\"2¿n=\╬\σ0ó`\╨\╬ë\ε7\┼\µàò¡ef\Γ(vb9┐½îÿÉ6$wîU\╥p\─{╛e\≤─¡\σ\╔¬d¢gÆû╢\╓\ΓìòU	\╟\┬+┴2H╣╣y╣ppE\n▌▒,r/ÿƒa\Θ5\φ½vEB²<èc¿ ╡c⌐½ÄoeQQ¿X╛á!╖UäÿQ|ìî₧\┘\±\0eÅs╕8ÿ┘╢\Γg\─\╞\Θ\├4\╠@n	Z▌░\≡öö\Ω¿åR*<\╓&┬ö¿Ä\⌡cb òU\╘l\Ω	\╤\≤<Z╛bÅ¿p[%\⌠]gY(öKxöyç┼è\≤HT╗\═\Γ\'ÿûä$Kô\╟.\╬vg\"Ö2\⌡D«º3°0K4┬é\█B(v\╫5\╙3ⁿA-╡»9\"sPTsü^µ╗çìⁿM4ê\┘*\r\τW╡âD╜nF\"\█U:e.\⌡-\σQî9G╢rå%║\╩\╠tòm#Z\╞▌î¼\╒ΩèüIM─¬Ä@\ε#9wí%> å^\ΓLV\≤ê∙,x\╤█ódéG4 \0RÇ(ñ■ÿ9\ßh⌐ÅÇkM3}à\▀ö.M¥\┬#D\Γ ½+ELXùYüW\≈N.0eú\Γ\Γⁿf╗\αA⌐│/╕9ƒ╣>\╟\"┌╜K?┴░\τ│\├K\'!Xï\╔Q~\ß▐«┤\0a\╫u/\╫\δS╘ª¿\╘SF,\\ò\Θ∙òp«\πb\"hù¡Æ\∩W.s\≡tA┴XU╦Çæ@ùPé\πk¡\Γ\"╢\±,u\r(\┬i└j=sH\ßM?q\÷ Mñ#╫ÿ\ΘÖçç\▄ug\Θù1√F╞£╗ò@%ª	EIp└\≈.\─öôT8â2|næ╪æ`r╢2Γ¬£)(]{î{`º\0²\─^Äna█╕\≡Åòn\rΣïí╣¢\▌\╦k~-^\φs \0░!]┴,M!\Φÿ7Xy∞ê▓─╛ü\█5▓\εX\╥\╩▓YE\┌:ºSNú	áÜ[>Ñå¬Ä\∩PiV\πb[¿dCQrÆ:îÅ¢àf└ÖaÇåç\▄,\'\╥<ê│P╗E-╝s¬\┬é\δ\\4░«b8\┌\τ∙Lxí\┬\'òrÄ+:?$]\∞·e»\\[O╠▒\π\≤\═bd@é^\≥ñ╣\╠╖\Ωy \r\█\±TU\┬82·fY₧\╨qP¬LZJQóû$y¿\─@wD\─\╠\Ω╖\≡\╪b0úa√ÿÿS£\Ω:?ö;/ó\σA5╒ë\Ω╣ⁿ&]√ä`ï\─╞¼\r▒úr\┼\╠îB*.4}\"ÿv\╦╫ÄEq\ΓTR\┼P!Qöqê4\αƒZ╩╕ï╟╝\─jæcï	│Jgå\╬!B\∞z⌐î\▌■Ñ┤╜\╩\╟+ ¬#J£BVû_an₧XüI∩╣ñn. \n\ΩÑe│\'\▄Zq8û\φÿ `╜ªëlC\r╟îSOëÅI@{╕T¢\╤)~\nG0╣\÷äÆ│r°«ê┤@[pº\╙F\ßBò¬\▄\nOà,\'▄╡ECª»⌐\ΩZ\Γ▒\≥î°30=ù▓:╒»\⌡0¼\µfj╢8^\═V%\πO\ß\Zgñ\Z\╪@▓&\δ\Θ b6\Γ,╕¢. ÿ\█U@nê\╨═ç,\╔²╢J│L░Q≤ÖæúQ,ç\╘D╪û\α\╪\n\φ*7àG\±Mg\Γà\∞â)£q╛!%\┌n1H°Ö╣ ªèèf\Γ#Q\╒\─l\├,;$6)\┌\╔\"¥1▒I\µ\0LiÿS\─6qL~\╪P½ó[│·A\µ╠⌐\n1\╟\╨D⌐|ïöGl8e hxG1X\═°è¬\┬\ßôJ\σ√ò▒r[·e¬4à└,A7@ \0rö2╣úⁿ├ä┴E\╫\╥\╟\εi\Ω\≈ÅIf╚╢$â╜║\≈*\┬`d9ü·X%C╛ªl[ü`▒┴[/+\▄\╔╞º\▄ü£d¢[-|u\nf▒1*╫å\0`\▀\╫∙àê½æ<^ 0PÇ∙	0ö@\n¡\ΓQ~\'âQjXq:\\╝\∩2╩¿2└¬»p╩ÅD\0\αàp\─b\╚8└%\φ╕îu\ZO\µá_BT\═SⁿJ\rúî¬%:╖â¿ë\⌡=+på┌í╣X\Σ`\ε6\Γ\\ó\╘┬¥sX]\≡┴Mq\┘EW\╞\╩u0\┼(\─up\╘FJ\σ╣\ZÄ╝\╠E¢6K\np¢ö8ëMlläÆ£xî[M\≤(▌ïÅ\╧^\ΓW\╙u)°w¬ëf1╬«/╕id\╧Yª√ÜL\╘Tò╗\µY¢<├╖ê5¿nU\├`\±+êòP\▄e8 ï\╬i u*£É(b\∩\α\╥w:î^%Wå╜J|xÇ╣E\πëiT╜\─It▒r\ε\rq\⌠F¥╩╜Jè\╞6\═L\╒@bjn─Ç°Åv+âè╦öëÑüâ▒√│\╤C»u£\rá\ZEª$▒\╨\├\αíb╦ºÿyHuê\÷ª=E▓)ⁿE^bu\▄╬»wP\┬\÷@s\┘\▄p%¡ ▒\╒\╘¡V\╒E▒\─░ÅH9j*\╠J@▄¿+ƒ╘¿S╕êK╞ëy,<@gÉ\ΓWML£@f┼î╗q\0½└J²╣\≈\ΓU\⌡j=Lè\▄\σYào<┐¿3\┬\Θê%lKj╗ë\⌡ûz312╜LÄ{âÜéÿNP├╕\╒;àg/p/ATErK0\'ë\0x&$¿[Xlç╕;W\r\╪²\"ì║ö\∞&Ç\µºì[áºæ\╘8Q\ßö]\╥L┤╜BÑ┴N▒ù\≤\─Oo\≤mò\\[\⌠C\ßOs5\µ\▌MÉ■!lYü9\∩{╖¬╡\╠%c7Rÿ+╝╫«╣ö	╗â{5\╟\ε_\ε╢J\╤\╬°ù8C\╠CéÉ\╥\0\'\ε\Z\Γ\r¬■σÜ▓\┘ô~%ì╗üΣÖìÿ\╠; ╠ê\≤\╥\π\Σ3\╠*#╬á7\Σ\█0ó╜\╦\╬╔Ä9/1c>¿êÑ╡q\0╛▓Ç¥╪æóÆÅá\Γ$╣\╪e┐«·\╦╡åPzZd√Kz8╢=#╕/)º3Syä╗J¬£Aa\±\εrc0Sp`ÿï·Ç\τ¿-KD╝TêiRjOï¬\≥╛&c⌐Å5&P£Å=S2°\Φ%L╠╣ù\╧Iùrⁿ╘╖ç1╗╠╖╣`¥.¡\⌠\±-)W\─6\╞*Uí.\Φ<\╘H¢*·2ä¼\δ╕V`åáöóªc$VCGPkUcs\╘d\═~#ë@\"l\┘#Æ\Z╧½ÆÖ@\≤┴y1\r\∩·ë9\ΩZoÖ«m-¬║\ε)qEYWQ\═\╤^&¢äìZ,C5─┤hûªa\╨·T½A\┘└í▓VZ7l2╝\αD║└#\╘QF\╞0\╞Es\σƒ\▄a\╬j╣Æb\┘9─║▓ºd┬░#\≡\Z  9Ç\\+óT\╙$5¿rH╘╢\πX}\╦┴qUb6\±^b╕ƒ\δ┴\"QÄ\n\╓\⌠@kâlx4\r\╙\≈╖\εç∙fg\▌\≈2\▀∞ûò¢▄╛½\≥@Ü\▐e\≤\r▒\╨ \0}√\ε\┘∙íæbT\n▒ëí«£q3\Φ\Σaàë\Σ.U)₧⌐\"l}2\╥\╦\±.d¬²\╠\├\╘8ñOHJñ\╥7¿èZ\Z\µ\n░\\\╠\±\0(\╧pC\rCM$~\∞M\rT╜\ε]║ö&│ÿ3D=\▄aàò\╙\n╣»0LB\0\n┼ê%\╚\Ωÿ^Ñ#g┤\≥t°ë\\░¡r\█Wú\╘I╣U*m\Γí.d\"åò└\┼Eì`ö8╖╕^a)u\nm\±\█t\╫5\┘V8xe1p\╞%¬;üⁿL\╓oP░gá°|y^\╥\▐\╤Qÿ[Ö/ù\╨\╠└┤\╠4\┌xë\▀9^í░)Y\┼.\Θ\Ωe \0	┐Å⌐\σ?Qf\Θ\±-²R·\≡f¥╖6s+%\╧.*fï\ε╪é.\┘}!\╥b\"oZùmo=J1\╘X}MÄqcV╦⌐\Z%╜»ÿÿ7q*½sP3\±E;ûÜ\╠püÆR$F\╩\╘j31o\ßâ>&\▄2\├cV~/\⌡2Ñq2;úê\ε\r\≡¿n\╩-ÖÉ\Γ/n\µ╖4\Σ\╙\╧\┌%ïûf\≥ö¿╕UD\Ω\╪+Ré.mUJ─áús0∞òìbP.X\╘J\ΩÄYFƒK▄╛│║▒¿\±<KÜ⌐öC\Γe╖\⌡éu\0á\⌠°oe\r▒ª\τÑ{!ïj╡|Qÿï\τ{É\╚└▀╕?║\0\╩?0ç\▄zèçY=@_PY\╞.¢GîÖ╢%º°Ñ,\▄fcw ╠▒cW¢⌐BìÜHVæ&d(=.\σ3JⁿEKTxò8à4\Σ╘½qó\Γ\\1/ó+\▌└\▌F▀ÿ\╫\╔1\╨e╖Nc\∞~\"b8É\µtn\≡\─\r,í\≤Rä╕ÿîqZéZ«íuU\τ┤`o\n\∞î\"ùS\σèYj+txÄ\σâ16.\∞b#S¿\\ª\ε╕╜ª3)¥\±1@B\╙\0\╘\ΘDÇí\█	\∞Ü└Q\╤8\╟├ï\╟°K\⌠\╩/\╔Q\∩n¥úÆ\╞2\┘Çìm\╤<}ⁿaHn;kp╗F%ºÿφîûÑ\╩Tà\├JBú\╦\┬[\╥[\├\≤,c\⌡¥\╞VY¿X\⌡Y\╟g\µq_d»ë\╤╛╩æ\≡E\"19Üëh\╧1└m\φ\╘9.P\╠Dóus),\╪\\1-4\≤	F¿╣│öVe4NYu!C\─º¿@2Öòh\─╞îEÿ½	ñYb%ì#\räV	₧\⌠\⌡«I╣A\φ+&*ü25\╠\r`D┴W2\┬p\═yeWû\≡T-»2ùT╣a\÷\\»\╠σå╡8é\ΘXæ\╞\≥½\╘fhüîK░+D¿GÅëTP\╤\≤k8ïïòs0╡º¿\ΓP!°ÖOnTÅ\▀0\▀\╟)╛ª1-╔ÅY_dEà]\Θç`ÄYb░@-cé\µ\τKÿ\Γ╖▄ú4}▓▄ƒ╝<Ü\≤°\┘e\╟!■ô\±y1<ê\╞-┼úâ½\├p%\┬|ºÑqKçlC¿╤Çé> 4M2│B\±äk¼ú─Ñ8\Γ8╤ê;¼\⌡ñ&F,U\╦\\3%n]\Zö┤╟ÿ\╫ói⌐Cg\╘\╠┴ëdª▒┴\Γoél╖G \▐%í	J]	│Xá\╬2\┬UDxïh\─\╠╔¿ä»\╘\≤\nÿRV`\ΓT\╦.9É\▄\τ \0#\∩|\ßpìô\0\╬Oî \0╣A½.é/\αrñGÖÿD⌐Q\┬\r\▌O\µóB*ç-\─╘î\⌡\σ■óWU\0\ε5Kî`\┌U\Θçj╕ïLaèU/\─SY·û╢┐\─Jíg\╦d2ä\⌠D\┘3ù\⌠¿R■`7Å\╤\╟\┌2\╨Yÿü5▒\┘Y.zàf¬?╣!\σúà\µY-\─ncIo\ΩYO=ß╡â0\αÇ*ÿ╧╡òuè₧aèE\╘AqW5ä5bfU\µ\▄╦▓\≈í\Γ*┤▄¡\─<\"\ΓR·ö╝áL┤\φGqP:ù╖Ràä\Ω$R\Z%oÿ\╦·j?h\▄\╔╤êYQ\n\⌡zL▓ëÆU\∞/├¿eëΦÅ│-s░HF╒▓Wìê\⌠ü\╤Xⁿ⌐u+:Ç\╨A|ÿu\≡\╬zò#(T\µ₧*\Z╝K\π┬¿\╫\n\Z\≤,/~%╖8ïhû▓Ñª%ú\╠fg\▄(n\rÑùP5í·ÇVêL╟îO?8\µ9▒╢<Eï`\╤\εN\Z·ëá`\┬e\▐%²░`äHúJX╗Xú\r@!@\Z\µ!à\≤$ûDö2EYj\╙\─╚ÿ¡└î\╔	ëLe\╙DzçäLûYJn╟ÿR8åp=T²o°¢8╣r¢\Γ:	E√`%╕╕■Nä)ΘÖ«\α\╥¥└0°·E╛Ñ2^å6└\ß,ì5C.n╜Åè\═%;TBg«\╠\n√\╪`û\├ⁿ$uÄUⁿ \0ëg°#\≤\╔pIps\∩h¿\┼eu¿tVxà╠û\≡ⁿ\╦\╚▄▒\αük╘╖Å\┘+\≤	@\╥\\\∞·ö\τyjó╦┤ù\Γ[\─ⁿJ}ù∞ÜúÿH$#Iûí₧\╧ÑÿîªÉ£xì╞ëDh\█┴î\⌡\0\π\▄M2A╝\═(┴\Θ\╔\n\╥<p\τF2╟¬ìA0A9ù║cû}╛f\Ωo\µiû╡√û-\αàêä\α\╙\╬\σ\┌9òAèî(,\Ωg>ff	à╛ú\⌡a·!▄âzåUÿë6\╧\Γà\╞v┴\εèéqT\┼\ΩuüτàîaÿH┐╣ê└\╒\÷\╘╩üH┐ñ║ⁿ\⌡\≈\⌡Jé,0\╞aX^»k?J\╟\Γ^A[ù2Ñ2╕j\ßïQu\╘\ZÇ▓░JA½¢hüy\─N\φ\εd \0!3■\Θp╡\╠¿\█w*\▄■HU\╫\ΩA/_\╠\⌠s■\╠\╟\≤,l\╟,╜éo^#▓\πu)\╦\╩V\─B┐u.\Γ▐ó\εÑtb\≡l\φ¥k\╘x\0[îº0\r\Ω/$rñÆ\÷r=\"1*b3¡Öí.\╤ó+éY\╤pN\"\≡\µS\▀,╟ó*Gé╩ù\╦q\╔t└┴╖MYòg\╘L¬ Xå\╧\┬@║ê\0╡└L═ûI╢{Tôëón\≥\Ω)T¡/\╘U1òªYv\Σ\≈)\╬\n\╦\Z\0Ößåê,:c\Γ\±\┌\ZƒY\Γ(┴S\±5ìú\≥.ûªeA\╤\0]:ä*\τ▄ñ▄åbÄ&à¿}▓·\╬∙û\╦]│\ε_╣h\█æà₧ìu\≡ûk\±\'ò∙ç \0T)■\ΘYCçHH:O,rñ╝c┐\╩\╚┴oê\╒\Φ╦Æs\0\▀╘╝└p║ò\╩#êl\╨@íkÆ=\φ\─a\∩╝╝p\┬\⌠>\πnü\├0\π\╤:\╚\─IÆ\±qgQUo\"+8åº\╪\╠\═^ZZ√Ö	o9J╣\")╕\╘)\0\╠\╟{S1BçD*Φ«ÑTM@(a¼|dÖⁿ#î\▐%ü\∩\╘Ä\╪\╨\Σà)Sëbⁿ\εb\α\╔èúo;!5V]_rÑ\≈8a\┬^L»\▄\0è	°\Γxn`ë\┼·àìⁿ√|\π^┬╖1óéÑ╖[7\╓q\r▌¢^áf\╫\ns\nòs?\╙─ïçÉ└]\▌vç·(\≡	\Ω?\Γ1v\╚\█X°û\0V\⌡*ò▄éZ½└\≤goRÑI\⌡%PV\╥z\╥må\─Qq╞æa╘║X°u«c\█\n└\╧@ï╕\╠v\╟(ò6\ßûZ\±\ΓWè6Ká\⌡)d;äM)\╪y\≈_\∩\╘yA««ëm6:ö(çHU\Φ╣Q\ßâ\╤gÄ&\0\τ\±)û■\α\n\╬`Q#╖Q6¢\Σ\┬U\Γ50E╜b[\─3°]ä░\Θ9@░ b\εZª^éEw;äâ⌐▓X>!çZ\≤¡Ll\ró┤╟üOD\Φ\├\Θ\r7/·£┼ó\█\Σàs-G\±#Öj{╦ê\╪P\\2\╦U5ú3ÿD\Ω>&\╟l9üx¢▒·ò\⌠DIÑ\┼δÿñ\─\╘[\µé\\\δ7|MóIh┤ìR\╔J▐úñ\╒j╪║:!4½Ds¼\εn`\≈¿^°ì\Z4║\─\▌&\╠\┼`║+O07\ΩsíÅhki┬£#\┌\÷\╤╕┤le\╒ⁿ╢%}\φf╗Ç0gÑ2`ªo6┴3.H\╞ZÇ└\▐\"┤ú:╣ô│é«U\⌡j6xùm,	4Ö«\Γ\ΣE,\▌s\▄\"PÖè\Γ\Z<╪ö\┬yCMB\╫\⌡Iói░^«óM\╧.\╚.¢)\╒>Ñ@╖\0à\╨S\╠6c.æ$\┘\╙Skdô╢2\Ω8ò⌐ƒAmí\╦C\'çh*ÑBxR\┌\╦\┘P\╥╪╗Gó╩╢)E<J╢\╩\▐*Ñ\╚√òÿ╞É\≤ì~9*á$²ëq-ï!9▒.<ê7\0R₧0\∞eÜ\╞_¬R╕4\α!!¿\≤è\┌ió[2\σe\ΦC;?╚ªïYä\\Ç\≤+J\Ω\\┌╛êg╕p\╤=┼¥=\▄q\▌Ej░┴\n>┴\Γ83╩╕₧\┌BñLHé\\QÉ\┼F\╔upK\Ω\─H\▌byE\⌡\┬\φòC\─Jp⌐émU╣ù	╡Zï\\¼\╩\╤ÿÿ\▀\Ω┌ûí/╣M└\neé┤\Θs\∞└âÆ╕\Γb▒\0\⌠å6ú\┬~\┬\⌠B┤\n\╫Jëí╜\╠\∞K0ó\φ\╦\r=Ñ5qh╣E\─GäJÖª%\"ê²Jb\ne│▐ÿZÜ\═02\δy½\ΓVmùq@bhKô\ΓóT╗·à(B_)_\▌\╦\▄P\±\≡k+;JºÖ\δaÑaÑ\Z·ª\n╜1\Φ¬\\ y&C\÷┴\Θ>\σ\∞}┴\▀?╕╧╡0╛%\≈ƒ\µ#╪¼S\▄Péûè║ÿ\Φ\╥\∩R»	╕ºPs#ìGE\╟à1²Æò╬Ç¿ö\╘J¢\⌡\rá\▌	»\┘é\╩fâ┤╠ê\nq─½ÿ«úMàJ[\╠√}┴\═\εÑ\±\rQ31\r¿æSÿR@╕ì╕\┼P|\┼V%ò/d&{òäO0ZKÑ#\≥A\╪ibåf╨Å=OXg\Σ*ù\'óÿ\Σû┼ÉE$╢\≤sKçîⁿx\\!\τ=5H\0QsJLîcÿ\▌8┐╘╝Å;⌐Ü°N\ΓaBëöao┬âY\╧\█0hY½▒\µ<«\╨?\╩2£F\01ë»d\╨a\┬S`\α\α!jH\Σ}H&\'í1\╠^$\╟om¢\Φ£No1┴F/\─╥╕t\┘	è¿S\╘fííd═│XaR\╧O║\╦zXchp\ε\ΩAb¬\0Q°¢åRÑAZJ│\╠*Y9BCd\╔°pFñbçQR°üY╓ä¼tG£]bqT░/L╜\0áßü¬\⌡\τRº\╠_Qn\┼U\┬#V`\α`¼\ΩS╡\Zl\▄\Z╢»┴\█2╪íT²J3N\╨X╠¼\╧ì▒%¡\"H`Umò\±p\├\╫0\0+\φehû\┼\─\╟ⁿK_\±₧Å\╫╟áMî\\YX,[é\Z\÷£╞«j\≡\╧jò⌐}êê\⌠á\╧\╪!àâ\'(!-°[▒Q\╤`∙BXÜ]ï^â\╠\┌\┬(║w2\═B\█\├WY■Ñ2^\ß1┴z\Γ8\≈r\"a\╚¡\ΓÇu\┬┴n2\╓\▄\0/e@\╔{¿\⌠╝`\█\05A\ΩQ\±\┬z£\╦┴)h\Γòëæ╕>\ΘB\µ5\ΩÑ\╤F╡*ÑXÜJY6%T\±\n\Ωé╤½\├\─8C\╠1ⁿ╡ \≡úm9\αB\Z-S⌐N\εè\╓w3>KcDóSYD\Γ$╖D┐\╥áR\≤√üÇ╪É╡AY8=╩ân;òY▐ô\±\±gq\╩A°JH\█#ûeA(\0q6\τê\╨·#k*4\┼Cv*ZYë0I;\╨oÿ;f\0ënYzàÆ│dr╛èëE\\ª=E╝X\Φü-╘ª0∙ö\▀╤¥E\╚la\Ω%lj₧\σû\├z\⌡╣\≡1/½nu\╧ \0A╛\ΘW⌐èú\⌡VQkⁿK\≥GÑ0\ZSè%¿ª²D\Φ,\0=éôê│\Γq\∞£éóê\╘róP\Z\σüd\"U\╘S*\Γ\'q\≡:ù\╬c\rÖ@╣ñúë¿\ε+âÿM·7\r3╢Ña\ZZ\'╢m|ù¿~éS\ΓP\0>æi)\┬B]╡$$)Å╕\█P9╢;\╓oÇ;{∙\╠\╘$4ï0∞ä┤c7\rⁿACg(P▓\≤\róûÉ\─jïhç\▐\╞\╧R\▐ e\─Gÿ\├Rô\ßSáE┴[.P\ßwù╕]Ä\Zò√M-╜░ç¥\n}çÄ╘╝D/£\≥\╩%├î\╘¿ye\█\'╡■b[ë\╤\Z.ü╚£ÄGåC∙V\╦VW¿\÷\n⌐F\╨zï4\╧\0öÖ?O\≡\┼dÿ╕H*=@û\ΓZUrTr\0Åh¿<Gÿó%∞ü│╜\╤\▌┴Ü\Ωw\nQæ¿A.\ßí)\╙3Ix°:î`┬½\─╢-\╦ Y\╬@\╩g\╤KænºÄrírT\┼yù\≥6¼\╫RäF ½\≈oⁿ\┌LT²Gj\╞9ÿ`%Oº¿¬\╠3B√₧$\0G\≤\█\╟R\Θ⌐AU0\Ω4\Γ?▒\σö\≡`L\╤\≈\rⁿûqù\╥ \0P6\╒°4S\±:Å½*$╬á+xpo\±Q╡½\≤┌╝┐ü\ZbHçV\╩t\∩êXúì▓GçóÑ\┌\╟∙ü \0£ù1?\╠)₧ê\≈√d┤+Z╕<ÿñ£H║ÜÖè«93ëT\╦0\ßâs*DK\δåXc\─1r┴b¢VIDúé\\1░r\┼%8\Θ\n\╨v\╠{│\ßH▒ïqâ¢êe\ε \0!┐\Z┤\═S¢Y*½$ÿoÖqj¢B\n!\≥┬î|Yuy\Ω\"▒1+íç\τÖ╕\╠┌î▓\ΓeÄ3\Z¡\╦\Ω\ΦEDTH\∩è-FÇ6\╩U]\╬\α\╘B\▐H\▌\┬KJ\╪)°╜º└\µ4\∩\r■\σ\⌡\Ωƒ\▄\┼@WPíû:ü1°Ñ\'²ç╕ñ@> \0\µ\┬9\╟ßƒñ4\0<ÉÇ\Φ┴²iß╛ëEi°ë╠ƒq╗\'\╞e\∞É\╠■IñT\Ω\╨d¿\π\─▐ôZVf\±¢g\─87D!%R┬ª£\╠Nbó\πv\ε<Æ\α\nbC¿\ni\∩╕R\╪\εb`└3°@3v\≈3ëxî]═╛╝Jöÿc\"ó\⌠╗MáBXl\╩\'lâM\αaU¿°\┌6\né\▄\┬`\÷~aXí\no\▄\╠Zôiù\╟\÷eæ_₧æëón\α└╣ü\0jj½bs.Q\┬bá%\═A!àúûYP	ñQéó╨Ç\┬E▓$u╖\±Yv┐P\╘Ih\"<+\≤;I\Z.╗:[Vn* pG\╨%-⌐:¿^zB╖>δåÉ╟ÿO\╩e\╦√L\╬_k.;0ÿ[\α0@:öhⁿ\┘Q5\≤ñ/UrHÆÇ\r\╘~\÷┴d\▀Kn\rC\╠[V\µô\╧P\Ωt\▀Pq\╨\╦\Zôê¢<bXù\Z\─├½\├4\▐Kî4ÉZ\\án`MAwe%\─%:é\τ\⌡╢DFGp\nÉïp▒L╖╝îú·∙fd╥«ªBèÿ\⌡Hóf╪Ä¢j\─\εÑ|\┼\╠\╤aC\n°ê▒Æ[Z\Ωu²&2▒pò$\δs¬ÿ\╒O\0T∙6\\\╩\╫Hö┴»üNq[ƒ\\%o\Σ\Ω7û>\ß\"│└┐¿lÇ\≡ªz\'┬░\α»<Æûz\╞Y\├uÖ░kR╜░·«╤öl\±\0n\Z\≡₧?\┌7UΩÆ£Te\├°Æ░V\⌠¿,Æ\─\n,p*e╝ \╦\┼@\τ)ä\⌠ú\╞╤ó:\Γ:é \Γ9E╥àë\╓\τÖHd#J\├\─I\0\╫0%ü	Ö\ΓQ¥\±4\╞&\═4\╠1ÖE╝ELñC▓\φ\─\╨Dú░«║ìåp\┬ÉpA\≈D>tC)╢\±pá\≈<\╬∙_ÉªÅæ\┼Gv╡\▀V8\ε8g\α│\Ω0▒úä\Z	|┤é\\8w)Æk\▐g\σ⌐G\±*Ç\Ω!\╨pAñN»╢* \0└┬ó(╝L#JH[°¬e>\╙.\≈0\ΓFè\╞σåä½5S\',\Γ<\në\├Rû(\▌\\ ù\─?B¿¿!\⌡K\φ;KÑ┼║M▓en]É°ev	\┬\▄B\▄<0d\╩]\╦Xq\≡\Γ+èû\≤\─└\╬QAKàî▀àQ∙`\▐%u\█~Ç¿V/\─\n\ßö\≡╕,HUCëf\τ$\≥\┘r\ε\nbûKàwfB_eJ\┘Wƒ1ë\▐\┬W╜º═îW└#\╪\\▒G\├z2\┘u,_2òdhªÖ=0¢\█h»Äd\Γè\µZ╡.\═T│0Ñº \04\±\r▒<\δ\⌡▒»0W▒ò¬┤Ev\├Có6°Kÿ5\ε\0e:ö╢_Q\'°	\▌}E9\Γ	\╧\÷T\α┐döí<2\Θ\Ωfà*╘Ñ² \0C(\ß\÷J\▄~Téÿ■\╪)ay	9\╩\╔\τ\÷¢\"<\Σ]\ΦqⁿK3\╬BnÄy\"&çp,âÿRR\nï\╧\Σú╠╡gªbJ Ü╤è╕\╠D^UP%à.\╬vp░%4½\Ω\≈╖⌐¼uD│8Å-G\φ■áïIñ\±Æ\σ\┼\╥A▓\σ∙\Ω$,\α?hQa;\Γ)\n\≤4\ε~¢T╣w3L╗òåS*\τëv\\╗â\µfp¥\⌡ês\╦¿v{ä¥m\πS;°lmUyK.\π\ΘÅ\├Γùùñ║»\⌠òâ\≥C\⌡Ñ¼1\╘╨¿-/\'pO\┼\Z\÷C▌╛q■╗9oAr¥╦┤C²D\rτñ╝¬Äü²KæÄ\nç\'\╙2╧ò¬·J▀╡\╦\≥₧\╓\╩`,*\'⌐\╙Å╢8C\≥Bmè&Eâë`\─ΣÉ░Lî¿\├┴ÿ╖uR\≤Ç\┬]YaÜìw\─╔░ì\πlKhT\╓@üM3ú\α┴ÿ\ε▓\\\ΘüòüA\φW,\├UÇ%▓Eu%dòUsu*ó0\\pÅä╣xï|Kùqe\┼\ΓY£E\Ω\\\╚N!àAå3⌐°ñÅ(\▀~W.\Φô(gBK\Γó│\≡Ücq₧`ü\⌠ⁿ5D░T╛YsÅ\╘9⌐(\σz;\╠\Γ\╦2\╒■íÜ\µÅv[P\r#╕}\▀\εílà\╩K/┤╞É⌐GS@\0khDSÖ╙üd■e=J\Φå\÷\⌡Q1\▌╙ÿ¿JL\┘S\"\╞íW\╘c\─╢e┤,u/ÉúmT┴ñLÑVó▓FXQ2àBLGP\≥è╡mâ╖ê╥çy╣ö╣╕aEJK\αéâÆ[√k:ùgU1\τ\µ\█°*T.\\Yr\≤-5:ïÿ\δ\Γ\Ωv■>\≈JKù\±Pf;\─p\0·£░ï\╨√bWuaH°+XÅ)\ΦàZS\∩¡U╡Ia\├X╗ù\╦,\├I]8\═w%ⁿ<97á■▓╛ÉBN&ì;┼ë\≤╝ \0íô\φ%Iz!à#╗ZAA\φ+ ·K\ΓV\'#2!B;¿¬î╣á#f\┬.\┌%»çε¿ìÜⁿL\╘Qñ⌐w\n\█°å&Pæ\σeå,\╔\≥\╩\n\┬\ΦÇcÄ\πP╫íu(|ÆÆ/3]K\⌠,T│╕ë2_r\σ\╦>R\τ\Θ,¡\╟,j2\╪\⌡*^s\n╕\⌡Q╞╛└\┼\╠\┬ⁿ^fu.cä\≡TAP╗\╠╔Ü}╞¡ƒqo\µP\█\Θé\ΓUp_\∞ê╣\ΩímÇÇ\Φ\εY\╩·êª\╧▄╖\'Çb@│\Θë2gp┤äc■ºÖpâ36Uw¿╔ò;	L║GÜ\'\≈d(/\≥ \0ñ½╫ƒûh╛\╬┴%`e\▄\Ω\ΘGê)\▐#é].\Z▒Gr╢[%ü\≤¿\Ω\≈dK)\▄\∩2ê¡QÿZ3║äY\╨a\Φïƒ\─{A╔çhYnU▄éê£e\π¿5\┬\┘a║\α╘êpæïe╝Æ\±\▄YtEùª\Γ\╟┴¿░\╬e\Γ_\╞\π⌐q~5\≡╡)C╙┤┘┤zé\┘:ö$/AA\≈\╠>\╟7╜lWñ\÷H└·\"v\∩°\Ω4\╤w┴■óm\⌡í·Æ└ú\╚─ìú\┌_.\╩T(Z\Φ;L\Z«]J5\\n¥E╢┤1ráæº\Φ\Ω-┴ÖH\Γ\π=C!\╞0╣!q¿╙ÖÉ7s0æ\\G_1q\r<\╒5+«#\Γ*Lînè*\Θ^\┘`$UM₧nóvåÄQ8fn\0\≈r\┼W\▄t\─╪ô╕=M▐ì\≤┤òV\ε._ÖxâDñ╗Ä\"\▄\▄\╤ÅÖuEÅ|\╦∙u1S⌐\╠k\α\0E\Φ\ΩAb1o#(\σ\α:√èoâ\≡Dd▌¼4«9mQ]\τ\≥üIªÄ\φ9aí┤d¬¿«7v╜°ëMó╘ª¢\╔\═E\φm)\Γ/\Σ@╝¥\╞\εëgUZ&\nÉyR╚Ç\α²ÖbÇ9▓R\╘n\σcR╛5=á╢û\0\≥\≡╗>Ñ\─-┘ê¡`ÿ\≤\0\╤\─2à╛á.░qâê\α\╤\╠v\╨\÷\╞0qu\0\▀B\α╤Öb\╪Dû╖\αÇU\╤\╘IQB\▀Sö\╙\⌠▓ªud\r╝╛π₧êò\\0\Σ╜1@T┤Sâ\ßï-ùù°╕2\Γ\╦─╗ö\'\├ï\±<└┘ÖF8*\\\≤┴\r░^S┬í,,\Γ9\Γ3ÆD&<\σN\╧P■Yú\╩5c`\╙\φ\╨?╕*\α\┘\╙\┼DÜê\╦:\▄)\─^^\µ	üGEizè⌐åéçYQ\±Ü■\π▓\⌠G	M@\Γ¿6\∞\╦\├`{M;(╗°\⌠Ñ¢ûlV4\─(╡\▐╡[\╠h\▌\╤\╠\Z\╦n\╚\╪\ΩpÆ\δhÉ\τk\ε-@\─]\⌡Eh\Θ1m48û\n\µ\∞²M\ß┌▓A~\╘b║»\ε\╚\0&\▀\±┬£ⁿ\┼\π\╠\Z▄┐ï°⌐q²\╞q \0àùD\Z\╠_¿\π\φÜù\╦k\─√~|+ëFv£\┬R║ÜbT½\╘iqph<╢d¢Ñ■îL+6Æ\εKGⁿ\µ\\▓\'Fn\α\╞\╓\╫\┌,\≤è\▐²K░QAT\≤2ó\╬░╥ò)é║æ\Γ\τÿ]∙RóA\\\≈(1V\╚(;ö\▌J²▒çùÿ\╬\Σ║w\╦B(4Æ\├@\ΣÅp\πmG2\±W\▄d░èe#Jr\╦ul\Ω-║:Ç\πU/\σ4ÿOMëäw┐¿Ç\╤╒┤?pIJr\┌@\µì8s*╞úëB\Z\ßÿW\┌UCs─⌐S#\'qÿùìF┌ì\╤.u\≡ñ\0V^\┬6Vå╛u\n	-ëÇPmû\╫GéL@\"\r\nV>|Ä\±(\╙\ΓÅîJÄÑVb\─\─	)Xvw$äi∙<J8\εîp\╟p\╓ │ö;m\µ£\╥uëy\ß┬½DÑëL/+Dä-ⁿb9\Ω╕x=KÅ!¢\rMM┴okΦ₧ïòS\╨	╔á\▄\Ωxö8`╝AΣé▒\─╫Å\╘)`£N%u─óU\▐\εV\"xò▄¿8ë9ëü*u\σ│\05Q≤ëàñí*ôUyòè╫êb_╕U>\"	╓ÑÉC\∞\┌■\"ö	_°╝jY░è\µPh⌐d║ùÖ¢î8g▓#\πåm\╩\╩\Θñ%. >\≡niz²\┼\αQ\Ω:ÿ»ä\╤·âZ9\0\▄)RôRº2.Aê+<╜└┤\0ZXupºx¬ä\Zàtûol\∞\φçe\╚<\╠·╥ïÿîd\╞!)\╞jtBC\╒\⌠E\╨\╨\Γ _lt\┼àû┴e|å\ΩñÜ▒,Kù\╠Ri¥\╩\─╠┐îqq\0╝\─Tîì3¥ä╝yâæ╛└ç\⌠FP7äuÖ\╧{ ░<\╧\≈R:[Ç\╤\≈i\π√\─X¬ß▒ƒ╗+æ2Ü\┼Fº2\µ\╪∙òÿ╕å7/8.\"eA\┌A╛fáK¿c\σ\0.ä\"█┤√\'º\┼\├p\Φ┤1e╗à1\╘[\'╛\'─║L\╠9╣ÿ6\╨;¼GV\╪\σ╢Q╜]\Γbjé╫£<£â\"╖\╠)⌐üCå3\⌡j-\≈+\÷F\εQ5^\╟D&D2\┼┴ú\╪\φ╓úmƒp\Σ╣\≤Zc\\1¬\▐eX\╩\╩┌╝┼êAGÖV#¿┴₧`K.YlMóX╧╜fóX╝\═╣T£BUÖ{[&}\⌡\µ^Hƒÿ)╕EE\0°\╧°ú\ΣOíù│\Θ·`\næââ\≈ê\≡ÿ£b,ZOå¢`}\≡Gd\╘.I╗\╒n⌐PK╢eSA<5\╓Tö┌»Å18ú6UA?\Z\n\┬|ÇâP_@2■\╚Z \┼°w╡¿eï\╔rYX`à+\\\▀\⌠ùë]D\σón\'yäÇm\≤╣░1\╠d⌐ê_1ä\╧i\╩A>\Z∙ö\÷â,\┌8«\r\\\▌\σ╜f\αz[ìJ▒é!/ï\⌡\≡\┌Z\ß3D╘╕\Ω_Slrê`Ekq\┌Q\╓jU║ \0RÆLûSfaÜòºYçâê┤ª¿ä\Γ■\".\╦\Θbl┤æ║î\╩lnb\"E¼Ab3▄£Q╡ƒ\αì¬╗r?$J,┴h&mL=,#[╖êu\τçéä\┬\δü┴]obA╢╔òvt:xÇ6û\█\╦(O⌐\ßï\▀\▄+2└/\αù\╘+┴UX°\ΩÜ\'5\╬\∩\ß5┐ï«\'2▒ë]D\Γ\Z-¥$Ñäé\α¿└\═ \0\ε#ë\Z¢\Θa1░║@2Éé0\╙Pì\∞\Γu{╝╩⌐▓\φ\Ω\≤aÉ\±╢\nCU$\┬:ò@a\▄Tyò\╥2\π9eÆ,\▀(╣Ä(\┬8╘╕D\╠\µ>&│a\0MK£h\Γ:1╪│nêU\╬\µ\╓:£%\╙b\ΘÄRÖæ\α\┼8\├	\≈3.q9â\┘\0`bí,êü?._3∙ú°K┐ûⁿKnôåÇ.D5%Ñën8\±ïq\╘\Γæ[_êH╨¼àT╕\εU¥\╘|\┼\αÿ}`º,\┬.Q\≡╓┤~\⌡╖°Å╢┐)ƒ²XƒJ\ΓN\Γ\─\µm9îAÄ8ì\±+╢\"╬Ñ5\┼xàåI\┘	│%w(\σOs;ç\▄Öh<\0U\r?\╘/:\⌡+*0ñwó%░]╡r\≈°─╡6\╘\α`\Φÿ ô1n70½ìî\╬á/╠¬₧ú\≡æ╛\"»so0@ôa┴\▄=\Φ(tC\≥\─û■\\=▓à\α¢ZJ\Ωj8gP%ALÆ\∞8e3F▒ä\╔jc\├w(6Å¿è\Θ\╔*\▀d5p\⌡3L>\α▐ô\ΩR=p%,╗è\╠▒\╤\αê&î&-¥1!a=0\Γ`5~\"lX¥▒\±}⌐ÄE7n å╗\Γ.]K»\╘\rÉ┐Ñ@╣X8r¥íÜ\"\▄─¬c╣»Äaû!\⌠òìG▄£\ZÇ╣u■a£╝\σd¼\≈(ƒ\╔\ε:ê▓\⌡\≡\╦\╚GIRäF[y\┼\εfnΣÿáVf/·Ç\εiå:1╕▓\Γ\0║ë\Γjiò\≡┤|α¿«L	å\'4½ⁿƒP8°x\Γá\±3aòdY!j\ß9K\"\Z\╘\ZB■\0u(/.\⌠▓Vê$>Æ\r╪òuwêëf¥t\╩Çö¼\═\─|7\ßQT¡6\╓3Xp`½╕X\ß╠¼f\▐mâ[ªÿZÖ;âä\Φ\"3Vs \0ô8å\ß<¡ï\Ω\\⌐¿\Γ8üQ┴Åè╕\═\╠@háöd£òÅP^o\╬Qò`òδ╖ó4Z■V\0°¥5\±\╪G6!êK|M\∩£]\≡\╩VL$\αÇBvÿNHqÿñëq\≤0Ä▒\╥j¿\┬\╠\╫▐áxPPtKÉ\▄s\\\≡\Φ:╛┐Ö\⌠\ßüc\─LF{öfÜL\╫\╟0⌐6╣0,aîBÄa╢R╕N└dR\δQP▐åFúR0\╩KOUT\╙w╕j╙▒\─`«\╚\πb\∩⌐H)>#\┘SngOÇ\ßóés\╞m\╙\ε3X8a░\≥■#áw╣SVGòd¼K!╓╡\╨K \0\±&ö~ÿ░z#└\╫\╓\ß╣úëG\φì-f{\╤.T\▐\ß■░\─Nëzâ4▓▐₧IúVy&æB\⌠\π▓<Næ.\╪\╞ ╧ë^14Je9à\÷\αZFç\─: D\≡U\Z╕e¼|^\'╦ÿ.)òDÿ¬R\┌Jf\┬T▒\\A₧ECê\Θ\≡\╥/3\≡Y#\╞\ΓÇ\σàGÿ?Æm\┘1-\╙\ß(EóiÜ:e╨▒\▄@ç─▒\╠*dö+ƒCw5	h░╢	\╩\0Ñ% \0⌐rë╜x\Σï\τg\Ω*M▒0\ε\α\µ/º\Z\"ù⌐\═&ò\╔\╘bM]&^Rî#cÖl₧`°glx°\╙(\Ω:çÅsîfæ\╓\╩ëñ┐1*W3fúûmÿ┘û╣q╕\▌M\ß╛J)╝=D\Z\╔bDCt\\\µb╗uÅîZLGL╕\Σf+#.óUC║T\δ\ß°\µbéá^╧û 2B¬\╫c\0Ns\δ\⌡\n¼0-ºzc¿ó\≤R▓+DÿïPB\┘\╫q$J\φ*ô\╦\\Æè4l\╘\0]L\╬\█╟⌐uw=æ3╣RùDæ¥4á!ÆU╢\ΦÄ╫Ç \µU¡╦æ.P\▄5SöC£ⁿ~ñBè]C\╬B\╓°ÖÆE.H/¿W5	k\Ω)6î[¿cÆU\".%Wïå∙Üó┴r╣Xx\Φ\▀Sº▄ñ\┬\╤\╫k\'╢V$¿∙Ü°¼LzY√	\─L\┼l┬áK\'?├┤╗J¥¬\Ω	çR\Ω=ER\÷Åïj\╪P2¥┴ü╛°cm│\─D(\"ûö¿iûÿ\Ω¥KÇ=4Z\╩#Æ·Çs¼æN╢\≤\Γ!oXI:Ä\τ╗\α⌐håæï╦¿t9\⌠éwZ\╘\r╗îsC\─(yÇ7YòDs\±*\╔D░₧bπê¿ù*ƒ%J▓└m\r\╞\Θ7\╒a:╡p\╬`Y╛`\σ½P\├$]\τ	Å£ô0i\╪\╞v│}\├X\εX¼zä\µé\"\\ÑQ\┬\n\"ⁿ\Θâ\╠╩¢àds\\ódù╝|\Ω\╠\Ω.á┴A_¡│Ä\ßbb▒(┤R0º3O\∞ö+╗█Æf╟«%Ä\├\╔5vJú\π\0⌐~,┤âò[\─%PZ\╘!á\n╝╝ô╦¬\∩\╘4?0è.\≥.Oép¿æò\█¼ä┐ô─ªÆ\εmqCq▐╡7ÅügQ\εÉR\≈ºäC@\╤\▄N¼!\\╟│\Θ0▓╧ª%ig\╩\├\Ω+╘¼S╕#éY\Γ\\⌐p\├Qⁿ%a63-&\─$_⌐@¼\═\Ω$úB#*N\▌bQCg\Γ`N~yâ)|K«Hù*ÿ4ë)SAO├ÿC°ûS└âD¬O╕▒KÖQ\±┤%└#\▌e8¢Ç\σ\ΩYÅÄ	[\≈Y¢║°\≡Pê[╔¿ÿ£\ε6╡pJ\▐f\╥╓Åq\ΦÆ \0SQ4»░pD\Züó#ô]\┼CX╕j²Dºk;âu\╥╚╢╘ºY£B@ï+¬`|1r¿ëR┴Zz>\r\δwóï\Γ=\σ╬¥A\╔\≡\╘p\µ\▄%]\─~\"\▐=U\δG╣i5q╧ëáb[\\k╝\┬A\─X:ÿ\Γ┤\ß>34x#│\σs\─(╦ù|c╖\╥■\"Y6\µj<\╓rGë\µhâò)QÇJ\ε«Ü┐7ùqº8°\n«QÅ0Tp\φ\µtó\Φû\Θ*╒è\╚\0U\╪`\≡ff\▄G<\µ+n9ëv\╠Xö\▄4ï\─SÅüÿC\Σ&\φ*b~4ó¢ ¬ÇA.\π«┼Æ\±lA\╚j/¿èèêVÄ+4└\"\∞ÿKi╦▓1ê0n\Γa4)Ob\εa\≥┴ëT`8ù-è\╞|É:#¬\╩\─>Ü°\╒/√d¢\"T1+ietG/í╕m\┼f╖ÿ(\τ\π\ΓgL\▀╞▒\µÆ»êUbí\Ωö⌐\ε,NmÅ	çëÅ_»ïî\≤ÅnPp°¢\Z`¼ºmô\ΦY\╩gé\0S\╩;%äKOP+\πÜäáïg└\'\╞\ε<Md\╒h\≤	\─\╫X║ja╥╕LAöå╢\▄-7ì\╠\∩Æ\n\⌡\ΣëR\╠1╨▓ƒ3nó/⌐F\Ω\Γ}B┴ï╡┐╘┤jM▒╖╕>ftQ+á!┴qPòê\rⁿV~8è¬]\╓\≥\"▓éXW\┬\▄7h¬^#»$-║ëB176K╬ªXfèZ\±° ½°5z\0@3\═\τ█░\\D8pú\Φ\±(P\n\δ,\╘J┴é\Z	\µuNæ,ÄQ┤ìû\r┴ªi\╤\█QÇ:%Q▄å#╕T╜J\r\▌·Öb·\'Sì└%╦ê\\Bú\π═«ªb∙\\3v\≥\≤\Z╛â}aÆ.0\├k%Ñì\≈]\Φ\╚╠┐19uuîfn3X░1ƒè∙c╣Pä2\≈\╪Mæ3	ñ`ÿ╖Rj┴~╕\├\╤0D¿Zo\ΓΦáó0FI\nÖÜO\≡ëî*½\╠┴pnq0q(\εm&▀╣öu\Ω^E`«!\n\▌\≥e\µ\╟L\Z╝3Kè\0\╪9ö3│pf\╤\╟└╣°\╒0å¢╤Ö⌐*%\╤\≡Ií	)1*n\▐EAhAk8à\n\╤,q#åÜc\═Eë\▀dzíZ\±Äÿ)┤ö9@{²M¬┐ÿ8x(â6\ε\±║\─w))Jó,2\┼\⌠.a¿Çⁿ3\σ0A9Krìæ°åöÿÉ▀¬\⌠\├/\─1P\╫─ù╗e\╠üx33«\π1R\▀3V\\p\┼\╨\─`k\αB\╓\┘k\▄E½A9X¡:\█.\╠w1î╣?YL¢é\╩76l\nÖ^ÉTXûbT\╩a╣3cé\█ \0\─\╠\'2º0b$\╩0w\ZçX\µê\∩öÇà┼åÿg*\Θ.~╚¿\≤\▄\╚y╕¼jj	\\!5Sê\╠MAë\╠>üó\π\≡tτÖÇ6\╔ôMq\0pCâú¿\≡M╛ó·╧ïMCê7Ü%\φ\Z\ΓféL\÷₧BZ¬ò│╠¬\⌡√$A1L╜\≡½ªz\Γª⌐\0sT╫ÿÇ╞╣y°\n«SkT7L\┬.)ìÿ\εSB0ª/┴``Ä\─yb°k\rG?.YW*å┼░ÉJE╢S⌐É└F%3╠│d~ ½ïO\≈ê\÷│,0\─\0ⁿñTL▒\r@Jò\≡\≡R\αbs òº\╤\▄,Ö\n\"\╧\╘U;l¼╢VT\\Q\╦\r└╢$\±K=É\≡K`Sbw╠║G\▀┴X\φäz\╠\─;L`\─\αùJ¢\ΓQêX▓\"▓\'¥åäW\≡B~x«ó\▄W\Zⁿ\ßA\ε;CPÜKª:xèúK>D└└┼╣j%?H4\µ\ΓR¿jí£\╩╠⌐X¢╩ÿ\'?\Z!╕1#ª 7Ceªfj.\ß.^*H▒gëW╝\\½1\█\ZCëd│╤Ç(3ë¼Sï/╟▓]Ç\╥<|jìW)i\±\╟└\├\┘t\▄ÇÅL┤\π\π~&+íRäyÿ⌐/0é\α¿~£\┬k7ç\╟\├\≥p┴äYÄÿ\αIv|3\±Zå«╪â╛*!ÑYi)cQ▀êæ°V~q\±áC\ß\╘1\±D¼FQ\╩\╞e░▒P⌐ï S0O╥è╜\╠{┌Ç\┼S4╜╠¬!ù\÷└ÿZ\╒,\⌡2\\┴(┐ \0«▓zAJ╬çû`T=GQÑÑ¡züHQé£~\"e\Γ▒\╠Pf\µ\≤ƒÇfa\╬9Äê\±2ì\╘&a\±┤!╕U\╟PG\─ÿ\ΩóCM\µÑaw\─qî\╤4¿\≤┬É|@\╠#G\Γ│&╛a\≡\┬7G\─$\╫\nDVi\≡\Γ\▌ⁿ╩ü4╝Jï─½\µ└`¼\┼\Σ╡zÇ∙62âæè4btD«`╕\πq\∩ΘÖç\⌡\Σ»C7╦ª,T4\Γ\\yàGÿ\0TjÄ╡UEéo+\Σ6Sï\─╪Ü═ôR\Zåº?.\ß|:å!\╘g	\╠ ╖	\r)Q\▄n⌐ƒº\≡ÿ|[\ΓÇÜ>ªÅåë\±\Φ@Ü▒_┴\╠Bk4ⁿFm12s&\╞╞Üöo\╚\╩\0\Ω\Γ¬*XÄ\π`F+N╧ç \┘','USER','2026-10-18 20:11:48.000000','syed abdul razak'),(_binary 'ë\╠\ΦIEÜB\ε¥\≤D╖\╔\⌡\µñ','2026-10-13 12:13:32.000000',NULL,'devtrio98@gmail.com',NULL,NULL,_binary '',NULL,NULL,'9876543210','$2b$12$R71ug/HWULDw9YM2bVxf0.QT6Ft1ADrP3T35Kyf6c/BKE6Za8GoOm',NULL,NULL,'ADMIN','2026-10-18 21:36:20.000000','Abdul Razak');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-02 15:03:50
