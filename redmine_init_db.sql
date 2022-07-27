-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: redmine
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-07-13 10:41:46.167625','2022-07-13 10:41:46.167625');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `container_id` int DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` bigint NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(64) NOT NULL DEFAULT '',
  `downloads` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  KEY `index_attachments_on_disk_filename` (`disk_filename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text,
  `timeout` int DEFAULT NULL,
  `verify_peer` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `topics_count` int NOT NULL DEFAULT '0',
  `messages_count` int NOT NULL DEFAULT '0',
  `last_message_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `changeset_id` int NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int NOT NULL,
  `parent_id` int NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changesets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repository_id` int NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int NOT NULL,
  `issue_id` int NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  KEY `index_changesets_issues_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `content` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_enumerations`
--

DROP TABLE IF EXISTS `custom_field_enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_enumerations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_field_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_enumerations`
--

LOCK TABLES `custom_field_enumerations` WRITE;
/*!40000 ALTER TABLE `custom_field_enumerations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int DEFAULT NULL,
  `max_length` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'IssueCustomField','Issue Category','list','---\n- Software\n- Hardware\n- Support\n- Syncing\n- Power\n- Network/Connectivity\n- Finance and Administration\n','',NULL,NULL,1,1,1,1,1,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: \'\'\nedit_tag_style: \'\'\n','The category e.g network for which an issue belongs'),(2,'IssueCustomField','District','list','---\n- Balaka\n- Blantyre\n- Chikwawa\n- Chiradzulu\n- Chitipa\n- Dedza\n- Dowa\n- Karonga\n- Kasungu\n- Likoma\n- Lilongwe\n- Machinga\n- Mangochi\n- Mchinji\n- Mulanje\n- Mwanza\n- Mzimba\n- Neno\n- Nkhata Bay\n- Nkhotakota\n- Nsanje\n- Ntcheu\n- Ntchisi\n- Phalombe\n- Rumphi\n- Salima\n- Thyolo\n- Zomba\n','',NULL,NULL,1,1,1,2,1,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: \'\'\nedit_tag_style: \'\'\n','District where an issue was observed'),(3,'IssueCustomField','Health Facility','list','---\n- All facilities\n- A-C Opticals\n- ABC Comm. Hospital\n- AC Opticals Lilongwe Shopping Mall\n- AC Opticals Old Town Mall\n- AHI Clinic\n- AMECA (Chilaweni)\n- ARMY\n- Achikondi Women Community Friendly Services Clinic\n- Adventist Health Centre Area 14\n- Adventist Health Centre Area 15\n- Africa Leaf Clinic Kanengo\n- Airwing Dispensary\n- Airwing Health Post\n- Akasale Private Clinic\n- Alinafe Community Hospital\n- Alinafe Private\n- Alinafe Private Clinic\n- Alliance One Clinic\n- Alumenda Estate Clinic\n- Alumenda Health Centre\n- Amalika Dispensary\n- Amitofo Health care centre\n- Anchor Farm\n- Aquid Lifeline Project\n- Area 18 Health Centre\n- Area 18 Medi Clinic\n- Area 24 Private Clinic\n- Area 25 BLM\n- Area 25 Health centre\n- Area 30 Police Clinic\n- Area 36 Living Waters Clinic\n- Arthur  Garden\n- Asante Private Clinic\n- Asimec Clinic\n- Assalam Clinic\n- Atupele Community Hospital\n- Atupele Pvt Clinic\n- Auction Holdings\n- Auction Holdings Clinic\n- Auctions Holdings\n- Ayali\n- BLM Bvumbwe Clinic\n- BLM Falls Estate Clinic\n- BLM Kawale 1 Clinic\n- BLM Liwonde Clinic\n- BLM Lunzu\n- BLM Mchinji Clinic\n- BLM Midima Clinic\n- BLM Mponela Clinic\n- BLM Mzimba Clinic\n- BLM Mzuzu  Clinic\n- BLM Ntcheu Clinic\n- Balaka Blm Clinic\n- Balaka District Hospital\n- Balaka Dream Clinic\n- Balaka Private Clinic\n- Bamuzi Post\n- Banda, Boniface An. N., Maziko\n- Bangwe\n- Bangwe BLM\n- Banja La Mstogolo (BLM) Nkhata\n- Banja La Mtsogolo Clinic\n- Banzi\n- Baptist Medical Clinic\n- Bayani\n- Baylor Childrens Centre Of Excellence In Malawi\n- Beit Cure International\n- Beleu Health Centre\n- Bello\n- Belton Kapyepye Memorial\n- Bembeke Health Centre\n- Benga Health Centre\n- Bernald Kachale\n- Bethsaida Hospital\n- Bhuptani, Girishkumar C.\n- Bilal Islamic Clinic\n- Bilila Health Centre\n- Biliwiri Health Cnetre\n- Billy Riordan Memorial Dispensary\n- Bimbi Health Centre\n- Blantyre Adventist Hospital\n- Blantyre Civic Centre\n- Blantyre DHO Pharmarcy\n- Blantyre Dream Project (Mandala)\n- Blantyre Water Board  - Walkers\n- Blantyre Water Board - Mudi\n- Blessings Hospital\n- Bliss Private Clinic\n- Bloomfield\n- Bolero Rural Hospital\n- Bondo Health Centre\n- Boulos, Maher Eskander. Amoun\n- Bowa, Labarson B. Kapiri Priva\n- Bowe Health Centre\n- Bua Health Centre\n- Bula Health Centre\n- Bulala Health Centre\n- Buleya\n- Buli\n- Bunda College Clinic\n- Bvumbwe Clinic - Limbe Muslim Jamat\n- Bvumbwe Health Centre\n- Bvumbwe Makungwa Health Centre\n- Bwaila Hospital\n- Bwanje Health Centre\n- Bwengu Health Centre\n- Bwese\n- CCK Health Clinic\n- CHAPUSA\n- CHIMBIRA\n- CHIMWAWA\n- CHIPOLONGA\n- CHISUWI\n- CHITUNDU\n- Care Medical Centre, Mtambo, M\n- Care PolyClinic Cross Roads\n- Care Private Clinic, Mphenzi,\n- Carlsberg / Sobo  Blantyre\n- Carlsberg / Sobo Clinic Lilong\n- Central 3 Clinic\n- Central East African Railways\n- Central Health Clinic Area 47\n- Chabuka Private Clinic\n- Chadza Health Centre\n- Chagoma\n- Chagunda Health Centre\n- Chakhaza Health Centre\n- Chamama Health Centre\n- Chamba Dispensary\n- Chamba Health Centre\n- Chambe Health Centre\n- Chambo Health Centre\n- Champiti Health Centre\n- Chamwabvi Health Centre\n- Chancellor College\n- Chang\'Ambika Health Centre\n- Changalume Barracks\n- Changata Health Centre\n- Chankhungu Health Centre\n- Chanza, Edwin, Erapecha Clinic\n- Chapananga Health Centre\n- Chapola\n- Chapwaila Health Centre\n- Charity Fellium Private Maternity Clinic\n- Chavala\n- Chawani\n- Chendo\n- Chesamu Health Centre\n- Chete, Tenace D B. Chagogo Pri\n- Chezi Mission Hospital\n- Chibanja Private Clinic, Mtika\n- Chibathi\n- Chichiri Escom\n- Chichiri Prison\n- Chididi Health Centre\n- Chiendausiku Health Centre\n- Chifundo, Monje\n- Chifunga Health Centre\n- Chigeli\n- Chigodi Health Centre\n- Chigomezgo Private Clinic\n- Chigumula\n- Chihepusha\n- Chikande Health Centre\n- Chikangawa Health Centre\n- Chikole Health Centre\n- Chikowa\n- Chikowa Dispensary\n- Chikowa Health Centre\n- Chikuli\n- Chikumbutso Private Clinic, Ng\n- Chikuse Health Centre\n- Chikutu\n- Chikwawa District Hospital\n- Chikweo Health Centre\n- Chikwina Health Centre\n- Chilamba\n- Chilambwe Health Centre\n- Chilani\n- Child Legacy\n- Children of Blessings\n- Chileka\n- Chileka Health Centre\n- Chileka SDA\n- Chilengo\n- Chilewani, Billy B. K. Gift of\n- Chilinda\n- Chilinde Health Services\n- Chilingwe\n- Chilipa Health Centre\n- Chilobwe\n- Chilobwe/Majiga Health Centre\n- Chilomoni\n- Chilomoni BLM\n- Chilonga Health care\n- Chilukwa\n- Chilumba Barracks\n- Chilumba Rural Hospital\n- Chimaliro Health Centre\n- Chimango, Amon B. Ali Private\n- Chimatiro\n- Chimbalanga Health Centre\n- Chimembe\n- Chimoto Health Centre\n- Chimvu\n- Chimwala Clinic\n- Chimwankango Health Post\n- Chimwemwe Private Clinic\n- Chinamwali Private Clinic\n- Ching\'Oma Health Post\n- Chingadzi Rural Hospital\n- Chingale Health Centre\n- Chinguluwe Health Centre\n- Chinguma\n- Chinjovu\n- Chinkhwiri Health Centre\n- Chinsapo Clinic\n- Chinsasu\n- Chintcheche Rural Hospital\n- Chinthembwe Health Centre\n- Chinyama -KU030\n- Chinyama Health Centre\n- Chiole Clinic\n- Chiosya Health Centre\n- Chipho Health Centre\n- Chiphwanya Health Centre (St.\n- Chipini Rural Hospital\n- Chipoka Health Centre\n- Chiponde Dispensary\n- Chipulumutso Private Clinic, K\n- Chipumi Health Centre\n- Chipwera\n- Chiradzulu District Hospital\n- Chirani\n- Chirimba\n- Chiringa Maternity\n- Chiringa Rural Hospital\n- Chirwa, Patrick W. Lilongwe  P\n- Chisala Health Centre\n- Chisambo Estate Clinic\n- Chisenga\n- Chisepo Health Centre\n- Chisi Island\n- Chisimuka Health Centre\n- Chisinga Dispensary\n- Chisitu Health Centre\n- Chisoka Health Centre\n- Chisunga\n- Chitala Health Centre\n- Chitawira Private\n- Chitedze Health Centre\n- Chitekesa Health Centre\n- Chitekwele\n- Chitera Health Centre\n- Chitete, Alex . St. Alex Priva\n- Chithandizo Private Clinic\n- Chithebe Health Centre\n- Chitheka Health Centre\n- Chithumba Health Centre\n- Chitimba Health Centre\n- Chitipa District Hospital\n- Chitowo Health Centre\n- Chiumbangame Dispensary\n- Chiunda Dispensary\n- Chiunjiza Health Centre\n- Chiwamba Health Centre\n- Chiwambo, Kinwell JBT Kanandi\n- Chiwe Health Centre\n- Chiweta\n- Chiza Private Clinic, Dube, Wy\n- Chizimba, Richard M. Vizimba P\n- Chizolowondo Health Centre\n- Chizumulu\n- Chololo\n- Choma Health Centre\n- Chombe Estate Dispensary\n- Chonde Health Centre\n- Chonde, Numeri G. Malakia Priv\n- Chongoni College of Forestry D/Health Center\n- Chulu Health Centre\n- City Assembly Health\n- City Centre Clinic\n- City Clinic Zomba\n- Cobbe Barracks\n- Codachom NGO\n- Comfort Clinic\n- Compassionate Mission Clinic\n- Cross Roads Dental Clinic\n- Cumnock Private Clinic\n- DMI-St. John the Baptist University Clinic\n- Daeyang Luke Hospital\n- Dalirani\n- Dalitso Private Clinic\n- Dambe\n- David Gordon Memorial\n- David Livingstone Memorial Cli\n- Dawn Private\n- De Johnstone, maria I.M\n- Dedza BLM\n- Dedza District Hospital\n- Demula\n- Dental Studio-Zomba Clinic\n- Diamphwe Health Centre\n- Dickson Health Centre\n- Discovery Medi Clinic\n- District Health Office Mobile\n- Dolo Health Centre\n- Domasi College Clinic\n- Domasi Rural Hospital\n- Dopa Private Clinic\n- Doviko Health Centre\n- Dowa District Hospital\n- Dr AQA Ghumra\n- Dr Chilemba Surgery\n- Dr G M Lorgat\n- Dr Musachi\'s Surgery\n- Dr. Dzinyemba\n- Dr. Kidys\n- Dr. S. Kampondeni\n- Dwambazi Rural Hospital\n- Dwangwa BLM\n- Dwangwa Cane Grower Ltd Clinic\n- Dwangwa Dispensary/Health Center\n- Dzabwa\n- Dzalanyama/Kapombeza\n- Dzaleka Health Centre\n- Dzenje Health Centre\n- Dzenza Health Centre\n- Dzimbiri Health Centre (DiDi)\n- Dzimbiri Health Post\n- Dzindevu Health Centre\n- Dziwe\n- Dzonzi Mvai Dispensary\n- Dzoole Health Centre\n- Dzunje Health Centre\n- Ebenezar\n- Edingeni Health Centre\n- Ehehieni  Dispensary\n- Ekhamuno\n- Ekwaiweni Dispensary\n- Ekwendeni Mission Hospital\n- El-Barakah\n- Eldorado Estate Clinic\n- Elim\n- Embangweni Mission Hospital\n- Emfeni Health Centre\n- Emsizini Health Centre\n- Endindeni Health Centre\n- Engucwini Health Centre\n- Enukweni Health Centre\n- Escom Clinic Lilongwe\n- Escom, Mzuzu\n- Esparanza Estate Clinic\n- Euthini Rural Hospital\n- Eva Demaya Private Clinic\n- FIDELITY PVT\n- FPAM Clinic\n- Family Health\n- Family Health Private Clinic\n- Family Planning Association Of\n- FamilyPlanning Association of Malawi\n- FamilyPlanning Association of Malawi Clinic\n- Fancy Private Clinic\n- Fanuel Dispensary\n- Fomo Clinic\n- Fpam Clinic\n- Fransisco Palau Rural Hospital/Mtengowanthenga Dream Project\n- Fulirwa Health Centre\n- GM Opticals\n- Gaga Health Centre\n- Gama, Samuel, Kachi Private Cl\n- Ganya Health Centre\n- Gate Way\n- Gatrad, Mahomed I\n- Gawanani Health Centre\n- Gika Private Clinic\n- Ginnery Corner BLM\n- Girach, Bilkis A\n- Glenorchy Estate Clinic\n- Gobede, Kalimanjira J. Chizika\n- God Heals\n- Gogo Leya Private Clinic\n- Gogode Dispensary\n- Gola\n- Golomoti Health Centre\n- Gombe\n- Gonthaminga\n- Good Health Private Clinic\n- Good Hope Private Clinic\n- Gotha Dispensary\n- Gotha Estate Clinic\n- Gowa Health Centre\n- Gowoka\n- Greenlight Clinic\n- Gumba Health Post\n- Gwaza, George R. Good Hope pri\n- H Parker Sharp Dispensary\n- Halena Oakely/Mtambanyama Clin\n- Hara Health Centre\n- Hasco\n- Healing Hearts\n- Henred\n- Hiwa, Garfield J. Monekera Pri\n- Hiwa, Snowden S. S S H Clinic\n- Hoho Health Centre\n- Holy Family Hospital\n- Hope Medical centre\n- Hope Village\n- Hope Village Clinic\n- Howa, David A C. Area 36 Priva\n- Hunger Clinic\n- ITES Medical Clinic\n- Iba Dispensary\n- Ifumbo Health Centre\n- Ighughu\n- Illovo Factory Estate Clinic - Nchalo\n- Internals Private Clinic\n- Iponga Health Centre\n- Itulo\n- Iyela\n- Jalasi Health Centre\n- Jalawe Health Centre\n- Jenda Health Centre\n- Jeofia\n- Jere, Raymond M. Medicare\n- Jti Leaf Clinic Kanengo\n- Jumpha Private Clinic\n- KTFT/Mziza Health Centre\n- Kabota, Nathaniel S. Mt. Nkhom\n- Kabudula Rural Hospital\n- Kabuwa Health Centre\n- Kabwafu Health Centre\n- Kachepa, Stephen J. Kama Priva\n- Kachere Clinic\n- Kachere Health Centre\n- Kachere Rehabilitation Centre\n- Kachi Pvt Clinic - Area 18A\n- Kachindamoto\n- Kadango Dispensary\n- Kadango Health Centre\n- Kadidi\n- Kafere Health Centre\n- Kafodya, Charles M. Mpumulo Pr\n- Kafukule Health Centre\n- Kaigwazanga Health Centre\n- Kakoma Health Centre\n- Kalemba Community Hospital\n- Kalembo Health Centre\n- Kalikene Private Clinic\n- Kalikumbi Health Centre\n- Kalimanjira\n- Kalinde Health Centre\n- Kalira\n- Kaliwo, Ignacious S. Luchenza\n- Kaloga Maternity\n- Kalong - Limbe\n- Kalulu Health Centre\n- Kalulu Health Centre, Chikwawa\n- Kaluluma Rural Hospital\n- Kamalizeni, Joe N. Tachira Pri\n- Kamanda\n- Kamanga, Lester P, Hossana Pri\n- Kamatenda Private Clinic\n- Kambanizithe\n- Kambenje Health Centre\n- Kambilonjo Private Clinic\n- Kambiya, Paulino A M. Demera P\n- Kamboni Health Centre\n- Kameme Health Centre\n- Kamiza, Mary Z. Kim\'s Medical\n- Kampanje Health Centre\n- Kamphata Health Post\n- Kamphoni\n- Kampini\n- Kamsonga Health Centre\n- Kamteteka Health Centre\n- Kamuzu Academy Clinic\n- Kamuzu Barracks Hospital\n- Kamuzu Central Hospital\n- Kamwe Health Centre\n- Kamwendo\n- Kaname/Mdeza Dispensary/Health Center\n- Kande Health Centre\n- Kandeu Health Centre\n- Kanengo Tobacco Processors Cli\n- Kang\'oma Health Centre\n- Kangolwa Health centre\n- Kanjedza Medical centre\n- Kanjedza Police\n- Kankao Health Centre\n- Kanyama Health Centre\n- Kanyenjere\n- Kanyerere\n- Kanyerere, Stuart. Stuka Priva\n- Kanyezi Health Centre\n- Kanyika, Mwakalinga M. Alinafe\n- Kanyimbi Health Post\n- Kaongozi Dispensary\n- Kapanga Health Centre\n- Kapangamawe\n- Kapelula Health Centre\n- Kapenda Health Centre\n- Kapeni Clinic - Project Malawi\n- Kapeni Dream Centre\n- Kapeni Health Centre\n- Kaphatenga Health Centre\n- Kaphuka Health Centre\n- Kapichira Escom Clinic\n- Kapili Health Centre\n- Kapire Dream Centre\n- Kapire Health Centre\n- Kapiri\n- Kapoka\n- Kaporo Rural Hospital\n- Kaputalambwe\n- Kapyanga Health Post\n- Karonga BLM\n- Karonga District Hospital\n- Karopa\n- Kasalika Health Centre\n- Kasalika Private Clinic, Chimb\n- Kasamba\n- Kasambala Private Clinic\n- Kasasa Clinic\n- Kasembeleka\n- Kasembereka Estate Clinic\n- Kasese/Lifeline Malawi Health\n- Kaseye Mission Hospital\n- Kasina Health Centre\n- Kasinje Health Centre\n- Kasinthula Dispensary\n- Kasitu Health Centre\n- Kasmani, Mohamed I M. Hasani M\n- Kasoba Health Centre\n- Kasonkhwe\n- Kasungu BLM\n- Kasungu District Hospital\n- Kasungu Engineers Battalion\n- Kasungu Prison\n- Kaswavipindi private Clinic\n- Katawa Clinic\n- Katchale Health Centre\n- Katema Health Centre\n- Katemela Clinic\n- Katete Community Hospital\n- Katimbira Health Centre\n- Katiri Health Center\n- Katope\n- Katowo Rural Hospital\n- Katsekera Health Centre\n- Katuli Health Centre\n- Katutula\n- Kaundu Health Centre\n- Kavukuku\n- Kavuzi Clinic\n- Kavuzi Clinic - Kawalazi Estate Clinic\n- Kavuzi New Cummock Clinic - Kajalire CCAP\n- Kawalazi Estate Clinic\n- Kawale Health Centre\n- Kawale Medical Services\n- Kawamba Health Centre\n- Kaweche Health Centre\n- Kawinga Dispensary\n- Kayelekela\n- Kayembe Health Centre\n- Kayumba, Jerome. Tulame Privat\n- Kazyozyo Health Post\n- Khama Private Clinic\n- Khamalathu Private Clinic\n- Kharodia, Ahmed I.\n- Khaya\n- Khokhwa\n- Khola Health Centre\n- Khombedza Health Centre\n- Khondowe\n- Khongoloni\n- Khongoni Health Centre\n- Khonje, Anaclate P, Twapochele\n- Khonjeni Health Centre\n- Khosolo Health Centre\n- Khuoge, Dane\n- Khuwi Health Centre\n- Kim\'s Medical Centre\n- Koche Community Hospital\n- Kochilira Rural Hospital\n- Kopakopa\n- Kotecha Leesha D.\n- Kubalalika Health Post\n- Kukalanga Dispensary\n- Kumadzi Dispensary\n- Kumadzi Estate Clinic\n- Kunenekude Health Centre\n- Kwambukwa Private Clinic, Mbuk\n- Kwataine Dispensary\n- Kwitanda Health Centre\n- LIKHONYOWA\n- Lafarge Cement\n- Lake View Health Centre\n- Lambulira Health Centre\n- Lauderdale Estate Clinic\n- Lemwe Health Centre\n- Lengwe Estate Clinic\n- Life Line Medical Clinic - Kasese\n- Life Line Medical Clinic - Ngozi\n- Lifeline Health Centre\n- Lifune Maternity\n- Lifupa Dispensary\n- Lifuwu Health Centre\n- Lighthouse Clinic\n- Ligowe Health Centre\n- Likanga Estate Clinic\n- Likangala Health Centre\n- Likoma/St Peters\n- Likudzi U5 Clinic Health Post\n- Likuni Mission Hospital\n- Lilongwe City Assembly - Mtsiriza Clinic\n- Lilongwe City Assembly Chinsap\n- Lilongwe City Assembly Staff Clinic\n- Lilongwe Health Clinic - Limbe Muslim Jamat\n- Lilongwe Private Clinic\n- Limbe\n- Limbe Diagnostic\n- Limbe Home Based Care\n- Limbe Leaf Tobacco -  Limbe\n- Limbe Leaf Tobacco Co. Ltd. Cl\n- Limbe Muslim\n- Limbe Muslim Jamat  - Mbayani\n- Limbe Muslim Jamat - Blantyre\n- Limbe Muslim Jamat - Diagnostic\n- Limbe Muslim Jamat - Habiba Mussa Clinic\n- Limbe Muslim Jamat - Kachere\n- Limbe Muslim Jamat - Kanjedza\n- Limbe Muslim Jamat - Limbe\n- Limbe Muslim Jamat - Makhetha\n- Limbe Muslim Jamat Clinic\n- Limbuli Estate Clinic\n- Lingadzi Private Clinic, Kayam\n- Lingalawe, Albert. Chiluli Pri\n- Linyangwa Health Centre\n- Lipande, MacDonald. Tachira Bi\n- Lirangwe\n- Lisa Private Clinic\n- Lisungwi Community Hospital\n- Liuzi Health Centre\n- Livingstonia Mission Hospital\n- Livwezi\n- Liwaladzi Health Centre\n- Liwonde Medical Clinic\n- Liwonde Medical Clinic, Chilik\n- Lizulu Health Centre\n- Lobi Health Centre\n- Lodjwa Health Centre\n- Logos pvt clinic\n- Ludzi\n- Lufita\n- Lughano Private Clinic\n- Lugola Health Centre\n- Lujeri Health Centre\n- Lukoloma Health Post\n- Lulanga Health Centre\n- Lulwe Health Centre\n- Lumbadzi Health Centre\n- Lumbadzi Masm Clinic\n- Lumbe, John L.\n- Lumbira / Mitsidi\n- Lundu\n- Lungazi\n- Lungu\n- Lungwena Health Centre\n- Lunjika Health Centre\n- Lupachi\n- Lupaso\n- Lupembe Health Centre\n- Lura Health Centre\n- Lusangazi Dispensary\n- Lutheran Mobile Clinic\n- Luviri\n- Luvwere Health Centre\n- Luwalika Health Centre\n- Luwani Health Centre\n- Luwanje\n- Luwawa Health Centre\n- Luwelezi Health Centre\n- Luwuchi Health Centre\n- Luzi Health Centre\n- Lwazi Health Centre\n- Lwezga Health Centre\n- M & M Medical and Dental Clini\n- M\'mambo Health Centre\n- MACRO Karonga Centre\n- MACRO Kasungu Centre\n- MAFCO\n- MAIC\n- MBA-Esita Private Clinic\n- MBANIRA\n- MHRYN Private\n- MOLIPA\n- MPC Bwaila ART CLINIC Health Centre\n- MWANJE\n- Mabiri Health Centre\n- Mabwera, Walson D. Chinyanje P\n- Machado, Alfred W. J. Machado\n- Machereza Health Post\n- Machinga District Hospital\n- Machinga Health Centre\n- Machinga Private Clinic\n- Machinjiri Health Centre\n- Macro  -Blantyre\n- Macro Lilongwe\n- Macro Mzuzu\n- Madalitso Private Clinic\n- Madalitso Pvt Clinic\n- Madede Health Centre\n- Madina Social Services\n- Madinah Social Services Mobile Clinic\n- Madise I\n- Madisi Mission Hospital\n- Madziabango\n- Maela Health Centre\n- Mafale\n- Mafisi Health Centre\n- Mafuphinzi\n- Magaleta Health Centre\n- Maganga\n- Maganga Health Centre\n- Magomero Rural Hospital\n- Magunda Health Centre\n- Mahowe\n- Mainjeni, Fyson W D. Fema Priv\n- Majete\n- Makande\n- Makanjira Health Centre\n- Makapwa Health Centre\n- Makata\n- Makhanga Health Centre\n- Makhetha\n- Makhwira Health Centre\n- Makioni Health Centre\n- Maku Private Clinic\n- Makungwa\n- Makwapala Health Centre\n- Makwasa\n- Makwasa Estate Clinic\n- Malabada\n- Malalwi Army Marine Dispensary\n- Malambo Health Centre\n- Malamulo Day  -  Amina\n- Malamulo Mission Hospital\n- Malavi Dispensary\n- Malawi Institute of Management Clinic\n- Malawi Polytechnic\n- Maldeco Fisheries Clinic\n- Malembo Health Centre\n- Maleta Health Post\n- Malewa\n- Malidade Health Centre\n- Malingamoyo Private Clinic\n- Malingunde Health Centre\n- Malmed\n- Malola, Lemson F. Umoyo Privat\n- Malombe Dispensary\n- Malomo Health Centre\n- Malowa Health Centre\n- Malukula Health Centre\n- Malungo\n- Maluwa Health Centre\n- Mama Ethel Private Clinic\n- Mama Khadija Private Clinic Na\n- Mamoyo Private Clinic\n- Maneno Private Clinic, Mhone,\n- Mangamba Health Centre\n- Mangochi BLM\n- Mangochi District Hospital\n- Mangulenje Health Centre\n- Manjawira Health Centre\n- Manjolo, Khamalake F, Feroz Me\n- Manolo Health Center\n- Manyamula Health Centre\n- Maonde Health Centre\n- Maoni Health Post\n- Mapale Medical Life Centre\n- Mapanga Clinic\n- Maperera Health Centre\n- Mapeto David White head\n- Mary Mount Clinic\n- Masache Private Clinic\n- Masasa Dispensary\n- Mase Health Centre\n- Masenjere Health Centre\n- Masida Private\n- Masm Medi - Limbe\n- Masm Medi Clinic Katoto\n- Masm Medi Clinic Lilongwe (Are\n- Masm Medi Clinic Zomba\n- Matabwa, Tengani L. Tadfa Priv\n- Matanda Health Centre\n- Matandani Health Centre\n- Matapila Health Centre\n- Matawale Health Centre\n- Matchereza Health Post\n- Matekenya\n- Matewere Village Clinic\n- Matiki Health Centre\n- Matiya Rural Hospital\n- Matope Health Centre\n- Matuli Health Centre\n- Matumba Rural Hospital\n- Maula Health Centre\n- Maula Prison Health Centre Static Art\n- Mauwa Health Centre\n- Mayaka Health Centre\n- Mayani Health Centre\n- Maziko Private Clinic\n- Mbabvi Health Centre\n- Mbalachanda Health Centre\n- Mbalama Dispensary\n- Mbalanguzi\n- Mbalunji Private Clinic, Dhlam\n- Mbang\'ombe 2 Health Centre\n- Mbangombe Health Centre 1\n- Mbayani\n- Mbenje Health Centre\n- Mbera Health Centre\n- Mbingwa Health Centre\n- Mbiza Health Centre\n- Mboma Estate Clinic (Conforzi)\n- Mbonechela Dispensary\n- Mbulumbuzi Health Centre\n- Mbvundula, Presley G. Germa Pr\n- Mbwana Private Clinic\n- Mbwatalika Health Centre\n- Mchacha Health Post\n- Mchenga Clinic\n- Mchima Clinic\n- Mchina\n- Mchinji District Hospital\n- Mchoka Health Centre\n- Mdeka\n- Mdeza Health Center\n- Mdunga Health Centre\n- Medical Aid Society of Malawi\n- Medicare City Centre / Makadam\n- Mehboob Memorial Centre\n- Merit\n- Merry Year Health Clinic\n- Mfera Health Centre\n- Mganja Health Centre\n- Mgoza\n- Mhalaunda Health Centre\n- Mhuju Rural Hospital\n- Mianga Estate Clinic\n- Mianga Health Centre\n- Midima BLM\n- Midzemba\n- Migowi Health Centre\n- Mikoke\n- Mikolongwe Health Centre\n- Mikondo Rural Hospital\n- Mikundi\n- Mikundi Health Centre\n- Mikuyu\n- Mikuyu Adult Clinic\n- Mikuyu Young Clinic\n- Milepa Health Centre\n- Milonde Health Centre\n- Mimosa Dispensary\n- Ming\'ong\'o Health Centre\n- Minimini Estate Clinic\n- Ministry of Hope Health Clinic - Area 47\n- Minoo\'s Dental Clinic\n- Misamvu Health Post\n- Misanjo\n- Misolo\n- Misomali Health Centre\n- Misuku Cooperative Community Hospital\n- Misuku Health Centre\n- Mitengo Health Centre\n- Mitondo Health Post\n- Mitondo, Peter R. P. Prime Pri\n- Mitundu Community Hospital\n- Mjini\n- Mjini Dispensary/Health Center\n- Mkanda Health Centre\n- Mkango Health Post\n- Mkhaya, Anakalet A. Mphatso Pr\n- Mkhota Health Centre\n- Mkhuzi Health Centre\n- Mkhwayi Health Centre\n- Mkoko, Arthur B, Chisomo Priva\n- Mkoma Health Centre\n- Mkomaula Health Centre\n- Mkumba Health Centre\n- Mkwaira Ladison E. L.&A\n- Mkwepere Health Centre\n- Mkwinda\n- Mlale Mission Hospital\n- Mlambe Mission Hospital\n- Mlanda Health Centre\n- Mlangali Health Centre\n- Mlangeni Health Centre\n- Mlare Health Centre\n- Mlembe\n- Mlodza/Seventh Day\n- Mlolera Womens Clinic\n- Mlolo Health Post\n- Mlomba Dispensary\n- Mlowe Health Centre\n- Mluma Dispensary\n- Mndinda Health Centre\n- Mngwangwa\n- Mnyanja\n- MoH Hq\n- Molere Health Centre\n- Mondwe\n- Monekera\n- Monkeybay Community Hospital\n- Mota-Engil 301 Clinic\n- Mota-Engil Clinic - Mkwinda Ca\n- Mota-Engil Liwonde Clinic\n- Moyale Barracks Clinics\n- Moyo\n- Mpala Health Centre\n- Mpale Private Clinic\n- Mpamantha Health Centre\n- Mpamba Health Centre\n- Mpasa Health Centre\n- Mpasazi Health Centre\n- Mpata Health Centre\n- Mpemba\n- Mpepa\n- Mphathi Health Centre\n- Mphatso Pvt Clinic\n- Mphepozinayi Dispensary\n- Mpherembe Health Centre\n- Mpherere Health Center\n- Mphofwa\n- Mphompha Health Centre\n- Mphunzi Health Centre\n- Mpingo Maternity\n- Mpiri Health Centre\n- Mpombe\n- Mpondasi Health Centre\n- Mponela Rural Hospital\n- Mposa Health Centre\n- Msakambewa Health Centre\n- Mseche\n- Msenjere Health Centre\n- Msese Health Centre\n- Msithe\n- Msumbe Health Center\n- Mt Soche - c/o Nyirenda\n- Mtakataka Health Centre\n- Mtambalika\n- Mtambo Private Clinic\n- Mtanga\n- Mtanga Private Clinic\n- Mtemwende\n- Mtende Health Centre\n- Mtendere Health Centre\n- Mtengoumodzi Private Hospital\n- Mtenthela Health Centre\n- Mthengathenga Hospital\n- Mtimabi Health Centre\n- Mtonda Health Centre\n- Mtosa Health Centre\n- Mtunthama Health Centre\n- Mtwalo Health Centre\n- Mua Rural Hospital\n- Muchila Private Clinic\n- Muferanji Clinic\n- Mulanje Blm Clinic\n- Mulanje District Hospital\n- Mulanje Mission Hospital\n- Mulibwanji Hospital\n- Mulomba Health Centre\n- Muloza Heath Centre\n- Muluma\n- Mulungu Alinafe Clinic\n- Mumbwe Medical Centre\n- Munthali Ndalakwanji, N, Pra\n- Munthali, Joyce W Naperi medi\n- Muopo\n- Muriya, Nemezio. Chifundo Priv\n- Muyendebwino Wellness Centre\n- Mvera Army Health Centre\n- Mvera Mission Health Centre\n- Mwachira Private Clinic\n- Mwai Hale Medical Skin\n- Mwaiwathu - Mbvunbula\n- Mwaiwathu Clinic\n- Mwaiwathu Private Hospital\n- Mwalanthuzi\n- Mwale, Charles M C. Yankho Pri\n- Mwanamanga Happiness\n- Mwanawanjobvu\n- Mwanayaya\n- Mwandamu Health Centre\n- Mwanga Rural Hospital\n- Mwangala Health Centre\n- Mwansambo Health Centre\n- Mwanza BLM Clinic\n- Mwanza Clinic Area 3\n- Mwanza District Hospital\n- Mwase\n- Mwatakata Health Post\n- Mwatitha Private Clinic\n- Mwaya Clinic\n- Mwayi\n- Mwazisi Health Centre\n- Mwenyekonde, Elled. Seventh Ce\n- Mwima Health Post\n- Mzalangwe Health Centre\n- Mzama Health Centre\n- Mzambazi Community Hospital\n- Mzandu Health Centre\n- Mzenga Health Centre\n- Mzimba District Hospital\n- Mzimba Prison\n- Mzokoto Health Centre\n- Mzuzu Cental Hospital\n- Mzuzu Central Prison\n- Mzuzu Health Centre\n- Mzuzu Police Clinic\n- Mzuzu University Clinic\n- NAMALITHA\n- NASO (Nkhotakota Aids Support\n- NJULI\n- Naching\'Anda\n- Nachipangapanga\n- Naisi Health Centre\n- Nakalanzi Health Centre\n- Nalunga Health Centre\n- Namadidi Health Centre\n- Namadzi Health Centre\n- Namadzi Private Clinic\n- Namakhwa, Jomo. Malavi Private\n- Namalaka Health Centre\n- Namandanje Health Centre\n- Namanja Health Centre\n- Namanolo Health Centre\n- Namasalima Health Centre\n- Nambazo Health Centre\n- Nambira Health Post\n- Nambiti 1\n- Namboya Felix\n- Nambuma Health Centre\n- Namdumbo Health  Centre\n- Namikango\n- Namikoko\n- Naming\'omba Health Centre\n- Namisu Dispensary\n- Namitambo Health Centre\n- Namizana Clinic\n- Namphungo Health Centre\n- Namulenga Rural Hospital\n- Namwera Health Centre\n- Nancholi Dispensary\n- Nangalamu Health Centre\n- Nankhwali Health Centre\n- Nankumba Health Centre\n- Naperi\n- Naphimba Health Centre\n- Nasawa Health Centre\n- Nasonia\n- Nasonia Estate Clinic\n- Nathenje Health Centre\n- Natural Resources College Clin\n- Nayinunje Health Centre\n- Nayuchi Health Centre\n- Nazombe Health Centre (Gogo)\n- Nchima Clinic\n- Ndakwera Health Centre\n- Ndamera Health Centre\n- Ndau Clinic\n- Ndaula Health Centre\n- Ndimoyo Palliative Trust Clini\n- Ndirande\n- Ndirande BLM\n- Ndunde Health Centre\n- Neno District Hospital\n- Neno Parish Health Centre\n- New state house Clinic\n- Newa Health Centre\n- Ng\'onga Health Centre\n- Ngabu Blm Clinic\n- Ngabu Rural Hospital\n- Ngabu Sda Health Centre\n- Ngala Health Centre\n- Ngala Health Post\n- Ngana Health Centre\n- Ngapani Sable Health Centre\n- Ngara\n- Ngatala Health Post\n- Ngisi\n- Ngodzi Health Centre\n- Ngokwe Health Centre\n- Ngolowera\n- Ngoni Health Centre\n- Ngotangota\n- Ngoya\n- Ngwelelo Health Centre\n- Ngwira  W. - Limbe\n- Nice Private\n- Njerenje\n- Njuyu Health Centre\n- Nkalo Health Centre\n- Nkasala Health Centre\n- Nkhalango Clinic\n- Nkhamenya Rural Hospital\n- Nkhande Dispensary\n- Nkhata Bay District Hospital\n- Nkhata Bay Private Clinic\n- Nkhataombere\n- Nkhate Health Post\n- Nkhoma Mission Hospital\n- Nkhomboli\n- Nkhorongo Health Centre\n- Nkhotakota BLM\n- Nkhotakota District Hospital\n- Nkhulambe Health Centre\n- Nkhunga Health Centre\n- Nkhuyukuyu Health Centre\n- Nkhwazi Health Centre\n- Nkombedzi Health Centre\n- Nkope Health Centre\n- Nkula Health Centre\n- Nkumaniza Health Centre\n- Nkuriza, Stanilas, Inernos Pri\n- Nsabwe Health Centre\n- Nsalu Health centre\n- Nsambe Health Centre\n- Nsanama Health Centre\n- Nsanje District Hospital\n- Nsipe Rural Hospital\n- Nsiyaludzu Health Centre\n- Nsomo\n- Nsuwadzi\n- Ntaja Health Centre\n- Ntakataka Police Dispensary\n- Ntata, Anthony C.\n- Ntcheu District Hospital\n- Ntchisi District Hospital\n- Ntepa Health Centre\n- Nthalire Health Centre\n- Nthenje Health Centre\n- Nthondo Health Centre\n- Nthondo Health centre\n- Nthorowa Health Centre\n- Nthungwa Health Centre\n- Nyamanda Private Clinic\n- Nyambadwe\n- Nyambi Health Centre\n- Nyamithuthu Health Centre\n- Nyamvuu Clinic\n- Nyangulu, Daniel S.\n- Nyanja\n- Nyanyala\n- Nyoka\n- Nyungwe Health Centre\n- Ofesi Health Centre\n- Old Hospital\n- Old Maula Health Center\n- Our Lady of Mount Carmel Rural\n- PIM Health Centre\n- Padley PIO\n- Palms Private Clinic\n- Parachute Battalion\n- Partners In Hope Clinic Dalitso Clinic (private)\n- Partners In Hope Clinic Moyo C\n- Partners in Christ Medical Centre\n- Pasulani, Emerson E. Chilitsen\n- Pende\n- Pensulo\n- Perekamoyo, William D. Mphatso\n- Phalira, Hudson J. Machanza Pr\n- Phalombe Health Centre\n- Phalula Health Centre\n- Phanga Dispensary\n- Phanga, Chimongo J. Prince Hen\n- Philadephia\n- Phimbi Health Centre\n- Phiri, Harold K. S. Chisomo Pr\n- Phirilanjuzi\n- Phirilongwe Health Centre\n- Phirisingo Health Center\n- Phokera Health Centre\n- Phuma, Damiano A. F. Tanyaze P\n- Phuno\n- Phwazi Estate Clinic\n- Phwezi Private Clinic\n- Piereck\n- Pilinanu- Tamao\n- Pirimiti Rural Hospital\n- Pitala\n- Police College Hospital\n- Portland cement\n- Pothawira (Haven) Health Facility\n- Praises\n- Press Cooperation Ltd.\n- Private Vehicle Hire Organisation\n- Puteni\n- Queen Elizabeth Central Hospital\n- RWJ Wallace Limited Clinic\n- Rafiki Foundation Clinic\n- Raha Private Clinic\n- Raiply Clinic\n- Reserve Bank of Malawi Clinic\n- Rhema Clinic\n- Ruarwe Dispensary\n- Rumphi BLM\n- Rumphi District Hospital\n- Ruo Estate Clinic\n- SAMBAKUSI\n- SOBO\n- SOS Medical Centre\n- SSH Clinic\n- Sadzi Health Centre\n- Saha Private Clinic, Ngulama,\n- Salamba\n- Salima AIDS Support Organisati\n- Salima Admarc Dispensary\n- Salima BLM\n- Salima District Hospital\n- Sam\n- Sambankhanga Health Centre\n- Sandama\n- Sangiro Health centre\n- Sanjika\n- Sankhulani Health Centre\n- Santhe Health Centre\n- Saopa\n- Satemwa Tea Estate Clinic\n- Sayama Clinic\n- Sedemen Private Clinic\n- Semema\n- Sendezera, Michael J. Tendai P\n- Senzani Health Centre\n- Servant of the Blessed Virgin Mary Sisters Imanol Larranaga Pvt Clinic\n- Sharpe Valley Health Centre\n- Shifa\n- Silu\n- Simlemba Health Centre\n- Sinyala Dispensary\n- Sister Martha Health Centre\n- Soche Maternity\n- Soche SDA\n- Social Islamic Development Clinic\n- Sokola\n- Solomon Village Clinic\n- Somba Health Centre\n- Sorgin Health Centre\n- Sos Childrens Village Blantyre\n- South Lunzu\n- Southern Bottlers Ltd. Clinic\n- Sr. Tereza Rural Hospital\n- St Anne\'S\n- St Joseph\'s Health Center\n- St Martin\'S Clinic\n- St Mary\'s / Chizumulu Health C\n- St Montfort Hospital\n- St Vincent\n- St. Andrews Health Centre\n- St. Anne\'s Health Centre\n- St. Annes Hospital\n- St. Faith Anglican Clinic\n- St. Gabriel Mission Hospital\n- St. Hellena Oakley (Ntambanyama)\n- St. John of God Mental Hospita\n- St. John of God, Lilongwe Service Centre\n- St. Johns Hospital\n- St. Johns Seminary\n- St. Joseph  Community Hospital\n- St. Joseph Hospital\n- St. Louis Private Clinic\n- St. Lukes Mission Hospital\n- St. Mamwene Private Clinic, Nd\n- St. Mark Private Clinic, Magom\n- St. Martins Mission Hospital\n- St. Mary\'s Rehabilitation Heal\n- St. Michael-Guillime\n- St. Patricks Health Centre\n- State House Dispensary\n- Stuka Pvt Clinic\n- Sucoma Clinic Illovo (Armumend\n- Sucoma Illovo Factory Clinic\n- Sucoma Kalulu Clinic\n- Sucoma Lengwe\n- Sucoma Mangulenje Clinic\n- Sucoma Mkombezi\n- Sucoma/Mwanza/Illovo Clinic\n- Sukasanje Health Centre\n- Sungani\'s Medical centre\n- Sunny Side B\n- THEATRE FOR CHANGE NGO\n- Tachira Private Clinic\n- Tadala\n- Tapima Minute Health centre\n- Tcharo Health Centre\n- Tedzani\n- Tembwe Health Centre\n- Tengani Health Centre\n- Thabwani\n- Thambani Health Centre\n- Thandizo- Semak\n- Thavite Health Centre\n- Thazima\n- The Clinic\n- The Clinic - Dr. Humera A Chaudhry\n- Thejopal Rotta. S\n- Thekerani Rural Hospital\n- Thembe Health Centre\n- Thendo\n- Therere\n- Thomasi Health Centre\n- Thondwe Dispensary\n- Thondwe Pastoral Centre\n- Thonje Health Centre\n- Thornwood Estate Clinic\n- Thoto Dispensary\n- Thuchila Health Centre\n- Thukuta\n- Thumbwe Health Centre\n- Thunduwike Health Centre\n- Thunga Health Centre\n- Thupa Health Centre\n- Thyolo District Hospital\n- Tikondane Clinic\n- Tilola\n- Timunyazge Clinic\n- Titani Private Clinic, Chimpha\n- Tiyende Ptv Clinic\n- Tiyese Maternity Clinic\n- Tovwirane Private\n- Towoo\'s Private Clinic\n- Trinity Hospital\n- Trizah\n- Truzag\n- Tsangano Health Centre\n- Tsoyo Dispensary/Health Center\n- Tukombo\n- Tulame Pvt Clinic\n- Tulonkhondo Health Centre\n- Twisile Private Clinic, Nyondo\n- Ukasi Clinic\n- Ukwe Health Centre\n- Ulemu\n- Uliwa\n- Ulongwe Health Centre\n- Umodzi Clinic\n- Umodzi Clinic - Aquaid Lifeline Project\n- Umoyo Private Clinic\n- Umoyo uweme Clinic\n- Unilever South East Company\n- Usisya Health Centre\n- Utale 1 Health Centre\n- Utale 2 Health Centre\n- Veruwa, Flyven P. Mphatso Zath\n- Vibangalala\n- Vibangalala Dispensary\n- Vilaule\n- Vision Bible Training & Accom. Centre Pvt Clinic\n- Vision Care\n- Vision Care - Area 14\n- Vitumbiko Private Clinic\n- Vizara Dispensary\n- WAFC Private Clinic, Banda, Be\n- Wakisa Private Clinic\n- Waliranji 2\n- Waruma\n- Watch Tower Society\n- Wecare Maternity Private Clini\n- Wehmat\n- Wenya Health Centre\n- Westcliff Clinic\n- Wezi Medical Centre\n- Wiliro Health Centre\n- Wimbe Health Centre\n- Wongani Private Clinic\n- World Medical Fund\n- Wovwe Escom Clinic\n- YONECO\n- Yankho                     .\n- Yankho Private Clinic\n- Zalewa Dapp Vct Station\n- Zalewa Pih Clinic\n- Zasintha Private Clinic\n- Zilindo Health Centre\n- Zingwangwa\n- Zingwangwa BLM\n- Zoa Health Centre\n- Zolozolo Health Post\n- Zomba BLM\n- Zomba Central Hospital\n- Zomba Central Prison Clinic\n- Zomba DHO Pharmacy\n- Zomba Mental Hospital\n- Zunga Health Post\n- chiwoza\n- sunrise clinic\n','',NULL,NULL,1,1,1,3,1,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: \'\'\nedit_tag_style: \'\'\n',''),(4,'IssueCustomField','Reported By','string',NULL,'',5,30,1,1,0,4,1,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: \'\'\nurl_pattern: \'\'\n','Name of a person reporting an issue from health facility'),(5,'IssueCustomField','Reporter phone number','string',NULL,'',10,13,1,1,0,5,1,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: \'\'\nurl_pattern: \'\'\n','e.g +265991763413'),(6,'IssueCustomField','Reporter position','string',NULL,'',2,40,1,1,0,6,0,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: \'\'\nurl_pattern: \'\'\n',''),(7,'IssueCustomField','Issue department','string',NULL,'',2,40,1,1,0,7,0,'',1,1,0,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: \'\'\nurl_pattern: \'\'\n','');
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int NOT NULL,
  `role_id` int NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int NOT NULL DEFAULT '0',
  `tracker_id` int NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
