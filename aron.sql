-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: aron
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Current Database: `aron`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `aron` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `aron`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'pbkdf2_sha256$30000$4VSAaehw82H8$+zZvLTxty/ImClzZPKHFs2sFeTXO5JE+NPSkmaZ4vnQ=','2017-01-17 01:53:55',1,'admin@ocbl.ca','admin','dustin','zhang',1988,'2016-12-31 13:43:14','2017-01-05 13:15:21',1,1,'2016-12-31 13:43:14'),(2,'pbkdf2_sha256$30000$Wyv5Gf4ELCzn$qIfj5PeFItD5NZXpqqj3swZK651opLE8c1qUDZBM3Sk=','2017-01-17 01:36:14',0,'kate@ocbl.ca','kate.bright','kate','bright',1988,'2017-01-01 04:51:01','2017-01-05 13:15:35',0,1,'2017-01-01 04:51:01'),(3,'justdoit','2017-01-17 01:48:01',0,'dake@we.com','dake','dake','yu',1988,'2017-01-17 01:49:08','2017-01-17 01:54:56',1,1,'2017-01-17 01:47:41'),(4,'justdoit','2017-01-17 01:49:23',0,'martin@ocbl.ca','martin','martin','lee',1988,'2017-01-17 01:50:57','2017-01-17 01:50:57',0,1,'2017-01-17 01:49:16');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_groups`
--

DROP TABLE IF EXISTS `account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_groups_account_id_59cc89ca_uniq` (`account_id`,`group_id`),
  KEY `account_groups_group_id_a67ded22_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_groups_account_id_d9b57185_fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `account_groups_group_id_a67ded22_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_groups`
--

