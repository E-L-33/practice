-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add course',7,'add_course'),(26,'Can change course',7,'change_course'),(27,'Can delete course',7,'delete_course'),(28,'Can view course',7,'view_course'),(29,'Can add score',8,'add_score'),(30,'Can change score',8,'change_score'),(31,'Can delete score',8,'delete_score'),(32,'Can view score',8,'view_score'),(33,'Can add student',9,'add_student'),(34,'Can change student',9,'change_student'),(35,'Can delete student',9,'delete_student'),(36,'Can view student',9,'view_student'),(37,'Can add teacher',10,'add_teacher'),(38,'Can change teacher',10,'change_teacher'),(39,'Can delete teacher',10,'delete_teacher'),(40,'Can view teacher',10,'view_teacher');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$cyaW9hY3bXBl$UqL4Q3Ih1dioVeQQ/OoTF6aNL8QrugWR623jTIH1qrg=','2018-12-24 07:39:07.334664',1,'liuya','','','bluebliss@foxmail.com',1,1,'2018-12-24 06:08:59.112245');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_teacher_id_b694c4f5_fk_teacher_id` (`teacher_id`),
  CONSTRAINT `course_teacher_id_b694c4f5_fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'语言',1),(2,'锻造',2),(3,'附魔',5),(4,'采药',3),(5,'工程',4),(6,'制皮',6),(7,'剥皮',5),(8,'铭文',6),(9,'珠宝',7),(10,'裁缝',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-24 06:15:25.147857','1','刘丫丫',1,'[{\"added\": {}}]',10,1),(2,'2018-12-24 06:15:32.411531','2','王狗二',1,'[{\"added\": {}}]',10,1),(3,'2018-12-24 06:17:26.317387','3','牛看三',1,'[{\"added\": {}}]',10,1),(4,'2018-12-24 06:17:37.666617','4','王哈哈',1,'[{\"added\": {}}]',10,1),(5,'2018-12-24 06:18:20.362156','5','黄灰红',1,'[{\"added\": {}}]',10,1),(6,'2018-12-24 06:18:38.047237','6','李赣麻',1,'[{\"added\": {}}]',10,1),(7,'2018-12-24 06:20:38.079092','7','李闽台',1,'[{\"added\": {}}]',10,1),(8,'2018-12-24 06:32:47.760338','1','懒得卡',1,'[{\"added\": {}}]',9,1),(9,'2018-12-24 06:33:21.618569','2','道格人',1,'[{\"added\": {}}]',9,1),(10,'2018-12-24 06:33:21.622045','3','道格人',1,'[{\"added\": {}}]',9,1),(11,'2018-12-24 06:33:51.580800','4','鲧冻條',1,'[{\"added\": {}}]',9,1),(12,'2018-12-24 06:34:26.071530','5','范隆段',1,'[{\"added\": {}}]',9,1),(13,'2018-12-24 06:34:36.742825','6','李开复',1,'[{\"added\": {}}]',9,1),(14,'2018-12-24 06:34:52.771161','7','日光表',1,'[{\"added\": {}}]',9,1),(15,'2018-12-24 06:35:10.966251','8','拉雅发',1,'[{\"added\": {}}]',9,1),(16,'2018-12-24 06:35:48.410087','1','语言',1,'[{\"added\": {}}]',7,1),(17,'2018-12-24 06:35:56.049022','2','锻造',1,'[{\"added\": {}}]',7,1),(18,'2018-12-24 06:36:03.461085','3','附魔',1,'[{\"added\": {}}]',7,1),(19,'2018-12-24 06:36:26.396967','4','采药',1,'[{\"added\": {}}]',7,1),(20,'2018-12-24 06:36:35.372046','5','工程',1,'[{\"added\": {}}]',7,1),(21,'2018-12-24 06:36:47.069842','6','制皮',1,'[{\"added\": {}}]',7,1),(22,'2018-12-24 06:36:59.476864','7','剥皮',1,'[{\"added\": {}}]',7,1),(23,'2018-12-24 06:37:17.400207','8','铭文',1,'[{\"added\": {}}]',7,1),(24,'2018-12-24 06:37:27.788615','9','珠宝',1,'[{\"added\": {}}]',7,1),(25,'2018-12-24 06:38:08.552136','10','裁缝',1,'[{\"added\": {}}]',7,1),(26,'2018-12-24 06:39:43.344618','2','Score object (2)',1,'[{\"added\": {}}]',8,1),(27,'2018-12-24 06:39:50.948117','3','Score object (3)',1,'[{\"added\": {}}]',8,1),(28,'2018-12-24 06:39:57.295193','4','Score object (4)',1,'[{\"added\": {}}]',8,1),(29,'2018-12-24 06:40:04.432137','5','Score object (5)',1,'[{\"added\": {}}]',8,1),(30,'2018-12-24 06:40:12.522484','6','Score object (6)',1,'[{\"added\": {}}]',8,1),(31,'2018-12-24 06:40:28.874873','3','道格人',3,'',9,1),(32,'2018-12-24 06:40:47.625251','2','Score object (2)',3,'',8,1),(33,'2018-12-24 06:40:58.264672','7','Score object (7)',1,'[{\"added\": {}}]',8,1),(34,'2018-12-24 06:41:08.776971','8','Score object (8)',1,'[{\"added\": {}}]',8,1),(35,'2018-12-24 06:41:15.552998','9','Score object (9)',1,'[{\"added\": {}}]',8,1),(36,'2018-12-24 06:41:22.425166','10','Score object (10)',1,'[{\"added\": {}}]',8,1),(37,'2018-12-24 06:41:29.513019','11','Score object (11)',1,'[{\"added\": {}}]',8,1),(38,'2018-12-24 06:41:40.740930','12','Score object (12)',1,'[{\"added\": {}}]',8,1),(39,'2018-12-24 06:41:46.547906','13','Score object (13)',1,'[{\"added\": {}}]',8,1),(40,'2018-12-24 06:42:02.733789','14','Score object (14)',1,'[{\"added\": {}}]',8,1),(41,'2018-12-24 06:42:10.860276','15','Score object (15)',1,'[{\"added\": {}}]',8,1),(42,'2018-12-24 06:42:20.303819','16','Score object (16)',1,'[{\"added\": {}}]',8,1),(43,'2018-12-24 06:42:25.890026','17','Score object (17)',1,'[{\"added\": {}}]',8,1),(44,'2018-12-24 06:42:32.521703','18','Score object (18)',1,'[{\"added\": {}}]',8,1),(45,'2018-12-24 06:42:40.277398','19','Score object (19)',1,'[{\"added\": {}}]',8,1),(46,'2018-12-24 06:42:57.944080','20','Score object (20)',1,'[{\"added\": {}}]',8,1),(47,'2018-12-24 06:43:07.635167','21','Score object (21)',1,'[{\"added\": {}}]',8,1),(48,'2018-12-24 06:43:29.606347','22','Score object (22)',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'school','course'),(8,'school','score'),(9,'school','student'),(10,'school','teacher'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-24 03:23:03.781488'),(2,'auth','0001_initial','2018-12-24 03:23:16.396381'),(3,'admin','0001_initial','2018-12-24 03:23:19.983815'),(4,'admin','0002_logentry_remove_auto_add','2018-12-24 03:23:20.036681'),(5,'admin','0003_logentry_add_action_flag_choices','2018-12-24 03:23:20.092965'),(6,'contenttypes','0002_remove_content_type_name','2018-12-24 03:23:21.535697'),(7,'auth','0002_alter_permission_name_max_length','2018-12-24 03:23:22.662169'),(8,'auth','0003_alter_user_email_max_length','2018-12-24 03:23:23.385444'),(9,'auth','0004_alter_user_username_opts','2018-12-24 03:23:23.439273'),(10,'auth','0005_alter_user_last_login_null','2018-12-24 03:23:24.148229'),(11,'auth','0006_require_contenttypes_0002','2018-12-24 03:23:24.189636'),(12,'auth','0007_alter_validators_add_error_messages','2018-12-24 03:23:24.244408'),(13,'auth','0008_alter_user_username_max_length','2018-12-24 03:23:24.987227'),(14,'auth','0009_alter_user_last_name_max_length','2018-12-24 03:23:25.832794'),(15,'school','0001_initial','2018-12-24 03:23:31.095430'),(16,'sessions','0001_initial','2018-12-24 03:23:31.811892');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ptak75sftcyujzws4qshafdl1dp96fgk','Y2I3YmE4MWJiN2ZlMWRlNDAyOGE3NDc2NDQ0OTIyY2E0MjRlNWIxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTVjY2I1MDk0NDgwNjM2Mjc4MTMyZTY2NjNlN2Q0ZDAxMWUzNzUwIn0=','2019-01-07 06:12:12.207672'),('smokgthz2ygkykeat1f20t6naipob0ee','Y2I3YmE4MWJiN2ZlMWRlNDAyOGE3NDc2NDQ0OTIyY2E0MjRlNWIxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OTVjY2I1MDk0NDgwNjM2Mjc4MTMyZTY2NjNlN2Q0ZDAxMWUzNzUwIn0=','2019-01-07 07:39:07.376619');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` double NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `score_course_id_9ac3760b_fk_course_id` (`course_id`),
  KEY `score_student_id_1b090b29_fk_student_id` (`student_id`),
  CONSTRAINT `score_course_id_9ac3760b_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `score_student_id_1b090b29_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (3,123,1,1),(4,50,3,1),(5,546,6,1),(6,450,7,2),(7,12,9,2),(8,34,4,4),(9,56,4,4),(10,666,10,4),(11,44,1,5),(12,78,6,5),(13,95,3,5),(14,888,1,6),(15,80,2,6),(16,12,9,6),(17,55,4,7),(18,55,6,7),(19,59,8,7),(20,89,4,8),(21,63,3,8),(22,90,8,8);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'懒得卡',0),(2,'道格人',0),(4,'鲧冻條',1),(5,'范隆段',0),(6,'李开复',1),(7,'日光表',1),(8,'拉雅发',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'刘丫丫'),(2,'王狗二'),(3,'牛看三'),(4,'王哈哈'),(5,'黄灰红'),(6,'李赣麻'),(7,'李闽台');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-25  8:38:32
