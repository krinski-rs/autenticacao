-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 192.168.10.249    Database: gcdb
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `AccessBlockHistory`
--

DROP TABLE IF EXISTS `AccessBlockHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessBlockHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `IP` varchar(15) NOT NULL DEFAULT '',
  `data` varchar(30) NOT NULL DEFAULT '',
  `block` tinyint(1) DEFAULT NULL,
  `datalib` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`id`),
  KEY `CustomerID` (`CustomerID`),
  KEY `IP` (`IP`)
) ENGINE=MyISAM AUTO_INCREMENT=8148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AccessHistory`
--

DROP TABLE IF EXISTS `AccessHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessHistory` (
  `sid` varchar(250) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `IP` varchar(15) NOT NULL DEFAULT '',
  `data` varchar(30) NOT NULL DEFAULT '',
  `Tipo` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`,`CustomerID`,`IP`,`data`,`Tipo`),
  KEY `sid` (`sid`),
  KEY `CustomerID` (`CustomerID`),
  KEY `IP` (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AccessHistory_user`
--

DROP TABLE IF EXISTS `AccessHistory_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessHistory_user` (
  `sid` varchar(250) NOT NULL DEFAULT '',
  `UserID` varchar(10) NOT NULL,
  `IP` varchar(15) NOT NULL DEFAULT '',
  `data` varchar(30) NOT NULL DEFAULT '',
  `Tipo` varchar(10) NOT NULL DEFAULT '',
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`sid`,`UserID`,`IP`,`data`,`Tipo`,`cpf`),
  KEY `sid` (`sid`),
  KEY `CustomerID` (`UserID`),
  KEY `IP` (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts` (
  `AccountID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `DateOpened` date DEFAULT NULL,
  `DateClosed` date DEFAULT NULL,
  `Price` float(10,2) DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `Charged` varchar(15) NOT NULL DEFAULT '',
  `Servidor` varchar(100) DEFAULT NULL,
  `Plano` varchar(50) DEFAULT NULL,
  `Dominio` varchar(100) DEFAULT NULL,
  `Moeda` enum('R','D') NOT NULL DEFAULT 'R',
  `ServicoID` int(10) NOT NULL DEFAULT '0',
  `template` varchar(20) DEFAULT NULL,
  `AccountID_Old` int(11) NOT NULL,
  `max_portas` int(11) NOT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `AccountID` (`AccountID`),
  KEY `AccountID_2` (`AccountID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `Username` (`Username`),
  KEY `ServicoID` (`ServicoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Atendimento`
--

DROP TABLE IF EXISTS `Atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Atendimento` (
  `ATID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL DEFAULT '0',
  `URL` varchar(150) DEFAULT NULL,
  `URLObs` text,
  `Obs` text,
  `Mostrar` enum('SIM','NAO') NOT NULL DEFAULT 'SIM',
  PRIMARY KEY (`ATID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ATID` (`ATID`),
  KEY `CustomerID_2` (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=4304 DEFAULT CHARSET=latin1 COMMENT='Tabela Atendimento ao Usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CFOP`
--

DROP TABLE IF EXISTS `CFOP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CFOP` (
  `CFOP` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `telecom` int(1) NOT NULL DEFAULT '0',
  `uf_local` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CFOP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cartao`
--

DROP TABLE IF EXISTS `Cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cartao` (
  `CartaoID` int(10) NOT NULL AUTO_INCREMENT,
  `Verificador` int(4) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Tipo` varchar(10) DEFAULT NULL,
  `Obs` varchar(50) DEFAULT NULL,
  `CustomerID` int(10) DEFAULT NULL,
  `Numero` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`CartaoID`),
  KEY `CartaoID` (`CartaoID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Categoria_Documentos`
--

DROP TABLE IF EXISTS `Categoria_Documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria_Documentos` (
  `CategoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(60) NOT NULL DEFAULT '',
  `Descricao` text NOT NULL,
  PRIMARY KEY (`CategoriaID`),
  KEY `CategoriaID` (`CategoriaID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Categorias de documentos existentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Categoria_Servicos`
--

DROP TABLE IF EXISTS `Categoria_Servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria_Servicos` (
  `CategoriaID` int(11) NOT NULL,
  `ServicoID` int(11) NOT NULL,
  PRIMARY KEY (`CategoriaID`,`ServicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Configuration`
--

DROP TABLE IF EXISTS `Configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Configuration` (
  `Version` varchar(50) NOT NULL DEFAULT '',
  `BillAhead` enum('On','Off') DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer_CFOP`
--

DROP TABLE IF EXISTS `Customer_CFOP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_CFOP` (
  `CFOP` varchar(10) NOT NULL,
  `CustomerID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CFOP`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Customer_CFOP_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `CustomerID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `First` varchar(30) DEFAULT NULL,
  `Mid` char(1) DEFAULT NULL,
  `Last` varchar(40) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Telephone` varchar(16) DEFAULT NULL,
  `Fax` varchar(16) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Fantasia` varchar(100) DEFAULT NULL,
  `Razao` varchar(100) DEFAULT NULL,
  `CNPJ` varchar(18) DEFAULT NULL,
  `Pais` varchar(20) DEFAULT NULL,
  `Obs` text,
  `Emergencia` varchar(200) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `ATPass` varchar(20) NOT NULL DEFAULT 'temporar',
  `tributaicms` tinyint(1) DEFAULT NULL,
  `delin` tinyint(1) DEFAULT NULL,
  `origemexterna` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `origemexterna` (`origemexterna`),
  CONSTRAINT `Customers_ibfk_1` FOREIGN KEY (`origemexterna`) REFERENCES `Origemexterna` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6903 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `Customers_BINS` BEFORE INSERT ON `Customers` FOR EACH ROW
BEGIN
declare novoId int default 0;
SELECT IFnull(MAX(CustomerID),0) into novoID FROM Customers WHERE CustomerID!=NEW.CustomerID;
SET NEW.CustomerID = novoID+1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Customers2users`
--

DROP TABLE IF EXISTS `Customers2users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers2users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) unsigned NOT NULL,
  `id_customers` int(11) unsigned NOT NULL,
  `data_abertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alqt_icms` int(1) NOT NULL DEFAULT '1',
  `recebe_boleto` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_users` (`id_users`,`id_customers`),
  KEY `fk_Customers2users_2_idx` (`id_customers`),
  CONSTRAINT `fk_Customers2users_1` FOREIGN KEY (`id_users`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers2users_2` FOREIGN KEY (`id_customers`) REFERENCES `Customers` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6005 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `Customers2users_AINS` BEFORE INSERT ON `Customers2users` FOR EACH ROW
BEGIN
	DECLARE total int default 0;
	DECLARE EXIT HANDLER FOR NOT FOUND begin end;

	SELECT count(id_users) INTO total FROM Customers2users WHERE id_users=NEW.id_users;
	IF total > 0 THEN
		
        SET NEW =' erro';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `CustomersN`
--

DROP TABLE IF EXISTS `CustomersN`;
/*!50001 DROP VIEW IF EXISTS `CustomersN`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `CustomersN` AS SELECT 
 1 AS `CustomerID`,
 1 AS `Status`,
 1 AS `Obs`,
 1 AS `ATPass`,
 1 AS `First`,
 1 AS `Mid`,
 1 AS `Last`,
 1 AS `id_users`,
 1 AS `Address`,
 1 AS `Telephone`,
 1 AS `Fax`,
 1 AS `Email`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Pais`,
 1 AS `Zip`,
 1 AS `Emergencia`,
 1 AS `insc_est`,
 1 AS `insc_mun`,
 1 AS `Razao`,
 1 AS `Fantasia`,
 1 AS `CNPJ`,
 1 AS `CPF`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Documentacao`
--

DROP TABLE IF EXISTS `Documentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentacao` (
  `DOCID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL DEFAULT '0',
  `Descricao` varchar(100) NOT NULL DEFAULT 'Sem Descricao',
  `Texto` text NOT NULL,
  `Mostrar` enum('SIM','NAO') NOT NULL DEFAULT 'SIM',
  PRIMARY KEY (`DOCID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `DOCID` (`DOCID`),
  KEY `CustomerID_2` (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=7143 DEFAULT CHARSET=latin1 COMMENT='Documenta��o de procedimentos a clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Documentos`
--

DROP TABLE IF EXISTS `Documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentos` (
  `DocumentoID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoriaID` int(11) NOT NULL DEFAULT '0',
  `Titulo` varchar(150) NOT NULL DEFAULT '',
  `Conteudo` text NOT NULL,
  `Criacao` date NOT NULL DEFAULT '0000-00-00',
  `Visitas` int(11) NOT NULL DEFAULT '0',
  `Ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DocumentoID`),
  KEY `CategoriaID` (`CategoriaID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Documentos  Knowledge Base';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Documentos_Customers`
--

DROP TABLE IF EXISTS `Documentos_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentos_Customers` (
  `AssociaID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL DEFAULT '0',
  `CategoriaID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AssociaID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CategoriaID` (`CategoriaID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Cruza documentos com clientes (categoria)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Equipe`
--

DROP TABLE IF EXISTS `Equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipe` (
  `EquipeID` int(11) NOT NULL AUTO_INCREMENT,
  `EquipeNome` varchar(50) NOT NULL,
  `EquipeApelido` varchar(50) NOT NULL,
  `Ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`EquipeID`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grupos_servicos`
--

DROP TABLE IF EXISTS `Grupos_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grupos_servicos` (
  `GrupoServicoID` int(4) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL DEFAULT '',
  `CGST` tinyint(1) NOT NULL COMMENT 'Serviço usar sistema de Contabilização de Banda ? 0=Não 1=Sim',
  PRIMARY KEY (`GrupoServicoID`),
  KEY `GrupoServicoID` (`GrupoServicoID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices` (
  `InvoiceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  `DateBilled` date DEFAULT NULL,
  `Amount` float(10,2) DEFAULT NULL,
  `EMail` char(1) DEFAULT NULL,
  `Nota` varchar(6) DEFAULT NULL,
  `AccountID` int(10) NOT NULL DEFAULT '0',
  `telecom` int(1) DEFAULT '0',
  PRIMARY KEY (`InvoiceID`),
  UNIQUE KEY `InvoiceID` (`InvoiceID`),
  KEY `InvoiceID_2` (`InvoiceID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `AccountID` (`AccountID`)
) ENGINE=MyISAM AUTO_INCREMENT=29420 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Origem`
--

DROP TABLE IF EXISTS `Origem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Origem` (
  `OrigemID` int(5) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(4) NOT NULL DEFAULT '0',
  `Origem` varchar(250) NOT NULL DEFAULT '',
  `Agente` varchar(20) NOT NULL DEFAULT '',
  `DataCadastro` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`OrigemID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Origemexterna`
--

DROP TABLE IF EXISTS `Origemexterna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Origemexterna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parceiros_Accounts`
--

DROP TABLE IF EXISTS `Parceiros_Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parceiros_Accounts` (
  `AccountID` int(10) NOT NULL DEFAULT '0',
  `UsuarioID` int(10) NOT NULL DEFAULT '0',
  `ComissaoID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountID`,`UsuarioID`,`ComissaoID`),
  KEY `AccountID` (`AccountID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `ComissaoID` (`ComissaoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parceiros_Customers`
--

DROP TABLE IF EXISTS `Parceiros_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parceiros_Customers` (
  `CustomerID` int(10) NOT NULL DEFAULT '0',
  `UsuarioID` int(10) NOT NULL DEFAULT '0',
  `ComissaoID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerID`,`UsuarioID`,`ComissaoID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `ComissaoID` (`ComissaoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payments` (
  `PaymentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL DEFAULT '0',
  `DatePaid` date DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Number` varchar(50) DEFAULT NULL,
  `Amount` float(10,2) DEFAULT NULL,
  `RefInv` int(10) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `PaymentID` (`PaymentID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=21897 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_IP`
--

DROP TABLE IF EXISTS `Planos_IP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_IP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `servidor` varchar(20) DEFAULT NULL,
  `tipo` enum('Windows','Linux') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Planos_IP_FKIndex1` (`AccountID`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_Servicos_adicionais`
--

DROP TABLE IF EXISTS `Planos_Servicos_adicionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_Servicos_adicionais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` text,
  `valor_ativacao` double(10,2) DEFAULT NULL,
  `valor_mensal` double(10,2) DEFAULT NULL,
  `periodo` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_VPSN`
--

DROP TABLE IF EXISTS `Planos_VPSN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_VPSN` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) NOT NULL,
  `vpsn` varchar(20) DEFAULT NULL,
  `tipo` enum('Windows','Linux') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Planos_VPSN_FKIndex1` (`AccountID`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_dom_has_account`
--

DROP TABLE IF EXISTS `Planos_dom_has_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_dom_has_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) NOT NULL,
  `dominio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Planos_dom_has_account_FKIndex1` (`AccountID`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_email_ativacao`
--

DROP TABLE IF EXISTS `Planos_email_ativacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_email_ativacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountID` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `modelo` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_relacao_plano_servAdicionais`
--

DROP TABLE IF EXISTS `Planos_relacao_plano_servAdicionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_relacao_plano_servAdicionais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Planos_Servicos_adicionais_id` int(10) unsigned NOT NULL,
  `AccountID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Planos_relacao_plano_servAdicionais_FKIndex1` (`AccountID`),
  KEY `Planos_relacao_plano_servAdicionais_FKIndex2` (`Planos_Servicos_adicionais_id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_relacao_plano_servico`
--

DROP TABLE IF EXISTS `Planos_relacao_plano_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_relacao_plano_servico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Planos_tipo_servico_id` int(10) unsigned NOT NULL,
  `Planos_servicos_id` int(10) unsigned NOT NULL,
  `quantidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Planos_relacao_plano_servico_FKIndex1` (`Planos_servicos_id`),
  KEY `Planos_relacao_plano_servico_FKIndex2` (`Planos_tipo_servico_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_servicos`
--

DROP TABLE IF EXISTS `Planos_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_servicos` (
  `id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `tipo_servidor` enum('Windows','Linux') DEFAULT NULL,
  `tipo_plano` enum('SDV','HS','SDE') DEFAULT NULL,
  `valor_mensal` double(10,2) DEFAULT NULL,
  `valor_ativacao` double(10,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Planos_tipo_servico`
--

DROP TABLE IF EXISTS `Planos_tipo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Planos_tipo_servico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Plantao`
--

DROP TABLE IF EXISTS `Plantao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plantao` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(250) NOT NULL DEFAULT '',
  `Celular` varchar(20) NOT NULL DEFAULT '',
  `Email` varchar(250) NOT NULL DEFAULT '',
  `Fone` varchar(15) NOT NULL DEFAULT '',
  `SMS` varchar(250) NOT NULL DEFAULT '',
  `Plantao` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PowerSwitches`
--

DROP TABLE IF EXISTS `PowerSwitches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PowerSwitches` (
  `PowerSwitchID` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(15) NOT NULL DEFAULT '',
  `Descricao` varchar(150) NOT NULL DEFAULT '',
  `Local` varchar(150) NOT NULL DEFAULT '',
  `RunPath` varchar(250) NOT NULL DEFAULT '',
  `login` varchar(10) NOT NULL DEFAULT '',
  `senha` varchar(10) NOT NULL DEFAULT '',
  `NumPortas` int(2) DEFAULT NULL,
  PRIMARY KEY (`PowerSwitchID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 PACK_KEYS=0 COMMENT='Listagem dos switches da SouthTech com seus IPs, quais sao e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PowerSwitches_Portas`
--

DROP TABLE IF EXISTS `PowerSwitches_Portas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PowerSwitches_Portas` (
  `PortaID` int(11) NOT NULL AUTO_INCREMENT,
  `NomeMaquina` text NOT NULL,
  `CustomerID` int(11) NOT NULL DEFAULT '0',
  `PowerSwitchID` int(11) NOT NULL DEFAULT '0',
  `Porta` int(11) NOT NULL DEFAULT '0',
  `Local` varchar(150) NOT NULL DEFAULT '',
  `MostrarParaCliente` int(1) DEFAULT NULL,
  PRIMARY KEY (`PortaID`),
  UNIQUE KEY `portas` (`PowerSwitchID`,`Porta`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SwitchID` (`PowerSwitchID`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1 COMMENT='Lista as portas ligadas em cada switch, associadas ao custom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Prioridade`
--

DROP TABLE IF EXISTS `Prioridade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prioridade` (
  `PrioridadeID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL,
  `Nivel` char(10) NOT NULL,
  PRIMARY KEY (`PrioridadeID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Prioridade_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5849 DEFAULT CHARSET=latin1 COMMENT='Guarda os niveis de clientes vip1 vip2 vip3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rel_GN`
--

DROP TABLE IF EXISTS `Rel_GN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rel_GN` (
  `GNID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `Delegado` datetime DEFAULT NULL,
  `Revogado` datetime DEFAULT NULL,
  PRIMARY KEY (`GNID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `Rel_GN_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `aut_usuarios` (`id`),
  CONSTRAINT `Rel_GN_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=50290 DEFAULT CHARSET=latin1 PACK_KEYS=0 COMMENT='Cruza o Gerente de Negocios com o cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ServiceQualityResearch`
--

DROP TABLE IF EXISTS `ServiceQualityResearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceQualityResearch` (
  `TicketID` int(11) NOT NULL DEFAULT '0',
  `dt_resposta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p1_cordialidade` int(1) NOT NULL DEFAULT '0',
  `p2_tempo` int(1) NOT NULL DEFAULT '0',
  `p3_avaliacao` int(1) NOT NULL DEFAULT '0',
  `user_id` int(10) NOT NULL DEFAULT '0',
  `CustomerID` int(10) NOT NULL DEFAULT '0',
  `IP` varchar(15) DEFAULT '0.0.0.0',
  PRIMARY KEY (`TicketID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Servicos`
--

DROP TABLE IF EXISTS `Servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Servicos` (
  `ServicoID` int(10) NOT NULL AUTO_INCREMENT,
  `GrupoServicoID` varchar(4) NOT NULL DEFAULT '',
  `Nome` varchar(50) NOT NULL DEFAULT '',
  `Apelido` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`ServicoID`),
  KEY `GrupoServicoID` (`GrupoServicoID`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COMMENT='Relacao de todos os servicos, rel grupos_servicos e rel_serv';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Switches`
--

DROP TABLE IF EXISTS `Switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Switches` (
  `SwitchID` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(15) NOT NULL DEFAULT '',
  `Descricao` varchar(150) NOT NULL DEFAULT '',
  `Local` varchar(150) NOT NULL DEFAULT '',
  `RunPath` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`SwitchID`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 PACK_KEYS=0 COMMENT='Listagem dos switches da SouthTech com seus IPs, quais sao e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Switches_Portas`
--

DROP TABLE IF EXISTS `Switches_Portas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Switches_Portas` (
  `PortaID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL DEFAULT '0',
  `SwitchID` int(11) NOT NULL DEFAULT '0',
  `Porta` int(11) NOT NULL DEFAULT '0',
  `Local` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`PortaID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SwitchID` (`SwitchID`)
) ENGINE=MyISAM AUTO_INCREMENT=922 DEFAULT CHARSET=latin1 COMMENT='Lista as portas ligadas em cada switch, associadas ao custom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TicketFollowUp`
--

DROP TABLE IF EXISTS `TicketFollowUp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketFollowUp` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `TicketID` int(10) NOT NULL,
  `Autor` varchar(250) NOT NULL DEFAULT '',
  `Email` varchar(250) NOT NULL DEFAULT '',
  `Mensagem` text NOT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `Tipo` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `TicketID` (`TicketID`),
  CONSTRAINT `TicketFollowUp_ibfk_1` FOREIGN KEY (`TicketID`) REFERENCES `Tickets` (`TicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=1680867 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets` (
  `TicketID` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL DEFAULT '0',
  `Subject` varchar(250) NOT NULL DEFAULT '',
  `Description` text,
  `Status` varchar(10) DEFAULT NULL,
  `OpenDate` date DEFAULT NULL,
  `OpenTime` time DEFAULT NULL,
  `CloseDate` date DEFAULT NULL,
  `CloseTime` time DEFAULT NULL,
  `Opener` varchar(100) DEFAULT NULL,
  `Solicitante` varchar(100) DEFAULT NULL,
  `Email` varchar(250) NOT NULL DEFAULT '',
  `Nivel` int(11) DEFAULT NULL,
  `Closer` varchar(100) NOT NULL DEFAULT '',
  `CategoriaID` int(10) NOT NULL DEFAULT '0',
  `Fechado` datetime DEFAULT NULL,
  `Aberto` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Metodo` varchar(100) NOT NULL DEFAULT 'interna',
  PRIMARY KEY (`TicketID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Tickets_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=163656 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TicketsPlantao`
--

DROP TABLE IF EXISTS `TicketsPlantao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketsPlantao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `dt` datetime DEFAULT NULL,
  `user_id_alteracao` int(5) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Categoria`
--

DROP TABLE IF EXISTS `Tickets_Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Categoria` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `conta_sla` tinyint(1) DEFAULT NULL,
  `prioridade` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `Ativo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Config`
--

DROP TABLE IF EXISTS `Tickets_Config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to` varchar(150) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Resp`
--

DROP TABLE IF EXISTS `Tickets_Resp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Resp` (
  `tickresp_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `data_inicial` datetime NOT NULL,
  `data_final` datetime DEFAULT NULL,
  PRIMARY KEY (`tickresp_codigoid`),
  KEY `tickets_id` (`tickets_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=327879 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_permission`
--

DROP TABLE IF EXISTS `Tickets_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_permission` (
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Userequipe`
--

DROP TABLE IF EXISTS `Userequipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Userequipe` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` tinyint(4) NOT NULL DEFAULT '1',
  `FK_UserID` int(11) NOT NULL,
  `FK_EquipeID` int(11) NOT NULL,
  `Data_Add` date NOT NULL,
  `Data_Rem` date DEFAULT '0000-00-00',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VendasAgentes`
--

DROP TABLE IF EXISTS `VendasAgentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VendasAgentes` (
  `VendaID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(4) NOT NULL DEFAULT '0',
  `AgenteID` int(3) NOT NULL DEFAULT '0',
  `Status` int(1) NOT NULL DEFAULT '0',
  `Comissao` varchar(25) NOT NULL DEFAULT '',
  `Pago` int(1) NOT NULL DEFAULT '0',
  `DataPago` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`VendaID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `AgenteID` (`AgenteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_old`
--

DROP TABLE IF EXISTS `accounts_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_old` (
  `AccountID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `DateOpened` date DEFAULT NULL,
  `DateClosed` date DEFAULT NULL,
  `Price` float(5,2) DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `Charged` varchar(15) NOT NULL DEFAULT '',
  `Servidor` varchar(100) DEFAULT NULL,
  `Plano` varchar(50) DEFAULT NULL,
  `Dominio` varchar(100) DEFAULT NULL,
  `Moeda` enum('R','D') NOT NULL DEFAULT 'R',
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `AccountID` (`AccountID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_trafego`
--

DROP TABLE IF EXISTS `accounts_trafego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_trafego` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `servicoID` int(11) NOT NULL,
  `tipo_servicoID` int(11) NOT NULL,
  `volume_trafego` char(10) NOT NULL,
  `trafego_extra` char(10) NOT NULL,
  `tipo_medida` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5649 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_cidades`
--

DROP TABLE IF EXISTS `adm_cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_cidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `adm_uf_id` int(11) DEFAULT NULL,
  `codigo_ibge` int(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_cidades_FKIndex1` (`adm_uf_id`),
  CONSTRAINT `adm_cidades_ibfk_1` FOREIGN KEY (`adm_uf_id`) REFERENCES `adm_uf` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_logradouro`
--

DROP TABLE IF EXISTS `adm_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_logradouro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_pais`
--

DROP TABLE IF EXISTS `adm_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` char(3) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `codigo_bacen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_switchs`
--

DROP TABLE IF EXISTS `adm_switchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_switchs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `qtd_portas` int(3) NOT NULL,
  `cmd_adm_status` varchar(200) NOT NULL,
  `cmd_ope_status` varchar(200) NOT NULL,
  `cmd_traffic_in` varchar(200) NOT NULL,
  `cmd_traffic_ou` varchar(200) NOT NULL,
  `communitty_read` varchar(200) NOT NULL,
  `communitty_write` varchar(200) NOT NULL,
  `cmd_nome_port` varchar(255) NOT NULL,
  `inversao` tinyint(1) DEFAULT NULL COMMENT 'Verifica se o Switch é Invertido ou Não 0:Correto  1:Invertido',
  `ativo` tinyint(1) NOT NULL COMMENT 'Verifica se o Switch é ativo ou desativo. 0 - Desativo ou 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_switchs_portas`
--

DROP TABLE IF EXISTS `adm_switchs_portas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_switchs_portas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `port_id` int(3) NOT NULL,
  `id_switchs` int(11) NOT NULL,
  `id_account` int(10) DEFAULT NULL,
  `bloco_ip` varchar(20) DEFAULT NULL,
  `nat_mask` varchar(20) NOT NULL,
  `interface_nome` varchar(200) DEFAULT NULL,
  `interface_desc` text,
  `dt_ativa` timestamp NULL DEFAULT NULL,
  `dt_desativa` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=717 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_switchs_portas_bloqueadas`
--

DROP TABLE IF EXISTS `adm_switchs_portas_bloqueadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_switchs_portas_bloqueadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `port_id` int(11) NOT NULL,
  `id_switch` int(11) NOT NULL,
  `data_bloqueio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_desbloqueio` timestamp NULL DEFAULT NULL,
  `quem_desbloqueou` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_switchs_trafego`
--

DROP TABLE IF EXISTS `adm_switchs_trafego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_switchs_trafego` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_porta` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `tr_in` bigint(20) DEFAULT NULL,
  `tr_out` bigint(20) DEFAULT NULL,
  `media_tr_in` bigint(20) DEFAULT NULL,
  `media_tr_out` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_tipo_complemento`
--

DROP TABLE IF EXISTS `adm_tipo_complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_tipo_complemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `sigla` char(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_tipo_ligacao`
--

DROP TABLE IF EXISTS `adm_tipo_ligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_tipo_ligacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `tipo` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_tipo_nome`
--

DROP TABLE IF EXISTS `adm_tipo_nome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_tipo_nome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `tipo` enum('F','J') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_tipo_telefone`
--

DROP TABLE IF EXISTS `adm_tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_tipo_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adm_uf`
--

DROP TABLE IF EXISTS `adm_uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_uf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` char(2) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `adm_pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_uf_FKIndex1` (`adm_pais_id`),
  CONSTRAINT `adm_uf_ibfk_1` FOREIGN KEY (`adm_pais_id`) REFERENCES `adm_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_key_index` (`app_key`) USING BTREE,
  KEY `application_name_index` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atividades_primarias`
--

DROP TABLE IF EXISTS `atividades_primarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividades_primarias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `pai_id` int(11) NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT '0',
  `cod_cnae` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4960 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_grupos`
--

DROP TABLE IF EXISTS `aut_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_grupos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_logerror`
--

DROP TABLE IF EXISTS `aut_logerror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_logerror` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) NOT NULL DEFAULT '',
  `ip` varchar(100) NOT NULL DEFAULT '',
  `site` varchar(200) NOT NULL DEFAULT '',
  `referer` varchar(200) DEFAULT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7999 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_opcoes`
--

DROP TABLE IF EXISTS `aut_opcoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_opcoes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `descricao` text,
  `visivel` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_permissoes`
--

DROP TABLE IF EXISTS `aut_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_permissoes` (
  `opcoes_id` int(10) unsigned NOT NULL DEFAULT '0',
  `usuarios_id` int(10) unsigned NOT NULL DEFAULT '0',
  `permissao` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcoes_id`,`usuarios_id`),
  KEY `usuarios_id` (`usuarios_id`),
  KEY `opcoes_id` (`opcoes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_permissoes_grupos`
--

DROP TABLE IF EXISTS `aut_permissoes_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_permissoes_grupos` (
  `opcoes_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grupos_id` int(10) unsigned NOT NULL DEFAULT '0',
  `permissao` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcoes_id`,`grupos_id`),
  KEY `permissoes_grupos_FKIndex1` (`opcoes_id`),
  KEY `permissoes_grupos_FKIndex2` (`grupos_id`),
  KEY `permissao` (`permissao`),
  KEY `grupos_id` (`grupos_id`),
  KEY `opcoes_id` (`opcoes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_usuario_application`
--

DROP TABLE IF EXISTS `aut_usuario_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_usuario_application` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `aut_usuario_id` int(10) NOT NULL,
  `message_key` varchar(255) DEFAULT NULL,
  `device_so` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  KEY `aut_usuario_id` (`aut_usuario_id`),
  CONSTRAINT `aut_usuario_application_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `aut_usuario_application_ibfk_2` FOREIGN KEY (`aut_usuario_id`) REFERENCES `aut_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_usuarios`
--

DROP TABLE IF EXISTS `aut_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_usuarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `pass` varchar(75) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1',
  `canal` tinyint(1) NOT NULL DEFAULT '0',
  `password_version` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2190 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aut_usuarios_has_Grupos`
--

DROP TABLE IF EXISTS `aut_usuarios_has_Grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aut_usuarios_has_Grupos` (
  `usuarios_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grupos_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuarios_id`,`grupos_id`),
  KEY `grupos_id` (`grupos_id`),
  KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `birthday`
--

DROP TABLE IF EXISTS `birthday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birthday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned NOT NULL,
  `date_send` date NOT NULL,
  `date_sent` timestamp NULL DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cad_users_id` (`cad_users_id`),
  KEY `cad_users_id_2` (`cad_users_id`),
  KEY `cad_users_id_3` (`cad_users_id`),
  KEY `cad_users_id_4` (`cad_users_id`),
  CONSTRAINT `birthday_ibfk_1` FOREIGN KEY (`cad_users_id`) REFERENCES `cad_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `birthday_config`
--

DROP TABLE IF EXISTS `birthday_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birthday_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `birthday_email`
--

DROP TABLE IF EXISTS `birthday_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birthday_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday_id` int(11) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `user_agent` text,
  `referer` text,
  `date_read` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date_sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `birthday_id` (`birthday_id`),
  CONSTRAINT `birthday_email_ibfk_1` FOREIGN KEY (`birthday_id`) REFERENCES `birthday` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4617 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_ligacao_c2u`
--

DROP TABLE IF EXISTS `cad_ligacao_c2u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_ligacao_c2u` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_cid_id` int(10) unsigned DEFAULT NULL,
  `cad_users_id2` int(10) unsigned DEFAULT NULL,
  `adm_tipo_ligacao_id` int(11) DEFAULT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL,
  `cargo` varchar(200) DEFAULT NULL,
  `cobranca` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_ligacao_u2u_FKIndex1` (`adm_tipo_ligacao_id`),
  KEY `cad_ligacao_u2u_FKIndex2` (`cad_users_id2`),
  KEY `cad_ligacao_u2u_FKIndex3` (`cad_cid_id`),
  CONSTRAINT `cad_ligacao_c2u_ibfk_1` FOREIGN KEY (`cad_users_id2`) REFERENCES `cad_users` (`id`),
  CONSTRAINT `cad_ligacao_c2u_ibfk_2` FOREIGN KEY (`cad_cid_id`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `cad_ligacao_c2u_ibfk_3` FOREIGN KEY (`adm_tipo_ligacao_id`) REFERENCES `adm_tipo_ligacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35406 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gcdb`.`cad_ligacao_c2u_BEFORE_INSERT` BEFORE INSERT ON `cad_ligacao_c2u` FOR EACH ROW
BEGIN
	if new.dt_fim = '0000-00-00' THEN
		set @dt_fim = null;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gcdb`.`cad_ligacao_c2u_AFTER_INSERT` AFTER INSERT ON `cad_ligacao_c2u` FOR EACH ROW
BEGIN
	if new.dt_fim = '0000-00-00' THEN
		set @dt_fim = null;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cad_ligacao_u2u`
--

DROP TABLE IF EXISTS `cad_ligacao_u2u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_ligacao_u2u` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `cad_users_id2` int(10) unsigned DEFAULT NULL,
  `adm_tipo_ligacao_id` int(11) DEFAULT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_ligacao_u2u_FKIndex1` (`adm_tipo_ligacao_id`),
  KEY `cad_ligacao_u2u_FKIndex2` (`cad_users_id2`),
  KEY `cad_ligacao_u2u_FKIndex3` (`cad_users_id`),
  CONSTRAINT `cad_ligacao_u2u_ibfk_1` FOREIGN KEY (`adm_tipo_ligacao_id`) REFERENCES `adm_tipo_ligacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_ligacao_u2u_ibfk_2` FOREIGN KEY (`cad_users_id2`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_ligacao_u2u_ibfk_3` FOREIGN KEY (`cad_users_id`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6783 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_logradouro`
--

DROP TABLE IF EXISTS `cad_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_logradouro` (
  `CAD01_CODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `CAD01_NOME` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`CAD01_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_pais`
--

DROP TABLE IF EXISTS `cad_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_pais` (
  `CAD05_CODIGO` int(3) NOT NULL AUTO_INCREMENT,
  `CAD05_SIGLA` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `CAD05_NOME` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `CAD05_REFERENCIA` smallint(6) DEFAULT NULL,
  `CAD16_CODIGO` int(3) NOT NULL DEFAULT '0',
  `CAD05_NACIONALIDADE` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`CAD05_CODIGO`),
  KEY `CAD05_PAIS_FKIndex1` (`CAD16_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_uf`
--

DROP TABLE IF EXISTS `cad_uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_uf` (
  `CAD04_CODIGO` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `CAD04_NOME` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `CAD05_CODIGO` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CAD04_CODIGO`),
  KEY `CAD04_UNIDADE_FEDERATIVA_FKIndex1` (`CAD05_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_user_has_complemento`
--

DROP TABLE IF EXISTS `cad_user_has_complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_user_has_complemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `adm_tipo_complemento_id` int(11) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_user_has_complemento_FKIndex1` (`adm_tipo_complemento_id`),
  KEY `cad_user_has_complemento_FKIndex2` (`cad_users_id`),
  CONSTRAINT `cad_user_has_complemento_ibfk_1` FOREIGN KEY (`adm_tipo_complemento_id`) REFERENCES `adm_tipo_complemento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_user_has_complemento_ibfk_2` FOREIGN KEY (`cad_users_id`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10873 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_user_historico_endereco`
--

DROP TABLE IF EXISTS `cad_user_historico_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_user_historico_endereco` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cad_user_id` int(10) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `adm_logradouro_id` int(11) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `adm_pais_id` int(11) DEFAULT NULL,
  `adm_uf_id` int(11) DEFAULT NULL,
  `adm_cidade_id` int(11) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cad_user_historico_idx` (`cad_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_users`
--

DROP TABLE IF EXISTS `cad_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` bigint(14) unsigned zerofill DEFAULT NULL,
  `cpf` bigint(11) unsigned zerofill DEFAULT NULL,
  `insc_est` varchar(32) DEFAULT NULL COMMENT 'Tipo de Documento Estrangeiro',
  `insc_mun` varchar(32) DEFAULT NULL COMMENT 'documento Estrangeiro',
  `senha` varchar(20) DEFAULT NULL,
  `dt_abertura` date DEFAULT NULL,
  `adm_logradouro_id` int(11) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `adm_pais_id` int(11) NOT NULL,
  `adm_uf_id` int(11) NOT NULL,
  `adm_cidades_id` int(11) NOT NULL,
  `site` varchar(80) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `tipo` enum('F','J','C') DEFAULT NULL,
  `qtfoto` int(11) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `simples` int(1) DEFAULT NULL,
  `hash_acesso` varchar(32) DEFAULT NULL,
  `hash_datainc` timestamp NULL DEFAULT NULL,
  `segmento_id` int(11) DEFAULT NULL,
  `atividade_ramo` char(2) DEFAULT NULL,
  `tipo_cliente` char(1) DEFAULT NULL,
  `cad_origem_contato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_FKIndex1` (`adm_logradouro_id`),
  KEY `cad_users_FKIndex2` (`adm_pais_id`),
  KEY `cad_users_FKIndex3` (`adm_uf_id`),
  KEY `cad_users_FKIndex4` (`adm_cidades_id`),
  KEY `fk_cad_users_4` (`segmento_id`),
  CONSTRAINT `cad_users_ibfk_1` FOREIGN KEY (`adm_logradouro_id`) REFERENCES `adm_logradouro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_users_ibfk_2` FOREIGN KEY (`adm_pais_id`) REFERENCES `adm_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_users_ibfk_3` FOREIGN KEY (`adm_uf_id`) REFERENCES `adm_uf` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_users_ibfk_4` FOREIGN KEY (`adm_cidades_id`) REFERENCES `adm_cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cad_users_4` FOREIGN KEY (`segmento_id`) REFERENCES `cad_users_segmento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60039 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cad_users_AINS` BEFORE INSERT ON `cad_users` FOR EACH ROW
BEGIN
	DECLARE cnpjTeste int default 0;
	DECLARE EXIT HANDLER FOR NOT FOUND begin end;


	IF NEW.tipo ='J' AND NEW.adm_pais_id = 28 THEN
		SELECT count(cnpj) INTO cnpjTeste FROM cad_users WHERE cnpj=NEW.cnpj;
		IF cnpjTeste > 0 THEN
			SET NEW =' erro';
		END IF;
	END IF;

	IF NEW.tipo ='F' AND NEW.adm_pais_id = 28 THEN
		SELECT count(cpf) INTO cnpjTeste FROM cad_users WHERE cpf=NEW.cpf;
		IF cnpjTeste > 0 THEN
			SET NEW =' erro';
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gcdb`.`cad_users_BEFORE_UPDATE` BEFORE UPDATE ON `cad_users` FOR EACH ROW

begin

DECLARE cnpjTeste int default 0;
DECLARE EXIT HANDLER FOR NOT FOUND begin end;


IF NEW.tipo ='J' AND NEW.cnpj != OLD.cnpj THEN
	SELECT count(cnpj) INTO cnpjTeste FROM cad_users WHERE cnpj=NEW.cnpj;
	IF cnpjTeste > 0 THEN
		SET NEW =' erro';
	END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gcdb`.`cad_users_AFTER_UPDATE` AFTER UPDATE ON `cad_users` FOR EACH ROW

begin


IF new.endereco <> OLD.endereco or 
  new.adm_logradouro_id <> old.adm_logradouro_id or
  new.numero <> old.numero or
       new.cep <> old.cep or
       new.bairro <> old.bairro or
       new.adm_cidades_id <> old.adm_cidades_id then

INSERT INTO `gcdb`.`cad_user_historico_endereco`
(
`cad_user_id`,
`endereco`,
`adm_logradouro_id`,
`cep`,
`numero`,
`bairro`,
`adm_pais_id`,
`adm_uf_id`,
`adm_cidade_id`,
`latitude`,
`longitude`,
`data_inc`)
VALUES
(
OLD.id,
OLD.endereco,
OLD.adm_logradouro_id, 
OLD.cep, 
OLD.numero, 
OLD.bairro, 
OLD.adm_pais_id, 
OLD.adm_uf_id,
OLD.adm_cidades_id, 
OLD.latitude, 
OLD.longitude, 
NOW());
end IF;

IF new.dt_abertura <> OLD.dt_abertura then
	UPDATE  `rh`.`rh_colaborador` SET  `data_nascimento` = new.dt_abertura WHERE  `rh_colaborador`.`id_cad_user_sistech` = OLD.id LIMIT 1 ;
    UPDATE  `gcdb`.`birthday` SET  `date_send` = new.dt_abertura WHERE  gcdb.birthday.cad_users_id = OLD.id LIMIT 1;
end IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cad_users_atividades`
--

DROP TABLE IF EXISTS `cad_users_atividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_atividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_atividade` int(11) NOT NULL,
  `id_atividadesecundaria` int(11) DEFAULT NULL,
  `id_user` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_atividade` (`id_atividade`),
  KEY `id_user` (`id_user`),
  KEY `id_atividadesecundaria` (`id_atividadesecundaria`),
  CONSTRAINT `cad_users_atividades_ibfk_1` FOREIGN KEY (`id_atividade`) REFERENCES `atividades_primarias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47755 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_users_email`
--

DROP TABLE IF EXISTS `cad_users_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mailing` tinyint(1) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  `id_adm_tipo_ligacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_email_FKIndex1` (`cad_users_id`),
  KEY `cad_users_email_FKIndex2` (`id_adm_tipo_ligacao`) USING BTREE,
  CONSTRAINT `cad_users_email_ibfk_1` FOREIGN KEY (`cad_users_id`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73824 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_users_imagem`
--

DROP TABLE IF EXISTS `cad_users_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_imagem` (
  `id_imagem` int(10) NOT NULL AUTO_INCREMENT,
  `id_cad_user` int(10) NOT NULL,
  `data_inc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao` varchar(255) DEFAULT NULL,
  `url_imagem` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `data_foto` timestamp NULL DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `fk_caduser_imagem_idx` (`id_cad_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2927 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_users_nome`
--

DROP TABLE IF EXISTS `cad_users_nome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_nome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `adm_tipo_nome_id` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_nome_FKIndex1` (`cad_users_id`),
  KEY `cad_users_nome_FKIndex2` (`adm_tipo_nome_id`),
  CONSTRAINT `cad_users_nome_ibfk_1` FOREIGN KEY (`cad_users_id`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_users_nome_ibfk_2` FOREIGN KEY (`adm_tipo_nome_id`) REFERENCES `adm_tipo_nome` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1102530 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER gcdb.UPDATE_NOME
AFTER UPDATE ON gcdb.cad_users_nome
FOR EACH ROW
BEGIN
	DECLARE usrNome VARCHAR(255);

    DECLARE cadUser INTEGER;

    DECLARE clieCodigoid INTEGER;
    DECLARE unidCodigoid INTEGER;
    DECLARE userCodigoid INTEGER;
    DECLARE colaCodigoid INTEGER;

	DECLARE cadUserTipo VARCHAR(1);
	
	SELECT id, tipo INTO cadUser, cadUserTipo FROM gcdb.cad_users AS usr WHERE usr.id = OLD.cad_users_id LIMIT 1;

	IF cadUser IS NOT NULL THEN
		IF cadUserTipo = 'J' THEN
			
			SELECT id_customers INTO clieCodigoid FROM Customers2users AS custuser WHERE custuser.id_users = cadUser LIMIT 1;

			SELECT pessj.nome INTO usrNome FROM gcdb.cad_users_nome AS pessj
			WHERE pessj.cad_users_id = cadUser AND pessj.adm_tipo_nome_id = 6;

			IF usrNome IS NULL THEN
				SELECT pessj.nome INTO usrNome FROM gcdb.cad_users_nome AS pessj
				WHERE pessj.cad_users_id = cadUser AND pessj.adm_tipo_nome_id = 5;
			END IF;

			IF clieCodigoid IS NOT NULL THEN
				UPDATE luma.unidade AS unid SET unid.unid_nome = usrNome
				WHERE unid.unid_codigoid IN (
					SELECT DISTINCT tipounid.unid_codigoid FROM luma.tipounidade AS tipounid WHERE tipounid.tipo_codigoid = 9
				) AND unid.unid_stechcodigoid = clieCodigoid;
			END IF;

			UPDATE luma.unidade AS unid SET unid.unid_nome = usrNome
			WHERE unid.unid_codigoid IN (
				SELECT DISTINCT tipounid.unid_codigoid FROM luma.tipounidade AS tipounid WHERE tipounid.tipo_codigoid = 10
			) AND unid.unid_stechcodigoid = cadUser;

		ELSEIF cadUserTipo = 'F' THEN
			
			SELECT id_customers INTO clieCodigoid FROM Customers2users AS custuser WHERE custuser.id_users = cadUser LIMIT 1;

			SELECT id_colaborador, id_alt_usuario_sistech, unid_codigoid INTO colaCodigoid, userCodigoid, unidCodigoid
			FROM rh.rh_colaborador AS cola
			WHERE cola.id_cad_user_sistech = cadUser LIMIT 1;
			
			SELECT CONCAT(nome,' ', prenome,' ', sobrenome) INTO usrNome FROM gcdb.nome_pessoa_fisica AS pessf
			WHERE pessf.id = cadUser;

			IF colaCodigoid IS NOT NULL THEN
				UPDATE rh.rh_colaborador AS cola SET cola.nome = usrNome
				WHERE cola.id_colaborador = colaCodigoid;
			END IF;

			IF unidCodigoid IS NOT NULL THEN
				UPDATE luma.unidade AS unid SET unid.unid_nome = usrNome
				WHERE unid.unid_codigoid = unidCodigoid;
			END IF;

			IF userCodigoid IS NOT NULL THEN
				UPDATE gcdb.aut_usuarios AS user SET user.nome = usrNome
				WHERE user.id = userCodigoid;
			END IF;

			IF clieCodigoid IS NOT NULL THEN
				UPDATE luma.unidade AS unid SET unid.unid_nome = usrNome
				WHERE unid.unid_codigoid IN (
					SELECT DISTINCT tipounid.unid_codigoid FROM luma.tipounidade AS tipounid WHERE tipounid.tipo_codigoid = 9
				) AND unid.unid_stechcodigoid = clieCodigoid;
			END IF;

		END IF;
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cad_users_segmento`
--

DROP TABLE IF EXISTS `cad_users_segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_segmento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_users_site`
--

DROP TABLE IF EXISTS `cad_users_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_site_FKIndex1` (`cad_users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5449 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_users_telefone`
--

DROP TABLE IF EXISTS `cad_users_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cad_users_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `adm_tipos_telefone_id` int(11) DEFAULT NULL,
  `ddi` int(3) unsigned zerofill DEFAULT NULL,
  `ddd` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `ramal` int(5) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  `emergencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_telefones_FKIndex1` (`adm_tipos_telefone_id`),
  KEY `cad_users_telefones_FKIndex2` (`cad_users_id`),
  CONSTRAINT `cad_users_telefone_ibfk_1` FOREIGN KEY (`adm_tipos_telefone_id`) REFERENCES `adm_tipo_telefone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cad_users_telefone_ibfk_2` FOREIGN KEY (`cad_users_id`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68795 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias_accounts`
--

DROP TABLE IF EXISTS `categorias_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias_accounts` (
  `CategoriaID` int(4) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL DEFAULT '',
  `Status` int(1) NOT NULL DEFAULT '1',
  `DataCriacao` date NOT NULL DEFAULT '0000-00-00',
  `Criador` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`CategoriaID`),
  KEY `Criador` (`Criador`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relacao de categorias de servicos que podem ser associados a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cep_bairros`
--

DROP TABLE IF EXISTS `cep_bairros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cep_bairros` (
  `IDBairros` int(11) NOT NULL AUTO_INCREMENT,
  `UF` char(2) DEFAULT NULL,
  `IDLocalidades` int(11) DEFAULT NULL,
  `Bairro` varchar(72) DEFAULT NULL,
  PRIMARY KEY (`IDBairros`),
  KEY `ix_bairrosBairr` (`Bairro`),
  KEY `ix_bairrosUF` (`UF`),
  KEY `ix_bairrosIDLoc` (`IDLocalidades`)
) ENGINE=InnoDB AUTO_INCREMENT=58230 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cep_especial`
--

DROP TABLE IF EXISTS `cep_especial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cep_especial` (
  `IDCepEspecial` int(11) NOT NULL DEFAULT '0',
  `UF` char(2) DEFAULT NULL,
  `IDLocalidades` int(11) DEFAULT NULL,
  `IDLogradouros` int(11) DEFAULT NULL,
  `IDBairros` int(11) DEFAULT NULL,
  `Cliente` varchar(72) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDCepEspecial`),
  KEY `ix_cepespecialClien` (`Cliente`),
  KEY `ix_cepespecialCEP` (`CEP`),
  KEY `ix_cepespecialUF` (`UF`),
  KEY `ix_cepespecialIDLoc` (`IDLocalidades`),
  KEY `ix_cepespecialIDLog` (`IDLogradouros`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cep_localidades`
--

DROP TABLE IF EXISTS `cep_localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cep_localidades` (
  `IDLocalidades` int(11) NOT NULL DEFAULT '0',
  `Localidade` varchar(40) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  `Situacao` int(11) DEFAULT NULL,
  `Tipo` char(1) DEFAULT NULL,
  `IDLocalidadesSub` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDLocalidades`),
  KEY `ix_localidadesLocal` (`Localidade`),
  KEY `ix_localidadesCEP` (`CEP`),
  KEY `ix_localidadesUF` (`UF`),
  KEY `ix_localidadesSitua` (`Situacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cep_logradouros`
--

DROP TABLE IF EXISTS `cep_logradouros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cep_logradouros` (
  `IDLogradouros` int(11) NOT NULL DEFAULT '0',
  `UF` char(2) DEFAULT NULL,
  `IDLocalidades` int(11) DEFAULT NULL,
  `Logradouro` varchar(65) DEFAULT NULL,
  `IDBairrosInicial` int(11) DEFAULT NULL,
  `IDBairrosFinal` int(11) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  `Tipo` varchar(22) DEFAULT NULL,
  `Status` char(1) DEFAULT NULL,
  `CEPEspecial` char(1) DEFAULT 'N',
  PRIMARY KEY (`IDLogradouros`),
  KEY `ix_logradourosUF` (`UF`),
  KEY `ix_logradourosCEP` (`CEP`),
  KEY `ix_logradourosIDLoc` (`IDLocalidades`),
  KEY `ix_logradourosLogra` (`Logradouro`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `user` varchar(50) NOT NULL,
  `recado` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `circuito`
--

DROP TABLE IF EXISTS `circuito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuito` (
  `circ_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `custserv_codigoid` int(11) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `usua_desativacao` int(11) DEFAULT NULL,
  `circ_ordem` int(11) DEFAULT NULL,
  `endeentr_codigoid` int(11) DEFAULT NULL,
  `circ_pontaa` varchar(255) DEFAULT NULL,
  `circ_popa` int(11) DEFAULT NULL,
  `circ_pontab` varchar(255) DEFAULT NULL,
  `circ_popb` int(11) DEFAULT NULL,
  `circ_meiotransmissao` varchar(255) DEFAULT NULL,
  `circ_velocidade` varchar(45) DEFAULT NULL,
  `circ_interface` varchar(45) DEFAULT NULL,
  `circ_informacoestecnicas` text,
  `circ_observacao` text,
  `circ_ativo` tinyint(1) DEFAULT NULL,
  `circ_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `circ_motivodesativado` text,
  `circ_datadesativado` timestamp NULL DEFAULT NULL,
  `circ_bandaid` int(10) DEFAULT NULL,
  PRIMARY KEY (`circ_codigoid`),
  KEY `fk_circuito_customerservico1` (`custserv_codigoid`),
  KEY `fk_circuito_endeentr_codigoid_idx` (`endeentr_codigoid`),
  CONSTRAINT `fk_circuito_customerservico1` FOREIGN KEY (`custserv_codigoid`) REFERENCES `customerservico` (`custserv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19686 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `circuito_pop`
--

DROP TABLE IF EXISTS `circuito_pop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuito_pop` (
  `id_circuito_pop` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) NOT NULL,
  `circ_codigoid` int(11) NOT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `endeentratrivalo_codigoid` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_circuito_pop`),
  KEY `fk_circuito_pop_circuito1_idx` (`circ_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=17229 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `circuito_regional`
--

DROP TABLE IF EXISTS `circuito_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuito_regional` (
  `regional` int(11) NOT NULL,
  `data` date NOT NULL,
  `circuitos` int(11) DEFAULT NULL,
  PRIMARY KEY (`regional`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `close_ticket`
--

DROP TABLE IF EXISTS `close_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `close_ticket` (
  `close_ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `close_ticket_user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `close_ticket_responsavel` int(11) NOT NULL,
  `viaturaid` int(11) DEFAULT NULL,
  `close_ticket_data_inc` datetime NOT NULL,
  `close_ticket_indisponibilidade_inicio` datetime DEFAULT NULL,
  `close_ticket_indisponibilidade_fim` datetime DEFAULT NULL,
  `close_ticket_escalonamento_inicio` datetime DEFAULT NULL,
  `close_ticket_escalonamento_fim` datetime DEFAULT NULL,
  `close_ticket_problema` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`close_ticket_id`),
  KEY `fk_close_ticket_1_ticket_idx` (`ticket_id`),
  CONSTRAINT `fk_close_ticket_1_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `Tickets` (`TicketID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `close_ticket_equipe`
--

DROP TABLE IF EXISTS `close_ticket_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `close_ticket_equipe` (
  `close_ticket_equipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `closet_soclicitacao_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`close_ticket_equipe_id`),
  KEY `fk_close_ticket_equipe_close_ticket_soclicitacao1_idx` (`closet_soclicitacao_id`),
  CONSTRAINT `fk_close_ticket_equipe_close_ticket_soclicitacao1` FOREIGN KEY (`closet_soclicitacao_id`) REFERENCES `close_ticket_soclicitacao` (`closet_soclicitacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `close_ticket_problema`
--

DROP TABLE IF EXISTS `close_ticket_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `close_ticket_problema` (
  `closest_ticket_problema_id` int(11) NOT NULL AUTO_INCREMENT,
  `closest_ticket_tipo_problema_id` int(11) NOT NULL,
  `closest_ticket_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`closest_ticket_problema_id`),
  KEY `fk_closest_ticket_problema_closest_ticket_tipo_problema_idx` (`closest_ticket_tipo_problema_id`),
  CONSTRAINT `fk_closest_ticket_problema_closest_ticket_tipo_problema` FOREIGN KEY (`closest_ticket_tipo_problema_id`) REFERENCES `closest_ticket_tipo_problema` (`closest_ticket_tipo_problema_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `close_ticket_soclicitacao`
--

DROP TABLE IF EXISTS `close_ticket_soclicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `close_ticket_soclicitacao` (
  `closet_soclicitacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `close_ticket_close_ticket_id` int(11) NOT NULL,
  `closet_soclicitacao_numero` varchar(45) DEFAULT NULL,
  `close_ticket_data_inc` datetime DEFAULT NULL,
  `close_ticket_soclicitacao_inicio` datetime DEFAULT NULL,
  `close_ticket_soclicitacao_alocacao` datetime DEFAULT NULL,
  `close_ticket_soclicitacao_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`closet_soclicitacao_id`),
  KEY `fk_close_ticket_soclicitacao_close_ticket1_idx` (`close_ticket_close_ticket_id`),
  CONSTRAINT `fk_close_ticket_soclicitacao_close_ticket1` FOREIGN KEY (`close_ticket_close_ticket_id`) REFERENCES `close_ticket` (`close_ticket_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=906 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `closest_ticket_problema_close_ticket`
--

DROP TABLE IF EXISTS `closest_ticket_problema_close_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closest_ticket_problema_close_ticket` (
  `close_ticket_id` int(11) NOT NULL,
  `closest_ticket_problema_id` int(11) NOT NULL,
  PRIMARY KEY (`close_ticket_id`,`closest_ticket_problema_id`),
  KEY `fk_closest_ticket_problema_has_close_ticket_close_ticket1_idx` (`close_ticket_id`),
  KEY `fk_closest_ticket_problema_close_ticket_problema_idx` (`closest_ticket_problema_id`),
  CONSTRAINT `fk_closest_ticket_problema_close_ticket_problema` FOREIGN KEY (`closest_ticket_problema_id`) REFERENCES `close_ticket_problema` (`closest_ticket_problema_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_closest_ticket_problema_has_close_ticket_close_ticket1` FOREIGN KEY (`close_ticket_id`) REFERENCES `close_ticket` (`close_ticket_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `closest_ticket_tipo_problema`
--

DROP TABLE IF EXISTS `closest_ticket_tipo_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closest_ticket_tipo_problema` (
  `closest_ticket_tipo_problema_id` int(11) NOT NULL AUTO_INCREMENT,
  `closest_ticket_tipo_problema_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`closest_ticket_tipo_problema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `closet_ticket_agendamento`
--

DROP TABLE IF EXISTS `closet_ticket_agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closet_ticket_agendamento` (
  `closet_ticket_agendamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `closet_soclicitacao_id` int(11) NOT NULL,
  `closet_ticket_chegada_previsao` datetime DEFAULT NULL,
  `closet_ticket_chegada` datetime DEFAULT NULL,
  `closet_ticket_reparo` datetime DEFAULT NULL,
  `closet_ticket_funcionamento` datetime DEFAULT NULL,
  PRIMARY KEY (`closet_ticket_agendamento_id`),
  KEY `fk_closet_ticket_agendamento_close_ticket_soclicitacao1_idx` (`closet_soclicitacao_id`),
  CONSTRAINT `fk_closet_ticket_agendamento_close_ticket_soclicitacao1` FOREIGN KEY (`closet_soclicitacao_id`) REFERENCES `close_ticket_soclicitacao` (`closet_soclicitacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contatos_aprovacao`
--

DROP TABLE IF EXISTS `contatos_aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contatos_aprovacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) NOT NULL,
  `valor` varchar(200) DEFAULT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `id_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `contatos_aprovacao_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores_aprovacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2926 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrab_control`
--

DROP TABLE IF EXISTS `contrab_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrab_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tempo` varchar(100) NOT NULL,
  `falha_switch` text NOT NULL,
  `execucao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `controle_atualizacao_at`
--

DROP TABLE IF EXISTS `controle_atualizacao_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controle_atualizacao_at` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cid_user` int(11) NOT NULL,
  `quem` varchar(10) NOT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2724 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacao_dolar`
--

DROP TABLE IF EXISTS `cotacao_dolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacao_dolar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` char(7) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerservico`
--

DROP TABLE IF EXISTS `customerservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerservico` (
  `custserv_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `idservico` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `custserv_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `custserv_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`custserv_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=964 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `so` char(1) NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id` (`device_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emails_configurados_geral`
--

DROP TABLE IF EXISTS `emails_configurados_geral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_configurados_geral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposito` varchar(255) NOT NULL,
  `titulo_email` varchar(255) NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipeTo`
--

DROP TABLE IF EXISTS `equipeTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipeTo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EquipePai` int(11) NOT NULL,
  `EquipeFilho` int(11) NOT NULL,
  `Ativo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedores_aprovacao`
--

DROP TABLE IF EXISTS `fornecedores_aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores_aprovacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razao` varchar(200) DEFAULT NULL,
  `fantasia` varchar(200) DEFAULT NULL,
  `ie` varchar(20) DEFAULT NULL,
  `im` varchar(20) DEFAULT NULL,
  `datafundacao` date DEFAULT NULL,
  `segmento` int(11) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `tipologradouro` int(11) DEFAULT NULL,
  `logradouro` varchar(200) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `tipocomplemento` int(11) DEFAULT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnpj` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template` (
  `tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tmp_nome` varchar(90) NOT NULL,
  `tmp_status` tinyint(1) NOT NULL DEFAULT '1',
  `tmp_permissao` int(10) DEFAULT NULL,
  `modulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tmp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gen_template_historico`
--

DROP TABLE IF EXISTS `gen_template_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template_historico` (
  `tmp_historico_id` int(11) NOT NULL AUTO_INCREMENT,
  `tmp_id` int(11) NOT NULL,
  `aut_usuarios_id` int(11) NOT NULL,
  `tmp_historico_mensagem` text,
  `tmp_historico_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tmp_historico_id`),
  KEY `fk_tmp_id` (`tmp_id`),
  KEY `fk_aut_usuarios_id` (`aut_usuarios_id`),
  CONSTRAINT `fk_aut_usuarios_id` FOREIGN KEY (`aut_usuarios_id`) REFERENCES `aut_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tmp_id` FOREIGN KEY (`tmp_id`) REFERENCES `gen_template` (`tmp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gen_template_tag`
--

DROP TABLE IF EXISTS `gen_template_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template_tag` (
  `tmp_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tmp_tag_nome` varchar(45) NOT NULL,
  `tmp_tag_alias` varchar(45) DEFAULT NULL,
  `tmp_tag_desc` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`tmp_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gen_template_tag_tipo`
--

DROP TABLE IF EXISTS `gen_template_tag_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template_tag_tipo` (
  `tmp_id` int(11) NOT NULL,
  `tmp_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`tmp_id`,`tmp_tag_id`),
  KEY `fk_gen_template_has_gen_template_tag_gen_template_tag1_idx` (`tmp_tag_id`),
  KEY `fk_gen_template_has_gen_template_tag_gen_template1_idx` (`tmp_id`),
  CONSTRAINT `fk_gen_template_has_gen_template_tag_gen_template1` FOREIGN KEY (`tmp_id`) REFERENCES `gen_template` (`tmp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gen_template_has_gen_template_tag_gen_template_tag1` FOREIGN KEY (`tmp_tag_id`) REFERENCES `gen_template_tag` (`tmp_tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gerencia_crontab`
--

DROP TABLE IF EXISTS `gerencia_crontab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gerencia_crontab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `caminho` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `max_duracao` time NOT NULL,
  `frequencia` enum('I','H','D','M','A') NOT NULL COMMENT 'I- minuto, H- hora , D-dia,M-mes,A- ano',
  `tempo_frequencia` int(11) NOT NULL COMMENT 'quantas vezes será executado',
  `hora_rodara` varchar(19) NOT NULL COMMENT 'Hora que rodará dentro das regras criadas',
  `ultimo_roda` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historico_tickets`
--

DROP TABLE IF EXISTS `historico_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_tickets` (
  `histtick_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `histtick_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `histtick_quantidade` int(11) NOT NULL,
  `tickcate_codigoid` int(11) DEFAULT NULL,
  `autuser_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`histtick_codigoid`),
  KEY `tickcate_codigoid` (`tickcate_codigoid`),
  KEY `autuser_codigoid` (`autuser_codigoid`),
  KEY `histtick_datainc` (`histtick_datainc`),
  CONSTRAINT `historico_tickets_ibfk_1` FOREIGN KEY (`autuser_codigoid`) REFERENCES `aut_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10170051 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historicoacesso`
--

DROP TABLE IF EXISTS `historicoacesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historicoacesso` (
  `histace_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users` int(11) unsigned NOT NULL,
  `customerid` int(11) unsigned NOT NULL,
  `histace_tipo` tinyint(4) NOT NULL,
  `histace_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `histace_sessao` varchar(32) NOT NULL,
  `histace_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`histace_codigoid`),
  KEY `fk_historicoacesso_1_idx` (`cad_users`),
  KEY `fk_historicoacesso_2_idx` (`customerid`),
  CONSTRAINT `fk_historicoacesso_1` FOREIGN KEY (`cad_users`) REFERENCES `cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_historicoacesso_2` FOREIGN KEY (`customerid`) REFERENCES `Customers` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35280 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interface_configuracao_bwd`
--

DROP TABLE IF EXISTS `interface_configuracao_bwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_configuracao_bwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodicidade_dias` int(11) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoices_old`
--

DROP TABLE IF EXISTS `invoices_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices_old` (
  `InvoiceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  `DateBilled` date DEFAULT NULL,
  `Amount` float(5,2) DEFAULT NULL,
  `EMail` char(1) DEFAULT NULL,
  `Nota` varchar(6) DEFAULT NULL,
  `AccountID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`InvoiceID`),
  UNIQUE KEY `InvoiceID` (`InvoiceID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `AccountID` (`AccountID`)
) ENGINE=MyISAM AUTO_INCREMENT=5937 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `limite_banda`
--

DROP TABLE IF EXISTS `limite_banda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limite_banda` (
  `circ_bandaid` int(11) NOT NULL AUTO_INCREMENT,
  `circ_limite` varchar(255) NOT NULL,
  `data_inc` datetime DEFAULT NULL,
  `data_edit` datetime DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`circ_bandaid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `idlog` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `log` char(255) NOT NULL,
  `data` char(10) NOT NULL,
  `hora` char(10) NOT NULL,
  `idusuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB AUTO_INCREMENT=248978 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_delete`
--

DROP TABLE IF EXISTS `logs_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_delete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sql` text NOT NULL,
  `data` datetime NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6272 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msg_email_suporte`
--

DROP TABLE IF EXISTS `msg_email_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_email_suporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msg_email_suporte_log`
--

DROP TABLE IF EXISTS `msg_email_suporte_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_email_suporte_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `tipo` varchar(25) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2399 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `niveis_criticidade`
--

DROP TABLE IF EXISTS `niveis_criticidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_criticidade` (
  `id` tinyint(10) NOT NULL,
  `nivel` varchar(20) NOT NULL,
  `t_ini_com` int(3) NOT NULL,
  `t_res_com` int(3) NOT NULL,
  `t_ini_ext` int(3) NOT NULL,
  `t_res_ext` int(3) NOT NULL,
  `status` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `nome_pessoa_fisica`
--

DROP TABLE IF EXISTS `nome_pessoa_fisica`;
/*!50001 DROP VIEW IF EXISTS `nome_pessoa_fisica`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nome_pessoa_fisica` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `prenome`,
 1 AS `sobrenome`,
 1 AS `cpf`,
 1 AS `insc_mun`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(255) NOT NULL,
  `accounts` varchar(255) NOT NULL,
  `nf` int(5) unsigned zerofill NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `nft` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nft` (`nft`)
) ENGINE=MyISAM AUTO_INCREMENT=6999 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online`
--

DROP TABLE IF EXISTS `online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online` (
  `onli_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(10) NOT NULL,
  `onli_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `onli_ip` varchar(15) NOT NULL,
  `onli_pagina` varchar(100) NOT NULL,
  `onli_disponivel` tinyint(1) NOT NULL,
  PRIMARY KEY (`onli_codigoid`),
  KEY `fk_online_aut_usuarios1` (`usuarios_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9551 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popuplink`
--

DROP TABLE IF EXISTS `popuplink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popuplink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origem` int(11) DEFAULT NULL,
  `destino` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portas`
--

DROP TABLE IF EXISTS `portas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portas` (
  `idporta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `porta` char(6) NOT NULL DEFAULT '',
  `admin_status` char(10) NOT NULL DEFAULT 'Down',
  `operacao` char(10) NOT NULL DEFAULT 'Ativada',
  `autoneg` char(10) NOT NULL DEFAULT 'Ativada',
  `speed` char(6) NOT NULL DEFAULT '-',
  `duplex` char(15) NOT NULL DEFAULT '-',
  `flowctrl` char(10) NOT NULL DEFAULT 'Desativado',
  `modo` char(7) NOT NULL DEFAULT 'Access',
  `vlanbase` char(13) NOT NULL DEFAULT 'Sem vlan base',
  `destino` char(150) NOT NULL,
  `idswitch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idporta`)
) ENGINE=InnoDB AUTO_INCREMENT=70021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portasvlan`
--

DROP TABLE IF EXISTS `portasvlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portasvlan` (
  `idportavlan` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idporta` int(10) unsigned NOT NULL,
  `idvlan` int(10) unsigned NOT NULL,
  `idswitch` int(10) unsigned NOT NULL,
  `nome` char(30) NOT NULL,
  `tagging` char(8) NOT NULL,
  PRIMARY KEY (`idportavlan`)
) ENGINE=InnoDB AUTO_INCREMENT=7370 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recursos`
--

DROP TABLE IF EXISTS `recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recursos` (
  `RecursoID` int(10) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) NOT NULL DEFAULT '',
  `Unidade` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`RecursoID`),
  KEY `RecursoID` (`RecursoID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='Recursos possuidos por servicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regional_grupo_meta`
--

DROP TABLE IF EXISTS `regional_grupo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional_grupo_meta` (
  `grup_codigoid` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `tme` int(11) NOT NULL COMMENT 'Tempo médio dos chamados',
  `projecao` decimal(10,2) NOT NULL,
  PRIMARY KEY (`grup_codigoid`,`mes`,`ano`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regional_meta`
--

DROP TABLE IF EXISTS `regional_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional_meta` (
  `regional_codigoid` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `tme` int(11) NOT NULL COMMENT 'Tempo médio dos chamados',
  `projecao` decimal(10,2) NOT NULL,
  PRIMARY KEY (`regional_codigoid`,`mes`,`ano`,`tme`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_recursos_accounts`
--

DROP TABLE IF EXISTS `rel_recursos_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_recursos_accounts` (
  `RelRecursosAccountsID` int(10) NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) NOT NULL DEFAULT '0',
  `RecursoID` int(10) NOT NULL DEFAULT '0',
  `Conteudo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`RelRecursosAccountsID`),
  KEY `AccountID` (`AccountID`),
  KEY `RecursoID` (`RecursoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Recursos e suas quantidades, para uma account.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_servicos_recursos`
--

DROP TABLE IF EXISTS `rel_servicos_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_servicos_recursos` (
  `RelServicosRecursosID` int(10) NOT NULL AUTO_INCREMENT,
  `ServicoID` int(10) NOT NULL DEFAULT '0',
  `RecursoID` int(10) NOT NULL DEFAULT '0',
  `Conteudo` varchar(100) NOT NULL DEFAULT '',
  `Obrigatorio` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`RelServicosRecursosID`),
  KEY `ServicoID` (`ServicoID`),
  KEY `RecursoID` (`RecursoID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semana`
--

DROP TABLE IF EXISTS `semana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semana` (
  `sema_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `sema_datainicio` date NOT NULL,
  `sema_datafim` date NOT NULL,
  `sema_ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sema_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semanaturno`
--

DROP TABLE IF EXISTS `semanaturno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semanaturno` (
  `sematurn_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `sema_codigoid` int(11) NOT NULL,
  `turn_codigoid` int(11) NOT NULL,
  `sematurn_diasemana` tinyint(1) NOT NULL,
  `sematurn_ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sematurn_codigoid`),
  KEY `fk_semanaturno_semana1` (`sema_codigoid`),
  KEY `fk_semanaturno_turno1` (`turn_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semanaturnoaut_usuarios`
--

DROP TABLE IF EXISTS `semanaturnoaut_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semanaturnoaut_usuarios` (
  `sematurnaut_usr` int(11) NOT NULL AUTO_INCREMENT,
  `sematurn_codigoid` int(11) NOT NULL,
  `id` int(10) NOT NULL,
  `sematurnaut_usr_ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sematurnaut_usr`),
  KEY `fk_semanaturnoaut_usuarios_semanaturno1` (`sematurn_codigoid`),
  KEY `fk_semanaturnoaut_usuarios_aut_usuarios1` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `idservico` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servico` char(40) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idservico`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicos_detalhes`
--

DROP TABLE IF EXISTS `servicos_detalhes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_detalhes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ServicoID` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `volume_trafego` char(20) NOT NULL,
  `velocidade_trafego` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicos_limite_banda`
--

DROP TABLE IF EXISTS `servicos_limite_banda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_limite_banda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ServicoID` int(11) NOT NULL,
  `banda_limitada` tinyint(1) NOT NULL COMMENT 'Informa se serviço possui banda limitada ou não 0=Não 1=Sim',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sidweb`
--

DROP TABLE IF EXISTS `sidweb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sidweb` (
  `sid` varchar(250) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `IP` varchar(15) NOT NULL DEFAULT '',
  `data` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`,`CustomerID`,`IP`,`data`),
  KEY `CustomerID` (`CustomerID`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sidweb_user`
--

DROP TABLE IF EXISTS `sidweb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sidweb_user` (
  `sid` varchar(250) NOT NULL DEFAULT '',
  `UserID` varchar(10) NOT NULL,
  `IP` varchar(15) NOT NULL DEFAULT '',
  `data` varchar(30) NOT NULL DEFAULT '',
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`sid`,`UserID`,`IP`,`data`,`cpf`),
  KEY `CustomerID` (`UserID`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `switch_templates`
--

DROP TABLE IF EXISTS `switch_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch_templates` (
  `idswitchtemplate` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marca` char(25) NOT NULL,
  `modelo` char(50) NOT NULL,
  `url` char(50) NOT NULL,
  PRIMARY KEY (`idswitchtemplate`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `switchs`
--

DROP TABLE IF EXISTS `switchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switchs` (
  `idswitch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` char(100) NOT NULL,
  `pop` char(50) NOT NULL,
  `localizacao` char(150) NOT NULL,
  `ipadmin` char(15) NOT NULL,
  `vlanadmin` char(4) NOT NULL,
  `modelo` char(40) NOT NULL,
  `usuario` char(30) NOT NULL,
  `senha` char(50) NOT NULL,
  PRIMARY KEY (`idswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=1990 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdm_enlace_side`
--

DROP TABLE IF EXISTS `tdm_enlace_side`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdm_enlace_side` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `capacidade_sdh-pdh` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdm_enlaces`
--

DROP TABLE IF EXISTS `tdm_enlaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdm_enlaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `capacidade_configurada` varchar(20) DEFAULT NULL,
  `id_tdm_equipamentos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tdm_equipamentos` (`id_tdm_equipamentos`),
  CONSTRAINT `tdm_enlaces_ibfk_1` FOREIGN KEY (`id_tdm_equipamentos`) REFERENCES `tdm_equipamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdm_equipamentos`
--

DROP TABLE IF EXISTS `tdm_equipamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdm_equipamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `capacidade_sdh-pdh` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdm_portas`
--

DROP TABLE IF EXISTS `tdm_portas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdm_portas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `impedancia` varchar(10) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `nexthop` int(10) unsigned NOT NULL,
  `id_enlaces_side` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_enlaces_side` (`id_enlaces_side`),
  CONSTRAINT `tdm_portas_ibfk_1` FOREIGN KEY (`id_enlaces_side`) REFERENCES `tdm_enlace_side` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `team_nome` varchar(255) NOT NULL,
  `team_apelido` varchar(45) DEFAULT NULL,
  `team_ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`team_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teamaut_usuarios`
--

DROP TABLE IF EXISTS `teamaut_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teamaut_usuarios` (
  `idteamaut_usr_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `team_codigoid` int(11) NOT NULL,
  `id` int(10) NOT NULL,
  PRIMARY KEY (`idteamaut_usr_codigoid`),
  KEY `fk_teamaut_usuarios_team1` (`team_codigoid`),
  KEY `fk_teamaut_usuarios_aut_usuarios1` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teamtoteam`
--

DROP TABLE IF EXISTS `teamtoteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teamtoteam` (
  `teamto_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `team_codigoid` int(11) NOT NULL,
  `teamto_team` int(11) NOT NULL,
  PRIMARY KEY (`teamto_codigoid`),
  KEY `fk_teamtoteam_team1` (`team_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_ligacao_c2u`
--

DROP TABLE IF EXISTS `temp_cad_ligacao_c2u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_ligacao_c2u` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_cid_id` int(10) unsigned DEFAULT NULL,
  `cad_users_id2` int(10) unsigned DEFAULT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `cad_ligacao_u2u_FKIndex2` (`cad_users_id2`),
  KEY `cad_ligacao_u2u_FKIndex3` (`cad_cid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_ligacao_u2u`
--

DROP TABLE IF EXISTS `temp_cad_ligacao_u2u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_ligacao_u2u` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `cad_users_id2` int(10) unsigned DEFAULT NULL,
  `adm_tipo_ligacao_id` int(11) DEFAULT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT '0000-00-00',
  `temp` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_ligacao_u2u_FKIndex1` (`adm_tipo_ligacao_id`),
  KEY `cad_ligacao_u2u_FKIndex2` (`cad_users_id2`),
  KEY `cad_ligacao_u2u_FKIndex3` (`cad_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_user_has_complemento`
--

DROP TABLE IF EXISTS `temp_cad_user_has_complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_user_has_complemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `adm_tipo_complemento_id` int(11) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_user_has_complemento_FKIndex1` (`adm_tipo_complemento_id`),
  KEY `cad_user_has_complemento_FKIndex2` (`cad_users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_users`
--

DROP TABLE IF EXISTS `temp_cad_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` bigint(14) unsigned zerofill DEFAULT NULL,
  `cpf` bigint(11) unsigned zerofill DEFAULT NULL,
  `insc_est` varchar(32) DEFAULT NULL COMMENT 'Tipo de Documento Estrangeiro',
  `insc_mun` varchar(32) DEFAULT NULL COMMENT 'documento Estrangeiro',
  `senha` varchar(20) DEFAULT NULL,
  `dt_abertura` date DEFAULT NULL,
  `adm_logradouro_id` int(11) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `adm_pais_id` int(11) DEFAULT NULL,
  `adm_uf_id` int(11) DEFAULT NULL,
  `adm_cidades_id` int(11) DEFAULT NULL,
  `site` varchar(80) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `tipo` enum('F','J') DEFAULT NULL,
  `qtfoto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_FKIndex1` (`adm_logradouro_id`),
  KEY `cad_users_FKIndex2` (`adm_pais_id`),
  KEY `cad_users_FKIndex3` (`adm_uf_id`),
  KEY `cad_users_FKIndex4` (`adm_cidades_id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_users_email`
--

DROP TABLE IF EXISTS `temp_cad_users_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_users_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mailing` tinyint(1) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_email_FKIndex1` (`cad_users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_users_nome`
--

DROP TABLE IF EXISTS `temp_cad_users_nome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_users_nome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `adm_tipo_nome_id` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_nome_FKIndex1` (`cad_users_id`),
  KEY `cad_users_nome_FKIndex2` (`adm_tipo_nome_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_users_site`
--

DROP TABLE IF EXISTS `temp_cad_users_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_users_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_site_FKIndex1` (`cad_users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cad_users_telefone`
--

DROP TABLE IF EXISTS `temp_cad_users_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cad_users_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_users_id` int(10) unsigned DEFAULT NULL,
  `adm_tipos_telefone_id` int(11) DEFAULT NULL,
  `ddi` int(3) unsigned zerofill DEFAULT NULL,
  `ddd` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `ramal` int(5) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  `emergencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cad_users_telefones_FKIndex1` (`adm_tipos_telefone_id`),
  KEY `cad_users_telefones_FKIndex2` (`cad_users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_close_ticket`
--

DROP TABLE IF EXISTS `temp_close_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_close_ticket` (
  `close_ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `close_ticket_user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `close_ticket_responsavel` int(11) NOT NULL,
  `viaturaid` int(11) DEFAULT NULL,
  `close_ticket_data_inc` datetime NOT NULL,
  `close_ticket_indisponibilidade_inicio` datetime DEFAULT NULL,
  `close_ticket_indisponibilidade_fim` datetime DEFAULT NULL,
  `close_ticket_escalonamento_inicio` datetime DEFAULT NULL,
  `close_ticket_escalonamento_fim` datetime DEFAULT NULL,
  `close_ticket_problema` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`close_ticket_id`),
  KEY `fk_close_ticket_1_ticket_idx` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_circuito`
--

DROP TABLE IF EXISTS `ticket_circuito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_circuito` (
  `tickcirc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `TicketID` int(11) NOT NULL,
  `unid_codigoid` int(11) NOT NULL,
  `circ_codigoid` int(11) NOT NULL,
  `pop_id` int(11) NOT NULL,
  PRIMARY KEY (`tickcirc_codigoid`),
  KEY `TicketID` (`TicketID`),
  KEY `unid_codigoid` (`unid_codigoid`),
  KEY `circ_codigoid` (`circ_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=7284 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turno` (
  `turn_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `turn_inicio` time NOT NULL,
  `turn_intervaloinicio` time NOT NULL,
  `turn_intervalofim` time NOT NULL,
  `turn_fim` time NOT NULL,
  `turn_plantao` tinyint(1) NOT NULL DEFAULT '0',
  `turn_ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`turn_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` char(25) NOT NULL,
  `senha` char(60) NOT NULL,
  `nivel` char(1) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `usuarios_moodle`
--

DROP TABLE IF EXISTS `usuarios_moodle`;
/*!50001 DROP VIEW IF EXISTS `usuarios_moodle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usuarios_moodle` AS SELECT 
 1 AS `id`,
 1 AS `username`,
 1 AS `pass`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `filial`,
 1 AS `email`,
 1 AS `cidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `usuarios_moodle_2`
--

DROP TABLE IF EXISTS `usuarios_moodle_2`;
/*!50001 DROP VIEW IF EXISTS `usuarios_moodle_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usuarios_moodle_2` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `pass`,
 1 AS `username`,
 1 AS `email`,
 1 AS `cidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vinculos_aprovacao`
--

DROP TABLE IF EXISTS `vinculos_aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vinculos_aprovacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `vinculos_aprovacao_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores_aprovacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9638 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vlans`
--

DROP TABLE IF EXISTS `vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlans` (
  `idvlan` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL,
  `descricao` text NOT NULL,
  `servico` char(30) NOT NULL,
  `num_circuito` char(2) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`idvlan`)
) ENGINE=InnoDB AUTO_INCREMENT=4097 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'gcdb'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Demissao` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ANSI_QUOTES' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE EVENT `Demissao` ON SCHEDULE EVERY 6 HOUR STARTS '2014-11-03 11:36:47' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Executa demissoes agendadas no RH' DO BEGIN
            DECLARE _id_colaborador, _id_demissao, _unid_codigoid, _id INTEGER;
            DECLARE done INT DEFAULT 0;
			
			DECLARE  cur_row CURSOR FOR
			SELECT d.id_demissao, c.id_colaborador, u.unid_codigoid, a.id FROM rh.rh_demissao d
            INNER JOIN rh.rh_colaborador c USING(id_colaborador)
            INNER JOIN luma.unidade u on
            c.unid_codigoid = u.unid_codigoid
            INNER JOIN gcdb.aut_usuarios a on
			c.id_alt_usuario_sistech = a.id
			WHERE d.pendencia = 1 AND d.data_demissao <= now();
			
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

			OPEN cur_row;
				read_loop: LOOP
					FETCH cur_row INTO _id_demissao, _id_colaborador, _unid_codigoid, _id;
					IF done THEN
						LEAVE read_loop;
					END IF;

					update rh.rh_demissao    set pendencia = 0 where id_demissao = _id_demissao;
					update rh.rh_colaborador set ativo = 0     where id_colaborador = _id_colaborador;
					update luma.unidade      set unid_ativo = 0 where unid_codigoid = _unid_codigoid;
                    update gcdb.aut_usuarios set pass = null, ativo = 0 where id = _id;
		 
				END LOOP read_loop;
            CLOSE cur_row;


      END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `HISTORICO_TICKETS` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE EVENT `HISTORICO_TICKETS` ON SCHEDULE EVERY 15 MINUTE STARTS '2014-10-02 10:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE histtick_datainc TIMESTAMP;
    DECLARE autuser_codigoid INT DEFAULT 0;
    DECLARE tickcate_codigoid INT DEFAULT 0;
    DECLARE histtick_quantidade INT DEFAULT 0;

    DECLARE arrayTickets CURSOR FOR
    SELECT DISTINCT resp.user_id,
					cate.id,
					COUNT(tick.TicketID) AS total
	FROM gcdb.Tickets AS tick
	LEFT JOIN gcdb.Tickets_Resp AS resp
		ON (resp.tickets_id = tick.TicketID AND (resp.data_final IS NULL OR resp.data_final = '0000-00-00 00:00:00'))
	LEFT JOIN gcdb.Tickets_Categoria AS cate
		ON (cate.id = tick.CategoriaID)
	WHERE tick.Fechado IS NULL
	GROUP BY resp.user_id, cate.id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	
	SET histtick_datainc = CURRENT_TIMESTAMP;

    OPEN arrayTickets;
    read_loop: LOOP
        FETCH arrayTickets INTO autuser_codigoid, tickcate_codigoid, histtick_quantidade;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO gcdb.historico_tickets (histtick_datainc, histtick_quantidade, tickcate_codigoid, autuser_codigoid) VALUES (histtick_datainc, histtick_quantidade, tickcate_codigoid, autuser_codigoid);
    END LOOP read_loop;
    CLOSE arrayTickets;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'gcdb'
--
/*!50003 DROP FUNCTION IF EXISTS `tempo_follow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tempo_follow`(ticketCodigoid INT) RETURNS int(11)
BLOCK1: BEGIN
    DECLARE dataTMP TIMESTAMP DEFAULT NULL;
    DECLARE dataFinal TIMESTAMP;
    DECLARE dataFechado TIMESTAMP;
    DECLARE dataAberto TIMESTAMP;

    DECLARE curFinal TIMESTAMP;
    DECLARE curFechado TIMESTAMP;
    DECLARE curAberto TIMESTAMP;

    DECLARE tempo INT DEFAULT NULL;
    DECLARE done INT DEFAULT 0;

SELECT ticket.Aberto, ticket.Fechado INTO dataAberto, dataFechado FROM Tickets AS ticket WHERE ticket.TicketID = ticketCodigoid;

    IF dataFechado IS NULL THEN
        SELECT MAX(follow.data) INTO dataFinal FROM TicketFollowUp AS follow WHERE follow.TicketID = ticketCodigoid AND follow.Tipo = 'I';
        SELECT TIMESTAMPDIFF(MINUTE, IFNULL(dataFinal, dataAberto), CURRENT_TIMESTAMP) INTO tempo;
    ELSE
        BLOCK2: BEGIN
            DECLARE arrayFollowUp CURSOR FOR SELECT follow.data FROM TicketFollowUp AS follow WHERE follow.TicketID = ticketCodigoid AND follow.Tipo = 'I' AND (follow.data < dataFechado) ORDER BY follow.data DESC;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
            OPEN arrayFollowUp;
            read_loop: LOOP
                FETCH arrayFollowUp INTO dataFinal;
                IF done THEN
                    LEAVE read_loop;
                END IF;
                IF dataTMP IS NULL THEN
                    SELECT TIMESTAMPDIFF(MINUTE, dataFinal, dataFechado) INTO tempo;
                ELSE
                    SELECT IF(TIMESTAMPDIFF(MINUTE, dataFinal, dataTMP)>tempo, TIMESTAMPDIFF(MINUTE, dataFinal, dataTMP), tempo) INTO tempo;
                END IF;
                SELECT dataFinal INTO dataTMP;
            END LOOP read_loop;
            CLOSE arrayFollowUp;
        END BLOCK2;
    END IF;
    RETURN tempo;
END BLOCK1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `CustomersN`
--

/*!50001 DROP VIEW IF EXISTS `CustomersN`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomersN` AS select `C`.`CustomerID` AS `CustomerID`,`C`.`Status` AS `Status`,`C`.`Obs` AS `Obs`,`C`.`ATPass` AS `ATPass`,(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `cad_ligacao_c2u`.`cad_users_id2` AS `cad_users_id2` from `cad_ligacao_c2u` where ((`cad_ligacao_c2u`.`cad_cid_id` = `C`.`CustomerID`) and (`cad_ligacao_c2u`.`dt_fim` = _utf8'0000-00-00') and (`cad_ligacao_c2u`.`cobranca` = 1)) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 1)) limit 1) AS `First`,(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `cad_ligacao_c2u`.`cad_users_id2` AS `cad_users_id2` from `cad_ligacao_c2u` where ((`cad_ligacao_c2u`.`cad_cid_id` = `C`.`CustomerID`) and (`cad_ligacao_c2u`.`dt_fim` = _utf8'0000-00-00') and (`cad_ligacao_c2u`.`cobranca` = 1)) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 2)) limit 1) AS `Mid`,(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `cad_ligacao_c2u`.`cad_users_id2` AS `cad_users_id2` from `cad_ligacao_c2u` where ((`cad_ligacao_c2u`.`cad_cid_id` = `C`.`CustomerID`) and (`cad_ligacao_c2u`.`dt_fim` = _utf8'0000-00-00') and (`cad_ligacao_c2u`.`cobranca` = 1)) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 3)) limit 1) AS `Last`,(select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `id_users`,(select concat((select `cad_users`.`endereco` AS `endereco` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1),_latin1',',(select `cad_users`.`numero` AS `numero` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1)) AS `endereco` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Address`,(select (select concat(`cad_users_telefone`.`ddd`,_latin1' ',`cad_users_telefone`.`telefone`) AS `CONCAT(ddd,' ',telefone)` from `cad_users_telefone` where ((`cad_users_telefone`.`cad_users_id` = `Customers2users`.`id_users`) and (`cad_users_telefone`.`principal` = 1) and (`cad_users_telefone`.`adm_tipos_telefone_id` = 1)) limit 1) AS `telefone` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Telephone`,(select (select concat(`cad_users_telefone`.`ddd`,_latin1' ',`cad_users_telefone`.`telefone`) AS `CONCAT(ddd,' ',telefone)` from `cad_users_telefone` where ((`cad_users_telefone`.`cad_users_id` = `Customers2users`.`id_users`) and (`cad_users_telefone`.`adm_tipos_telefone_id` = 3)) limit 1) AS `telefone` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Fax`,(select (select `cad_users_email`.`email` AS `email` from `cad_users_email` where ((`cad_users_email`.`cad_users_id` = `Customers2users`.`id_users`) and (`cad_users_email`.`principal` = 1)) limit 1) AS `email` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Email`,(select (select (select `adm_cidades`.`nome` AS `nome` from `adm_cidades` where (`adm_cidades`.`id` = `cad_users`.`adm_cidades_id`) limit 1) AS `nome` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1) AS `adm_cidades_id` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `City`,(select (select (select `adm_uf`.`sigla` AS `sigla` from `adm_uf` where (`adm_uf`.`id` = `cad_users`.`adm_uf_id`) limit 1) AS `nome` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1) AS `adm_uf_id` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `State`,(select (select (select `adm_pais`.`nome` AS `nome` from `adm_pais` where (`adm_pais`.`id` = `cad_users`.`adm_pais_id`) limit 1) AS `nome` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1) AS `adm_pais_id` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Pais`,(select (select `cad_users`.`cep` AS `cep` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1) AS `cep` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Zip`,(select (select concat(`cad_users_telefone`.`ddd`,_latin1' ',`cad_users_telefone`.`telefone`) AS `CONCAT(ddd,' ',telefone)` from `cad_users_telefone` where ((`cad_users_telefone`.`cad_users_id` = `Customers2users`.`id_users`) and (`cad_users_telefone`.`emergencia` = 1)) limit 1) AS `emergencia` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `Emergencia`,(select (select `cad_users`.`insc_est` AS `insc_est` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1) AS `insc_est` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `insc_est`,(select (select `cad_users`.`insc_mun` AS `insc_mun` from `cad_users` where (`cad_users`.`id` = `Customers2users`.`id_users`) limit 1) AS `insc_mun` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1) AS `insc_mun`,if(((select `cad_users`.`tipo` AS `tipo` from `cad_users` where (`cad_users`.`id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) limit 1) = _latin1'J'),(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`adm_tipo_nome_id` = 5) and (`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1))) limit 1),concat((select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 1))),_latin1' ',(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 2))),_latin1' ',(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 3))))) AS `Razao`,if(((select `cad_users`.`tipo` AS `tipo` from `cad_users` where (`cad_users`.`id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) limit 1) = _latin1'J'),(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`adm_tipo_nome_id` = 6) and (`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1))) limit 1),concat((select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 1))),_latin1' ',(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 2))),_latin1' ',(select `cad_users_nome`.`nome` AS `nome` from `cad_users_nome` where ((`cad_users_nome`.`cad_users_id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) and (`cad_users_nome`.`adm_tipo_nome_id` = 3))))) AS `Fantasia`,if(((select `cad_users`.`tipo` AS `tipo` from `cad_users` where (`cad_users`.`id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) limit 1) = _latin1'J'),(select `cad_users`.`cnpj` AS `cnpj` from `cad_users` where (`cad_users`.`id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) limit 1),(select `cad_users`.`cpf` AS `cpf` from `cad_users` where (`cad_users`.`id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) limit 1)) AS `CNPJ`,(select `cad_users`.`cpf` AS `cpf` from `cad_users` where (`cad_users`.`id` = (select `Customers2users`.`id_users` AS `id_users` from `Customers2users` where (`Customers2users`.`id_customers` = `C`.`CustomerID`) limit 1)) limit 1) AS `CPF` from `Customers` `C` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nome_pessoa_fisica`
--

/*!50001 DROP VIEW IF EXISTS `nome_pessoa_fisica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nome_pessoa_fisica` AS select `a`.`cad_users_id` AS `id`,(select `b`.`nome` from `cad_users_nome` `b` where ((`a`.`cad_users_id` = `b`.`cad_users_id`) and (`b`.`adm_tipo_nome_id` = 1))) AS `nome`,(select `b`.`nome` from `cad_users_nome` `b` where ((`a`.`cad_users_id` = `b`.`cad_users_id`) and (`b`.`adm_tipo_nome_id` = 2))) AS `prenome`,(select `b`.`nome` from `cad_users_nome` `b` where ((`a`.`cad_users_id` = `b`.`cad_users_id`) and (`b`.`adm_tipo_nome_id` = 3))) AS `sobrenome`,`u`.`cpf` AS `cpf`,`u`.`insc_mun` AS `insc_mun` from (`cad_users_nome` `a` join `cad_users` `u` on((`a`.`cad_users_id` = `u`.`id`))) where (`a`.`adm_tipo_nome_id` in (1,2,3)) group by `a`.`cad_users_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_moodle`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_moodle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_moodle` AS select `cad`.`id` AS `id`,`aut`.`username` AS `username`,`aut`.`pass` AS `pass`,(select group_concat(`gcdb`.`cad_users_nome`.`nome` separator ' ') from `gcdb`.`cad_users_nome` where ((`gcdb`.`cad_users_nome`.`cad_users_id` = `cad`.`id`) and (`gcdb`.`cad_users_nome`.`adm_tipo_nome_id` = 1))) AS `nome`,(select group_concat(`gcdb`.`cad_users_nome`.`nome` order by `gcdb`.`cad_users_nome`.`adm_tipo_nome_id` ASC separator ' ') from `gcdb`.`cad_users_nome` where ((`gcdb`.`cad_users_nome`.`cad_users_id` = `cad`.`id`) and (`gcdb`.`cad_users_nome`.`adm_tipo_nome_id` in (2,3)))) AS `sobrenome`,`nomefilial`.`nome` AS `filial`,(case when (substr(`nomefilial`.`nome`,1,13) = 'Sul Americana') then concat(`aut`.`username`,'@stech.net.br') when (substr(`nomefilial`.`nome`,1,5) = 'Avvio') then concat(`aut`.`username`,'@vogeltelecom.com') end) AS `email`,(select `gcdb`.`adm_cidades`.`nome` from `gcdb`.`adm_cidades` where (`gcdb`.`adm_cidades`.`id` = `cadfilial`.`adm_cidades_id`)) AS `cidade` from ((((((`gcdb`.`aut_usuarios` `aut` join `rh`.`rh_colaborador` `colab` on(((`aut`.`id` = `colab`.`id_alt_usuario_sistech`) and (`colab`.`id_tipo_colaborador` = 1)))) join `gcdb`.`cad_users` `cad` on((`colab`.`id_cad_user_sistech` = `cad`.`id`))) join `rh`.`rh_colaborador_filial` `filial` on(((`colab`.`id_colaborador` = `filial`.`id_colaborador`) and isnull(`filial`.`data_fim`)))) join `gcdb`.`Customers2users` `custuser` on((`filial`.`sistech_codigoid` = `custuser`.`id_customers`))) join `gcdb`.`cad_users` `cadfilial` on((`cadfilial`.`id` = `custuser`.`id_users`))) join `gcdb`.`cad_users_nome` `nomefilial` on(((`nomefilial`.`cad_users_id` = `cadfilial`.`id`) and (`nomefilial`.`adm_tipo_nome_id` = 5)))) where (`aut`.`ativo` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_moodle_2`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_moodle_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.10.247` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_moodle_2` AS select `cad`.`id` AS `id`,`colab`.`nome` AS `nome`,`usr`.`pass` AS `pass`,`usr`.`username` AS `username`,`email`.`email` AS `email`,`cidade`.`nome` AS `cidade` from ((((`rh`.`rh_colaborador` `colab` join `gcdb`.`aut_usuarios` `usr` on((`usr`.`id` = `colab`.`id_alt_usuario_sistech`))) join `gcdb`.`cad_users` `cad` on((`cad`.`id` = `colab`.`id_cad_user_sistech`))) left join `gcdb`.`adm_cidades` `cidade` on((`cidade`.`id` = `cad`.`adm_cidades_id`))) left join `gcdb`.`cad_users_email` `email` on(((`email`.`cad_users_id` = `cad`.`id`) and (`email`.`email` like '%vogeltelecom.com%')))) where (`usr`.`ativo` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-01 17:43:19
