-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `comment` text,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'M@teo21','Un peu court ce billet !','2010-03-25 16:49:53'),(2,1,'Maxime','Oui, ça commence pas très fort ce blog...','2010-03-25 16:57:16'),(3,1,'MultiKiller','+1 !','2010-03-25 17:12:52'),(4,2,'John','Preum\'s !','2010-03-27 18:59:49'),(5,2,'Maxime','Excellente analyse de la situation !\r\nIl y arrivera plus tôt qu\'on ne le pense !','2010-03-27 22:02:13'),(6,4,'Lulu58','Diablement fascinant !','2020-05-20 23:56:42'),(7,5,'dede87','Génialissime !','2020-06-04 23:59:26');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeux_video`
--

DROP TABLE IF EXISTS `jeux_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeux_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_proprietaire` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `possesseur` varchar(255) NOT NULL,
  `console` varchar(255) NOT NULL,
  `prix` double NOT NULL DEFAULT '0',
  `nbre_joueurs_max` int(11) NOT NULL DEFAULT '0',
  `commentaires` text NOT NULL,
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeux_video`
--

LOCK TABLES `jeux_video` WRITE;
/*!40000 ALTER TABLE `jeux_video` DISABLE KEYS */;
INSERT INTO `jeux_video` VALUES (1,1,'Super Mario Bros','Florent','NES',4,1,'Un jeu d\'anthologie !'),(2,2,'Sonic','Patrick','Megadrive',2,1,'Pour moi, le meilleur jeu du monde !'),(3,1,'Zelda : ocarina of time','Florent','Nintendo 64',15,1,'Un jeu grand, beau et complet comme on en voit rarement de nos jours'),(4,1,'Mario Kart 64','Florent','Nintendo 64',25,4,'Un excellent jeu de kart !'),(5,3,'Super Smash Bros Melee','Michel','GameCube',55,4,'Un jeu de baston délirant !'),(6,2,'Dead or Alive','Patrick','Xbox',60,4,'Le plus beau jeu de baston jamais créé'),(7,2,'Dead or Alive Xtreme Beach Volley Ball','Patrick','Xbox',60,4,'Un jeu de beach volley de toute beauté o_O'),(8,3,'Enter the Matrix','Michel','PC',45,1,'Plutôt bof comme jeu, mais ça complète bien le film'),(9,3,'Max Payne 2','Michel','PC',50,1,'Très réaliste, une sorte de film noir sur fond d\'histoire d\'amour. A essayer !'),(10,1,'Yoshi\'s Island','Florent','SuperNES',6,1,'Le paradis des Yoshis :o)'),(11,1,'Zlatan, le Jeu','Florent','PC',70,4,'Zlatannesque !!!!');
/*!40000 ALTER TABLE `jeux_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minichat`
--

DROP TABLE IF EXISTS `minichat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minichat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date_insertion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minichat`
--

LOCK TABLES `minichat` WRITE;
/*!40000 ALTER TABLE `minichat` DISABLE KEYS */;
INSERT INTO `minichat` VALUES (217,'Jojo56','Bon appÃ©tit !','2020-05-20 19:42:30'),(218,'lionel87','Merci !!!!','2020-05-20 19:48:53'),(219,'GÃ©gÃ©67','Hello, y a quelqu\'un ?','2020-05-20 20:04:29'),(220,'GÃ©gÃ©67','J\'ai faim !!!','2020-05-20 20:42:03'),(221,'Lulu44','C\'est l\'heure du marchand de sable !!!','2020-05-20 23:45:58'),(222,'GÃ©gÃ©67','Tout Ã  f','2020-05-20 23:46:36'),(223,'Jojo56','Tout Ã  fait Lulu !!!','2020-05-20 23:47:04');
/*!40000 ALTER TABLE `minichat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Ma première news','Vous lisez ma première news'),(2,'Ma deuxième news ','Vous lisez ma deuxième news'),(3,'Ma troisième news','Vous lisez ma troisième news.');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Bienvenue sur mon blog !','Je vous souhaite à toutes et à tous la bienvenue sur mon blog qui parlera de... PHP bien sûr !','2010-03-25 16:28:41'),(2,'Le PHP à la conquête du monde !','C\'est officiel, l\'éléPHPant a annoncé à la radio hier soir \"J\'ai l\'intention de conquérir le monde !\".\r\nIl a en outre précisé que le monde serait à sa botte en moins de temps qu\'il n\'en fallait pour dire \"éléPHPant\". Pas dur, ceci dit entre nous...','2010-03-27 18:31:11'),(3,'Un ingénieur crée une voiture autonome dans GTA V grâce à de l’IA et une webcam','Un jeune développeur a transformé un système de pilotage automatique pour l\'adapter à GTA V. Résultat : il a crée une voiture autonome dans le célèbre jeu de Rockstar Games.\r\n\r\nGrand Theft Auto V (GTA V) n’est clairement pas le lieu idoine pour apprendre de bonnes pratiques de conduite. Par conséquent, le jeu est encore moins indiqué pour un système de pilotage automatique. Qu’importe, l’idée est fascinante et un jeune développeur de 15 ans seulement a réussi à faire rouler une voiture autonome dans les rues fictives de l’État de San Andreas.\r\nPour ce faire, le développeur — Leon Hillman de son nom — s’est appuyé sur le code open source de l’entreprise Comma.ai. L’objectif de cette firme est de faire baisser les coûts des technologies de pilotage automatique pour les véhicules autonomes.\r\n\r\nEn modifiant cette base, le jeune homme a réussi à intégrer des véhicules autonomes dans GTA V. Grosso modo, l’algorithme prend le contrôle du véhicule à la place du joueur. Leon Hillman a publié une démonstration vidéo sur son compte Twitter. Un article de Comma.ai sur Medium livre par ailleurs quelques détails techniques sur ce joli exploit.\r\n\r\n\r\n','2020-05-20 23:23:15'),(4,'Intel Core de 10e génération : les processeurs Comet Lake-S draguent les joueurs et les créatifs.','Cela faisait 18 mois qu\'Intel n\'avait pas renouvelé son offre de CPU à destination des ordinateurs de bureau. La firme revient toutefois à la charge avec une 10e génération de processeurs Core, qui a fort à faire face aux Ryzen d\'AMD.\r\n\r\nIntel avait pris pour habitude de renouveler chaque année ses séries de processeurs, qu\'ils soient à destination des ordinateurs portables ou de bureau. Le fabricant rencontre toutefois certaines difficultés à maintenir ce cap et aura tardé un an et demi à proposer une relève à ses processeurs Core de 9e génération. Cette longue attente aurait pu être synonyme d\'évolutions technologiques avancées, mais il n\'en est malheureusement rien pour cette 10e génération de puces Core à destination des ordinateurs de bureau.\r\n\r\nComet Lake-S : aucune évolution technologique pour les Core de 10e génération\r\nSur cette série, Intel est ainsi toujours enlisé dans la gravure en 14 nm et conserve la même architecture que sur sa précédente gamme. Ceux qui suivent l\'actualité des composants l\'auront compris : ces nouveaux processeurs recourent encore et toujours à l\'architecture Skylake de 2015. Évidemment, Intel a fait évoluer ses puces par petites touches au fil des ans, mais l\'architecture de cette série Comet Lake-S n\'est qu\'une énième version rafraîchie de la 6e génération de processeurs Core. Le 10 nm et l\'architecture Sunny Cove sont donc toujours l\'exclusivité d\'une partie de la 10e génération de processeurs Core à destination des ordinateurs de bureau.\r\n\r\npar  Régis Jehl (Twitter @regis_lesnums@regis_lesnums)\r\n Publié le 20/05/20 à 15h00','2020-05-20 23:25:56'),(5,'Microsoft révolutionne Office et brise les barrières entre Word, Excel et PowerPoint','Microsoft va proposer une toute nouvelle expérience de création, d’édition et de partage des documents Office. L’entreprise se focalise sur l’aspect collaboratif des applications de sa suite, à l’image de Google Docs, Sheets et Forms. Et grâce au nouveau Framework Fluid, il n’existe désormais plus de frontière entre Word, Office ou encore PowerPoint. Vous pourrez créer des éléments indépendants qui s’intègrent facilement dans n’importe quel document.\r\nLors de sa conférence Build 2020 qui se déroule exclusivement en ligne du 19 au 21 mai 2020, Microsoft a dévoilé ses plans pour l’avenir de la suite Office. Ce futur passe par le nouveau Framework Fluid qui s’apprête à s’installer au cœur du fonctionnement de Microsoft 365 et des applications Office. Ces dernières deviendront beaucoup plus dynamiques et interconnectées grâce à des éléments indépendants et évolutifs.\r\n\r\nQu’est-ce que le FrameWork Fluid ?\r\nMicrosoft Fluid Framework est une technologie conçue pour faciliter la collaboration entre les utilisateurs des applications de la suite Office en ligne, notamment via Microsoft 365 et Office.com. Le framework permet de créer et de modifier des contenus dynamiques en temps réel grâce à des composants indépendants qui peuvent être partagés de manière transparente entre différentes applications.\r\n\r\nL’idée est de permettre de créer des éléments tels que des tableaux sans avoir nécessairement à utiliser Excel par exemple. Ces tableaux fonctionneront comme des blocs autonomes qui peuvent être intégrés dans un document Word, Excel, dans Microsoft Team ou encore dans un email. Mieux, toutes les modifications effectuées à un endroit s’appliqueront automatiquement partout ou l’élément est intégré.\r\n\r\nMicrosoft compare ces éléments à des blocs Lego de contenu Office qui vivent sur le Web. Les tableaux, graphiques et listes de tâche que vous trouvez généralement dans les documents Office se transforment en modules collaboratifs dynamiques qui peuvent exister en dehors des documents traditionnels. Peu importe où vous les créez et quelle que soit la façon dont vous les partagez et les copiez dans d’autres applications, ils restent accessibles et\r\n\r\nMicrosoft veut faire de Word, Excel et PowerPoint des outils collaboratifs d’un nouveau genre\r\nCertes, Microsoft Office reste très populaire, mais la suite subit de plus en plus la concurrence de Google Docs, Sheets et Forms qui sont entièrement gratuits et collaboratifs. Office Online, la version en ligne gratuite de Microsoft représente la parfaite alternative, mais la forte communauté de Google/Gmail a tendance à faire basculer les préférences en sa faveur. Microsoft Fluid et ses blocs dynamiques vont peut-être contribuer à renverser la vapeur.\r\n\r\nGrâce à Fluid, les tableaux, les graphiques et listes sont toujours vivants et modifiables, cela pourrait être dans un email, dans une application de chat comme Microsoft Teams, ou même dans des applications tierces. Comment est-ce possible ? Simplement parce que Microsoft a décidé de rendre le Framework Open Source.\r\n\r\nDes éditeurs tiers pourront donc rejoindre la barque et rendre les blocs Fluid compatibles avec leurs propres applications.  Cette nouvelle expérience sera proposée dans les prochains mois sur Office Online (Office.com) et Outlook. Seuls les abonnés Microsoft 365 avec une licence Entreprise pourront y accéder dans un premier temps.\r\n\r\nPAR DAVID IGUE, 20/05/2020\r\n\r\n\r\n \r\n\r\n','2020-05-20 23:29:03');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietaires`
--

DROP TABLE IF EXISTS `proprietaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proprietaires` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prenom` varchar(200) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `tel` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietaires`
--

LOCK TABLES `proprietaires` WRITE;
/*!40000 ALTER TABLE `proprietaires` DISABLE KEYS */;
INSERT INTO `proprietaires` VALUES (1,'Florent','Dugommier','01 44 77 21 33'),(2,'Patrick','Lejeune','03 22 17 41 22'),(3,'Michel','Doussand','04 11 78 02 00'),(4,'Romain','Villepi','01 21 98 51 01');
/*!40000 ALTER TABLE `proprietaires` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-06 17:20:49
