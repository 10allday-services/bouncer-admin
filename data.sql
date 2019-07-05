SET NAMES utf8mb4 ;
CREATE DATABASE IF NOT EXISTS bouncer;
USE bouncer;
DROP TABLE IF EXISTS `auth_group`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(80) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `name` (`name`)) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
LOCK TABLES `auth_group` WRITE;
INSERT INTO `auth_group` VALUES (1,'API access'),(2,'Volunteer admins');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_group_permissions`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (`id` int(11) NOT NULL AUTO_INCREMENT,`group_id` int(11) NOT NULL,`permission_id` int(11) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `group_id` (`group_id`,`permission_id`),KEY `permission_id_refs_id_a7792de1` (`permission_id`)) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
LOCK TABLES `auth_group_permissions` WRITE;
INSERT INTO `auth_group_permissions` VALUES (1,1,40),(2,1,41),(3,1,42),(4,1,43),(5,1,44),(6,1,45),(7,1,46),(8,1,47),(9,1,48),(10,1,49),(19,2,31),(11,2,32),(12,2,33),(13,2,34),(14,2,35),(15,2,36),(16,2,37),(17,2,38),(18,2,39);
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_message`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_message` (`id` int(11) NOT NULL AUTO_INCREMENT,`user_id` int(11) NOT NULL,`message` longtext NOT NULL,PRIMARY KEY (`id`),KEY `auth_message_user_id` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `auth_message` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_permission`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(50) NOT NULL,`content_type_id` int(11) NOT NULL,`codename` varchar(100) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),KEY `auth_permission_content_type_id` (`content_type_id`)) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES (1,'Can add Legacy User',1,'add_legacyuser'),(2,'Can change Legacy User',1,'change_legacyuser'),(3,'Can delete Legacy User',1,'delete_legacyuser'),(4,'Can add user profile',2,'add_userprofile'),(5,'Can change user profile',2,'change_userprofile'),(6,'Can delete user profile',2,'delete_userprofile'),(7,'Can add migration history',3,'add_migrationhistory'),(8,'Can change migration history',3,'change_migrationhistory'),(9,'Can delete migration history',3,'delete_migrationhistory'),(10,'Can add log entry',4,'add_logentry'),(11,'Can change log entry',4,'change_logentry'),(12,'Can delete log entry',4,'delete_logentry'),(13,'Can add permission',5,'add_permission'),(14,'Can change permission',5,'change_permission'),(15,'Can delete permission',5,'delete_permission'),(16,'Can add group',6,'add_group'),(17,'Can change group',6,'change_group'),(18,'Can delete group',6,'delete_group'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add message',8,'add_message'),(23,'Can change message',8,'change_message'),(24,'Can delete message',8,'delete_message'),(25,'Can add content type',9,'add_contenttype'),(26,'Can change content type',9,'change_contenttype'),(27,'Can delete content type',9,'delete_contenttype'),(28,'Can add session',10,'add_session'),(29,'Can change session',10,'change_session'),(30,'Can delete session',10,'delete_session'),(31,'Can add country',11,'add_country'),(32,'Can change country',11,'change_country'),(33,'Can delete country',11,'delete_country'),(34,'Can add region',12,'add_region'),(35,'Can change region',12,'change_region'),(36,'Can delete region',12,'delete_region'),(37,'Can add mirror',13,'add_mirror'),(38,'Can change mirror',13,'change_mirror'),(39,'Can delete mirror',13,'delete_mirror'),(40,'Can add product',14,'add_product'),(41,'Can change product',14,'change_product'),(42,'Can delete product',14,'delete_product'),(43,'Can add product language',15,'add_product_language'),(44,'Can change product language',15,'change_product_language'),(45,'Can delete product language',15,'delete_product_language'),(46,'Can add location',16,'add_location'),(47,'Can change location',16,'change_location'),(48,'Can delete location',16,'delete_location'),(49,'Can view mirror uptake',16,'view_uptake'),(50,'Can add Operating System',17,'add_os'),(51,'Can change Operating System',17,'change_os'),(52,'Can delete Operating System',17,'delete_os'),(53,'Can add product alias',18,'add_productalias'),(54,'Can change product alias',18,'change_productalias'),(55,'Can delete product alias',18,'delete_productalias'),(56,'Can add product language',15,'add_productlanguage'),(57,'Can change product language',15,'change_productlanguage'),(58,'Can delete product language',15,'delete_productlanguage'),(59,'Can add location mirror map',19,'add_locationmirrormap'),(60,'Can change location mirror map',19,'change_locationmirrormap'),(61,'Can delete location mirror map',19,'delete_locationmirrormap'),(62,'Can add location mirror language exception',20,'add_locationmirrorlanguageexception'),(63,'Can change location mirror language exception',20,'change_locationmirrorlanguageexception'),(64,'Can delete location mirror language exception',20,'delete_locationmirrorlanguageexception'),(65,'Can add IP Block',21,'add_ipblock'),(66,'Can change IP Block',21,'change_ipblock'),(67,'Can delete IP Block',21,'delete_ipblock');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (`id` int(11) NOT NULL AUTO_INCREMENT,`username` varchar(30) NOT NULL,`first_name` varchar(30) NOT NULL,`last_name` varchar(30) NOT NULL,`email` varchar(75) NOT NULL,`password` varchar(128) NOT NULL,`is_staff` tinyint(1) NOT NULL,`is_active` tinyint(1) NOT NULL,`is_superuser` tinyint(1) NOT NULL,`last_login` datetime NOT NULL,`date_joined` datetime NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `username` (`username`)) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
LOCK TABLES `auth_user` WRITE;
INSERT INTO `auth_user` VALUES (1,'admin','','','admin@admin.com','pbkdf2_sha256$10000$1obyKBfQOSs6$TwvoLHHnE7uZprw9ZMZmviCVPKqCH1M+bFN2o6zNX4w=',1,1,1,'2019-06-05 10:48:57','2015-07-23 10:58:11');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_groups`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (`id` int(11) NOT NULL AUTO_INCREMENT,`user_id` int(11) NOT NULL,`group_id` int(11) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `user_id` (`user_id`,`group_id`),KEY `group_id_refs_id_f0ee9890` (`group_id`)) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
LOCK TABLES `auth_user_groups` WRITE;
INSERT INTO `auth_user_groups` VALUES (1,1,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_user_permissions`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (`id` int(11) NOT NULL AUTO_INCREMENT,`user_id` int(11) NOT NULL,`permission_id` int(11) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `user_id` (`user_id`,`permission_id`),KEY `permission_id_refs_id_67e79cb` (`permission_id`)) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;
LOCK TABLES `auth_user_user_permissions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_admin_log`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (`id` int(11) NOT NULL AUTO_INCREMENT,`action_time` datetime NOT NULL,`user_id` int(11) NOT NULL,`content_type_id` int(11) DEFAULT NULL,`object_id` longtext,`object_repr` varchar(200) NOT NULL,`action_flag` smallint(5) unsigned NOT NULL,`change_message` longtext NOT NULL,PRIMARY KEY (`id`),KEY `django_admin_log_user_id` (`user_id`),KEY `django_admin_log_content_type_id` (`content_type_id`)) ENGINE=InnoDB AUTO_INCREMENT=32477 DEFAULT CHARSET=latin1;
LOCK TABLES `django_admin_log` WRITE;
INSERT INTO `django_admin_log` VALUES (1,'2015-07-23 13:31:08',1,14,'1','Firefox',1,''),(2,'2015-07-23 13:31:56',1,17,'1','win64',1,''),(3,'2015-07-23 13:32:02',1,17,'2','osx',1,''),(4,'2015-07-23 13:35:34',1,16,'1','/firefox/releases/40.0b5/win32/:lang/Firefox%20Setup%2040.0b5.exe',1,''),(5,'2015-07-23 13:36:20',1,16,'2','/firefox/releases/40.0b5/mac/:lang/Firefox%2040.0b5.dmg',1,''),(6,'2015-07-23 13:38:15',1,12,'1','All',1,''),(7,'2015-07-23 13:38:30',1,13,'1','Mozilla Installer CDN',1,''),(8,'2015-07-23 13:38:59',1,13,'2','Mozilla Installer CDN - SSL ',1,''),(9,'2015-07-23 13:39:20',1,18,'1','ProductAlias object',1,''),(10,'2015-07-23 13:41:49',1,11,'US','United States (US)',1,''),(11,'2015-07-23 13:43:43',1,21,'1','0.0.0.0 -- 223.255.247.255',1,''),(12,'2015-07-23 16:11:12',1,16,'2','/firefox/releases/39.0/mac/:lang/Firefox%2039.0.dmg',2,'Changed path.'),(13,'2015-07-23 16:11:28',1,16,'1','/firefox/releases/39.0/win32/:lang/Firefox%20Setup%2039.0.exe',2,'Changed path.'),(16,'2015-07-23 16:39:18',1,14,'2','Firefox-SSL',1,''),(17,'2015-07-23 16:39:57',1,16,'3','/firefox/releases/39.0/win32/:lang/Firefox%20Setup%2039.0.exe',1,''),(32473,'2019-05-14 11:35:46',1,14,'4556','AaronProduct',1,''),(32474,'2019-05-14 11:36:14',1,16,'23194','/test',1,''),(32475,'2019-05-14 11:43:20',1,14,'4556','AaronProduct',2,'Changed ssl_only.'),(32476,'2019-05-14 11:46:44',1,14,'4556','AaronProduct',2,'Added product language \"AaronProduct (en-US)\".');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_content_type`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(100) NOT NULL,`app_label` varchar(100) NOT NULL,`model` varchar(100) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `app_label` (`app_label`,`model`)) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES (1,'Legacy User','users','legacyuser'),(2,'user profile','users','userprofile'),(3,'migration history','south','migrationhistory'),(4,'log entry','admin','logentry'),(5,'permission','auth','permission'),(6,'group','auth','group'),(7,'user','auth','user'),(8,'message','auth','message'),(9,'content type','contenttypes','contenttype'),(10,'session','sessions','session'),(11,'Country','geoip','country'),(12,'Region','geoip','region'),(13,'Mirror','mirror','mirror'),(14,'Product','mirror','product'),(15,'ProductLanguage','mirror','productlanguage'),(16,'Location','mirror','location'),(17,'Operating System','mirror','os'),(18,'product alias','mirror','productalias'),(19,'location mirror map','mirror','locationmirrormap'),(20,'location mirror language exception','mirror','locationmirrorlanguageexception'),(21,'IP Block','geoip','ipblock');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_session`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (`session_key` varchar(40) NOT NULL,`session_data` longtext NOT NULL,`expire_date` datetime NOT NULL,PRIMARY KEY (`session_key`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `django_session` WRITE;
INSERT INTO `django_session` VALUES ('3966d82b5e88833f37f512e53823f75e','OGJlMDI1NjU2YWM1YTA0NTAxY2M1YTU4NTkxYWIyYTY2MzA1ZTAxYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2019-05-31 10:16:22'),('51f88507d55be2e055394509617c3ced','OGJlMDI1NjU2YWM1YTA0NTAxY2M1YTU4NTkxYWIyYTY2MzA1ZTAxYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2019-05-28 11:17:10'),('810f108fd09ce4e4bb84684cb3581b41','OGJlMDI1NjU2YWM1YTA0NTAxY2M1YTU4NTkxYWIyYTY2MzA1ZTAxYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-08-06 16:07:01'),('82dd82bfdcd7f2d04cf63596633639bf','OGJlMDI1NjU2YWM1YTA0NTAxY2M1YTU4NTkxYWIyYTY2MzA1ZTAxYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2019-06-04 11:45:24'),('fb1fd5acf4cfed42981b23c4ca8e43e0','MzE3MDM0YjAyYTgwZGE4NDQyNmNlNjZkYjUwN2FmYWFkNWUyZTRhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2019-06-19 10:48:57');
UNLOCK TABLES;
DROP TABLE IF EXISTS `geoip_country_to_region`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `geoip_country_to_region` (`country_code` varchar(2) NOT NULL DEFAULT '',`region_id` int(11) DEFAULT NULL,`country_name` varchar(255) NOT NULL DEFAULT '',`continent` varchar(2) NOT NULL DEFAULT '',PRIMARY KEY (`country_code`),KEY `region_id` (`region_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping country codes to regions';
LOCK TABLES `geoip_country_to_region` WRITE;
INSERT INTO `geoip_country_to_region` VALUES ('US',1,'United States','NA');
UNLOCK TABLES;
DROP TABLE IF EXISTS `geoip_ip_to_country`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `geoip_ip_to_country` (`id` int(10) unsigned NOT NULL AUTO_INCREMENT,`ip_start` int(10) unsigned NOT NULL DEFAULT '0',`ip_end` int(10) unsigned NOT NULL DEFAULT '0',`country_code` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',PRIMARY KEY (`id`),KEY `ip_start` (`ip_start`),KEY `ip_end` (`ip_end`)) ENGINE=InnoDB AUTO_INCREMENT=4091488 DEFAULT CHARSET=utf8;
LOCK TABLES `geoip_ip_to_country` WRITE;
INSERT INTO `geoip_ip_to_country` VALUES (1,0,3758094335,'US');
UNLOCK TABLES;
DROP TABLE IF EXISTS `geoip_mirror_region_map`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `geoip_mirror_region_map` (`id` int(11) NOT NULL AUTO_INCREMENT,`mirror_id` int(11) NOT NULL DEFAULT '0',`region_id` int(11) NOT NULL DEFAULT '0',PRIMARY KEY (`id`),UNIQUE KEY `mirror_id` (`mirror_id`,`region_id`)) ENGINE=InnoDB AUTO_INCREMENT=4353 DEFAULT CHARSET=utf8;
LOCK TABLES `geoip_mirror_region_map` WRITE;
INSERT INTO `geoip_mirror_region_map` VALUES (1,1,1),(2,2,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `geoip_regions`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `geoip_regions` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(255) NOT NULL DEFAULT '',`priority` int(11) NOT NULL DEFAULT '0',`throttle` int(11) NOT NULL,`fallback_id` int(11) DEFAULT NULL,`prevent_global_fallback` int(1) DEFAULT NULL,PRIMARY KEY (`id`),UNIQUE KEY `region_name` (`name`),KEY `geoip_regions_e28329c2` (`fallback_id`)) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
LOCK TABLES `geoip_regions` WRITE;
INSERT INTO `geoip_regions` VALUES (1,'All',100,100,NULL,0);
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_aliases`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_aliases` (`id` int(11) NOT NULL AUTO_INCREMENT,`alias` varchar(255) NOT NULL,`related_product` varchar(255) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `alias` (`alias`),UNIQUE KEY `uniq_alias` (`alias`)) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_aliases` WRITE;
INSERT INTO `mirror_aliases` VALUES (1,'firefox-latest','Firefox'),(2,'firefox-sha1','Firefox-43.0.1-SSL');
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_lmm_lang_exceptions`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_lmm_lang_exceptions` (`id` int(11) NOT NULL AUTO_INCREMENT,`location_mirror_map_id` bigint(20) DEFAULT NULL,`language` varchar(30) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `location_mirror_map_id` (`location_mirror_map_id`,`language`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `mirror_lmm_lang_exceptions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_location_mirror_map`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_location_mirror_map` (`id` bigint(20) NOT NULL AUTO_INCREMENT,`location_id` int(11) NOT NULL DEFAULT '0',`mirror_id` int(11) NOT NULL DEFAULT '0',`active` tinyint(4) NOT NULL DEFAULT '0',`healthy` tinyint(4) NOT NULL DEFAULT '1',PRIMARY KEY (`id`),UNIQUE KEY `location_id` (`location_id`,`mirror_id`)) ENGINE=InnoDB AUTO_INCREMENT=3262737555 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_location_mirror_map` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_locations`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_locations` (`id` int(11) NOT NULL AUTO_INCREMENT,`product_id` int(11) NOT NULL DEFAULT '0',`os_id` int(11) NOT NULL DEFAULT '0',`path` varchar(255) NOT NULL DEFAULT '',PRIMARY KEY (`id`,`product_id`,`os_id`),KEY `product_os_idx` (`product_id`,`os_id`)) ENGINE=InnoDB AUTO_INCREMENT=23260 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_locations` WRITE;
INSERT INTO `mirror_locations` VALUES (1,1,1,'/firefox/releases/39.0/win64/:lang/Firefox%20Setup%2039.0.exe'),(2,1,2,'/firefox/releases/39.0/mac/:lang/Firefox%2039.0.dmg'),(3,1,3,'/firefox/releases/39.0/win32/:lang/Firefox%20Setup%2039.0.exe'),(4,2,1,'/firefox/releases/39.0/win64/:lang/Firefox%20Setup%2039.0.exe'),(5,2,2,'/firefox/releases/39.0/mac/:lang/Firefox%2039.0.dmg'),(6,2,3,'/firefox/releases/39.0/win32/:lang/Firefox%20Setup%2039.0.exe'),(7,3,1,'/firefox/releases/43.0.1/win64/:lang/Firefox%20Setup%2043.0.1.exe'),(8,3,2,'/firefox/releases/43.0.1/mac/:lang/Firefox%2043.0.1.dmg'),(9,3,3,'/firefox/releases/43.0.1/win32/:lang/Firefox%20Setup%2043.0.1.exe'),(23194,4556,2,'/test');
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_log`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_log` (`log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,`mirror_id` int(10) unsigned NOT NULL DEFAULT '0',`location_id` int(10) unsigned NOT NULL DEFAULT '0',`log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,PRIMARY KEY (`log_id`),KEY `log_date` (`log_date`),KEY `mirror_id` (`mirror_id`),KEY `location_id` (`location_id`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `mirror_log` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_mirrors`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_mirrors` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(64) NOT NULL DEFAULT '',`baseurl` varchar(255) NOT NULL DEFAULT '',`rating` int(11) NOT NULL DEFAULT '0',`active` tinyint(4) NOT NULL DEFAULT '0',`count` bigint(20) unsigned NOT NULL DEFAULT '0',PRIMARY KEY (`id`),UNIQUE KEY `mirror_name` (`name`),KEY `mirror_count` (`count`)) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_mirrors` WRITE;
INSERT INTO `mirror_mirrors` VALUES (1,'Mozilla Installer CDN','http://download-installer.cdn.mozilla.net/pub',100000,1,0),(2,'Mozilla Installer CDN - SSL ','https://download-installer.cdn.mozilla.net/pub',81000,1,0);
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_mirrors_contacts`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_mirrors_contacts` (`id` int(11) NOT NULL AUTO_INCREMENT,`mirror_id` int(11) NOT NULL,`user_id` int(11) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `mirror_mirrors_contacts_mirror_id_596bbe5dd7a331f9_uniq` (`mirror_id`,`user_id`),KEY `mirror_mirrors_contacts_mirror_id` (`mirror_id`),KEY `mirror_mirrors_contacts_user_id` (`user_id`)) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=latin1;
LOCK TABLES `mirror_mirrors_contacts` WRITE;
INSERT INTO `mirror_mirrors_contacts` VALUES (1,1,1),(2,2,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_os`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_os` (`id` int(10) unsigned NOT NULL AUTO_INCREMENT,`name` varchar(32) NOT NULL DEFAULT '',`priority` int(11) NOT NULL DEFAULT '0',PRIMARY KEY (`id`,`name`)) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_os` WRITE;
INSERT INTO `mirror_os` VALUES (1,'win64',0),(2,'osx',0),(3,'win',0),(4,'linux',0),(5,'linux64', 0);
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_product_langs`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_product_langs` (`id` int(11) NOT NULL AUTO_INCREMENT,`product_id` int(11) NOT NULL,`language` varchar(30) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `product_id` (`product_id`,`language`)) ENGINE=InnoDB AUTO_INCREMENT=222156 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_product_langs` WRITE;
INSERT INTO `mirror_product_langs` VALUES (1,1,'en-GB'),(2,1,'en-US'),(4,2,'en-GB'),(3,2,'en-US'),(5,3,'en-GB'),(6,3,'en-US'),(222155,4556,'en-CA'),(222137,4556,'en-GB'),(222138,4556,'en-US');
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_products`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_products` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(255) NOT NULL DEFAULT '',`priority` int(11) NOT NULL DEFAULT '0',`count` bigint(20) unsigned NOT NULL DEFAULT '0',`active` tinyint(4) NOT NULL DEFAULT '1',`checknow` tinyint(1) unsigned NOT NULL DEFAULT '1',`ssl_only` tinyint(1) NOT NULL DEFAULT '0',PRIMARY KEY (`id`),UNIQUE KEY `product_name` (`name`),KEY `product_count` (`count`),KEY `product_active` (`active`),KEY `product_checknow` (`checknow`)) ENGINE=InnoDB AUTO_INCREMENT=4563 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_products` WRITE;
INSERT INTO `mirror_products` VALUES (1,'Firefox',1,0,1,1,0),(2,'Firefox-SSL',1,0,1,1,1),(3,'Firefox-43.0.1-SSL',1,0,1,1,1),(4556,'AaronProduct',1,0,1,1,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_sessions`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_sessions` (`session_id` varchar(32) NOT NULL DEFAULT '',`username` varchar(16) NOT NULL DEFAULT '',PRIMARY KEY (`session_id`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `mirror_sessions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mirror_users`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `mirror_users` (`user_id` int(11) NOT NULL AUTO_INCREMENT,`username` varchar(32) NOT NULL DEFAULT '',`password` varchar(32) NOT NULL DEFAULT '',`user_firstname` varchar(255) NOT NULL DEFAULT '',`user_lastname` varchar(255) NOT NULL DEFAULT '',`user_email` varchar(255) NOT NULL DEFAULT '',`converted` tinyint(4) NOT NULL DEFAULT '0',PRIMARY KEY (`user_id`,`username`,`password`),UNIQUE KEY `user_email` (`user_email`)) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
LOCK TABLES `mirror_users` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sentry_log`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `sentry_log` (`log_date` datetime NOT NULL,`check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,`mirror_id` int(10) unsigned NOT NULL,`mirror_active` enum('0','1') NOT NULL,`mirror_rating` int(11) NOT NULL,`reason` mediumtext,UNIQUE KEY `log_entry` (`mirror_id`,`log_date`),KEY `log_date_idx` (`log_date`),KEY `log_entry2` (`mirror_id`,`check_time`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `sentry_log` WRITE;
INSERT INTO `sentry_log` VALUES ('2015-07-23 16:19:09','2015-07-23 23:19:09',1,'1',100000,'Checking mirror download-installer.cdn.mozilla.net ...\ndownload-installer.cdn.mozilla.net.	5	IN	CNAME	cs163.wpc.taucdn.net.\ncs163.wpc.taucdn.net.	5	IN	A	93.184.215.191\nUsing first seen IP: 93.184.215.191 for requests\nMaking base URL http://93.184.215.191/pub\n[2015-07-23 16:19:09 -0700] HEAD http://93.184.215.191/pub/firefox/releases/39.0/win32/zh-TW/Firefox%20Setup%2039.0.exe ... okay. CACHE=hit TOOK=0.006216\n[2015-07-23 16:19:09 -0700] HEAD http://93.184.215.191/pub/firefox/releases/39.0/mac/zh-TW/Firefox%2039.0.dmg ... okay. CACHE=hit TOOK=0.007065\nFinished. Elapsed time: 0.\n'),('2015-07-23 16:19:09','2015-07-23 23:19:28',2,'0',90000,'Checking mirror download-installer.cdn.mozilla.net ...\ndownload-installer.cdn.mozilla.net.	5	IN	CNAME	cs163.wpc.taucdn.net.\ncs163.wpc.taucdn.net.	5	IN	A	93.184.215.191\nUsing first seen IP: 93.184.215.191 for requests\nMaking base URL http://93.184.215.191/pub\n[2015-07-23 16:19:09 -0700] HEAD http://93.184.215.191/pub/firefox/releases/39.0/win32/zh-TW/Firefox%20Setup%2039.0.exe ... okay. CACHE=hit TOOK=0.006216\n[2015-07-23 16:19:09 -0700] HEAD http://93.184.215.191/pub/firefox/releases/39.0/mac/zh-TW/Firefox%2039.0.dmg ... okay. CACHE=hit TOOK=0.007065\nFinished. Elapsed time: 0.\nChecking mirror download-installer.cdn.mozilla.net ...\ndownload-installer.cdn.mozilla.net.	5	IN	CNAME	cs163.wpc.taucdn.net.\ncs163.wpc.taucdn.net.	5	IN	A	93.184.215.191\nUsing first seen IP: 93.184.215.191 for requests\nMaking base URL https://93.184.215.191/pub\nhttps://93.184.215.191/pub sent no response after 10 seconds!  Checking recent history...\n**** weight 90000 active 0 for https://93.184.215.191/pub\n**** https://93.184.215.191/pub Weight Drop Pattern matched, weight will be dropped 10%\n**** https://93.184.215.191/pub Weight change 90000 -> 81000\n');
UNLOCK TABLES;
DROP TABLE IF EXISTS `south_migrationhistory`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `south_migrationhistory` (`id` int(11) NOT NULL AUTO_INCREMENT,`app_name` varchar(255) NOT NULL,`migration` varchar(255) NOT NULL,`applied` datetime NOT NULL,PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
LOCK TABLES `south_migrationhistory` WRITE;
INSERT INTO `south_migrationhistory` VALUES (1,'mirror','0001_initial','2015-07-23 17:58:19'),(2,'mirror','0002_auto','2015-07-23 17:58:19'),(3,'mirror','0003_add_permissions_for_api','2015-07-23 17:58:19'),(4,'mirror','0004_auto__add_productalias__add_field_locationmirrormap_healthy__add_field','2015-07-23 17:58:20'),(5,'geoip','0001_initial','2015-07-23 17:58:20'),(6,'geoip','0002_auto__add_field_region_fallback','2015-07-23 17:58:20'),(7,'geoip','0003_auto__add_field_region_prevent_global_fallback','2015-07-23 17:58:20');
UNLOCK TABLES;
DROP TABLE IF EXISTS `users_userprofile`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `users_userprofile` (`id` int(11) NOT NULL AUTO_INCREMENT,`user_id` int(11) NOT NULL,`address` longtext NOT NULL,`phone_number` varchar(32) NOT NULL,`ircnick` varchar(32) NOT NULL,`comments` longtext NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `user_id` (`user_id`)) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;
LOCK TABLES `users_userprofile` WRITE;
INSERT INTO `users_userprofile` VALUES (1,1,'','','','');
UNLOCK TABLES;