INSERT INTO `custom_fields_trackers` VALUES (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int NOT NULL DEFAULT '0',
  `custom_field_id` int NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
INSERT INTO `custom_values` VALUES (1,'Issue',1,1,'Support and Deployment'),(2,'Issue',1,2,'Chitipa'),(3,'Issue',1,3,'Kameme Health Centre'),(4,'Issue',1,4,'John Banda'),(5,'Issue',1,5,'0991763413'),(6,'Issue',2,1,'Hardware'),(7,'Issue',2,2,'Dowa'),(8,'Issue',2,3,'Chisepo Health Centre'),(9,'Issue',2,4,'pempho'),(10,'Issue',2,5,'+265990987909'),(11,'Issue',3,1,'Hardware'),(12,'Issue',3,2,'Lilongwe'),(13,'Issue',3,3,'Bwaila Hospital'),(14,'Issue',3,4,'Rajab Billy'),(15,'Issue',3,5,'0999888777');
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES (1,1,'mhonemaxwell@gmail.com',1,1,'2022-07-13 10:40:29','2022-07-13 10:46:47'),(2,10,'kkapundi@kuunika.org',1,1,'2022-07-13 10:58:37','2022-07-13 10:58:37'),(3,11,'chimwemwe.mputeni@compelling.works',1,1,'2022-07-13 11:01:05','2022-07-13 11:01:05');
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enabled_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt'),(11,2,'issue_tracking'),(12,2,'time_tracking'),(13,2,'news'),(14,2,'documents'),(15,2,'files'),(16,2,'wiki'),(17,2,'repository'),(18,2,'boards'),(19,2,'calendar'),(20,2,'gantt'),(21,3,'issue_tracking'),(22,3,'time_tracking'),(23,3,'news'),(24,3,'documents'),(25,3,'files'),(26,3,'wiki'),(27,3,'repository'),(28,3,'boards'),(29,3,'calendar'),(30,3,'gantt'),(31,4,'issue_tracking'),(32,4,'time_tracking'),(33,4,'news'),(34,4,'documents'),(35,4,'files'),(36,4,'wiki'),(37,4,'repository'),(38,4,'boards'),(39,4,'calendar'),(40,4,'gantt');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumerations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Urgent',1,0,'IssuePriority',1,NULL,NULL,'lowest'),(2,'High',2,0,'IssuePriority',1,NULL,NULL,'low2'),(3,'Medium',3,1,'IssuePriority',1,NULL,NULL,'default'),(4,'Low',4,0,'IssuePriority',1,NULL,NULL,'highest');
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_users` (
  `group_id` int NOT NULL,
  `user_id` int NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (5,1),(5,11),(6,1),(6,10),(7,1),(8,1),(9,1);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `import_id` int NOT NULL,
  `position` int NOT NULL,
  `obj_id` int DEFAULT NULL,
  `message` text,
  `unique_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_import_items_on_import_id_and_unique_id` (`import_id`,`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `settings` text,
  `total_items` int DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `assigned_to_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issue_from_id` int NOT NULL,
  `issue_to_id` int NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `default_done_ratio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'New',0,1,NULL),(2,'Pending',0,2,NULL),(3,'Completed',0,3,NULL),(4,'Resolved',0,4,NULL),(5,'Closed',1,5,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tracker_id` int NOT NULL,
  `project_id` int NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `due_date` date DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `assigned_to_id` int DEFAULT NULL,
  `priority_id` int NOT NULL,
  `fixed_version_id` int DEFAULT NULL,
  `author_id` int NOT NULL,
  `lock_version` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  KEY `index_issues_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'Phone not syncing','','2022-07-22',NULL,5,11,2,NULL,1,10,'2022-07-13 13:25:49','2022-07-15 12:50:03','2022-07-13',0,NULL,NULL,1,1,2,0,'2022-07-15 14:50:03'),(2,1,3,'Tablet not powering up','A user has reported that her laptop is not powering up','2022-07-22',NULL,5,11,1,NULL,1,10,'2022-07-15 07:04:24','2022-07-15 12:54:05','2022-07-15',0,NULL,NULL,2,1,2,0,'2022-07-15 14:20:04'),(3,1,3,'Laptop unable to charge','',NULL,NULL,5,10,2,NULL,1,9,'2022-07-15 13:01:11','2022-07-15 13:15:59','2022-07-15',0,NULL,NULL,3,1,2,0,'2022-07-15 15:15:59');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_id` int NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` longtext,
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'cf','4',NULL,'John Banda'),(2,2,'cf','5',NULL,'0991763413'),(3,3,'cf','2','Lilongwe','Dowa'),(4,3,'cf','3','All facilities','Family Planning Association Of'),(5,4,'cf','2','Dowa','Chitipa'),(6,4,'cf','3','Family Planning Association Of','Kameme Health Centre'),(7,7,'attr','status_id','1','2'),(8,8,'attachment','1',NULL,'patient_reg_form.png'),(9,9,'attachment','1','patient_reg_form.png',NULL),(10,10,'attr','status_id','2','5'),(11,11,'attr','status_id','1','3'),(12,12,'attr','status_id','3','5'),(13,13,'attr','status_id','1','2'),(14,14,'attr','status_id','2','4'),(15,15,'attr','status_id','4','5');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `journalized_id` int NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `notes` longtext,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,1,'Issue',1,'','2022-07-13 15:58:02',0),(2,1,'Issue',1,'','2022-07-13 16:04:23',0),(3,1,'Issue',1,'','2022-07-14 12:14:53',0),(4,1,'Issue',1,'','2022-07-14 12:15:44',0),(5,2,'Issue',1,'Can you please check with the user if she tried to change power chargers','2022-07-15 09:06:01',0),(6,1,'Issue',1,'Unable to edit an issue status','2022-07-15 09:34:03',0),(7,2,'Issue',1,'','2022-07-15 11:08:44',0),(8,1,'Issue',1,'','2022-07-15 11:22:50',0),(9,1,'Issue',1,'','2022-07-15 11:23:23',0),(10,2,'Issue',1,'The solution is .....','2022-07-15 14:20:04',0),(11,1,'Issue',1,'','2022-07-15 14:21:11',0),(12,1,'Issue',1,'','2022-07-15 14:50:03',0),(13,3,'Issue',1,'','2022-07-15 15:10:06',0),(14,3,'Issue',1,'','2022-07-15 15:13:14',0),(15,3,'Issue',1,'motherboard replaced','2022-07-15 15:15:59',0);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `role_id` int NOT NULL,
  `inherited_from` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`),
  KEY `index_member_roles_on_inherited_from` (`inherited_from`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,4,NULL),(2,2,4,NULL),(3,3,4,NULL),(4,4,4,NULL),(5,5,3,NULL),(6,6,3,NULL),(7,7,3,NULL),(8,8,3,NULL),(9,9,3,NULL),(10,9,4,NULL),(11,10,3,NULL),(12,10,4,NULL),(13,11,3,NULL),(14,11,4,NULL),(15,12,3,NULL),(16,12,4,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,11,2,'2022-07-13 09:45:29',0),(2,11,3,'2022-07-13 09:45:29',0),(3,11,4,'2022-07-13 09:45:29',0),(4,11,1,'2022-07-13 09:45:29',0),(5,10,2,'2022-07-13 09:45:53',0),(6,10,3,'2022-07-13 09:45:53',0),(7,10,4,'2022-07-13 09:45:53',0),(8,10,1,'2022-07-13 09:45:54',0),(9,1,2,'2022-07-13 09:46:17',0),(10,1,3,'2022-07-13 09:46:18',0),(11,1,4,'2022-07-13 09:46:18',0),(12,1,1,'2022-07-13 09:46:18',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int DEFAULT NULL,
  `replies_count` int NOT NULL DEFAULT '0',
  `last_reply_id` int DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `comments_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,3,'Test News','','This is a test news item for this Redmine Installation. ',1,'2022-07-27 08:50:45',0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int DEFAULT NULL,
  `default_assigned_to_id` int DEFAULT NULL,
  `default_issue_query_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'OHSP','One Health Surveillance Platform(OHSP).','https://ohsp.health.gov.mw/',1,NULL,'2022-07-13 09:05:43','2022-07-13 09:05:43','ohsp',1,7,8,0,NULL,NULL,NULL),(2,'DHIS2','District Health Information System(DHIS2)','https://dhis2.health.gov.mw/',1,NULL,'2022-07-13 09:06:48','2022-07-13 09:06:48','dhis2',1,1,2,0,NULL,NULL,NULL),(3,'ICHIS','Integrated Community Health Information System','https://ccdev.org',1,NULL,'2022-07-13 09:09:44','2022-07-13 09:09:44','ichis',1,3,4,0,NULL,NULL,NULL),(4,'MHFR','Master Health Facility Register','http://zipatala.health.gov.mw/',1,NULL,'2022-07-13 09:11:18','2022-07-13 09:11:18','mhfr',1,5,6,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_trackers` (
  `project_id` int NOT NULL DEFAULT '0',
  `tracker_id` int NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries_roles` (
  `query_id` int NOT NULL,
  `role_id` int NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repositories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` longtext,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `position` int DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',0,1,1,'---\n- :view_issues\n- :view_news\n- :view_messages\n','default','all','all',1,NULL),(2,'Anonymous',0,1,2,'---\n- :view_issues\n- :view_news\n- :view_messages\n','default','all','all',1,NULL),(3,'Developer',1,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n','default','all','all',1,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(4,'Support Officer',2,1,0,'---\n- :view_messages\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :view_news\n','default','all','all',1,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(5,'Helpdesk Officer',3,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n','default','all','all',1,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(6,'Manager',4,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n','default','all','all',1,'--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_managed_roles`
--

DROP TABLE IF EXISTS `roles_managed_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_managed_roles` (
  `role_id` int NOT NULL,
  `managed_role_id` int NOT NULL,
  UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_managed_roles`
--

LOCK TABLES `roles_managed_roles` WRITE;
/*!40000 ALTER TABLE `roles_managed_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_managed_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('20140903143914'),('20140920094058'),('20141029181752'),('20141029181824'),('20141109112308'),('20141122124142'),('20150113194759'),('20150113211532'),('20150113213922'),('20150113213955'),('20150208105930'),('20150510083747'),('20150525103953'),('20150526183158'),('20150528084820'),('20150528092912'),('20150528093249'),('20150725112753'),('20150730122707'),('20150730122735'),('20150921204850'),('20150921210243'),('20151020182334'),('20151020182731'),('20151021184614'),('20151021185456'),('20151021190616'),('20151024082034'),('20151025072118'),('20151031095005'),('20160404080304'),('20160416072926'),('20160529063352'),('20161001122012'),('20161002133421'),('20161010081301'),('20161010081528'),('20161010081600'),('20161126094932'),('20161220091118'),('20170207050700'),('20170302015225'),('20170309214320'),('20170320051650'),('20170418090031'),('20170419144536'),('20170723112801'),('20180501132547'),('20180913072918'),('20180923082945'),('20180923091603'),('20190315094151'),('20190315102101'),('20190510070108'),('20190620135549'),('20200826153401'),('20200826153402'),('20210704125704'),('20210705111300'),('20210728131544'),('20210801145548'),('20210801211024'),('20211213122100'),('20211213122101'),('20211213122102'),('20220224194639'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'default_projects_public','1','2022-07-15 09:02:49'),(2,'default_projects_modules','---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n','2022-07-15 09:02:49'),(3,'default_projects_tracker_ids','---\n- \'1\'\n- \'2\'\n','2022-07-15 09:02:49'),(4,'sequential_project_identifiers','0','2022-07-15 09:02:49'),(5,'project_list_display_type','board','2022-07-15 09:02:50'),(6,'project_list_defaults','---\n:column_names:\n- name\n- identifier\n- short_description\n','2022-07-15 09:02:50'),(7,'default_project_query','','2022-07-15 09:02:50');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `issue_id` int DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `activity_id` int NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int NOT NULL,
  `tmonth` int NOT NULL,
  `tweek` int NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (2,1,'session','4cd9d5fbbc00446d53e684691977d25cead49692','2022-07-13 10:45:00','2022-07-13 14:04:22'),(3,1,'feeds','e04841fb2847c8bb8c80306557f156ab7008ca00','2022-07-13 10:46:58','2022-07-13 08:46:58'),(4,1,'session','3c62c496ae2ba42c8edbfb645bcc964a94bca195','2022-07-14 08:47:49','2022-07-14 10:24:35'),(8,11,'feeds','1a6504860ae6927c968d6f6bae204afb58b4d1ef','2022-07-15 09:11:02','2022-07-15 07:11:02'),(9,1,'session','baf22c81e4688da432694c6275967eaf5f745fe8','2022-07-15 09:25:21','2022-07-15 13:15:54'),(10,1,'session','213127feed6908035a0d032c83b1e3b135ae556d','2022-07-25 09:09:49','2022-07-25 11:09:07'),(11,1,'session','5a17f04be71b09ea229aa1dc9d8cde5a09a2042f','2022-07-26 10:49:31','2022-07-26 13:08:53'),(12,1,'session','a58669f58324972d1f4180f2ca7e168bea1bfb2c','2022-07-27 10:43:02','2022-07-27 08:59:23');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trackers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int DEFAULT '0',
  `default_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Defect','Tracker used for all  reported project issues',1,1,68,1),(2,'Feature','Used  only for new project features',2,1,0,1);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '1',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:recently_used_project_ids: \'3,1,4\'\n:gantt_zoom: 2\n:gantt_months: 6\n:activity_scope:\n- issues\n- changesets\n- news\n- documents\n- files\n- wiki_edits\n- messages\n',1,''),(2,10,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',1,''),(3,11,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3,1\'\n',1,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL,
  `twofa_scheme` varchar(255) DEFAULT NULL,
  `twofa_totp_key` varchar(255) DEFAULT NULL,
  `twofa_totp_last_used_at` int DEFAULT NULL,
  `twofa_required` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','3750cc2af26ebc3ea343845e60cb12e3aca40420','Redmine','Admin',1,1,'2022-07-27 10:43:01','',NULL,'2022-07-13 08:35:08','2022-07-13 08:45:00','User','all','f2012aa670e939e050ac9f37b3bbcb15',0,'2022-07-13 10:45:00',NULL,NULL,NULL,0),(2,'','','','Anonymous users',0,1,NULL,'',NULL,'2022-07-13 08:40:19','2022-07-13 08:40:19','GroupAnonymous','',NULL,0,NULL,NULL,NULL,NULL,0),(3,'','','','Non member users',0,1,NULL,'',NULL,'2022-07-13 08:40:19','2022-07-13 08:40:19','GroupNonMember','',NULL,0,NULL,NULL,NULL,NULL,0),(4,'','','','Anonymous',0,0,NULL,'',NULL,'2022-07-13 08:42:35','2022-07-13 08:42:35','AnonymousUser','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(5,'','','','Support and Deployment',0,1,NULL,'',NULL,'2022-07-13 08:52:35','2022-07-13 08:52:35','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(6,'','','','Software Development',0,1,NULL,'',NULL,'2022-07-13 08:52:54','2022-07-13 08:52:54','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(7,'','','','Network and Infrastructure',0,1,NULL,'',NULL,'2022-07-13 08:53:08','2022-07-13 08:53:08','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(8,'','','','Analystics',0,1,NULL,'',NULL,'2022-07-13 08:53:18','2022-07-13 08:53:18','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(9,'','','','Finance and Administration',0,1,NULL,'',NULL,'2022-07-13 08:53:27','2022-07-13 08:53:27','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(10,'kenneth.kapundi','831bb575d0dff04bcc2162661dd67e51b3b693d8','Kenneth','Kapundi',1,1,NULL,'en',NULL,'2022-07-13 08:58:37','2022-07-13 08:58:37','User','only_my_events','8b07b2733f26b4719e1fb7dab0c1ba1c',0,'2022-07-13 10:58:37',NULL,NULL,NULL,0),(11,'chimwemwe.mputeni','9c5a1495495fdced40f39f636ba6dcb3e0540bb4','Chimwemwe','Mputeni',0,1,'2022-07-15 09:09:59','en',NULL,'2022-07-13 09:01:05','2022-07-15 07:10:46','User','only_my_events','cdd001fefade0589672cd8e28fa8ff65',0,'2022-07-15 09:10:46',NULL,NULL,NULL,0),(12,'','','','Helpdesk',0,1,NULL,'',NULL,'2022-07-15 08:05:13','2022-07-15 08:05:13','Group','',NULL,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
INSERT INTO `watchers` VALUES (1,'Issue',1,1),(2,'Issue',2,11),(3,'Issue',2,1),(4,'Issue',3,11),(5,'Issue',3,10),(6,'Issue',3,1),(7,'News',1,1);
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_content_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int NOT NULL,
  `page_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `text` longtext,
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wiki_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wiki_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wikis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1),(2,2,'Wiki',1),(3,3,'Wiki',1),(4,4,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tracker_id` int NOT NULL DEFAULT '0',
  `old_status_id` int NOT NULL DEFAULT '0',
  `new_status_id` int NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`),
  KEY `index_workflows_on_tracker_id` (`tracker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(2,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(3,1,1,2,5,0,0,'WorkflowTransition',NULL,NULL),(4,1,1,2,6,0,0,'WorkflowTransition',NULL,NULL),(5,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(6,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(7,2,1,2,5,0,0,'WorkflowTransition',NULL,NULL),(8,2,1,2,6,0,0,'WorkflowTransition',NULL,NULL),(9,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(10,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(11,1,1,3,5,0,0,'WorkflowTransition',NULL,NULL),(12,1,1,3,6,0,0,'WorkflowTransition',NULL,NULL),(13,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(14,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(15,2,1,3,5,0,0,'WorkflowTransition',NULL,NULL),(16,2,1,3,6,0,0,'WorkflowTransition',NULL,NULL),(17,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(18,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(19,1,1,4,5,0,0,'WorkflowTransition',NULL,NULL),(20,1,1,4,6,0,0,'WorkflowTransition',NULL,NULL),(21,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(22,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(23,2,1,4,5,0,0,'WorkflowTransition',NULL,NULL),(24,2,1,4,6,0,0,'WorkflowTransition',NULL,NULL),(25,1,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(26,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(27,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(28,1,1,5,6,0,0,'WorkflowTransition',NULL,NULL),(29,2,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(30,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(31,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(32,2,1,5,6,0,0,'WorkflowTransition',NULL,NULL),(33,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(34,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(35,1,2,3,5,0,0,'WorkflowTransition',NULL,NULL),(36,1,2,3,6,0,0,'WorkflowTransition',NULL,NULL),(37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(38,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(39,2,2,3,5,0,0,'WorkflowTransition',NULL,NULL),(40,2,2,3,6,0,0,'WorkflowTransition',NULL,NULL),(41,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(42,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(43,1,2,4,5,0,0,'WorkflowTransition',NULL,NULL),(44,1,2,4,6,0,0,'WorkflowTransition',NULL,NULL),(45,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(46,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(47,2,2,4,5,0,0,'WorkflowTransition',NULL,NULL),(48,2,2,4,6,0,0,'WorkflowTransition',NULL,NULL),(49,1,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(50,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(51,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(52,1,2,5,6,0,0,'WorkflowTransition',NULL,NULL),(53,2,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(54,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(55,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(56,2,2,5,6,0,0,'WorkflowTransition',NULL,NULL),(57,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(58,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(59,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(60,1,3,4,6,0,0,'WorkflowTransition',NULL,NULL),(61,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(62,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(63,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(64,2,3,4,6,0,0,'WorkflowTransition',NULL,NULL),(65,1,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(66,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(67,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(68,1,3,5,6,0,0,'WorkflowTransition',NULL,NULL),(69,2,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(70,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(71,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(72,2,3,5,6,0,0,'WorkflowTransition',NULL,NULL),(73,1,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(74,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(75,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(76,1,4,5,6,0,0,'WorkflowTransition',NULL,NULL),(77,2,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(78,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(79,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(80,2,4,5,6,0,0,'WorkflowTransition',NULL,NULL),(81,1,0,1,3,0,0,'WorkflowTransition',NULL,NULL),(82,1,0,1,4,0,0,'WorkflowTransition',NULL,NULL),(83,1,0,1,5,0,0,'WorkflowTransition',NULL,NULL),(84,1,0,1,6,0,0,'WorkflowTransition',NULL,NULL),(85,2,0,1,3,0,0,'WorkflowTransition',NULL,NULL),(86,2,0,1,4,0,0,'WorkflowTransition',NULL,NULL),(87,2,0,1,5,0,0,'WorkflowTransition',NULL,NULL),(88,2,0,1,6,0,0,'WorkflowTransition',NULL,NULL),(89,1,0,2,3,0,0,'WorkflowTransition',NULL,NULL),(90,1,0,2,4,0,0,'WorkflowTransition',NULL,NULL),(91,1,0,2,5,0,0,'WorkflowTransition',NULL,NULL),(92,1,0,2,6,0,0,'WorkflowTransition',NULL,NULL),(93,2,0,2,3,0,0,'WorkflowTransition',NULL,NULL),(94,2,0,2,4,0,0,'WorkflowTransition',NULL,NULL),(95,2,0,2,5,0,0,'WorkflowTransition',NULL,NULL),(96,2,0,2,6,0,0,'WorkflowTransition',NULL,NULL),(97,1,0,3,3,0,0,'WorkflowTransition',NULL,NULL),(98,1,0,3,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,0,3,5,0,0,'WorkflowTransition',NULL,NULL),(100,1,0,3,6,0,0,'WorkflowTransition',NULL,NULL),(101,2,0,3,3,0,0,'WorkflowTransition',NULL,NULL),(102,2,0,3,4,0,0,'WorkflowTransition',NULL,NULL),(103,2,0,3,5,0,0,'WorkflowTransition',NULL,NULL),(104,2,0,3,6,0,0,'WorkflowTransition',NULL,NULL),(105,1,0,4,3,0,0,'WorkflowTransition',NULL,NULL),(106,1,0,4,4,0,0,'WorkflowTransition',NULL,NULL),(107,1,0,4,5,0,0,'WorkflowTransition',NULL,NULL),(108,1,0,4,6,0,0,'WorkflowTransition',NULL,NULL),(109,2,0,4,3,0,0,'WorkflowTransition',NULL,NULL),(110,2,0,4,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,0,4,5,0,0,'WorkflowTransition',NULL,NULL),(112,2,0,4,6,0,0,'WorkflowTransition',NULL,NULL),(113,1,0,5,3,0,0,'WorkflowTransition',NULL,NULL),(114,1,0,5,4,0,0,'WorkflowTransition',NULL,NULL),(115,1,0,5,5,0,0,'WorkflowTransition',NULL,NULL),(116,1,0,5,6,0,0,'WorkflowTransition',NULL,NULL),(117,2,0,5,3,0,0,'WorkflowTransition',NULL,NULL),(118,2,0,5,4,0,0,'WorkflowTransition',NULL,NULL),(119,2,0,5,5,0,0,'WorkflowTransition',NULL,NULL),(120,2,0,5,6,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27 13:15:24
