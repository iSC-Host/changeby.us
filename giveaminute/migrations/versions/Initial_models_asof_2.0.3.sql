-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cbu
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `badwords`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kill_words` text,
  `warn_words` text,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badwords`
--

LOCK TABLES `badwords` WRITE;
/*!40000 ALTER TABLE `badwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `badwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beta_invite_code`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beta_invite_code` (
  `code` char(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beta_invite_code`
--

LOCK TABLES `beta_invite_code` WRITE;
/*!40000 ALTER TABLE `beta_invite_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `beta_invite_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beta_invite_request`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beta_invite_request` (
  `beta_invite_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `comment` text,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`beta_invite_request_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beta_invite_request`
--

LOCK TABLES `beta_invite_request` WRITE;
/*!40000 ALTER TABLE `beta_invite_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `beta_invite_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direct_message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direct_message` (
  `direct_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `message` text,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`direct_message_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direct_message`
--

LOCK TABLES `direct_message` WRITE;
/*!40000 ALTER TABLE `direct_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `direct_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_user` (
  `facebook_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_user`
--

LOCK TABLES `facebook_user` WRITE;
/*!40000 ALTER TABLE `facebook_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_project`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_project` (
  `ordinal` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ordinal`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_project`
--

LOCK TABLES `featured_project` WRITE;
/*!40000 ALTER TABLE `featured_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idea`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idea` (
  `idea_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL DEFAULT '-1',
  `submission_type` enum('web','sms','email') NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `num_flags` smallint(6) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idea_id`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idea`
--

LOCK TABLES `idea` WRITE;
/*!40000 ALTER TABLE `idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `mirrored` tinyint(1) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `app` (`app`),
  KEY `mirrored` (`mirrored`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `keyword` varchar(25) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`keyword`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  `lon` decimal(9,6) NOT NULL,
  `borough` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `keywords` text,
  `num_flags` smallint(6) NOT NULL DEFAULT '0',
  `is_official` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project__idea`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project__idea` (
  `project_id` int(11) NOT NULL,
  `idea_id` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`idea_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project__idea`
--

LOCK TABLES `project__idea` WRITE;
/*!40000 ALTER TABLE `project__idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `project__idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project__project_resource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project__project_resource` (
  `project_id` int(11) NOT NULL,
  `project_resource_id` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`project_resource_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project__project_resource`
--

LOCK TABLES `project__project_resource` WRITE;
/*!40000 ALTER TABLE `project__project_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `project__project_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project__user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project__user` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_project_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`user_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project__user`
--

LOCK TABLES `project__user` WRITE;
/*!40000 ALTER TABLE `project__user` DISABLE KEYS */;
/*!40000 ALTER TABLE `project__user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_endorsement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_endorsement` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`user_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_endorsement`
--

LOCK TABLES `project_endorsement` WRITE;
/*!40000 ALTER TABLE `project_endorsement` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_endorsement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_goal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_goal` (
  `project_goal_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `time_frame_numeric` int(11) DEFAULT NULL,
  `time_frame_unit` enum('day','week','month') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_accomplished` tinyint(1) NOT NULL DEFAULT '0',
  `num_flags` smallint(6) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_goal_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_goal`
--

LOCK TABLES `project_goal` WRITE;
/*!40000 ALTER TABLE `project_goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_invite`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_invite` (
  `project_invite_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `inviter_user_id` int(11) NOT NULL,
  `invitee_idea_id` int(11) DEFAULT NULL,
  `invitee_user_id` int(11) DEFAULT NULL,
  `invitee_email` int(11) DEFAULT NULL,
  `accepted_datetime` timestamp NULL DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_invite_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_invite`
--

LOCK TABLES `project_invite` WRITE;
/*!40000 ALTER TABLE `project_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_leader`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_leader` (
  `user_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_leader`
--

LOCK TABLES `project_leader` WRITE;
/*!40000 ALTER TABLE `project_leader` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_leader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_link`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_link` (
  `project_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `num_flags` smallint(6) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_link_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_link`
--

LOCK TABLES `project_link` WRITE;
/*!40000 ALTER TABLE `project_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_message` (
  `project_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `message_type` enum('member_comment','admin_comment','goal_achieved','join','endorsement') DEFAULT NULL,
  `idea_id` int(11) DEFAULT NULL,
  `project_goal_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `num_flags` smallint(6) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_message_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_message`
--

LOCK TABLES `project_message` WRITE;
/*!40000 ALTER TABLE `project_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_resource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_resource` (
  `project_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_user_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `keywords` text,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_official` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_resource_id`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_resource`
--

LOCK TABLES `project_resource` WRITE;
/*!40000 ALTER TABLE `project_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_feedback`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_feedback` (
  `site_feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `submitter_name` varchar(100) DEFAULT NULL,
  `submitter_email` varchar(100) DEFAULT NULL,
  `comment` text,
  `is_responded` tinyint(1) NOT NULL DEFAULT '0',
  `responded_user_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_feedback_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_feedback`
--

LOCK TABLES `site_feedback` WRITE;
/*!40000 ALTER TABLE `site_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_stopped_phone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_stopped_phone` (
  `phone` varchar(10) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phone`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_stopped_phone`
--

LOCK TABLES `sms_stopped_phone` WRITE;
/*!40000 ALTER TABLE `sms_stopped_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_stopped_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_user` (
  `twitter_id` int(11) NOT NULL,
  `twitter_username` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `twitter_id` (`twitter_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_user`
--

LOCK TABLES `twitter_user` WRITE;
/*!40000 ALTER TABLE `twitter_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unauthenticated_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unauthenticated_user` (
  `auth_guid` char(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`auth_guid`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unauthenticated_user`
--

LOCK TABLES `unauthenticated_user` WRITE;
/*!40000 ALTER TABLE `unauthenticated_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `unauthenticated_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_key` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `full_display_name` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `affiliation` varchar(100) DEFAULT NULL,
  `group_membership_bitmask` tinyint(1) NOT NULL DEFAULT '1',
  `is_oncall` tinyint(1) NOT NULL DEFAULT '0',
  `email_notification` enum('none','digest') NOT NULL DEFAULT 'digest',
  `last_account_page_access_datetime` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user__user_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__user_group` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__user_group`
--

LOCK TABLES `user__user_group` WRITE;
/*!40000 ALTER TABLE `user__user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user__user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_session`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_session` (
  `session_id` char(128) NOT NULL,
  `atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_session`
--

LOCK TABLES `web_session` WRITE;
/*!40000 ALTER TABLE `web_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `files`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `descriptions` text,
  `mirrored` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 COMMENT='File descriptions';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-12 16:45:24