LOCK TABLES `account_groups` WRITE;
/*!40000 ALTER TABLE `account_groups` DISABLE KEYS */;
INSERT INTO `account_groups` VALUES (4,3,1),(2,4,1);
/*!40000 ALTER TABLE `account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_permissions`
--

DROP TABLE IF EXISTS `account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_permissions_account_id_a6d962f2_uniq` (`account_id`,`permission_id`),
  KEY `account_user_permis_permission_id_a1087168_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `account_user_permissions_account_id_5d542d01_fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `account_user_permis_permission_id_a1087168_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_permissions`
--

LOCK TABLES `account_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_permissions` DISABLE KEYS */;
INSERT INTO `account_user_permissions` VALUES (1,3,25);
/*!40000 ALTER TABLE `account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'captain'),(2,'coach');
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,26),(3,1,27);
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add account',6,'add_account'),(17,'Can change account',6,'change_account'),(18,'Can delete account',6,'delete_account'),(19,'Can add block',7,'add_block'),(20,'Can change block',7,'change_block'),(21,'Can delete block',7,'delete_block'),(22,'Can add page',8,'add_page'),(23,'Can change page',8,'change_page'),(24,'Can delete page',8,'delete_page'),(25,'Can add player',9,'add_player'),(26,'Can change player',9,'change_player'),(27,'Can delete player',9,'delete_player'),(28,'Can add team',10,'add_team'),(29,'Can change team',10,'change_team'),(30,'Can delete team',10,'delete_team');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `content` longtext,
  `locale` varchar(2) NOT NULL,
  `page_id` int(11),
  PRIMARY KEY (`id`),
  KEY `block_1a63c800` (`page_id`),
  CONSTRAINT `block_page_id_64418192_fk_page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'home_about','## About use contents\r\n\r\n- item 1\r\n- item 2','en',1),(2,'home_how_to_join','How to join block','en',1),(3,'rules_content','Please refer https://www.fiba.com/downloads/Rules/2014/Official_Basketball_Rules_2014_Y.pdf\r\n\r\nTEAM CLASSIFICATION\r\nThe League reserves the right to place any team within any division within reason to ensure full divisions. Any division champion returning for another season with five or more players from the championship roster, may be asked to advance to play in the next higher division. The last place team of the next higher division in the preceding year may be asked to drop down to fill the vacancy in the next lower division.\r\n\r\nGAME TIME\r\nThe game will start at the scheduled time. If the second or third game is going to start after the scheduled start time it will start as soon as possible as soon as a 5 minute warm up period has elapsed which starts immediately after the previous game players have cleared the playing surface. The duration of games shall be two twenty-five (25) minute straight time halves. The final 30 seconds of the first half shall be stopped time, regardless of score. The final three (3) minutes of the game shall be stopped time, unless the point differential is fifteen (15) or more points. This shall mean that under 15 points the clock is stopped and 15 points or more the clock runs continually during this final three (3) minutes of play. Stop time includes all whistles. A three (3) minute rest period shall take place at half time. Overtime shall be a three (3) minute stopped time period. A one (1) minute rest period shall take place before an overtime period. Only one overtime period will take place during the regular season.\r\n\r\nTIME OUTS\r\nEach team shall be allowed a maximum of two (2) time outs per regulation half. Each team shall be allowed one (1) time out per overtime period – time outs do not carry over into the second half or any subsequent overtime periods. Time outs may only be called on deadball situations or by the possessing team in the backcourt. No T.O. between free throws. During the last two minutes of the game or overtime period a player or coach of the team scored upon may ask for a time out after a made basket before the ball is in control of the person throwing in the ball. With less than 2 minutes remaining in the game or overtime period(s) a T.O. by a team who will be in control of the ball that is being inbounded in the backcourt will move to the designated throw in spot in the front court (sideline opposite bench, top of 3 pt arc).\r\n\r\nSUBSTITUTIONS\r\nPermitted during any stoppage of play (Men’s League Specific). Free throws situations - Prior to first shot and before ball at disposal of thrower-in following last shot if successful, or if to be followed by throw-in at mid-court.\r\n\r\nGAME START AND DEFAULTS\r\nPlayers are the team members who are legally on the floor during play. All others are considered bench personell/substitutes. Teams must have a minimum of 4 players on the court at the designated start time, or it they default the game. If both teams have 5 players on the court ready to start the game then there are no extra stipulations. If both teams have 4 players on the court to start the game and no other players show up at any time during the game, the entire game is played 4 on 4, no extra stipulations. If one of the teams then has enough players to field 5, the player can enter the game at the first subsitution opportunity and the game continues 5 on 4 however Mercy Rule Applies. If at any time prior to Mercy Rule stopping the game a 5th player shows up to play for the team with 4, the Mercy rule will no longer apply and the game will continue to conclusion. If the game starts with 5 players on one team and 4 players on the opposing team, the entire game is played 5 on 4 however Mercy Rule applies. If at any time prior to Mercy Rule stopping the game a 5th player shows up to play, the Mercy rule no longer applies and the game will continue to conclusion. Mercy Rule: the game ends when the team with 5 players has a 25 or more point lead at any time. Finishing a game with less than five (5) players does not constitute a default.\r\n\r\nA team that defaults the game shall lose two (2) points from its standings, as well as lose $100 of its default fee. A team defaulting two (2) or more games during a season may result in the suspension of that team and its players for a period of one (1) year. The Executive Committee will rule on eligibility for the next year.\r\n\r\nPOSTPONEMENTS\r\nNo Postponements shall be granted. In the case of extenuating circumstances, at least twenty-four (24) hours notice must be given to the President who will decide on these circumstances with the Executive Committee.\r\n\r\nUNIFORMS\r\nEach team must wear distinctive numbered jerseys in order to facilitate officiating. Running shoes or the equivalent must be worn. A team not having distinctive numbered jerseys after 5 games will be penalized at the start of its game with 2 foul shots and possession of the ball being granted to the opposing team. Furthermore, at the discretion of the Executive Committee, a team violating this rule beyond reasonable excuse shall default its game and lose two (2) points from its standings.\r\n\r\nIf two teams of the same Division have similar coloured jerseys thereby making it difficult to determine which players are playing for which team, it is the responsibility of the HOME TEAM to provide an alternative coloured set of jerseys when playing each other. Failure of the HOME TEAM to do so will result in the HOME TEAM being penalized at the start its game with 2 foul shots and posses ion of the ball being granted to the opposing team.\r\n\r\nBASKETBALLS\r\nThe HOME TEAM is responsible for supplying the game ball which must be leather and of good enough quality to be acceptable to the Referees.\r\n\r\nSCOREKEEPING\r\nThe Chief Scorekeeper will supply, employ, instruct, and supervise scorekeepers. The Chief Scorekeeper shall report any documented ejections or difficulties encountered in the gymnasium to the Convener and the Executive Committee at his earliest convenience. The Chief Scorekeeper shall keep an accurate account of division standings and post them to the website. The duty of the scorekeeper is to time the game and keep score. They shall ensure that the score sheet documents all ejections and difficulties encountered in the gymnasium and have the referees write and sign the report on the back of the score sheet. Scorekeepers shall stroke out the name of any player not present.\r\n\r\nREFEREES\r\nThe K-W Basketball Officials shall supply the referees. All decisions with reference to judgement calls shall be final. Referees shall document all ejections and difficulties encountered in the gymnasium on the back of the score sheet and sign their name to the report.\r\n\r\nPLAYING RULES\r\nThe playing rules shall basically be those of FIBA with those exceptions as contained in the Constitution, By-laws and Rules of the League. If the three-point line is painted on the floor, the three point shot shall be in effect. Otherwise, there is no three point shot.\r\n\r\nFREE THROWS\r\nTeam control foul = no free throw. Only one shot free throws to count as (1) , (2) or (3) depending on situation. Penalty will occur on the 7th foul of each half and are all (1) shot to count as (2). Technical Foul Free throws only one shot to count as (1) or (2) depending on situation. Maximum 5 players (3 defense, 2 offense) in designated lane spaces. Spaces do not have to be filled. Spaces are exclusive to each team. Violation by either team (excluding the shooter) is called only if free throw is unsuccessful. Violation by the free throw shooter takes precedence over other violations. Five seconds to release the try. Players in marked lanes space may move once ball is released, for other players until the ball touches the ring.\r\n\r\nTHROW INS\r\nTeam A has the ball in their front court and a turnover by violation is called against Team A. Team B will take the ball to the nearest spot (this becomes the new back court) and will inbound it. Team B is not allowed to run down the side line (officials usually give a couple of steps). The play will be blown down if subs were reported at the table prior to the turnover and the scorekeeper sounds horn. Officials will call in subs and then handle the throw in at the spot it should have been in.\r\n\r\nThe officials will handle the ball in all front court situations, all fouls situations and after all time out situations. The officials will handle the ball during the last 30 seconds of the half and 2 mintues of the game, in otherwords during all stop time play.\r\n\r\nCLOSELY GUARDED\r\nBecause of no shot clock - NFHS 5 second closely guarded rule: in the front court only 5 second count on a player holding or dribbling the ball while closely guarded. (Note: a player can hold the ball for 4 seconds then dribble the ball for 4 seconds then hold the ball for 4 seconds. Anytime the count gets to 5 a violation occurs).\r\n\r\nTECHNICALS\r\nA technical foul shall result in a two (2) shot penalty.\r\n\r\nIf a player receives two (2) technical fouls in a game, the player shall be ejected from that game. It shall be the responsibility of the referees to complete a report noting the nature of the technical and that report shall be signed by the Referees. The report shall be submitted immediately to the Executive Committee.\r\n\r\nAll fouls shall count as personal and team fouls. Any player ejected from a game is immediately suspended for the the next game, and it is the captain\'s responsibility to uphold this. Penalty for using an illegal player will consist of any games played by the player are retroactively defaulted (cost to team is $100 per default). If the illegal player is from another team in the league they are suspended from the league. The captain of the offending team will be required to attend a hearing at which further action may take place with regards to suspension, fines and or defaults. . Also, players with a history of multiple technical fouls may be reviewed by the disciplinary committee with regards to any disciplinary action.\r\n\r\nPROTESTS: Protests in triplicate shall be accepted in writing within forty-eight (48) hours of the offence by the President. The forty-eight (48) hour limit is interpreted to mean two (2) full normal working days.\r\n\r\nA fee of $50.00 must accompany the protest, which is refundable only if the protest is won. The President shall provide a copy of the protest to the opposing team and a similar forty-eight (48) hour period to provide a written defence. The Executive Committee’s decision shall be final. Protests are not acceptable on Referee’s judgement calls and must be restricted to interpretation of the Rules, player eligibility, etc..\r\n\r\nCONDUCT\r\nAll players shall conduct themselves in a sportsmanlike manner and any player ejected from a game for misconduct shall automatically be suspended for the next game. If a player is ejected from three (3) games over the course of the season for misconduct, that player shall be disqualified from further League games, including the playoffs, for the balance of the season. Further disciplinary action may be taken by the Executive Committee where deemed necessary. The onus of honouring suspensions rests with the Manager, Coach or League representative of the team involved. Use of a suspended player shall result in the default by the offending team and loss of two (2) points from its standings. The suspension shall carry over to the team’s next game.\r\n\r\nUnder extenuating circumstances the Executive Committee may also overrule a suspension and allow a suspended player to play in the next game provided a properly filed protest has been submitted on behalf of the suspended player. (ie: Certain obscure rules may require a technical to be called without there having been any player misconduct.)\r\n\r\nSCHEDULES\r\nThe schedule commences about the first week of October, with a Practice Scrimmage for teams the week before, with Playoffs starting in April. Each team receives 20 regular season games. Teams play once a week either Tues, Wed, or Thur nights (the night is usually consistent throughout the year) with game times being anywhere from 7pm - 9:30pm start times. Location and days may change from time to time due to variations in the availability of the facilities.\r\n\r\nMISCELLANEOUS\r\nAll areas of the schools are out of bounds except for gymnasiums, dressing rooms, and washrooms. ENTRY DOORS ARE NOT TO BE PROPPED OPEN. A door monitor shall be provided at each location where necessary to allow access to the gymnasium.\r\n\r\nValuables are the player’s own responsibility. It is suggested that valuables not be left in clothing as dressing room doors are not locked.\r\n\r\nSchool regulations do not allow smoking or alchoholic beverages on the premises, which includes all school property boundaries. Any team or players caught doing so will be suspended for at least the balance of the current season.\r\n\r\nThe scorekeeper is in charge overall for the night’s activity in the gymnasium. For example, the scorekeeper is responsible for clearing the gymnasium.','en',2),(4,'terms_content','<h3>Terms</h3>\r\n  \r\n  <h4>No Unlawful or Prohibited Use</h4>\r\n<p><small>\r\nAs a condition of your use of this Web site, you warrant to ocbl.ca that you will not use this Web site for any purpose that is unlawful or prohibited by these terms, conditions, and notices. If you violate any of these terms, your permission to use the Web site automatically terminates.\r\n</small></p>\r\n\r\n<h4>Liability Disclaimer</h4>\r\n\r\n<p><small>You use this Web site at your own risk.  The information published on this web site may include inaccuracies or typographical errors. Changes are periodically added to the information herein. ocbl.ca  may have improvements and/or changes in this web site at any time without notice.</small></p>','en',3),(5,'privacy_content','<h3>Privacy Policy</h3>\r\n  <p><small>Thank you for visiting the Ontario Chinese Basketball League (OCBL) website. OCBL is committed to maintaining the privacy of our visitors in the way we collect, store and use information about them.</small></p>\r\n\r\n  <h4>Links</h4>\r\n	<p><small>The Ontario Chinese Basketball League web site contains links and references to other people’s work. Please be aware that the Ontario Chinese Basketball League is not responsible in any way for the privacy practices of external sites.</small></p>	\r\n	\r\n<h4>Collection of information</h4>\r\n<p><small>Depending on the section of the site you are visiting, you may be asked to provide personal information, such as your name, an email address or to provide feedback. Personal information provided to Ontario Chinese Basketball League will be used only for the purpose for which it has been provided (e.g. organize seasonal games), unless you have consented for it to be used otherwise. Internet access information, including access trends and general demographic information may be collected indirectly for the purpose of evaluation.</small></p>','en',4);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_id` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-01-02 03:16:13','2','kate@ocbl.ca',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',6,1),(2,'2017-01-03 12:40:52','1','home',1,'[{\"added\": {}}]',8,1),(3,'2017-01-03 12:41:16','2','rules',1,'[{\"added\": {}}]',8,1),(4,'2017-01-03 12:41:23','3','terms',1,'[{\"added\": {}}]',8,1),(5,'2017-01-03 12:41:31','4','policy',1,'[{\"added\": {}}]',8,1),(6,'2017-01-03 12:42:28','4','privacy',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',8,1),(7,'2017-01-03 12:43:36','1','home_about',1,'[{\"added\": {}}]',7,1),(8,'2017-01-03 12:44:05','2','home_how_to_join',1,'[{\"added\": {}}]',7,1),(9,'2017-01-03 12:56:53','3','rules_content',1,'[{\"added\": {}}]',7,1),(10,'2017-01-03 12:57:42','4','terms_content',1,'[{\"added\": {}}]',7,1),(11,'2017-01-03 12:58:11','5','privacy_content',1,'[{\"added\": {}}]',7,1),(12,'2017-01-05 13:15:21','1','admin@ocbl.ca',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(13,'2017-01-05 13:15:35','2','kate@ocbl.ca',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(14,'2017-01-14 14:14:54','1','home_about',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(15,'2017-01-14 14:24:20','1','home_about',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(16,'2017-01-17 01:48:36','1','player',1,'[{\"added\": {}}]',3,1),(17,'2017-01-17 01:49:08','3','dake@we.com',1,'[{\"added\": {}}]',6,1),(18,'2017-01-17 01:50:13','2','coach',1,'[{\"added\": {}}]',3,1),(19,'2017-01-17 01:50:57','4','martin@ocbl.ca',1,'[{\"added\": {}}]',6,1),(20,'2017-01-17 01:51:21','1','captain',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',3,1),(21,'2017-01-17 01:52:32','3','dake@we.com',2,'[]',6,1),(22,'2017-01-17 01:53:07','3','dake@we.com',2,'[]',6,1),(23,'2017-01-17 01:54:33','3','dake@we.com',2,'[]',6,1),(24,'2017-01-17 01:54:56','3','dake@we.com',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',6,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','account'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'content','block'),(8,'content','page'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(9,'team','player'),(10,'team','team');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-12-31 13:40:15'),(2,'contenttypes','0002_remove_content_type_name','2016-12-31 13:40:15'),(3,'auth','0001_initial','2016-12-31 13:40:17'),(4,'auth','0002_alter_permission_name_max_length','2016-12-31 13:40:18'),(5,'auth','0003_alter_user_email_max_length','2016-12-31 13:40:18'),(6,'auth','0004_alter_user_username_opts','2016-12-31 13:40:18'),(7,'auth','0005_alter_user_last_login_null','2016-12-31 13:40:18'),(8,'auth','0006_require_contenttypes_0002','2016-12-31 13:40:18'),(9,'auth','0007_alter_validators_add_error_messages','2016-12-31 13:40:18'),(10,'auth','0008_alter_user_username_max_length','2016-12-31 13:40:18'),(11,'accounts','0001_initial','2016-12-31 13:40:20'),(12,'admin','0001_initial','2016-12-31 13:40:21'),(13,'admin','0002_logentry_remove_auto_add','2016-12-31 13:40:21'),(14,'sessions','0001_initial','2016-12-31 13:40:21'),(15,'content','0001_initial','2017-01-02 14:52:59'),(16,'content','0002_auto_20170105_1310','2017-01-05 13:10:47'),(17,'content','0003_auto_20170105_1330','2017-01-05 13:30:35'),(18,'team','0001_initial','2017-01-15 15:26:49');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('67u741n5srcgnfuoa17lbdgjestxplo8','ZDliNzI3ZGFhYzhjOWFhMGIwMGVhNDU3M2VjMjRiZmQ5ZTA2N2VjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyNzg3ZDQ2ZDhmMzdjOTE2MzIxZmMyYzgxOWJiYWY5Y2MwNzExM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-01-31 01:36:14'),('7kqdpumoa75906lkj2ui3w4ge09f1acl','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-15 05:02:22'),('9egnnfaiaca4szoxxq4ostjakre64v5s','ZDliNzI3ZGFhYzhjOWFhMGIwMGVhNDU3M2VjMjRiZmQ5ZTA2N2VjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyNzg3ZDQ2ZDhmMzdjOTE2MzIxZmMyYzgxOWJiYWY5Y2MwNzExM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-01-16 03:29:04'),('bhpa8udd0xzrwue83jh762yh5z8o70le','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-14 13:47:09'),('bij6njl32995r896vua9h96n5ele626a','ZDliNzI3ZGFhYzhjOWFhMGIwMGVhNDU3M2VjMjRiZmQ5ZTA2N2VjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyNzg3ZDQ2ZDhmMzdjOTE2MzIxZmMyYzgxOWJiYWY5Y2MwNzExM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-01-16 03:16:37'),('crmb9ijye5j1rr5iq3lpds1huxqcvu63','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-31 01:47:10'),('j44n3e8p3r5qe1apim0vcm7twnurabln','ZDliNzI3ZGFhYzhjOWFhMGIwMGVhNDU3M2VjMjRiZmQ5ZTA2N2VjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyNzg3ZDQ2ZDhmMzdjOTE2MzIxZmMyYzgxOWJiYWY5Y2MwNzExM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-01-16 03:17:09'),('pg40i5sfeo6ykyu6a2jf6ew5w2l2x8k5','ZDliNzI3ZGFhYzhjOWFhMGIwMGVhNDU3M2VjMjRiZmQ5ZTA2N2VjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEyNzg3ZDQ2ZDhmMzdjOTE2MzIxZmMyYzgxOWJiYWY5Y2MwNzExM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-01-16 03:17:09'),('qcxvefhyid7a6i49ebkaxrr6w1xew1w8','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-16 03:08:20'),('vwzq3lgu47glhlwcr708zp80i1kqj3dk','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-28 19:53:08'),('wz0yi8mhzsmxhefbej2yrnv7mlctszv4','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-31 01:53:55'),('xb6s1nubn7sxlozl7goa6vvceuamf8la','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-28 14:14:20'),('xf0biznpkmo9tqptpajelyuetao7u1ok','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-14 14:36:40'),('z5j902nqbunef8pdw11quofo0xdxxvlm','YmMzMDFmNjlkMjVjYzVlYzk5MGFiNThkYWRiZWZmODBlYmNlNzc5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmVjNTlmZThiNzFiNDkzM2RiYWY3MTc5MTY1YWMzM2RhNTNjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-14 14:56:37');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'home'),(4,'privacy'),(2,'rules'),(3,'terms');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `number` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `team_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `player_f6a7ca40` (`team_id`),
  CONSTRAINT `player_account_id_60dfb015_fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `player_team_id_84ef9586_fk_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16 21:34:01
