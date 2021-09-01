-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: rds-artemis-prod.akross.com.br    Database: artemis
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `channelTypeUuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) NOT NULL,
  `auction` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `config` text,
  PRIMARY KEY (`uuid`),
  KEY `channelTypeUuid` (`channelTypeUuid`),
  CONSTRAINT `channel_ibfk_1` FOREIGN KEY (`channelTypeUuid`) REFERENCES `channelType` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES ('39766f8e-621a-40b0-aa5e-ff265b881324','PUSH','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','Oi Wifi',0,'2020-05-14 16:36:19','2020-05-14 16:36:23',NULL,0,'{\"audience\":{\"optin\":\"totalSponsorNotification\"}, \"userKeyType\":[\"terminal\", \"documento\" ]}'),('3b148899-6c48-4f49-92af-5d22b9381d39','PUSH','1d3cec27-4a2c-4023-90f9-a2e60c46f7f9','PUSH',0,'2019-01-01 02:00:00','2019-01-01 02:00:00',NULL,0,'{\"audience\":{\"optin\":\"totalOptinPush\"},\"nai\":\"200\",\"nt\":\"notification_oiwifi\", \"userKeyType\":[\"terminal\", \"documento\" ]}'),('410acdee-7519-11ea-8888-0adb496a6c72','NOTIFY','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','Notify',0,'2020-04-02 19:39:22','2020-04-02 19:39:22',NULL,0,'{\"audience\":{\"optin\":\"totalOptinNotify\"}, \"userKeyType\":[\"terminal\", \"documento\" ]}'),('429b688c-42ec-4874-b69b-14f8a014e181','No Credit','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','No Credit',1,'2020-07-08 16:58:51','2020-07-08 16:58:52',NULL,0,'{\"userKeyType\":[\"terminal\", \"documento\" ]}'),('478bc49a-0065-4c0b-9adf-b42783977581','IVR-TIM','56e4f195-b343-4732-a4be-ab9040073d73','IVR',1,'2020-07-01 16:07:32','2020-07-01 16:07:32',NULL,0,'{}'),('4e2a4def-e0d8-11ea-86ee-060cd8ca31a3','CAPTIVE-IMAGE','cb7bf4b5-ccee-11ea-a5b1-0ad41959e74c','Imagem',0,'2020-08-20 15:13:41','2020-08-20 15:13:41','2020-11-26 19:43:19',0,'{}'),('4e2a51ca-e0d8-11ea-86ee-060cd8ca31a3','CAPTIVE-VIDEO','cb7bf4b5-ccee-11ea-a5b1-0ad41959e74c','Video',0,'2020-08-20 15:13:41','2020-08-20 15:13:41','2020-11-26 19:43:20',0,'{}'),('4e2a526d-e0d8-11ea-86ee-060cd8ca31a3','CAPTIVE-SURVEY','cb7bf4b5-ccee-11ea-a5b1-0ad41959e74c','Pesquisa',0,'2020-08-20 15:13:41','2020-08-20 15:13:41','2020-11-26 19:43:21',0,'{}'),('4e2a5310-e0d8-11ea-86ee-060cd8ca31a3','CAPTIVE-EMBEDDED','cb7bf4b5-ccee-11ea-a5b1-0ad41959e74c','Pagina web',0,'2020-08-20 15:13:41','2020-08-20 15:13:41','2020-11-26 19:43:22',0,'{}'),('701abfc4-81cd-11eb-910a-0ea7622c23f9','Portal-IVA-Mobicare','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','Portal-IVA-Mobicare',0,'2021-03-10 15:24:34','2021-03-10 15:24:35',NULL,0,'{}'),('79475802-c34b-4623-98b9-64d6279cf508','Claro Free Campaigns Calhau','c2c373a0-15e3-4f95-819d-e14292537628','Campanhas Claro Free Calhau',0,'2021-02-26 13:51:29','2021-02-26 13:51:29',NULL,0,'{}'),('7ca22211-da6e-4ea9-bf1c-6eaa8c23cfd9','No Data','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','No Data',1,'2020-09-09 14:10:39','2020-09-09 14:10:39',NULL,0,'{}'),('7d8d2fc0-7267-47b6-a8fe-b5180beb4d94','Satpush','a8c9d8bf-18b9-441c-922d-8418c8537e0a','Satpush',1,'2020-04-27 17:35:09','2020-04-27 17:35:12',NULL,0,'{}'),('899cb964-0224-4067-8978-de855232ff6a','SMS','d7569757-6eb3-4601-a523-637aa5480ffd','Short Text Message',0,'2019-12-06 11:21:56','2019-12-06 11:21:56',NULL,0,'{\"audience\":{\"optin\":\"totalOptinSms\"}, \"userKeyType\":[\"terminal\", \"documento\" ]}'),('90902fcb-5e09-458b-b51a-f9d0e8c5dd8a','Claro Free App Install','c2c373a0-15e3-4f95-819d-e14292537628','Claro Free App Install',0,'2021-07-23 15:26:38','2021-07-23 15:26:38',NULL,0,'{}'),('90f196a3-3e5e-4f03-b087-73eb88804ec1','USSD-TIM','2aee4023-bfe8-433f-b404-ff22bbf4ae5f','USSD',1,'2020-07-01 16:07:28','2020-07-01 16:07:28',NULL,0,'{}'),('91a66125-84c2-43ad-9546-54c3035548fe','Claro Free Desafio','c2c373a0-15e3-4f95-819d-e14292537628','Desafio Claro Free',0,'2020-11-09 17:20:00','2020-11-09 17:20:00',NULL,0,'{}'),('95180c53-7e57-4219-a46c-52bd22abb51f','USSD','2aee4023-bfe8-433f-b404-ff22bbf4ae5f','USSD',1,'2019-01-01 00:00:00','2019-01-01 00:00:00',NULL,0,'{}'),('955b94e7-eb74-4136-b79f-9f444b26b4fa','Smart Message','a8c9d8bf-18b9-441c-922d-8418c8537e0a','Smart Message',1,'2019-01-01 00:00:00','2019-01-01 00:00:00',NULL,0,'{}'),('a05d84bc-95f3-418f-a3c6-d2eeca9279cf','Minha-Oi-PULL','b6663481-27b5-4fe9-b263-0147c893bbbe','Minha Oi',0,'2021-01-05 13:43:30','2021-01-13 13:43:30',NULL,0,'{\"acfgu\":\"http://minhaoirows.mobicare.mockable.io/artemis/ads/config\",\"atu\":\"https://hml-adserver.mobicare.com.br/adserver/tracker\",\"acu\":\"https://hml-adserver.mobicare.com.br/adserver/campaign/v2/{campaignId}?size={size}\",\"aru\":\"https://hml-adserver.mobicare.com.br/adserver/report\",\"asnu\":\"https://hml-adserver.mobicare.com.br/adserver/campaign/sponsor/{msisdn}\",\"nt\":\"notification_minhaoi\",\"nru\":\"https://oi-p-ngt.mobicare.com.br/mcare-ngt/v2/register\",\"nuu\":\"https://oi-p-ngt.mobicare.com.br/mcare-ngt/v1/unregister\",\"ncu\":\"https://oi-p-ngt.mobicare.com.br/mcare-ngt/v2/device/callback\",\"nai\":\"202\",\"audience\":{\"optin\":\"totalOptinPush\"}, \"userKeyType\":[\"terminal\", \"documento\"]}'),('a28ad453-e4a9-4caf-9f0e-6a3e2d94d991','IVR-CLARO','56e4f195-b343-4732-a4be-ab9040073d73','IVR',1,'2020-04-27 19:32:54','2020-04-27 19:32:54',NULL,0,'{}'),('afd83f2b-ccf9-11ea-a5b1-0ad41959e74c','CAPTIVE-PORTAL','cb7bf4b5-ccee-11ea-a5b1-0ad41959e74c','Apolo captive portal',0,'2020-08-20 12:34:17','2020-08-20 12:34:17',NULL,0,'{}'),('afd856d1-ccf9-11ea-a5b1-0ad41959e74c','CAPTIVE-REDIR','cb7bf7d4-ccee-11ea-a5b1-0ad41959e74c','Apolo captive redir',0,'2020-08-20 12:34:17','2020-08-20 12:34:17',NULL,0,'{}'),('c67706dc-cee5-4e9f-af66-f5e760d80282','SmartMessage','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','SmartMessage (Pós)',1,'2020-07-28 22:14:29','2020-07-28 22:14:29',NULL,0,'{}'),('c7b01224-03a2-49ba-8501-dbbd3fcfabd3','IVR','56e4f195-b343-4732-a4be-ab9040073d73','IVR',1,'2019-01-01 00:00:00','2019-01-01 00:00:00',NULL,0,'{}'),('d1105f2a-1cb7-461f-b084-1229bdef1034','Satpush Text','a8c9d8bf-18b9-441c-922d-8418c8537e0a','Satpush Text',1,'2020-09-09 14:10:39','2020-09-09 14:10:39',NULL,0,'{}'),('db4f2f11-5966-46e7-8e05-31ccecca0a93','Satpush-TIM','a8c9d8bf-18b9-441c-922d-8418c8537e0a','Satpush',1,'2020-07-01 16:07:30','2020-07-01 16:07:30',NULL,0,'{}'),('f76760d1-0e78-49e0-8e77-aee8f6de2243','Claro Free Campaigns','c2c373a0-15e3-4f95-819d-e14292537628','Campanhas Claro Free',0,'2020-11-09 17:20:00','2020-11-09 17:20:00',NULL,0,'{}'),('fb31a2c8-4e99-11eb-9c5e-0242ac110002','Minha-Oi','1d3cec27-4a2c-4023-90f9-a2e60c46f7f9','Minha Oi',0,'2021-01-05 13:43:30','2021-01-13 13:43:30',NULL,0,'{\"acfgu\":\"http://minhaoirows.mobicare.mockable.io/artemis/ads/config\",\"atu\":\"https://hml-adserver.mobicare.com.br/adserver/tracker\",\"acu\":\"https://hml-adserver.mobicare.com.br/adserver/campaign/v2/{campaignId}?size={size}\",\"aru\":\"https://hml-adserver.mobicare.com.br/adserver/report\",\"asnu\":\"https://hml-adserver.mobicare.com.br/adserver/campaign/sponsor/{msisdn}\",\"nt\":\"notification_minhaoi\",\"nru\":\"https://oi-p-ngt.mobicare.com.br/mcare-ngt/v2/register\",\"nuu\":\"https://oi-p-ngt.mobicare.com.br/mcare-ngt/v1/unregister\",\"ncu\":\"https://oi-p-ngt.mobicare.com.br/mcare-ngt/v2/device/callback\",\"nai\":\"202\",\"audience\":{\"optin\":\"totalOptinPush\"}, \"userKeyType\":[\"terminal\", \"documento\" ]}'),('fd1bd5dc-4754-11ea-89ec-0677896605d2','VIDEO','aa7ec8bd-b7c4-488c-9dd8-5528b248047c','No-Credit',0,'2020-02-04 13:48:46','2020-02-04 13:48:46',NULL,0,'{\"audience\":{\"optin\":\"totalOptinRewarded\"}, \"userKeyType\":[\"terminal\", \"documento\" ]}');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-24  8:32:51
