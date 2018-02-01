-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 192.168.10.249    Database: financeiro
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
-- Table structure for table `alcada`
--

DROP TABLE IF EXISTS `alcada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alcada` (
  `alca_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `alca_percentual` decimal(3,2) NOT NULL,
  `alca_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alca_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aprovacao`
--

DROP TABLE IF EXISTS `aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprovacao` (
  `apro_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `apro_nome` varchar(45) NOT NULL,
  `apro_tipo` int(11) NOT NULL COMMENT 'apro_tipo: tipo de aprovação Interna = 1\n                  tipo de aprovação Externa = 2\n                  tipo de aprovação da ativação = 3',
  PRIMARY KEY (`apro_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ar`
--

DROP TABLE IF EXISTS `ar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar` (
  `ar_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `rangar_codigoid` int(11) NOT NULL,
  `ar_numero` varchar(10) NOT NULL,
  PRIMARY KEY (`ar_codigoid`),
  KEY `fk_ar_rangear1_idx` (`rangar_codigoid`),
  CONSTRAINT `fk_ar_rangear1` FOREIGN KEY (`rangar_codigoid`) REFERENCES `rangear` (`rangar_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivoremessa`
--

DROP TABLE IF EXISTS `arquivoremessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivoremessa` (
  `arqureme_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `arqureme_nome` varchar(25) NOT NULL,
  `arqureme_indice` int(11) NOT NULL,
  `arqureme_texto` text NOT NULL,
  `arqureme_dataenvio` timestamp NULL DEFAULT NULL,
  `arqureme_datainc` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`arqureme_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ativacao`
--

DROP TABLE IF EXISTS `ativacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ativacao` (
  `ativ_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) DEFAULT NULL,
  `ativ_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativ_dataativado` timestamp NULL DEFAULT NULL,
  `ativ_apospagamento` tinyint(1) NOT NULL,
  `ativ_aposassinatura` tinyint(1) NOT NULL,
  `ativ_datafixa` date DEFAULT NULL,
  `ativ_diasapos` int(11) DEFAULT NULL,
  `ativ_cobraraposativacao` tinyint(1) NOT NULL,
  `ativ_cobraraposassinatura` tinyint(1) NOT NULL,
  `ativ_cobrardatafixa` date DEFAULT NULL,
  `ativ_cobrardiasapos` int(11) DEFAULT NULL,
  `ativ_cobraraposprimeiraparcela` tinyint(1) DEFAULT NULL,
  `ativ_dataalterado` timestamp NULL DEFAULT NULL,
  `ativ_pagamentotaxa` date DEFAULT NULL,
  PRIMARY KEY (`ativ_codigoid`),
  KEY `fk_ativacao_contrato1_idx` (`cont_codigoid`),
  KEY `ativ_dataativado` (`ativ_dataativado`),
  CONSTRAINT `fk_ativacao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51710 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ativacao_AUPD` BEFORE UPDATE ON `ativacao` FOR EACH ROW
BEGIN
	SET NEW.ativ_dataalterado = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ativacaopagamento`
--

DROP TABLE IF EXISTS `ativacaopagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ativacaopagamento` (
  `ativpag_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `ativpag_cobrado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ativpag_codigoid`),
  UNIQUE KEY `cont_codigoid` (`cont_codigoid`),
  KEY `fk_ativacaopagamento_1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_ativacaopagamento_1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22028 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ativacaotemplate`
--

DROP TABLE IF EXISTS `ativacaotemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ativacaotemplate` (
  `ativtemp_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `serv_codigoid` int(11) NOT NULL,
  `ativtemp_nome` varchar(75) NOT NULL,
  PRIMARY KEY (`ativtemp_codigoid`),
  KEY `fk_servico_serv_codigoid_idx` (`serv_codigoid`),
  CONSTRAINT `fk_servico_serv_codigoid` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ativacaotemplatepermissao`
--

DROP TABLE IF EXISTS `ativacaotemplatepermissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ativacaotemplatepermissao` (
  `ativtemppermi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ativtemp_codigoid` int(11) NOT NULL,
  `atri_codigoid` int(11) NOT NULL,
  `ativtemppermi_ordem` int(11) DEFAULT '0',
  PRIMARY KEY (`ativtemppermi_codigoid`),
  KEY `fk_ativacaotemplate_ativtemp_codigoid_idx` (`ativtemp_codigoid`),
  KEY `fk_atributovalor_atri_codigoid_idx` (`atri_codigoid`),
  CONSTRAINT `fk_ativacaotemplate_ativtemp_codigoid` FOREIGN KEY (`ativtemp_codigoid`) REFERENCES `ativacaotemplate` (`ativtemp_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atributovalor_atri_codigoid` FOREIGN KEY (`atri_codigoid`) REFERENCES `atributo` (`atri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atributo`
--

DROP TABLE IF EXISTS `atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributo` (
  `atri_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `atri_nome` varchar(255) NOT NULL,
  `atrib_tipohtml` varchar(45) NOT NULL,
  `atrib_mask` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`atri_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atributo_adicional`
--

DROP TABLE IF EXISTS `atributo_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributo_adicional` (
  `id_atributo_adiconal` int(11) NOT NULL AUTO_INCREMENT,
  `endeentratrivalo_codigoid` int(11) NOT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `info_interna` varchar(255) DEFAULT NULL,
  `info_externa` varchar(255) DEFAULT NULL,
  `data_inc` datetime DEFAULT NULL,
  PRIMARY KEY (`id_atributo_adiconal`),
  KEY `fk_atributo_adiconal_enderecoentregaatributovalor1_idx` (`endeentratrivalo_codigoid`),
  CONSTRAINT `fk_atributo_adiconal_enderecoentregaatributovalor1` FOREIGN KEY (`endeentratrivalo_codigoid`) REFERENCES `enderecoentregaatributovalor` (`endeentratrivalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=233866 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atributovalor`
--

DROP TABLE IF EXISTS `atributovalor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributovalor` (
  `atrivalo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `atri_codigoid` int(11) NOT NULL,
  `atrivalo_valor` varchar(255) NOT NULL,
  `mask` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`atrivalo_codigoid`),
  KEY `fk_atributovalor_atributo1_idx` (`atri_codigoid`),
  CONSTRAINT `fk_atributovalor_atributo1` FOREIGN KEY (`atri_codigoid`) REFERENCES `atributo` (`atri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `banc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `banc_codigobacen` varchar(3) NOT NULL,
  `banc_nome` varchar(45) NOT NULL,
  `banc_segmento` varchar(255) NOT NULL,
  `banc_cnpj` varchar(45) NOT NULL,
  PRIMARY KEY (`banc_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_garantia_ativacao`
--

DROP TABLE IF EXISTS `base_garantia_ativacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_garantia_ativacao` (
  `numero_contrato_bruto` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL DEFAULT '0',
  `ativ_dataativado` timestamp NULL DEFAULT NULL,
  `cobranca_ativacao` varchar(17) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `legado` varchar(112) CHARACTER SET utf8 DEFAULT NULL,
  `proposta` int(11),
  `velocidade` varchar(22) CHARACTER SET utf8 DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `razao` varchar(200) DEFAULT NULL,
  `segmento` varchar(90),
  `status_contrato` varchar(45) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_garantia_receita`
--

DROP TABLE IF EXISTS `base_garantia_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_garantia_receita` (
  `numero_contrato_bruto` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL DEFAULT '0',
  `id_circuito` int(11) NOT NULL DEFAULT '0',
  `ativ_dataativado` timestamp NULL DEFAULT NULL,
  `cobranca_ativacao` varchar(17) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `stt` varchar(39) CHARACTER SET utf8 DEFAULT NULL,
  `legado` varchar(336) CHARACTER SET utf8 DEFAULT NULL,
  `proposta` int(11),
  `velocidade` varchar(22) CHARACTER SET utf8 DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `razao` varchar(200) DEFAULT NULL,
  `segmento` varchar(90),
  `regional_ativacao` char(2) DEFAULT NULL,
  `valor_mensalidade` decimal(10,2),
  `valor_ativacao` decimal(10,2),
  `status` varchar(45) NOT NULL,
  `data_bloqueio` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bloqueio`
--

DROP TABLE IF EXISTS `bloqueio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloqueio` (
  `bloq_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `bloq_acao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bloq_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelamento`
--

DROP TABLE IF EXISTS `cancelamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelamento` (
  `canc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usr_codigoid` int(11) NOT NULL,
  `canc_datasolicitacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canc_datacancelado` timestamp NULL DEFAULT NULL,
  `canc_cumpriraviso` tinyint(1) NOT NULL DEFAULT '1',
  `canc_datainc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`canc_codigoid`),
  KEY `cont_codigoid` (`cont_codigoid`),
  CONSTRAINT `cancelamento_ibfk_1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4260 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER LOG_CANCELAMENTO_CONTRATO AFTER INSERT ON financeiro.cancelamento
FOR EACH ROW BEGIN
    -- insert no log da businessintelligence
    INSERT INTO businessintelligence.log SET date_record = NOW(), identificadorProposta = '', flagUpdated = 0, idProposal = NULL, idContrato = NEW.cont_codigoid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `capacidade`
--

DROP TABLE IF EXISTS `capacidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacidade` (
  `capa_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `capa_capacidade` int(11) NOT NULL,
  PRIMARY KEY (`capa_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=1067 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cfop`
--

DROP TABLE IF EXISTS `cfop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfop` (
  `cfop_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cfop_paicodigoid` int(11) DEFAULT NULL,
  `cfop_cfop` varchar(10) NOT NULL,
  `cfop_descricao` text NOT NULL,
  `cfop_aplicacao` text,
  PRIMARY KEY (`cfop_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clienteaprovacao`
--

DROP TABLE IF EXISTS `clienteaprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienteaprovacao` (
  `clieapro_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `apro_codigoid` int(11) NOT NULL,
  `clie_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) NOT NULL,
  `clieapro_delin` int(11) NOT NULL COMMENT 'clieapro_delin 1=''Sempre''\nclieapro_delin 2=''Nunca''',
  PRIMARY KEY (`clieapro_codigoid`),
  KEY `fk_clienteaprovacao_aprovacao1_idx` (`apro_codigoid`),
  CONSTRAINT `fk_clienteaprovacao_aprovacao1` FOREIGN KEY (`apro_codigoid`) REFERENCES `aprovacao` (`apro_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `confirmacao`
--

DROP TABLE IF EXISTS `confirmacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirmacao` (
  `conf_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ativ_codigoid` int(11) NOT NULL,
  `conf_tipo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `conf_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `conf_dataconfi` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'data que o usuário alegou ter confirmado',
  `usua_codigoid` int(11) NOT NULL,
  `conf_ciente` tinyint(1) NOT NULL,
  `conf_justificativa` text CHARACTER SET latin1,
  `conf_contato` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`conf_codigoid`),
  KEY `ativ_codigoid` (`ativ_codigoid`),
  CONSTRAINT `confirmacao_ibfk_1` FOREIGN KEY (`ativ_codigoid`) REFERENCES `ativacao` (`ativ_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3859 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `cont_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `sla_codigoid` int(11) DEFAULT NULL,
  `stat_codigoid` int(11) NOT NULL,
  `mult_codigoid` int(11) DEFAULT NULL,
  `cont_proximocodigoid` int(11) DEFAULT NULL,
  `cont_paicodigoid` int(11) DEFAULT NULL,
  `mode_codigoid` int(11) DEFAULT NULL,
  `clie_codigoid` int(11) DEFAULT NULL,
  `usua_codigoid` int(11) NOT NULL,
  `cont_numero` int(11) NOT NULL,
  `cont_limiteatraso` int(11) NOT NULL,
  `cont_menorprazo` tinyint(1) NOT NULL,
  `cont_prazorescisao` int(11) NOT NULL,
  `cont_dataassinatura` timestamp NULL DEFAULT NULL,
  `cont_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cont_indicereajuste` varchar(45) NOT NULL,
  `cont_prazoreajuste` int(11) NOT NULL,
  `cont_indisponibilidade` decimal(5,2) NOT NULL DEFAULT '0.00',
  `endeentr_codigoid` int(11) DEFAULT NULL,
  `desig_codigoid` int(11) DEFAULT NULL,
  `cont_dependentecodigoid` int(11) DEFAULT NULL,
  `unid_codigoid` int(11) DEFAULT NULL,
  `banc_codigoid` int(11) DEFAULT NULL,
  `envi_codigoid` int(11) DEFAULT NULL,
  `cont_datacancelamento` timestamp NULL DEFAULT NULL,
  `cont_datacancelado` timestamp NULL DEFAULT NULL,
  `cont_substituircodigoid` int(11) DEFAULT NULL,
  `cont_datareajustado` timestamp NULL DEFAULT NULL,
  `cont_unid_arquivado` int(11) DEFAULT NULL,
  `cont_cliente_final` varchar(255) DEFAULT NULL,
  `integracao_summit` tinyint(255) DEFAULT NULL,
  `cont_tipo` char(1) NOT NULL,
  `propcircuit_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cont_codigoid`),
  KEY `fk_contrato_sla1_idx` (`sla_codigoid`),
  KEY `fk_contrato_contrato1_idx` (`cont_proximocodigoid`),
  KEY `fk_contrato_multas1_idx` (`mult_codigoid`),
  KEY `fk_contrato_status1_idx` (`stat_codigoid`),
  KEY `fk_contrato_contrato2_idx` (`cont_paicodigoid`),
  KEY `fk_contrato_modelo_idx` (`mode_codigoid`),
  KEY `fk_contrato_enderecoentrega_idx` (`endeentr_codigoid`),
  KEY `fk_contrato_designacao1_idx` (`desig_codigoid`),
  KEY `clie_codigoid` (`clie_codigoid`),
  KEY `fk_contrato_1_idx` (`cont_substituircodigoid`),
  CONSTRAINT `fk_contrato_1` FOREIGN KEY (`cont_substituircodigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_contrato1` FOREIGN KEY (`cont_proximocodigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_contrato2` FOREIGN KEY (`cont_paicodigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_designacao1` FOREIGN KEY (`desig_codigoid`) REFERENCES `designacao` (`desig_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_enderecoentrega` FOREIGN KEY (`endeentr_codigoid`) REFERENCES `enderecoentrega` (`endeentr_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_modelo` FOREIGN KEY (`mode_codigoid`) REFERENCES `modelo` (`mode_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_multas1` FOREIGN KEY (`mult_codigoid`) REFERENCES `multas` (`mult_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_sla1` FOREIGN KEY (`sla_codigoid`) REFERENCES `sla` (`sla_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_status1` FOREIGN KEY (`stat_codigoid`) REFERENCES `status` (`stat_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52259 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`192.168.10.247`*/ /*!50003 TRIGGER `trg_contrato_tipo_tbi` BEFORE insert ON `contrato` FOR EACH ROW
BEGIN
    IF NEW.cont_paicodigoid is null THEN
        SET NEW.cont_tipo = 'P';
    ELSE 
        SET NEW.cont_tipo = 'F';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER log_contrato_insert_trigger AFTER INSERT ON financeiro.contrato
FOR EACH ROW
    INSERT INTO businessintelligence.log SET date_record = NOW(), identificadorProposta = '', flagUpdated = 0, idProposal = NULL, idContrato = NEW.cont_codigoid; */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `UPDATE_ATIVACAO_CONTRATO` BEFORE UPDATE ON `contrato`
FOR EACH ROW BEGIN
	DECLARE clieCodigoid INT(11) DEFAULT 0;
	DECLARE ativpagaCodigoid INT(11) DEFAULT 0;
	DECLARE contDatainc DATE DEFAULT CURRENT_DATE;
	DECLARE grupserviCodigoid INT(11) DEFAULT 0;
                   DECLARE unidCodigoid INT(11) DEFAULT 0;

	SELECT DISTINCT serv.grupserv_codigoid INTO grupserviCodigoid FROM contrato AS cont
	INNER JOIN contratoservico AS contserv ON (contserv.cont_codigoid = cont.cont_codigoid)
	INNER JOIN servicocapacidade AS servcapa ON (servcapa.servcapa_codigoid = contserv.servcapa_codigoid)
	INNER JOIN servico AS serv ON (serv.serv_codigoid = servcapa.serv_codigoid)
	WHERE cont.cont_codigoid =  NEW.cont_paicodigoid;
	
	SELECT clie_codigoid, DATE_FORMAT(cont_datainc, '%Y-%m-%d'), unid_codigoid INTO clieCodigoid, contDatainc, unidCodigoid FROM contrato WHERE cont_codigoid =  NEW.cont_paicodigoid;
	
	IF NEW.cont_paicodigoid IS NOT NULL AND clieCodigoid > 1000 AND contDatainc = CURRENT_DATE AND grupserviCodigoid = 2   THEN
		SELECT ativpag_codigoid INTO ativpagaCodigoid FROM ativacaopagamento WHERE cont_codigoid =  NEW.cont_codigoid LIMIT 1;
		IF ativpagaCodigoid =0 THEN
			INSERT INTO ativacaopagamento (cont_codigoid, ativpag_cobrado) VALUES (NEW.cont_codigoid, 0);
		END IF;
	END IF;


	
	IF NEW.stat_codigoid=4 AND OLD.stat_codigoid != 4 THEN
		SET NEW.cont_datacancelamento = NOW();
	END IF;

	-- insert no log da businessintelligence
    INSERT INTO businessintelligence.log SET date_record = NOW(), identificadorProposta = '', flagUpdated = 0, idProposal = NULL, idContrato = NEW.cont_codigoid;
    
    IF NEW.cont_paicodigoid is null THEN
        SET NEW.cont_tipo = 'P';
    ELSE 
        SET NEW.cont_tipo = 'F';
    END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contrato_aprovacao_fechamento`
--

DROP TABLE IF EXISTS `contrato_aprovacao_fechamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato_aprovacao_fechamento` (
  `id_contrato` int(255) NOT NULL,
  `active` tinyint(255) DEFAULT NULL,
  `aproved_by` int(255) DEFAULT NULL,
  `chance_id` int(255) DEFAULT NULL,
  `date_aproval` datetime DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  `date_record` datetime DEFAULT NULL,
  `delta` double DEFAULT NULL,
  `description` text,
  `tag` text,
  `wallet_id` int(11) DEFAULT NULL,
  `classification` int(255) DEFAULT NULL,
  `venda_valeu` int(255) DEFAULT NULL,
  `tipoVenda` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_contrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato_legado`
--

DROP TABLE IF EXISTS `contrato_legado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato_legado` (
  `cont_codigoid` int(11) NOT NULL,
  `proposta_legado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cont_codigoid`),
  KEY `fk_contrato_legado_contrato1_idx` (`cont_codigoid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato_servico_agregado`
--

DROP TABLE IF EXISTS `contrato_servico_agregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato_servico_agregado` (
  `contservagre_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `serv_codigoid` int(11) NOT NULL,
  `cont_codigoid` int(11) NOT NULL,
  `servagre_codigoid` int(11) NOT NULL,
  `natu_codigoid` int(11) NOT NULL,
  `peri_codigoid` int(11) NOT NULL,
  `moed_codigoid` int(11) NOT NULL,
  `contservagre_valor` decimal(15,2) NOT NULL,
  `contservagre_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contservagre_datafim` timestamp NULL DEFAULT NULL,
  `contservagre_desconto` decimal(15,2) NOT NULL,
  PRIMARY KEY (`contservagre_codigoid`),
  UNIQUE KEY `cont_codigoid` (`cont_codigoid`,`servagre_codigoid`,`natu_codigoid`),
  KEY `serv_codigoid` (`serv_codigoid`,`cont_codigoid`,`servagre_codigoid`,`natu_codigoid`,`peri_codigoid`,`moed_codigoid`),
  KEY `servagre_codigoid` (`servagre_codigoid`),
  KEY `natu_codigoid` (`natu_codigoid`),
  KEY `peri_codigoid` (`peri_codigoid`),
  KEY `moed_codigoid` (`moed_codigoid`),
  CONSTRAINT `contrato_servico_agregado_ibfk_1` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contrato_servico_agregado_ibfk_2` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contrato_servico_agregado_ibfk_3` FOREIGN KEY (`servagre_codigoid`) REFERENCES `servico_agregado` (`servagre_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contrato_servico_agregado_ibfk_4` FOREIGN KEY (`natu_codigoid`) REFERENCES `natureza` (`natu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contrato_servico_agregado_ibfk_5` FOREIGN KEY (`peri_codigoid`) REFERENCES `periodicidade` (`peri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contrato_servico_agregado_ibfk_6` FOREIGN KEY (`moed_codigoid`) REFERENCES `moeda` (`moed_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato_wan_vogel`
--

DROP TABLE IF EXISTS `contrato_wan_vogel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato_wan_vogel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `ctr_codigo` int(11) NOT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contrato_wan_vogel_id_IDX` (`id`) USING BTREE,
  KEY `contrato_wan_vogel_cont_codigoid_IDX` (`cont_codigoid`) USING BTREE,
  KEY `contrato_wan_vogel_ctr_codigo_IDX` (`ctr_codigo`) USING BTREE,
  CONSTRAINT `contrato_wan_vogel_contrato_FK` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4384 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratoaprovacao`
--

DROP TABLE IF EXISTS `contratoaprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoaprovacao` (
  `contapro_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) NOT NULL,
  `contapro_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contapro_dataaprovado` timestamp NULL DEFAULT NULL,
  `contapro_aprovado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`contapro_codigoid`),
  KEY `fk_contratoaprovacao_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_contratoaprovacao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratobloqueio`
--

DROP TABLE IF EXISTS `contratobloqueio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratobloqueio` (
  `contbloq_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `bloq_codigoid` int(11) NOT NULL,
  `cont_codigoid` int(11) NOT NULL,
  `contbloq_motivo` varchar(45) DEFAULT NULL,
  `contbloq_usuario` int(11) DEFAULT NULL,
  `contbloq_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contbloq_codigoid`),
  KEY `fk_contratobloqueio_1_idx` (`bloq_codigoid`),
  KEY `fk_contratobloqueio_cont_codigoid_idx` (`cont_codigoid`),
  CONSTRAINT `fk_contratobloqueio_bloq_codigoid` FOREIGN KEY (`bloq_codigoid`) REFERENCES `bloqueio` (`bloq_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratobloqueio_cont_codigoid` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratocontato`
--

DROP TABLE IF EXISTS `contratocontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratocontato` (
  `contcont_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usr_codigoid` int(11) NOT NULL,
  `contcont_contato` varchar(100) NOT NULL,
  PRIMARY KEY (`contcont_codigoid`),
  KEY `fk_contratocontato_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_contratocontato_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19587 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratoproposta`
--

DROP TABLE IF EXISTS `contratoproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoproposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproposal` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcontrato_proposta_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5092 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratoservico`
--

DROP TABLE IF EXISTS `contratoservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoservico` (
  `contserv_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `servcapa_codigoid` int(11) NOT NULL,
  `contserv_circuito` varchar(45) DEFAULT NULL COMMENT 'cont_circuito - meios de entrega e designação de ckt clm (circuito carrier last mile)',
  PRIMARY KEY (`contserv_codigoid`),
  KEY `fk_contratoservico_contrato1_idx` (`cont_codigoid`),
  KEY `fk_contratoservico_servicocapacidade1_idx` (`servcapa_codigoid`),
  CONSTRAINT `fk_contratoservico_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratoservico_servicocapacidade1` FOREIGN KEY (`servcapa_codigoid`) REFERENCES `servicocapacidade` (`servcapa_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51634 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER financeiro.circuito_contrato BEFORE INSERT ON financeiro.contratoservico
FOR EACH ROW
BEGIN
DECLARE circuito VARCHAR(45);
DECLARE clienteID int;

SELECT clie_codigoid INTO clienteID FROM contrato
WHERE cont_codigoid = NEW.cont_codigoid LIMIT 1;

SELECT concat(clienteID, '-', serv.serv_apelido, '-', RIGHT(concat('00', (MAX(RIGHT(IFNULL(contserv.contserv_circuito, '000'), 3))+1)), 3)) INTO circuito FROM servicocapacidade AS servcapa
INNER JOIN servico AS serv ON (serv.serv_codigoid = servcapa.serv_codigoid)
LEFT JOIN contratoservico AS contserv ON (contserv.servcapa_codigoid = servcapa.servcapa_codigoid)
LEFT JOIN contrato AS cont ON (cont.cont_codigoid = contserv.cont_codigoid)
WHERE servcapa.servcapa_codigoid = NEW.servcapa_codigoid OR cont.clie_codigoid = clienteID;
SET NEW.contserv_circuito = circuito;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `numero_contrato` AFTER INSERT ON `contratoservico`
FOR EACH ROW BEGIN
	DECLARE numero int;
	DECLARE contPai INT(11) DEFAULT 0;
	DECLARE clieCodigoid INT(11) DEFAULT 0;
	DECLARE grupservCodigoid INT(11) DEFAULT 0;
	DECLARE ativpagaCodigoid INT(11) DEFAULT 0;
	DECLARE unidCodigoid INT(11) DEFAULT 0;

	SELECT (IFNULL(MAX(cont_numero),0)+1), IFNULL(unid_codigoid, 0) INTO numero, unidCodigoid FROM contrato
		WHERE cont_paicodigoid IS NULL
		AND clie_codigoid > 0;

	UPDATE contrato SET cont_numero = numero
		WHERE cont_codigoid = NEW.cont_codigoid
		AND cont_numero = 0
		AND cont_paicodigoid IS NULL
		AND CLIE_CODIGOID > 0;

	SELECT DISTINCT IFNULL(serv.grupserv_codigoid, 0),
					IFNULL(cont.cont_paicodigoid, 0),
					IFNULL(cont.clie_codigoid, 0)
	INTO grupservCodigoid, contPai, clieCodigoid FROM contrato AS cont
	INNER JOIN contratoservico AS contserv ON (contserv.cont_codigoid = cont.cont_codigoid)
	INNER JOIN servicocapacidade AS servcapa ON (servcapa.servcapa_codigoid = contserv.servcapa_codigoid)
	INNER JOIN servico AS serv ON (serv.serv_codigoid = servcapa.serv_codigoid)
		WHERE cont.cont_codigoid =  NEW.cont_codigoid;

	IF contPai = 0 AND clieCodigoid > 1000 AND  grupservCodigoid != 2 AND unidCodigoid IN(1,8989) THEN
		SELECT IFNULL(ativpag_codigoid, 0) INTO ativpagaCodigoid FROM ativacaopagamento 
			WHERE cont_codigoid = NEW.cont_codigoid;
		IF ativpagaCodigoid = 0 THEN
			INSERT INTO ativacaopagamento (cont_codigoid, ativpag_cobrado) VALUES (NEW.cont_codigoid, 0);
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contratoticket`
--

DROP TABLE IF EXISTS `contratoticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoticket` (
  `conttick_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `tick_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`conttick_codigoid`),
  KEY `fk_contratoticket_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_contratoticket_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratovalor`
--

DROP TABLE IF EXISTS `contratovalor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratovalor` (
  `contvalo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `contvalo_proximocodigoid` int(11) DEFAULT NULL,
  `contvalo_anteriorcodigoid` int(11) DEFAULT NULL,
  `cont_codigoid` int(11) NOT NULL,
  `moed_codigoid` int(11) NOT NULL,
  `natu_codigoid` int(11) NOT NULL,
  `contvalo_datainic` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contvalo_datafim` timestamp NULL DEFAULT NULL,
  `contvalo_valor` decimal(10,2) NOT NULL,
  `contvalo_valorsemdesconto` decimal(10,2) DEFAULT NULL,
  `contvalo_valorsemimposto` decimal(10,2) DEFAULT NULL,
  `contvalo_SVA` decimal(5,2) DEFAULT NULL,
  `contvalo_SCM` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`contvalo_codigoid`),
  KEY `fk_contratovalor_contrato1_idx` (`cont_codigoid`),
  KEY `fk_contratovalor_moeda1_idx` (`moed_codigoid`),
  KEY `fk_contratovalor_contratovalor1_idx` (`contvalo_proximocodigoid`),
  KEY `fk_contratovalor_natureza1_idx` (`natu_codigoid`),
  KEY `fk_contratovalor_contratovalor2_idx` (`contvalo_anteriorcodigoid`),
  KEY `contvalo_datafim` (`contvalo_datafim`),
  CONSTRAINT `fk_contratovalor_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratovalor_contratovalor1` FOREIGN KEY (`contvalo_proximocodigoid`) REFERENCES `contratovalor` (`contvalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratovalor_contratovalor2` FOREIGN KEY (`contvalo_anteriorcodigoid`) REFERENCES `contratovalor` (`contvalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratovalor_moeda1` FOREIGN KEY (`moed_codigoid`) REFERENCES `moeda` (`moed_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratovalor_natureza1` FOREIGN KEY (`natu_codigoid`) REFERENCES `natureza` (`natu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103096 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contratovalor_discriminacao`
--

DROP TABLE IF EXISTS `contratovalor_discriminacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratovalor_discriminacao` (
  `cont_discriminacao_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `contvalo_codigoid` int(11) NOT NULL,
  `discriminacao_codigoid` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cont_discriminacao_codigoid`),
  KEY `fk_contratovalor_has_discriminacao_discriminacao1_idx` (`discriminacao_codigoid`),
  KEY `fk_contratovalor_has_discriminacao_contratovalor1_idx` (`contvalo_codigoid`),
  CONSTRAINT `fk_contratovalor_has_discriminacao_contratovalor1` FOREIGN KEY (`contvalo_codigoid`) REFERENCES `contratovalor` (`contvalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratovalor_has_discriminacao_discriminacao1` FOREIGN KEY (`discriminacao_codigoid`) REFERENCES `discriminacao` (`id_discriminacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68615 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER ADD_SCM_SVA
AFTER INSERT ON contratovalor_discriminacao
FOR EACH ROW
BEGIN
	
	DECLARE contvaloCodigoid INT(11);
	DECLARE contvaloValor DECIMAL(10,2);
	DECLARE percentualSVA DECIMAL(10,2) DEFAULT 0.00;
	DECLARE percentualSCM DECIMAL(10,2) DEFAULT 0.00;

	DECLARE arrayContratoValor CURSOR FOR
	SELECT contvalo.contvalo_codigoid, contvalo.contvalo_valor
	FROM contratovalor AS contvalo WHERE contvalo_codigoid = NEW.contvalo_codigoid;

	OPEN arrayContratoValor;
	FETCH arrayContratoValor INTO contvaloCodigoid, contvaloValor;
	
	IF NEW.discriminacao_codigoid = 1 THEN 
		SET percentualSVA = ((NEW.valor*100)/contvaloValor);
		SET percentualSCM = (100.00 - percentualSVA);
	ELSEIF  NEW.discriminacao_codigoid = 2 THEN
	
		SET percentualSCM = ((NEW.valor*100)/contvaloValor);
		SET percentualSVA = (100.00 - percentualSCM);
	END IF;

    UPDATE contratovalor SET contvalo_SVA = percentualSVA,
						 contvalo_SCM = percentualSCM
	WHERE contvalo_codigoid = NEW.contvalo_codigoid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contratovalorfatura`
--

DROP TABLE IF EXISTS `contratovalorfatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratovalorfatura` (
  `contvalofatu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `fatu_codigoid` int(11) DEFAULT NULL,
  `contvalo_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`contvalofatu_codigoid`),
  KEY `fk_invoiceperiodicidade_fatura1_idx` (`fatu_codigoid`),
  KEY `fk_contratovalorfatura_contratovalor1_idx` (`contvalo_codigoid`),
  CONSTRAINT `fk_contratovalorfatura_contratovalor1` FOREIGN KEY (`contvalo_codigoid`) REFERENCES `contratovalor` (`contvalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoiceperiodicidade_fatura1` FOREIGN KEY (`fatu_codigoid`) REFERENCES `fatura` (`fatu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dadosbancarios`
--

DROP TABLE IF EXISTS `dadosbancarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dadosbancarios` (
  `dadobanc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `banc_codigoid` int(11) NOT NULL,
  `dadobanc_agencia` varchar(10) NOT NULL,
  `dadobanc_conta` varchar(50) NOT NULL,
  `empr_codigoid` int(11) NOT NULL,
  `dadobanc_codigocedente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dadobanc_codigoid`),
  KEY `fk_dadosbancarios_banco1_idx` (`banc_codigoid`),
  CONSTRAINT `fk_dadosbancarios_banco1` FOREIGN KEY (`banc_codigoid`) REFERENCES `banco` (`banc_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `de_para_voice`
--

DROP TABLE IF EXISTS `de_para_voice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `de_para_voice` (
  `contrato_id` int(11) NOT NULL DEFAULT '0',
  `tipo_pessoa` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `razao_social` longtext,
  `nome_fantasia` varchar(200) DEFAULT NULL,
  `executivo` varchar(100),
  `data_de_criacao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cnpj_cpf` bigint(20) unsigned DEFAULT NULL,
  `data_vencimento` int(11) DEFAULT NULL,
  `data_inicial` timestamp NULL DEFAULT NULL,
  `vigencia` int(11) NOT NULL,
  `informacoes_adicionais` binary(0) DEFAULT NULL,
  `produto_contratado` varchar(255) NOT NULL,
  `tipo_servico` binary(0) DEFAULT NULL,
  `interface` longtext,
  `qtd_canais` text,
  `plano` binary(0) DEFAULT NULL,
  `franquia` decimal(10,2),
  `instalacao` decimal(10,2),
  `assinatura` decimal(10,2),
  `desconto_instalacao` decimal(11,2) DEFAULT NULL,
  `desconto_assinatura` decimal(11,2) DEFAULT NULL,
  `qtd_numeros` binary(0) DEFAULT NULL,
  `remessa_cep` varchar(45),
  `remessa_estado` varchar(45),
  `remessa_cidade` varchar(45),
  `remessa_rua` varchar(45),
  `remessa_numero` varchar(45),
  `remessa_bairro` varchar(45),
  `administrativo_nome` longtext,
  `administrativo_cpf` bigint(11) unsigned zerofill DEFAULT NULL,
  `administrativo_nascimento` date DEFAULT NULL,
  `administrativo_telefone` varchar(30) DEFAULT NULL,
  `administrativo_celular` varchar(30) DEFAULT NULL,
  `administrativo_email` varchar(200) DEFAULT NULL,
  `tecnico_nome` longtext,
  `tecnico_telefone` varchar(30) DEFAULT NULL,
  `tecnico_celular` varchar(30) DEFAULT NULL,
  `tecnico_email` varchar(200) DEFAULT NULL,
  `financeiro_nome` longtext,
  `financeiro_telefone` varchar(30) DEFAULT NULL,
  `financeiro_celular` varchar(30) DEFAULT NULL,
  `financeiro_email` varchar(200) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desativacao`
--

DROP TABLE IF EXISTS `desativacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desativacao` (
  `desa_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) DEFAULT NULL,
  `desa_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `desa_datadesativado` timestamp NULL DEFAULT NULL,
  `desa_ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`desa_codigoid`),
  KEY `fk_desativacao_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_desativacao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `designacao`
--

DROP TABLE IF EXISTS `designacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designacao` (
  `desig_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `endeentr_codigoid` int(11) DEFAULT NULL,
  `clie_codigoid` int(11) DEFAULT NULL,
  `desig_stt` varchar(20) DEFAULT NULL,
  `desig_numero` int(11) NOT NULL DEFAULT '0',
  `desig_pedido` varchar(90) DEFAULT NULL,
  `desig_ponta` int(11) DEFAULT NULL,
  PRIMARY KEY (`desig_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=26251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discriminacao`
--

DROP TABLE IF EXISTS `discriminacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discriminacao` (
  `id_discriminacao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_discriminacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `docu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipodocu_codigoid` int(11) NOT NULL,
  `cont_codigoid` int(11) NOT NULL,
  `docu_nome` varchar(255) NOT NULL,
  `docu_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `docu_usuainc` int(11) DEFAULT NULL,
  `docu_datafim` timestamp NULL DEFAULT NULL,
  `docu_usuafim` int(11) DEFAULT NULL,
  `docu_aprovado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`docu_codigoid`),
  KEY `fk_documento_tipodocumento1_idx` (`tipodocu_codigoid`),
  KEY `fk_documento_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_documento_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_tipodocumento1` FOREIGN KEY (`tipodocu_codigoid`) REFERENCES `tipodocumento` (`tipodocu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37373 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentopesquisa`
--

DROP TABLE IF EXISTS `documentopesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentopesquisa` (
  `docupesq_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `docu_codigoid` int(11) NOT NULL,
  `pesq_codigoid` int(11) NOT NULL,
  `docupesq_dado` varchar(255) NOT NULL,
  PRIMARY KEY (`docupesq_codigoid`),
  KEY `fk_documentopesquisa_documento1_idx` (`docu_codigoid`),
  KEY `fk_documentopesquisa_pesquisa1_idx` (`pesq_codigoid`),
  CONSTRAINT `fk_documentopesquisa_documento1` FOREIGN KEY (`docu_codigoid`) REFERENCES `documento` (`docu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentopesquisa_pesquisa1` FOREIGN KEY (`pesq_codigoid`) REFERENCES `pesquisa` (`pesq_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `duracaocontrato`
--

DROP TABLE IF EXISTS `duracaocontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duracaocontrato` (
  `duracont_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) DEFAULT NULL,
  `duracont_proximocodigoid` int(11) DEFAULT NULL,
  `duracont_meses` tinyint(1) NOT NULL,
  `duracont_periodo` int(11) NOT NULL,
  `duracont_inicio` timestamp NULL DEFAULT NULL,
  `duracont_fim` timestamp NULL DEFAULT NULL,
  `duracont_renovado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`duracont_codigoid`),
  KEY `fk_duracaocontrado_duracaocontrado1_idx` (`duracont_proximocodigoid`),
  KEY `fk_duracaocontrato_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_duracaocontrado_duracaocontrado1` FOREIGN KEY (`duracont_proximocodigoid`) REFERENCES `duracaocontrato` (`duracont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_duracaocontrato_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40406 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enderecocobranca`
--

DROP TABLE IF EXISTS `enderecocobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enderecocobranca` (
  `endecobr_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `endecobr_pais` int(11) NOT NULL,
  `endecobr_estado` varchar(45) NOT NULL,
  `endecobr_cidade` varchar(45) NOT NULL,
  `endecobr_bairro` varchar(45) NOT NULL,
  `endecobr_logradouro` varchar(45) NOT NULL,
  `endecobr_cep` varchar(45) NOT NULL,
  `endecobr_numero` varchar(45) NOT NULL,
  `endecobr_complemento` varchar(45) DEFAULT NULL,
  `endecobr_latitude` varchar(45) DEFAULT NULL,
  `endecobr_longitude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`endecobr_codigoid`),
  KEY `fk_enderecocobranca_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_enderecocobranca_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16997 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enderecoentrega`
--

DROP TABLE IF EXISTS `enderecoentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enderecoentrega` (
  `endeentr_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) DEFAULT NULL,
  `endeentr_concentrador` tinyint(1) NOT NULL,
  `endeentr_pais` int(11) NOT NULL,
  `endeentr_estado` int(11) NOT NULL,
  `endeentr_cidade` int(11) NOT NULL,
  `endeentr_bairro` varchar(255) NOT NULL,
  `endeentr_logradouro` varchar(255) NOT NULL,
  `endeentr_cep` varchar(255) NOT NULL,
  `endeentr_numero` int(11) NOT NULL,
  `endeentr_complemento` varchar(255) DEFAULT NULL,
  `endeentr_ponta` varchar(10) DEFAULT NULL,
  `endeentr_latitude` varchar(50) DEFAULT NULL,
  `endeentr_longitude` varchar(50) DEFAULT NULL,
  `endeentr_designador_old` varchar(255) DEFAULT NULL,
  `adm_logradouro` int(11) DEFAULT NULL,
  PRIMARY KEY (`endeentr_codigoid`),
  KEY `fk_endereco_contrato1_idx` (`cont_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=20174 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_adm_logradouro_tbi` BEFORE INSERT  ON `enderecoentrega` FOR EACH ROW
BEGIN
    IF NEW.adm_logradouro IS NULL THEN 
        SET NEW.adm_logradouro = CAST(
            SUBSTRING_INDEX( SUBSTRING_INDEX(NEW.endeentr_logradouro, '-::-', 1), '-::-', -1 ) AS UNSIGNED
        )  ;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_adm_logradouro_tbu` BEFORE UPDATE  ON `enderecoentrega` FOR EACH ROW
BEGIN
    IF NEW.adm_logradouro IS NULL THEN 
        SET NEW.adm_logradouro = CAST(
            SUBSTRING_INDEX( SUBSTRING_INDEX(NEW.endeentr_logradouro, '-::-', 1), '-::-', -1 ) AS UNSIGNED
        )  ;
    END IF;  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `enderecoentregaatributovalor`
--

DROP TABLE IF EXISTS `enderecoentregaatributovalor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enderecoentregaatributovalor` (
  `endeentratrivalo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `endeentratrivalo_paicodigoid` int(11) DEFAULT NULL,
  `atrivalo_codigoid` int(11) NOT NULL,
  `cont_codigoid` int(11) NOT NULL,
  `endeentr_codigoid` int(11) DEFAULT NULL,
  `endeentratrivalo_valor` text,
  `endeentratrivalo_descricao` text,
  `data_inc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registrante` int(11) DEFAULT NULL,
  `endeentratrivalo_datafim` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`endeentratrivalo_codigoid`),
  KEY `fk_contratoservicoatributos_atributovalor1_idx` (`atrivalo_codigoid`),
  KEY `fk_enderecoentregaatributovalor_cont_codigoid_idx` (`cont_codigoid`),
  CONSTRAINT `fk_contratoservicoatributos_atributovalor1` FOREIGN KEY (`atrivalo_codigoid`) REFERENCES `atributovalor` (`atrivalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=148717 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ANSI_QUOTES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="root"@"%"*/ /*!50003 TRIGGER `enderecoentregaatributovalor_AUPD` AFTER UPDATE ON `enderecoentregaatributovalor` FOR EACH ROW
begin
INSERT INTO  `financeiro`.`enderecoentregaatributovalor_histo` (
`endeentratrivalo_codigoid` ,
`atrivalo_codigoid` ,
`endeentratrivalo_valor` ,
`endeentratrivalo_descricao` ,
`data_inc` ,
`registrante`
)
VALUES (
OLD.endeentratrivalo_codigoid,
OLD.atrivalo_codigoid,  
OLD.endeentratrivalo_valor,
OLD.endeentratrivalo_descricao,
OLD.data_inc,
OLD.registrante
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `enderecoentregaatributovalor_histo`
--

DROP TABLE IF EXISTS `enderecoentregaatributovalor_histo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enderecoentregaatributovalor_histo` (
  `endeentratrivalo_histo` int(11) NOT NULL AUTO_INCREMENT,
  `endeentratrivalo_codigoid` int(11) NOT NULL,
  `atrivalo_codigoid` int(11) DEFAULT NULL,
  `endeentratrivalo_valor` text,
  `endeentratrivalo_descricao` text,
  `data_inc` datetime DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  PRIMARY KEY (`endeentratrivalo_histo`),
  KEY `fk_enderecoentregaatributovalor_histo_endeentratrivalo_codi_idx` (`endeentratrivalo_codigoid`),
  CONSTRAINT `fk_enderecoentregaatributovalor_histo_endeentratrivalo_codigoid` FOREIGN KEY (`endeentratrivalo_codigoid`) REFERENCES `enderecoentregaatributovalor` (`endeentratrivalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envio` (
  `envi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `envi_nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`envi_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excedente`
--

DROP TABLE IF EXISTS `excedente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excedente` (
  `exce_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `exce_valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`exce_codigoid`),
  KEY `fk_excedente_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_excedente_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura` (
  `fatu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `arqureme_codigoid` int(11) DEFAULT NULL,
  `usua_codigoid` int(11) DEFAULT NULL,
  `fatu_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fatu_datavencimento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fatu_valor` decimal(10,2) NOT NULL,
  `fatu_nsr` int(11) NOT NULL,
  `fatu_emitido` tinyint(1) NOT NULL,
  `fatu_datade` timestamp NULL DEFAULT NULL,
  `fatu_dataate` timestamp NULL DEFAULT NULL,
  `fatu_excedente` decimal(10,2) DEFAULT NULL,
  `fatu_consumido` decimal(10,2) DEFAULT NULL,
  `fatu_codigobarra` varchar(45) DEFAULT NULL,
  `fatu_linhadigitavel` varchar(100) DEFAULT NULL,
  `fatu_nossonumero` varchar(10) DEFAULT NULL,
  `fatu_valorjuros` decimal(10,2) DEFAULT NULL,
  `fatu_valormulta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`fatu_codigoid`),
  KEY `fk_fatura_arquivoremessa1_idx` (`arqureme_codigoid`),
  CONSTRAINT `fk_fatura_arquivoremessa1` FOREIGN KEY (`arqureme_codigoid`) REFERENCES `arquivoremessa` (`arqureme_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gruposervico`
--

DROP TABLE IF EXISTS `gruposervico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gruposervico` (
  `grupserv_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `grupserv_nome` varchar(45) NOT NULL,
  `grupserv_descricao` varchar(255) NOT NULL,
  `grupserv_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`grupserv_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `igpdi`
--

DROP TABLE IF EXISTS `igpdi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `igpdi` (
  `igpdi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `igpdi_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `igpdi_percentual` decimal(5,2) NOT NULL,
  `igpdi_acumuladonoano` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igpdi_acumulado12meses` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igpdi_prazo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`igpdi_codigoid`),
  UNIQUE KEY `igpdi_prazo` (`igpdi_prazo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `igpm`
--

DROP TABLE IF EXISTS `igpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `igpm` (
  `igpm_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `igpm_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `igpm_percentual` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igpm_acumuladonoano` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igpm_acumulado12meses` decimal(5,2) NOT NULL DEFAULT '0.00',
  `igpm_prazo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`igpm_codigoid`),
  UNIQUE KEY `igpm_prazo` (`igpm_prazo`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impostoscontrato`
--

DROP TABLE IF EXISTS `impostoscontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impostoscontrato` (
  `impocont_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `impocont_pis_reter` tinyint(1) NOT NULL,
  `impocont_pis_destacar` tinyint(1) NOT NULL,
  `impocont_pis_valor` decimal(5,2) NOT NULL,
  `impocont_pis_reducao` decimal(5,2) DEFAULT NULL,
  `impocont_cofins_reter` tinyint(1) NOT NULL,
  `impocont_cofins_destacar` tinyint(1) NOT NULL,
  `impocont_cofins_valor` decimal(5,2) NOT NULL,
  `impocont_cofins_reducao` decimal(5,2) DEFAULT NULL,
  `impocont_ir_reter` tinyint(1) NOT NULL,
  `impocont_ir_destacar` tinyint(1) NOT NULL,
  `impocont_ir_valor` decimal(5,2) NOT NULL,
  `impocont_ir_reducao` decimal(5,2) DEFAULT NULL,
  `impocont_isll_reter` tinyint(1) NOT NULL,
  `impocont_isll_destacar` tinyint(1) NOT NULL,
  `impocont_isll_valor` decimal(5,2) NOT NULL,
  `impocont_isll_reducao` decimal(5,2) DEFAULT NULL,
  `impocont_issqn_reter` tinyint(1) NOT NULL,
  `impocont_issqn_destacar` tinyint(1) NOT NULL,
  `impocont_issqn_valor` decimal(5,2) NOT NULL,
  `impocont_issqn_reducao` decimal(5,2) DEFAULT NULL,
  `impocont_icms_reter` tinyint(1) NOT NULL,
  `impocont_icms_destacar` tinyint(1) NOT NULL,
  `impocont_icms_valor` decimal(5,2) NOT NULL,
  `impocont_icms_reducao` decimal(5,2) DEFAULT NULL,
  `ativ_pis_valor` decimal(5,2) DEFAULT NULL,
  `ativ_pis_reter` tinyint(1) DEFAULT NULL,
  `ativ_cofins_valor` decimal(5,2) DEFAULT NULL,
  `ativ_cofins_reter` tinyint(1) DEFAULT NULL,
  `ativ_ir_valor` decimal(5,2) DEFAULT NULL,
  `ativ_ir_reter` tinyint(1) DEFAULT NULL,
  `ativ_csll_valor` decimal(5,2) DEFAULT NULL,
  `ativ_csll_reter` tinyint(1) DEFAULT NULL,
  `ativ_issqn_valor` decimal(5,2) DEFAULT NULL,
  `ativ_issqn_reter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`impocont_codigoid`),
  KEY `fk_impostoscontrato_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_impostoscontrato_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19773 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inpc`
--

DROP TABLE IF EXISTS `inpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inpc` (
  `inpc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `inpc_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inpc_percentual` decimal(5,2) NOT NULL,
  `inpc_acumuladonoano` decimal(5,2) NOT NULL DEFAULT '0.00',
  `inpc_acumulado12meses` decimal(5,2) NOT NULL DEFAULT '0.00',
  `inpc_prazo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`inpc_codigoid`),
  UNIQUE KEY `inpc_prazo` (`inpc_prazo`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integracao_wan_log`
--

DROP TABLE IF EXISTS `integracao_wan_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integracao_wan_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrato_wan_id` int(11) DEFAULT NULL,
  `contrato_vogel_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_id_wan` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `data_hora_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `fk_contrato-wan_contrato-vogel_contrato1_idx` (`contrato_vogel_id`),
  KEY `integracao_wan_log_contrato_wan_id_IDX` (`contrato_wan_id`),
  KEY `integracao_wan_log_customer_id_IDX` (`customer_id`),
  KEY `integracao_wan_log_customer_id_wan_IDX` (`customer_id_wan`),
  CONSTRAINT `fk_contrato-wan_contrato-vogel_contrato1` FOREIGN KEY (`contrato_vogel_id`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2192636 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipcaibge`
--

DROP TABLE IF EXISTS `ipcaibge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipcaibge` (
  `ipcaibge_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ipcaibge_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipcaibge_percentual` decimal(5,2) NOT NULL,
  `ipcaibge_acumuladonoano` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ipcaibge_acumulado12meses` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ipcaibge_prazo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ipcaibge_codigoid`),
  KEY `ipcaibge_prazo` (`ipcaibge_prazo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipciepe`
--

DROP TABLE IF EXISTS `ipciepe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipciepe` (
  `ipciepe_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ipciepe_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipciepe_percentual` decimal(5,2) NOT NULL,
  `ipciepe_acumuladonoano` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ipciepe_acumulado12meses` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ipciepe_prazo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ipciepe_codigoid`),
  KEY `ipciepe_prazo` (`ipciepe_prazo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ist`
--

DROP TABLE IF EXISTS `ist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ist` (
  `ist_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ist_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ist_percentual` decimal(5,2) NOT NULL,
  `ist_acumuladonoano` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ist_acumulado12meses` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ist_prazo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ist_codigoid`),
  UNIQUE KEY `ist_prazo` (`ist_prazo`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `logg_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipologg_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) DEFAULT NULL,
  `logg_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logg_ip` varchar(50) NOT NULL,
  `logg_oldendata` text,
  `logg_database` varchar(25) DEFAULT NULL,
  `logg_table` varchar(50) DEFAULT NULL,
  `logg_tableid` int(11) DEFAULT NULL,
  PRIMARY KEY (`logg_codigoid`),
  KEY `fk_logging_tipologging1_idx` (`tipologg_codigoid`),
  CONSTRAINT `fk_logging_tipologging1` FOREIGN KEY (`tipologg_codigoid`) REFERENCES `tipologging` (`tipologg_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lotebancario`
--

DROP TABLE IF EXISTS `lotebancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotebancario` (
  `lotebanc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `usua_codigoid` int(11) NOT NULL,
  `banc_codigoid` int(11) NOT NULL,
  `lotebanc_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lotebanc_texto` text NOT NULL,
  `lotebanc_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`lotebanc_codigoid`),
  KEY `fk_lotebancario_banco1_idx` (`banc_codigoid`),
  CONSTRAINT `fk_lotebancario_banco1` FOREIGN KEY (`banc_codigoid`) REFERENCES `banco` (`banc_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medida`
--

DROP TABLE IF EXISTS `medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medida` (
  `medi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `medi_nome` varchar(255) NOT NULL,
  `medi_sigla` varchar(10) NOT NULL,
  `medi_multiplicador` int(11) NOT NULL DEFAULT '1024',
  `medi_vezes` int(11) NOT NULL DEFAULT '0',
  `medi_categoria` int(11) NOT NULL,
  PRIMARY KEY (`medi_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `mode_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `mode_nome` varchar(255) NOT NULL,
  `mode_ativo` tinyint(1) NOT NULL,
  `mode_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mode_datafim` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mode_codigoid`),
  KEY `fk_modelo_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_modelo_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moeda`
--

DROP TABLE IF EXISTS `moeda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moeda` (
  `moed_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `moed_nome` varchar(45) NOT NULL,
  `moed_valor` decimal(5,2) NOT NULL,
  `moed_sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`moed_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multas` (
  `mult_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `mult_atraso` decimal(5,2) NOT NULL,
  `mult_juro` decimal(5,2) NOT NULL,
  `mult_mora` decimal(5,2) NOT NULL,
  `mult_downgrade` decimal(5,2) NOT NULL,
  `mult_recisao` decimal(5,2) NOT NULL,
  `mult_cobrardesconto` tinyint(1) NOT NULL,
  `mult_cobrardescontofuturo` tinyint(1) NOT NULL,
  PRIMARY KEY (`mult_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `natureza`
--

DROP TABLE IF EXISTS `natureza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `natureza` (
  `natu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `natu_descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`natu_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `nive_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `nive_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`nive_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificacaovencimento`
--

DROP TABLE IF EXISTS `notificacaovencimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacaovencimento` (
  `notvenc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `notvenc_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notvenc_usuacodigoid` int(11) NOT NULL,
  `notvenc_dataconfirmacao` timestamp NULL DEFAULT NULL,
  `notvenc_descricaoconfirmacao` text,
  PRIMARY KEY (`notvenc_codigoid`),
  KEY `fk_notificacaovencimento_1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_notificacaovencimento_1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3775 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagina`
--

DROP TABLE IF EXISTS `pagina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagina` (
  `pagi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `docu_codigoid` int(11) NOT NULL,
  `pagi_proxima` int(11) DEFAULT NULL,
  `pagi_pagina` int(11) NOT NULL,
  `pagi_nome` varchar(255) NOT NULL,
  `pagi_extensao` varchar(5) NOT NULL,
  `pagi_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pagi_texto` text,
  PRIMARY KEY (`pagi_codigoid`),
  KEY `fk_pagina_documento1_idx` (`docu_codigoid`),
  KEY `fk_pagina_pagina1_idx` (`pagi_proxima`),
  CONSTRAINT `fk_pagina_documento1` FOREIGN KEY (`docu_codigoid`) REFERENCES `documento` (`docu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagina_pagina1` FOREIGN KEY (`pagi_proxima`) REFERENCES `pagina` (`pagi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37364 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodicidade`
--

DROP TABLE IF EXISTS `periodicidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodicidade` (
  `peri_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `contvalo_codigoid` int(11) DEFAULT NULL,
  `peri_periodicidadefatura` int(11) NOT NULL,
  `peri_periodicidadenota` int(11) NOT NULL,
  `peri_parcelasfatura` int(11) NOT NULL,
  `peri_parcelasnota` int(11) NOT NULL,
  `peri_vencimento` int(11) DEFAULT NULL,
  `peri_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `peri_aposassinatura` tinyint(1) DEFAULT NULL,
  `peri_pospago` int(11) NOT NULL DEFAULT '0',
  `peri_numeroparcelas` int(11) NOT NULL,
  `peri_carenciadias` int(11) DEFAULT NULL,
  `peri_carenciames` int(11) DEFAULT NULL,
  `peri_carenciadatafixa` timestamp NULL DEFAULT NULL,
  `peri_vencimentodatafixa` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`peri_codigoid`),
  KEY `fk_periodicidade_contratovalor1_idx` (`contvalo_codigoid`),
  CONSTRAINT `fk_periodicidade_contratovalor1` FOREIGN KEY (`contvalo_codigoid`) REFERENCES `contratovalor` (`contvalo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65055 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesquisa`
--

DROP TABLE IF EXISTS `pesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesquisa` (
  `pesq_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pesq_nome` varchar(45) NOT NULL,
  `pesq_tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`pesq_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `postagem`
--

DROP TABLE IF EXISTS `postagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postagem` (
  `post_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `fatu_codigoid` int(11) NOT NULL,
  `ar_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) NOT NULL,
  `post_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_datarecebimento` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`post_codigoid`),
  KEY `fk_postagem_ar1_idx` (`ar_codigoid`),
  KEY `fk_postagem_fatura1_idx` (`fatu_codigoid`),
  CONSTRAINT `fk_postagem_ar1` FOREIGN KEY (`ar_codigoid`) REFERENCES `ar` (`ar_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_postagem_fatura1` FOREIGN KEY (`fatu_codigoid`) REFERENCES `fatura` (`fatu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rangear`
--

DROP TABLE IF EXISTS `rangear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rangear` (
  `rangar_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `rangar_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rangar_inicio` varchar(10) NOT NULL,
  `rangar_fim` varchar(10) NOT NULL,
  `rangar_ativo` tinyint(1) NOT NULL,
  `rangear_serie` varchar(2) NOT NULL,
  PRIMARY KEY (`rangar_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `realtorio`
--

DROP TABLE IF EXISTS `realtorio`;
/*!50001 DROP VIEW IF EXISTS `realtorio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `realtorio` AS SELECT 
 1 AS `id`,
 1 AS `municipio`,
 1 AS `SIGLA`,
 1 AS `stat_nome`,
 1 AS `serv_codigoid`,
 1 AS `servicos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reativacao`
--

DROP TABLE IF EXISTS `reativacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reativacao` (
  `reat_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) DEFAULT NULL,
  `reat_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reat_datareativado` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reat_codigoid`),
  KEY `fk_reativacao_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_reativacao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recebimento`
--

DROP TABLE IF EXISTS `recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento` (
  `rece_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `fatu_codigoid` int(11) NOT NULL,
  `lotebanc_codigoid` int(11) DEFAULT NULL,
  `rece_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rece_valor` decimal(10,2) NOT NULL,
  `rece_valormulta` decimal(10,2) NOT NULL,
  `rece_valorjuros` decimal(10,2) NOT NULL,
  `rece_datarecebido` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`rece_codigoid`),
  KEY `fk_recebimento_fatura1_idx` (`fatu_codigoid`),
  KEY `fk_recebimento_lotebancario1_idx` (`lotebanc_codigoid`),
  CONSTRAINT `fk_recebimento_fatura1` FOREIGN KEY (`fatu_codigoid`) REFERENCES `fatura` (`fatu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recebimento_lotebancario1` FOREIGN KEY (`lotebanc_codigoid`) REFERENCES `lotebancario` (`lotebanc_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rescisao`
--

DROP TABLE IF EXISTS `rescisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rescisao` (
  `resc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `resc_datarecebimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resc_datainc` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`resc_codigoid`),
  KEY `fk_rescisao_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_rescisao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restricao`
--

DROP TABLE IF EXISTS `restricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restricao` (
  `rest_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `rest_contratardeterceiro` tinyint(1) NOT NULL,
  `rest_divulgaramarca` tinyint(1) NOT NULL,
  `rest_mudarmeiotransmicao` tinyint(1) NOT NULL,
  `rest_transferirdireitos` tinyint(1) NOT NULL,
  PRIMARY KEY (`rest_codigoid`),
  KEY `fk_restricao_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_restricao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20403 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scriptmedicao`
--

DROP TABLE IF EXISTS `scriptmedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scriptmedicao` (
  `scrimedi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `scrimedi_nome` varchar(255) NOT NULL,
  `scrimedi_descricao` varchar(255) NOT NULL,
  `scrimedi_path` varchar(255) NOT NULL,
  `scrimedi_tiporetorno` varchar(50) NOT NULL,
  PRIMARY KEY (`scrimedi_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `serv_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `grupserv_codigoid` int(11) NOT NULL,
  `serv_nome` varchar(255) NOT NULL,
  `serv_descricao` varchar(255) NOT NULL,
  `serv_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `serv_apelido` varchar(20) NOT NULL,
  `serv_dependente` tinyint(4) NOT NULL,
  `serv_ativo` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serv_codigoid`),
  KEY `fk_sevico_gruposervico1_idx` (`grupserv_codigoid`),
  CONSTRAINT `fk_sevico_gruposervico1` FOREIGN KEY (`grupserv_codigoid`) REFERENCES `gruposervico` (`grupserv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico_agregado`
--

DROP TABLE IF EXISTS `servico_agregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_agregado` (
  `servagre_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `servagre_nome` varchar(255) NOT NULL,
  `servagre_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `servagre_tipo` enum('SCM','SVA') NOT NULL,
  `servagre_apelido` varchar(100) NOT NULL,
  PRIMARY KEY (`servagre_codigoid`),
  KEY `servagre_tipo` (`servagre_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico_atributo`
--

DROP TABLE IF EXISTS `servico_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_atributo` (
  `id_servico_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `atri_codigoid` int(11) DEFAULT NULL,
  `serv_codigoid` int(11) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_servico_atributo`),
  KEY `fk_atributo_idx` (`atri_codigoid`),
  KEY `fk_servico_idx` (`serv_codigoid`),
  CONSTRAINT `fk_atributo` FOREIGN KEY (`atri_codigoid`) REFERENCES `atributo` (`atri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico_discriminacao`
--

DROP TABLE IF EXISTS `servico_discriminacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_discriminacao` (
  `servdisc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `serv_codigoid` int(11) NOT NULL,
  `id_discriminacao` int(11) NOT NULL,
  `servdisc_valorpadrao` decimal(5,2) NOT NULL,
  PRIMARY KEY (`servdisc_codigoid`),
  UNIQUE KEY `serv_codigoid_2` (`serv_codigoid`,`id_discriminacao`),
  KEY `serv_codigoid` (`serv_codigoid`),
  KEY `id_discriminacao` (`id_discriminacao`),
  CONSTRAINT `servico_discriminacao_ibfk_3` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `servico_discriminacao_ibfk_4` FOREIGN KEY (`id_discriminacao`) REFERENCES `discriminacao` (`id_discriminacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servico_servico_agregado`
--

DROP TABLE IF EXISTS `servico_servico_agregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_servico_agregado` (
  `serv_codigoid` int(11) NOT NULL,
  `servagre_codigoid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`serv_codigoid`,`servagre_codigoid`),
  UNIQUE KEY `serv_codigoid` (`serv_codigoid`,`servagre_codigoid`),
  KEY `servagre_codigoid` (`servagre_codigoid`),
  CONSTRAINT `servico_servico_agregado_ibfk_1` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `servico_servico_agregado_ibfk_2` FOREIGN KEY (`servagre_codigoid`) REFERENCES `servico_agregado` (`servagre_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicocapacidade`
--

DROP TABLE IF EXISTS `servicocapacidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicocapacidade` (
  `servcapa_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `scrimedi_codigoid` int(11) DEFAULT NULL,
  `serv_codigoid` int(11) NOT NULL,
  `capa_codigoid` int(11) NOT NULL,
  `medi_codigoid` int(11) NOT NULL,
  `servicapa_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `servcapa_visibilidade` tinyint(4) NOT NULL,
  PRIMARY KEY (`servcapa_codigoid`),
  KEY `fk_servicocapacidade_sevico1_idx` (`serv_codigoid`),
  KEY `fk_servicocapacidade_capacidade1_idx` (`capa_codigoid`),
  KEY `fk_servicocapacidade_medida1_idx` (`medi_codigoid`),
  KEY `fk_servicocapacidade_scriptmedicao1_idx` (`scrimedi_codigoid`),
  CONSTRAINT `fk_servicocapacidade_capacidade1` FOREIGN KEY (`capa_codigoid`) REFERENCES `capacidade` (`capa_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicocapacidade_medida1` FOREIGN KEY (`medi_codigoid`) REFERENCES `medida` (`medi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicocapacidade_scriptmedicao1` FOREIGN KEY (`scrimedi_codigoid`) REFERENCES `scriptmedicao` (`scrimedi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicocapacidade_sevico1` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9469 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviconatureza`
--

DROP TABLE IF EXISTS `serviconatureza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviconatureza` (
  `servnatu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `serv_codigoid` int(11) NOT NULL,
  `natu_codigoid` int(11) NOT NULL,
  `dadobanc_codigoid` int(11) NOT NULL,
  `servnatu_percentual` decimal(5,2) NOT NULL,
  `servnatu_baseicms` decimal(5,2) NOT NULL,
  `servnatu_cedente` tinyint(1) NOT NULL,
  PRIMARY KEY (`servnatu_codigoid`),
  KEY `fk_serviconatureza_servico1_idx` (`serv_codigoid`),
  KEY `fk_serviconatureza_natureza1_idx` (`natu_codigoid`),
  KEY `fk_serviconatureza_dadosbancarios1_idx` (`dadobanc_codigoid`),
  CONSTRAINT `fk_serviconatureza_dadosbancarios1` FOREIGN KEY (`dadobanc_codigoid`) REFERENCES `dadosbancarios` (`dadobanc_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_serviconatureza_natureza1` FOREIGN KEY (`natu_codigoid`) REFERENCES `natureza` (`natu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_serviconatureza_servico1` FOREIGN KEY (`serv_codigoid`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicos_wan_servico_agregado`
--

DROP TABLE IF EXISTS `servicos_wan_servico_agregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_wan_servico_agregado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servagre_codigoid` int(11) NOT NULL,
  `tpr_id_servico` varchar(255) NOT NULL,
  `data_inc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `servagre_codigoid` (`servagre_codigoid`),
  CONSTRAINT `servicos_wan_servico_agregado_ibfk_1` FOREIGN KEY (`servagre_codigoid`) REFERENCES `servico_agregado` (`servagre_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicos_wan_servicos_vogel`
--

DROP TABLE IF EXISTS `servicos_wan_servicos_vogel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_wan_servicos_vogel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servico_wan_id` int(11) DEFAULT NULL,
  `servico_vogel_id` int(11) NOT NULL,
  `data_hora_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tpr_id_servico` varchar(250) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servicos_wan_servicos_vogel_servico1_idx` (`servico_vogel_id`),
  CONSTRAINT `fk_servicos_wan_servicos_vogel_servico1` FOREIGN KEY (`servico_vogel_id`) REFERENCES `servico` (`serv_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sla`
--

DROP TABLE IF EXISTS `sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla` (
  `sla_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `sla_proximocodigoid` int(11) DEFAULT NULL,
  `sla_nome` varchar(255) NOT NULL,
  `sla_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sla_datafim` timestamp NULL DEFAULT NULL,
  `sla_disponibilidade` decimal(5,2) NOT NULL,
  PRIMARY KEY (`sla_codigoid`),
  KEY `fk_sla_sla1_idx` (`sla_proximocodigoid`),
  CONSTRAINT `fk_sla_sla1` FOREIGN KEY (`sla_proximocodigoid`) REFERENCES `sla` (`sla_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slanivel`
--

DROP TABLE IF EXISTS `slanivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slanivel` (
  `slanive_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `sla_codigoid` int(11) NOT NULL,
  `nive_codigoid` int(11) NOT NULL,
  `slanive_respostacomercial` int(11) NOT NULL,
  `slanive_resolucaocomercial` int(11) NOT NULL,
  `slanive_resolucaoextra` int(11) NOT NULL,
  `slanive_respostaextra` int(11) NOT NULL,
  PRIMARY KEY (`slanive_codigoid`),
  KEY `fk_slanivel_nivel1_idx` (`nive_codigoid`),
  KEY `fk_slanivel_sla1_idx` (`sla_codigoid`),
  CONSTRAINT `fk_slanivel_nivel1` FOREIGN KEY (`nive_codigoid`) REFERENCES `nivel` (`nive_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_slanivel_sla1` FOREIGN KEY (`sla_codigoid`) REFERENCES `sla` (`sla_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `stat_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `stat_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`stat_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suspencao`
--

DROP TABLE IF EXISTS `suspencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspencao` (
  `susp_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `usua_codigoid` int(11) DEFAULT NULL,
  `susp_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `susp_datasuspenso` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`susp_codigoid`),
  KEY `fk_suspencao_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_suspencao_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `textolegal`
--

DROP TABLE IF EXISTS `textolegal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textolegal` (
  `textlega_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) NOT NULL,
  `textlega_texto` text NOT NULL,
  PRIMARY KEY (`textlega_codigoid`),
  KEY `fk_textologal_contrato1_idx` (`cont_codigoid`),
  CONSTRAINT `fk_textologal_contrato1` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `tipodocu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipodocu_nome` varchar(255) NOT NULL,
  PRIMARY KEY (`tipodocu_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipologging`
--

DROP TABLE IF EXISTS `tipologging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipologging` (
  `tipologg_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipologg_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`tipologg_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_atributo`
--

DROP TABLE IF EXISTS `tmp_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_atributo` (
  `id_tmp_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tmp_ponta` int(11) NOT NULL,
  `coluna_csv` varchar(45) DEFAULT NULL,
  `valor` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id_tmp_atributo`),
  KEY `fk_tmp_atributo_tmp_ponta1_idx` (`id_tmp_ponta`),
  CONSTRAINT `fk_tmp_atributo_tmp_ponta1` FOREIGN KEY (`id_tmp_ponta`) REFERENCES `tmp_ponta` (`id_tmp_ponta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=142869 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_circuito`
--

DROP TABLE IF EXISTS `tmp_circuito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_circuito` (
  `id_tmp_circuito` int(11) NOT NULL AUTO_INCREMENT,
  `id_tmp_contrato` int(11) DEFAULT NULL,
  `cont_codigoid` int(11) DEFAULT NULL,
  `circuito` int(11) DEFAULT NULL,
  `id_circuito` int(11) DEFAULT NULL,
  `razao_social` varchar(90) DEFAULT NULL,
  `fantasia` varchar(90) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `ie` varchar(45) DEFAULT NULL,
  `im` varchar(45) DEFAULT NULL,
  `contribuinte_icms` varchar(45) DEFAULT NULL,
  `segmento_mercado` varchar(45) DEFAULT NULL,
  `ramo_atividade` varchar(45) DEFAULT NULL,
  `porte` varchar(45) DEFAULT NULL,
  `area_atuacao` varchar(45) DEFAULT NULL,
  `faturamento_anual` tinyint(1) DEFAULT NULL,
  `numero_funcionario` int(11) DEFAULT NULL,
  `gerente_conta` varchar(45) DEFAULT NULL,
  `canal_venda` varchar(45) DEFAULT NULL,
  `produto` varchar(45) DEFAULT NULL,
  `meio_acesso` varchar(45) DEFAULT NULL,
  `capacidade` varchar(45) DEFAULT NULL,
  `pedido` varchar(45) DEFAULT NULL,
  `data_pedido` datetime DEFAULT NULL,
  `cliente_final` varchar(45) DEFAULT NULL,
  `tipo_servico` varchar(45) DEFAULT NULL,
  `prazo_mes` varchar(45) DEFAULT NULL,
  `data_pervista_ativacao` datetime DEFAULT NULL,
  `sla_disponibilidade` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `motivo_alteracao` varchar(90) DEFAULT NULL,
  `equipamento_cliente` varchar(90) DEFAULT NULL,
  `historico` varchar(90) DEFAULT NULL,
  `data_inicial` datetime DEFAULT NULL,
  `data_ativacao` datetime DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  `data_ativacao_comercial` datetime DEFAULT NULL,
  `designacao` varchar(45) DEFAULT NULL,
  `valor_ativacao` decimal(10,2) DEFAULT NULL,
  `valor_sem_imposto` decimal(10,2) DEFAULT NULL,
  `valor_com_imposto` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tmp_circuito`),
  KEY `fk_tmp_circuito_tmp_contrato1_idx` (`id_tmp_contrato`),
  CONSTRAINT `fk_tmp_circuito_tmp_contrato1` FOREIGN KEY (`id_tmp_contrato`) REFERENCES `tmp_contrato` (`id_tmp_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6497 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_conta_criada`
--

DROP TABLE IF EXISTS `tmp_conta_criada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_conta_criada` (
  `id_tmp_conta_criada` int(11) NOT NULL AUTO_INCREMENT,
  `ramo_atividade` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `porte` varchar(45) DEFAULT NULL,
  `tipo_pessoa` varchar(45) DEFAULT NULL,
  `conta_criada` int(11) DEFAULT NULL,
  `gc` varchar(45) DEFAULT NULL,
  `canal_venda` varchar(45) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id_tmp_conta_criada`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_contrato`
--

DROP TABLE IF EXISTS `tmp_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_contrato` (
  `id_tmp_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `id_tmp_conta_criada` int(11) NOT NULL,
  `circuito` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `designacao` varchar(45) DEFAULT NULL,
  `canal_venda` varchar(45) DEFAULT NULL,
  `ativado` datetime DEFAULT NULL,
  `destivado` datetime DEFAULT NULL,
  `velocidade` varchar(45) DEFAULT NULL,
  `produto` varchar(45) DEFAULT NULL,
  `servico` varchar(45) DEFAULT NULL,
  `pedido` varchar(45) DEFAULT NULL,
  `valor_ativacao` decimal(10,2) DEFAULT NULL,
  `valor_sem_imposto` decimal(10,2) DEFAULT NULL,
  `valor_com_imposto` decimal(10,2) DEFAULT NULL,
  `leitura` tinyint(1) DEFAULT NULL,
  `erro` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tmp_contrato`),
  KEY `fk_tmp_contrato_tmp_conta_criada1_idx` (`id_tmp_conta_criada`),
  CONSTRAINT `fk_tmp_contrato_tmp_conta_criada1` FOREIGN KEY (`id_tmp_conta_criada`) REFERENCES `tmp_conta_criada` (`id_tmp_conta_criada`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5585 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_de_para`
--

DROP TABLE IF EXISTS `tmp_de_para`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_de_para` (
  `campo01` varchar(255) DEFAULT NULL,
  `campo02` varchar(255) DEFAULT NULL,
  `campo03` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_log_cliente`
--

DROP TABLE IF EXISTS `tmp_log_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_log_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `data_inc` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=938 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_log_contrato`
--

DROP TABLE IF EXISTS `tmp_log_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_log_contrato` (
  `id_log` int(10) NOT NULL AUTO_INCREMENT,
  `data_inc` datetime NOT NULL,
  `id_tmp_contrato` int(11) NOT NULL,
  `obs` varchar(255) NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `fk_tmp_log_contrato_idx` (`id_tmp_contrato`),
  CONSTRAINT `fk_tmp_log_contrato` FOREIGN KEY (`id_tmp_contrato`) REFERENCES `tmp_contrato` (`id_tmp_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_planilha`
--

DROP TABLE IF EXISTS `tmp_planilha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_planilha` (
  `campo01` varchar(255) DEFAULT NULL,
  `campo02` varchar(255) DEFAULT NULL,
  `campo03` varchar(255) DEFAULT NULL,
  `campo04` varchar(255) DEFAULT NULL,
  `campo05` varchar(255) DEFAULT NULL,
  `campo06` varchar(255) DEFAULT NULL,
  `campo07` varchar(255) DEFAULT NULL,
  `campo08` varchar(255) DEFAULT NULL,
  `campo09` varchar(255) DEFAULT NULL,
  `campo10` varchar(255) DEFAULT NULL,
  `campo11` varchar(255) DEFAULT NULL,
  `campo12` varchar(255) DEFAULT NULL,
  `campo13` varchar(255) DEFAULT NULL,
  `campo14` varchar(255) DEFAULT NULL,
  `campo15` varchar(255) DEFAULT NULL,
  `campo16` varchar(255) DEFAULT NULL,
  `campo17` varchar(255) DEFAULT NULL,
  `campo18` varchar(255) DEFAULT NULL,
  `campo19` varchar(255) DEFAULT NULL,
  `campo20` varchar(255) DEFAULT NULL,
  `campo21` varchar(255) DEFAULT NULL,
  `campo22` varchar(255) DEFAULT NULL,
  `campo23` varchar(255) DEFAULT NULL,
  `campo24` varchar(255) DEFAULT NULL,
  `campo25` varchar(255) DEFAULT NULL,
  `campo26` varchar(255) DEFAULT NULL,
  `campo27` varchar(255) DEFAULT NULL,
  `campo28` varchar(255) DEFAULT NULL,
  `campo29` varchar(255) DEFAULT NULL,
  `campo30` varchar(255) DEFAULT NULL,
  `campo31` varchar(255) DEFAULT NULL,
  `campo32` varchar(255) DEFAULT NULL,
  `campo33` varchar(255) DEFAULT NULL,
  `campo34` varchar(255) DEFAULT NULL,
  `campo35` varchar(255) DEFAULT NULL,
  `campo36` varchar(255) DEFAULT NULL,
  `campo37` varchar(255) DEFAULT NULL,
  `campo38` varchar(255) DEFAULT NULL,
  `campo39` varchar(255) DEFAULT NULL,
  `campo40` varchar(255) DEFAULT NULL,
  `campo41` varchar(255) DEFAULT NULL,
  `campo42` varchar(255) DEFAULT NULL,
  `campo43` varchar(255) DEFAULT NULL,
  `campo44` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_planilha_2`
--

DROP TABLE IF EXISTS `tmp_planilha_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_planilha_2` (
  `campo01` varchar(255) DEFAULT NULL,
  `campo02` varchar(255) DEFAULT NULL,
  `campo03` varchar(255) DEFAULT NULL,
  `campo04` varchar(255) DEFAULT NULL,
  `campo05` varchar(255) DEFAULT NULL,
  `campo06` varchar(255) DEFAULT NULL,
  `campo07` varchar(255) DEFAULT NULL,
  `campo08` varchar(255) DEFAULT NULL,
  `campo09` varchar(255) DEFAULT NULL,
  `campo10` varchar(255) DEFAULT NULL,
  `campo11` varchar(255) DEFAULT NULL,
  `campo12` varchar(255) DEFAULT NULL,
  `campo13` varchar(255) DEFAULT NULL,
  `campo14` varchar(255) DEFAULT NULL,
  `campo15` varchar(255) DEFAULT NULL,
  `campo16` varchar(255) DEFAULT NULL,
  `campo17` varchar(255) DEFAULT NULL,
  `campo18` varchar(255) DEFAULT NULL,
  `campo19` varchar(255) DEFAULT NULL,
  `campo20` varchar(255) DEFAULT NULL,
  `campo21` varchar(255) DEFAULT NULL,
  `campo22` varchar(255) DEFAULT NULL,
  `campo23` varchar(255) DEFAULT NULL,
  `campo24` varchar(255) DEFAULT NULL,
  `campo25` varchar(255) DEFAULT NULL,
  `campo26` varchar(255) DEFAULT NULL,
  `campo27` varchar(255) DEFAULT NULL,
  `campo28` varchar(255) DEFAULT NULL,
  `campo29` varchar(255) DEFAULT NULL,
  `campo30` varchar(255) DEFAULT NULL,
  `campo31` varchar(255) DEFAULT NULL,
  `campo32` varchar(255) DEFAULT NULL,
  `campo33` varchar(255) DEFAULT NULL,
  `campo34` varchar(255) DEFAULT NULL,
  `campo35` varchar(255) DEFAULT NULL,
  `campo36` varchar(255) DEFAULT NULL,
  `campo37` varchar(255) DEFAULT NULL,
  `campo38` varchar(255) DEFAULT NULL,
  `campo39` varchar(255) DEFAULT NULL,
  `campo40` varchar(255) DEFAULT NULL,
  `campo41` varchar(255) DEFAULT NULL,
  `campo42` varchar(255) DEFAULT NULL,
  `campo43` varchar(255) DEFAULT NULL,
  `campo44` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_planilha_contratos`
--

DROP TABLE IF EXISTS `tmp_planilha_contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_planilha_contratos` (
  `contrato` varchar(255) DEFAULT NULL,
  `circuito` varchar(255) DEFAULT NULL,
  `designacao` varchar(255) DEFAULT NULL,
  `task` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_planilha_contratos_2`
--

DROP TABLE IF EXISTS `tmp_planilha_contratos_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_planilha_contratos_2` (
  `contrato` varchar(255) DEFAULT NULL,
  `circuito` varchar(255) DEFAULT NULL,
  `designacao` varchar(255) DEFAULT NULL,
  `task` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_planilha_contratos_meios`
--

DROP TABLE IF EXISTS `tmp_planilha_contratos_meios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_planilha_contratos_meios` (
  `designacao` varchar(255) DEFAULT NULL,
  `meio_id` int(11) DEFAULT NULL,
  `meio_desc` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_planilha_contratos_meios_2`
--

DROP TABLE IF EXISTS `tmp_planilha_contratos_meios_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_planilha_contratos_meios_2` (
  `designacao` varchar(255) DEFAULT NULL,
  `meio_id` int(11) DEFAULT NULL,
  `meio_desc` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_ponta`
--

DROP TABLE IF EXISTS `tmp_ponta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_ponta` (
  `id_tmp_ponta` int(11) NOT NULL AUTO_INCREMENT,
  `id_tmp_circuito` int(11) NOT NULL,
  `ponta` varchar(45) DEFAULT NULL,
  `interface` varchar(45) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `id_pop` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tmp_ponta`),
  KEY `fk_tmp_ponta_tmp_circuito1_idx` (`id_tmp_circuito`),
  CONSTRAINT `fk_tmp_ponta_tmp_circuito1` FOREIGN KEY (`id_tmp_circuito`) REFERENCES `tmp_circuito` (`id_tmp_circuito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12989 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upgrade`
--

DROP TABLE IF EXISTS `upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade` (
  `upgr_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cont_codigoid` int(11) DEFAULT NULL,
  `endeentr_codigoid` int(11) NOT NULL,
  `upgr_proximocodigoid` int(11) DEFAULT NULL,
  `servcapa_codigoid` int(11) NOT NULL,
  `upgr_aposativacao` int(11) DEFAULT NULL,
  `upgr_datafixa` timestamp NULL DEFAULT NULL,
  `upgr_dataupgrade` timestamp NULL DEFAULT NULL,
  `upgr_datainc` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `upgr_usuario` int(11) DEFAULT NULL,
  `proposal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`upgr_codigoid`),
  KEY `fk_upgrade_upgrade1_idx` (`upgr_proximocodigoid`),
  KEY `fk_upgrade_servicocapacidade1_idx` (`servcapa_codigoid`),
  KEY `fk_upgrade_enderecoentrega1_idx` (`endeentr_codigoid`),
  KEY `fk_upgrade_contrato_idx` (`cont_codigoid`),
  CONSTRAINT `fk_upgrade_contrato` FOREIGN KEY (`cont_codigoid`) REFERENCES `contrato` (`cont_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_upgrade_servicocapacidade1` FOREIGN KEY (`servcapa_codigoid`) REFERENCES `servicocapacidade` (`servcapa_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_upgrade_upgrade1` FOREIGN KEY (`upgr_proximocodigoid`) REFERENCES `upgrade` (`upgr_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000204 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upgradevalor`
--

DROP TABLE IF EXISTS `upgradevalor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgradevalor` (
  `upgrvalo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `upgr_codigoid` int(11) NOT NULL,
  `moed_codigoid` int(11) NOT NULL,
  `natu_codigoid` int(11) NOT NULL,
  `peri_codigoid` int(11) NOT NULL,
  `upgrvalo_valor` decimal(10,2) NOT NULL,
  `upgr_valorsemdesconto` decimal(10,2) DEFAULT NULL,
  `upgr_valorsemimposto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`upgrvalo_codigoid`),
  KEY `fk_upgradevalor_upgrade1_idx` (`upgr_codigoid`),
  KEY `fk_upgradevalor_moeda1_idx` (`moed_codigoid`),
  KEY `fk_upgradevalor_natureza1_idx` (`natu_codigoid`),
  KEY `fk_upgradevalor_periodicidade1_idx` (`peri_codigoid`),
  CONSTRAINT `fk_upgradevalor_moeda1` FOREIGN KEY (`moed_codigoid`) REFERENCES `moeda` (`moed_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_upgradevalor_natureza1` FOREIGN KEY (`natu_codigoid`) REFERENCES `natureza` (`natu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_upgradevalor_periodicidade1` FOREIGN KEY (`peri_codigoid`) REFERENCES `periodicidade` (`peri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_upgradevalor_upgrade1` FOREIGN KEY (`upgr_codigoid`) REFERENCES `upgrade` (`upgr_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'financeiro'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `reset_hash_cad_users` */;
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
/*!50106 CREATE EVENT `reset_hash_cad_users` ON SCHEDULE EVERY 30 MINUTE STARTS '2016-01-25 08:08:06' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE gcdb.cad_users SET hash_acesso = NULL, hash_datainc = NULL WHERE (hash_datainc + INTERVAL 5 HOUR)< CURRENT_TIMESTAMP */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'financeiro'
--
/*!50003 DROP FUNCTION IF EXISTS `addModeloContrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `addModeloContrato`() RETURNS int(11)
BEGIN

declare modeCodigoid int default 0;
declare multCodigoid int default 0;
declare multAtraso int default 0;
declare multJuro int default 0;
declare multMora int default 0;
declare multDown int default 0;
declare multRecisao int default 0;
declare multDescPassado tinyint default 0;
declare multDescFuturo tinyint default 0;

declare slaCodigoid int default 0;
declare slaNome varchar(50) default '';
declare slaDisponibilidade decimal(5,2) default 0.00;

declare slaLeveRespo int default 0;
declare slaLeveResol int default 0;
declare slaLeveRespoExtra int default 0;
declare slaLeveResolExtra int default 0;

declare slaGraveRespo int default 0;
declare slaGraveResol int default 0;
declare slaGraveRespoExtra int default 0;
declare slaGraveResolExtra int default 0;

declare slaCriticoRespo int default 0;
declare slaCriticoResol int default 0;
declare slaCriticoRespoExtra int default 0;
declare slaCriticoResolExtra int default 0;

declare contCodigoid int default 0;
declare contLimiteatraso int default 0;
declare contMenorprazo tinyint default 0;
declare contPrazorescisao int default 0;
declare contIndicereajuste varchar(20) default 'IGPM';
declare contPrazoreajuste int default 0;
declare contIndisponibilidade int default 0;
declare unidCodigoid int default 1;

declare restContratarterceiro tinyint default 0;
declare restDivulgaramarca tinyint default 0;
declare restMudarmeiotransmicao tinyint default 0;
declare restTransferirdireitos tinyint default 0;

/*
SET multAtraso = 2;
SET multJuro = 1;
SET multMora = 2;
SET multDown = 0;
SET multRecisao = 0;
SET multDescPassado = 1;
SET multDescFuturo = 1;*/

SET slaNome = 'NPI - Avvio';
/*SET slaDisponibilidade = 99.9;

SET slaLeveRespo = 6;
SET slaLeveResol = 72;
SET slaLeveRespoExtra = 8;
SET slaLeveResolExtra = 72;

SET slaGraveRespo = 2;
SET slaGraveResol = 24;
SET slaGraveRespoExtra = 6;
SET slaGraveResolExtra = 24;

SET slaCriticoRespo = 1;
SET slaCriticoResol = 8;
SET slaCriticoRespoExtra = 6;
SET slaCriticoResolExtra = 6;

SET contLimiteatraso = 5; /*  em dias*/
/*SET contMenorprazo = 1;
SET contPrazorescisao = 30; /*  em dias*/
/*SET contIndicereajuste = 'IST';
SET contPrazoreajuste = 12;
SET contIndisponibilidade = 1;
SET unidCodigoid = 1; /* Para contratos Voice = 8989 | Demais contratos = 1  */
/*
SET restContratarterceiro = 1;
SET restDivulgaramarca = 0;
SET restMudarmeiotransmicao = 1;
SET restTransferirdireitos = 0;
*/

SELECT modelo.mode_codigoid INTO modeCodigoid FROM financeiro.modelo
INNER JOIN financeiro.contrato ON modelo.cont_codigoid=contrato.cont_codigoid
INNER JOIN financeiro.restricao ON contrato.cont_codigoid=restricao.cont_codigoid
INNER JOIN financeiro.multas USING(mult_codigoid)
INNER JOIN financeiro.sla USING(sla_codigoid)
WHERE restricao.rest_contratardeterceiro=restContratarterceiro
AND restricao.rest_divulgaramarca=restDivulgaramarca
AND restricao.rest_mudarmeiotransmicao=restMudarmeiotransmicao
AND restricao.rest_transferirdireitos=restTransferirdireitos
AND contrato.cont_limiteatraso=contLimiteatraso
AND contrato.cont_menorprazo=contMenorprazo
AND contrato.cont_prazorescisao=contPrazorescisao
AND contrato.cont_indicereajuste=contIndicereajuste
AND contrato.cont_prazoreajuste=contPrazoreajuste
AND contrato.unid_codigoid=unidCodigoid
AND sla.sla_nome=slaNome
AND sla.sla_disponibilidade=slaDisponibilidade
AND multas.mult_atraso=multAtraso
AND multas.mult_juro=multJuro
AND multas.mult_mora=multMora
AND multas.mult_downgrade=multDown
AND multas.mult_recisao=multRecisao
AND multas.mult_cobrardesconto=multDescPassado
AND multas.mult_cobrardescontofuturo=multDescFuturo
AND modelo.mode_nome=slaNome
AND modelo.mode_ativo=1
;


IF modeCodigoid>0 THEN

	RETURN modeCodigoid;

ELSE

	/* Busca multa existente */
	SELECT mult_codigoid INTO multCodigoid FROM financeiro.multas 
	WHERE mult_atraso=multAtraso 
	AND mult_juro=multJuro
	AND mult_mora=multMora
	AND mult_downgrade=multDown
	AND mult_recisao=multRecisao
	AND mult_cobrardesconto=multDescPassado
	AND mult_cobrardescontofuturo=multDescFuturo;


	/* Se não retornar nada, criar multa */
	IF multCodigoid < 1 THEN
		INSERT INTO financeiro.multas (
			mult_atraso,
			mult_juro,
			mult_mora,
			mult_downgrade,
			mult_recisao,
			mult_cobrardesconto,
			mult_cobrardescontofuturo
		)
		VALUES(
			multAtraso,
			multJuro,
			multMora,
			multDown,
			multRecisao,
			multDescPassado,
			multDescFuturo
		);
		SET multCodigoid = LAST_INSERT_ID();
	END IF;

	/* Criar o SLA */
	INSERT INTO financeiro.sla (
		sla_proximocodigoid,
		sla_nome,
		sla_datainc,
		sla_datafim,
		sla_disponibilidade
	)
	VALUES(
		NULL,
		slaNome,
		NOW(),
		NULL,
		slaDisponibilidade
	);

	SET slaCodigoid = LAST_INSERT_ID();

	/* SLA Nivel */
	/* LEVE */
	INSERT INTO financeiro.slanivel (
		sla_codigoid,
		nive_codigoid,
		slanive_respostacomercial,
		slanive_resolucaocomercial,
		slanive_resolucaoextra,
		slanive_respostaextra
	)
	VALUES(
		slaCodigoid,
		1,
		slaLeveRespo,
		slaLeveResol,
		slaLeveResolExtra,
		slaLeveRespoExtra
	);

	/* GRAVE */
	INSERT INTO financeiro.slanivel (
		sla_codigoid,
		nive_codigoid,
		slanive_respostacomercial,
		slanive_resolucaocomercial,
		slanive_resolucaoextra,
		slanive_respostaextra
	)
	VALUES(
		slaCodigoid,
		2,
		slaGraveRespo,
		slaGraveResol,
		slaGraveResolExtra,
		slaGraveRespoExtra
	);
	/* CRITICO */
	INSERT INTO financeiro.slanivel (
		sla_codigoid,
		nive_codigoid,
		slanive_respostacomercial,
		slanive_resolucaocomercial,
		slanive_resolucaoextra,
		slanive_respostaextra
	)
	VALUES(
		slaCodigoid,
		3,
		slaCriticoRespo,
		slaCriticoResol,
		slaCriticoResolExtra,
		slaCriticoRespoExtra
	);

	/* Criar o Contrato */
	INSERT INTO financeiro.contrato (
		sla_codigoid,
		stat_codigoid,
		mult_codigoid,
		cont_proximocodigoid,
		cont_paicodigoid,
		mode_codigoid,
		clie_codigoid,
		usua_codigoid,
		cont_numero,
		cont_limiteatraso,
		cont_menorprazo,
		cont_prazorescisao,
		cont_dataassinatura,
		cont_datainc,
		cont_indicereajuste,
		cont_prazoreajuste,
		cont_indisponibilidade,
		endeentr_codigoid,
		desig_codigoid,
		cont_dependentecodigoid,
		unid_codigoid,
		banc_codigoid,
		envi_codigoid
	)
	VALUES(
		slaCodigoid,
		1,
		multCodigoid,
		NULL,
		NULL,
		NULL,
		0,
		0,
		0,
		contLimiteatraso,
		contMenorprazo,
		contPrazorescisao,
		NULL,
		NOW(),
		contIndicereajuste,
		contPrazoreajuste,
		contIndisponibilidade,
		NULL,
		NULL,
		NULL,
		unidCodigoid,
		NULL,
		NULL
	);

	SET contCodigoid = LAST_INSERT_ID();

	/* Cria Restricoes do Contrato */
	INSERT INTO financeiro.restricao (
		cont_codigoid,
		rest_contratardeterceiro,
		rest_divulgaramarca,
		rest_mudarmeiotransmicao,
		rest_transferirdireitos
	)
	VALUES(
		contCodigoid,
		restContratarterceiro,
		restDivulgaramarca,
		restMudarmeiotransmicao,
		restTransferirdireitos
	);

	/* Criar o Modelo */
	INSERT INTO financeiro.modelo (
		cont_codigoid,
		mode_nome,
		mode_ativo,
		mode_datainc,
		mode_datafim
	)
	VALUES(
		contCodigoid,
		slaNome,
		1,
		NOW(),
		NULL
	);

	RETURN 1;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `dataReajusteContrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `dataReajusteContrato`(`CONTRATO` int) RETURNS date
BEGIN
	
return (SELECT contvalo_datainic
	          FROM contratovalor AS contval 
				 WHERE contval.cont_codigoid = CONTRATO
						  AND natu_codigoid = 4
		ORDER BY contval.contvalo_codigoid DESC LIMIT 0, 1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getContratoOriginal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getContratoOriginal`(  p_contrato Int ) RETURNS int(11)
BEGIN
RETURN (SELECT lv
   FROM
     (SELECT @pv:=
        (SELECT GROUP_CONCAT(CAST(cont_codigoid AS CHAR) SEPARATOR ',')
         FROM contrato
         WHERE cont_proximocodigoid IN (@pv)) AS lv
      FROM contrato
      JOIN
        (SELECT @pv:=p_contrato)tmp
      WHERE cont_proximocodigoid IN (@pv)) a);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.10.247` FUNCTION `SPLIT_STR`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN 
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `temProjeto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `temProjeto`(desig_codigoid INTEGER) RETURNS int(11)
BEGIN
	DECLARE temProjeto INTEGER;
	SELECT COUNT(proj.proj_codigoid) INTO temProjeto FROM luma.projeto proj WHERE proj.desig_codigoid = desig_codigoid AND pedistat_codigoid != 5;
RETURN temProjeto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_IGPDI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_IGPDI`(IN contDatareajustado TIMESTAMP, IN contDataassinatura TIMESTAMP, IN contvaloValor DECIMAL(10,2), IN prazo INT, IN contvaloCodigoid INT, IN contPai INT, IN moedCodigoid INT, IN natuCodigoid INT, IN contvaloValorsemdesconto DECIMAL(10,2), IN contvaloValorsemimposto DECIMAL(10,2), IN contvaloSVA DECIMAL(5,2), IN contvaloSCM DECIMAL(5,2))
BEGIN
	DECLARE percentual DECIMAL(5,2);
	DECLARE percentualNovo DECIMAL(5,2) DEFAULT 0.00;
	DECLARE novoValorId INT;

	IF contDatareajustado IS NULL THEN
		SELECT IFNULL(igpdi_percentual, 0.00) INTO percentualNovo FROM igpdi
			WHERE DATE_FORMAT(igpdi_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDataassinatura, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	ELSE
		SELECT IFNULL(igpdi_percentual, 0.00) INTO percentualNovo FROM igpdi
			WHERE DATE_FORMAT(igpdi_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDatareajustado, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	END IF;
	IF percentualNovo > 0.00 THEN
		INSERT INTO contratovalor 
		(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
		VALUES
		(NULL, NULL, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValor+(contvaloValor*(percentualNovo/100.00))), (contvaloValorsemdesconto+(contvaloValorsemdesconto*(percentualNovo/100.00))), (contvaloValorsemimposto+(contvaloValorsemimposto*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

		SET novoValorId = LAST_INSERT_ID();

		UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
								 contvalo_proximocodigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE periodicidade SET contvalo_codigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE contrato SET cont_datareajustado = CURRENT_TIMESTAMP
		WHERE cont_codigoid = contPai;

		SET contvaloValor = 0.00;
		BLOCK3: BEGIN

			DECLARE doneFilho INT DEFAULT FALSE;
			DECLARE contvaloCodigoidFilho, contCodigoidFilho INT;
			DECLARE contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho DECIMAL(10,2);
			DECLARE curFilho CURSOR FOR
				SELECT cont.cont_codigoid,
					   contvalo.contvalo_codigoid,
					   contvalo.contvalo_valor,
					   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
					   IFNULL(contvalo.contvalo_valorsemimposto, 0.00)
				FROM contrato AS cont
				INNER JOIN contratovalor AS contvalo
					ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
						AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
				WHERE cont.cont_paicodigoid = contPai AND cont.stat_codigoid IN (1,2,3,12);

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET doneFilho = 1;
			OPEN curFilho;
				LOOP_CONTRATO_FILHO: LOOP
					FETCH curFilho INTO contCodigoidFilho, contvaloCodigoidFilho, contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho;
					IF doneFilho THEN
					  LEAVE LOOP_CONTRATO_FILHO;
					END IF;

					INSERT INTO contratovalor 
					(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
					VALUES
					(NULL, NULL, contvaloCodigoidFilho, contCodigoidFilho, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))), (contvaloValorsemdescontoFilho+(contvaloValorsemdescontoFilho*(percentualNovo/100.00))), (contvaloValorsemimpostoFilho+(contvaloValorsemimpostoFilho*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

					UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
											 contvalo_proximocodigoid = LAST_INSERT_ID()
					WHERE contvalo_codigoid = contvaloCodigoidFilho;
					SET contvaloValor = (contvaloValor+(contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))));
				END LOOP LOOP_CONTRATO_FILHO;
			CLOSE curFilho;
		END BLOCK3;
		IF contvaloValor > 0.00 THEN
			UPDATE contratovalor SET contvalo_valor = contvaloValor
			WHERE contvalo_codigoid = novoValorId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_IGPM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_IGPM`(IN contDatareajustado TIMESTAMP, IN contDataassinatura TIMESTAMP, IN contvaloValor DECIMAL(10,2), IN prazo INT, IN contvaloCodigoid INT, IN contPai INT, IN moedCodigoid INT, IN natuCodigoid INT, IN contvaloValorsemdesconto DECIMAL(10,2), IN contvaloValorsemimposto DECIMAL(10,2), IN contvaloSVA DECIMAL(5,2), IN contvaloSCM DECIMAL(5,2))
BEGIN
	DECLARE percentual DECIMAL(5,2);
	DECLARE percentualNovo DECIMAL(5,2) DEFAULT 0.00;
	DECLARE novoValorId INT;

	IF contDatareajustado IS NULL THEN
		SELECT IFNULL(igpm_percentual, 0.00) INTO percentualNovo FROM igpm
			WHERE DATE_FORMAT(igpm_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDataassinatura, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	ELSE
		SELECT IFNULL(igpm_percentual, 0.00) INTO percentualNovo FROM igpm
			WHERE DATE_FORMAT(igpm_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDatareajustado, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	END IF;
	IF percentualNovo > 0.00 THEN
		INSERT INTO contratovalor 
		(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
		VALUES
		(NULL, NULL, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValor+(contvaloValor*(percentualNovo/100.00))), (contvaloValorsemdesconto+(contvaloValorsemdesconto*(percentualNovo/100.00))), (contvaloValorsemimposto+(contvaloValorsemimposto*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

		SET novoValorId = LAST_INSERT_ID();

		UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
								 contvalo_proximocodigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE periodicidade SET contvalo_codigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE contrato SET cont_datareajustado = CURRENT_TIMESTAMP
		WHERE cont_codigoid = contPai;

		SET contvaloValor = 0.00;
		BLOCK3: BEGIN

			DECLARE doneFilho INT DEFAULT FALSE;
			DECLARE contvaloCodigoidFilho, contCodigoidFilho INT;
			DECLARE contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho DECIMAL(10,2);
			DECLARE curFilho CURSOR FOR
				SELECT cont.cont_codigoid,
					   contvalo.contvalo_codigoid,
					   contvalo.contvalo_valor,
					   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
					   IFNULL(contvalo.contvalo_valorsemimposto, 0.00)
				FROM contrato AS cont
				INNER JOIN contratovalor AS contvalo
					ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
						AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
				WHERE cont.cont_paicodigoid = contPai AND cont.stat_codigoid IN (1,2,3,12);

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET doneFilho = 1;
			OPEN curFilho;
				LOOP_CONTRATO_FILHO: LOOP
					FETCH curFilho INTO contCodigoidFilho, contvaloCodigoidFilho, contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho;
					IF doneFilho THEN
					  LEAVE LOOP_CONTRATO_FILHO;
					END IF;

					INSERT INTO contratovalor 
					(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
					VALUES
					(NULL, NULL, contvaloCodigoidFilho, contCodigoidFilho, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))), (contvaloValorsemdescontoFilho+(contvaloValorsemdescontoFilho*(percentualNovo/100.00))), (contvaloValorsemimpostoFilho+(contvaloValorsemimpostoFilho*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

					UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
											 contvalo_proximocodigoid = LAST_INSERT_ID()
					WHERE contvalo_codigoid = contvaloCodigoidFilho;
					SET contvaloValor = (contvaloValor+(contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))));
				END LOOP LOOP_CONTRATO_FILHO;
			CLOSE curFilho;
		END BLOCK3;
		IF contvaloValor > 0.00 THEN
			UPDATE contratovalor SET contvalo_valor = contvaloValor
			WHERE contvalo_codigoid = novoValorId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_INDICE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_INDICE`()
BEGIN

	DECLARE done INT DEFAULT FALSE;
	DECLARE contPai, contvaloCodigoid, indiCodigoid, moedCodigoid, natuCodigoid, prazo, novoValorId INT;
	DECLARE percentual DECIMAL(5,2);
	DECLARE contvaloValor, contvaloValorsemdesconto, contvaloValorsemimposto DECIMAL(10,2);
	DECLARE contvaloSVA, contvaloSCM DECIMAL(5,2);
	DECLARE indice VARCHAR(45);
	DECLARE contvaloDatainc, contDataassinatura, contDatareajustado TIMESTAMP;

	DECLARE cur1 CURSOR FOR
		SELECT cont.cont_codigoid,
			   cont.cont_indicereajuste,
			   cont.cont_prazoreajuste,
			   cont.cont_dataassinatura,
			   cont.cont_datareajustado,
			   contvalo.contvalo_codigoid,
			   contvalo.contvalo_valor,
			   contvalo.moed_codigoid,
			   contvalo.natu_codigoid,
			   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
			   IFNULL(contvalo.contvalo_valorsemimposto, 0.00),
			   IFNULL(contvalo.contvalo_SVA, 0.00),
			   IFNULL(contvalo.contvalo_SCM, 0.00),
			   contvalo.contvalo_datainic
		FROM contrato AS cont
	INNER JOIN contratovalor AS contvalo
		ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
			AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
	INNER JOIN ativacao AS ativ
		ON ( ativ.cont_codigoid = cont.cont_codigoid AND ativ.ativ_dataativado IS NOT NULL )
-- 	WHERE cont.cont_paicodigoid IS NULL AND cont.stat_codigoid IN (1,2,3,12)
-- 	AND TIMESTAMPDIFF(MONTH, cont.cont_dataassinatura, CURRENT_TIMESTAMP) >= 12 AND contvalo.contvalo_codigoid = 14055;

	WHERE cont.cont_paicodigoid IS NULL AND cont.stat_codigoid IN (1,2,3,12)
	AND TIMESTAMPDIFF(MONTH, cont.cont_dataassinatura, CURRENT_TIMESTAMP) >= (IFNULL(cont.cont_prazoreajuste, IF(cont.cont_prazoreajuste = 0, 12, cont.cont_prazoreajuste)))
	AND (cont.cont_datareajustado IS NULL OR (TIMESTAMPDIFF(MONTH, cont.cont_datareajustado, CURRENT_TIMESTAMP) >= cont.cont_prazoreajuste));

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN cur1;

		LOOP_CONTRATO: LOOP
			FETCH cur1 INTO contPai, indice, prazo, contDataassinatura, contDatareajustado, contvaloCodigoid, contvaloValor, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM, contvaloDatainc;
			IF done THEN
			  LEAVE LOOP_CONTRATO;
			END IF;

	 		BLOCK2: BEGIN
				IF UPPER(indice) = 'IGPM' THEN
					CALL ATUALIZA_IGPM(contDatareajustado, contDataassinatura, contvaloValor, prazo, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM);
				ELSEIF UPPER(indice) = 'INPC' THEN
					CALL ATUALIZA_INPC(contDatareajustado, contDataassinatura, contvaloValor, prazo, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM);
				ELSEIF UPPER(indice) = 'IST' THEN
					CALL ATUALIZA_IST(contDatareajustado, contDataassinatura, contvaloValor, prazo, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM);
				ELSEIF UPPER(indice) = 'IPC-IEPE' THEN
					CALL ATUALIZA_IPCIEPE(contDatareajustado, contDataassinatura, contvaloValor, prazo, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM);
				ELSEIF UPPER(indice) = 'IGP-DI' THEN
					CALL ATUALIZA_IGPDI(contDatareajustado, contDataassinatura, contvaloValor, prazo, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM);
				ELSEIF UPPER(indice) = 'IPCA/IBGE' THEN
					CALL ATUALIZA_IPCAIBGE(contDatareajustado, contDataassinatura, contvaloValor, prazo, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, contvaloValorsemdesconto, contvaloValorsemimposto, contvaloSVA, contvaloSCM);
			 	END IF;
 			END BLOCK2;

		END LOOP LOOP_CONTRATO;

	CLOSE cur1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_INPC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_INPC`(IN contDatareajustado TIMESTAMP, IN contDataassinatura TIMESTAMP, IN contvaloValor DECIMAL(10,2), IN prazo INT, IN contvaloCodigoid INT, IN contPai INT, IN moedCodigoid INT, IN natuCodigoid INT, IN contvaloValorsemdesconto DECIMAL(10,2), IN contvaloValorsemimposto DECIMAL(10,2), IN contvaloSVA DECIMAL(5,2), IN contvaloSCM DECIMAL(5,2))
BEGIN
	DECLARE percentual DECIMAL(5,2);
	DECLARE percentualNovo DECIMAL(5,2) DEFAULT 0.00;
	DECLARE novoValorId INT;

	IF contDatareajustado IS NULL THEN
		SELECT IFNULL(inpc_percentual, 0.00) INTO percentualNovo FROM inpc
			WHERE DATE_FORMAT(inpc_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDataassinatura, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	ELSE
		SELECT IFNULL(inpc_percentual, 0.00) INTO percentualNovo FROM inpc
			WHERE DATE_FORMAT(inpc_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDatareajustado, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	END IF;
	IF percentualNovo > 0.00 THEN
		INSERT INTO contratovalor 
		(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
		VALUES
		(NULL, NULL, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValor+(contvaloValor*(percentualNovo/100.00))), (contvaloValorsemdesconto+(contvaloValorsemdesconto*(percentualNovo/100.00))), (contvaloValorsemimposto+(contvaloValorsemimposto*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

		SET novoValorId = LAST_INSERT_ID();

		UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
								 contvalo_proximocodigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE periodicidade SET contvalo_codigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE contrato SET cont_datareajustado = CURRENT_TIMESTAMP
		WHERE cont_codigoid = contPai;

		SET contvaloValor = 0.00;
		BLOCK3: BEGIN

			DECLARE doneFilho INT DEFAULT FALSE;
			DECLARE contvaloCodigoidFilho, contCodigoidFilho INT;
			DECLARE contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho DECIMAL(10,2);
			DECLARE curFilho CURSOR FOR
				SELECT cont.cont_codigoid,
					   contvalo.contvalo_codigoid,
					   contvalo.contvalo_valor,
					   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
					   IFNULL(contvalo.contvalo_valorsemimposto, 0.00)
				FROM contrato AS cont
				INNER JOIN contratovalor AS contvalo
					ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
						AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
				WHERE cont.cont_paicodigoid = contPai AND cont.stat_codigoid IN (1,2,3,12);

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET doneFilho = 1;
			OPEN curFilho;
				LOOP_CONTRATO_FILHO: LOOP
					FETCH curFilho INTO contCodigoidFilho, contvaloCodigoidFilho, contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho;
					IF doneFilho THEN
					  LEAVE LOOP_CONTRATO_FILHO;
					END IF;

					INSERT INTO contratovalor 
					(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
					VALUES
					(NULL, NULL, contvaloCodigoidFilho, contCodigoidFilho, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))), (contvaloValorsemdescontoFilho+(contvaloValorsemdescontoFilho*(percentualNovo/100.00))), (contvaloValorsemimpostoFilho+(contvaloValorsemimpostoFilho*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

					UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
											 contvalo_proximocodigoid = LAST_INSERT_ID()
					WHERE contvalo_codigoid = contvaloCodigoidFilho;
					SET contvaloValor = (contvaloValor+(contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))));
				END LOOP LOOP_CONTRATO_FILHO;
			CLOSE curFilho;
		END BLOCK3;
		IF contvaloValor > 0.00 THEN
			UPDATE contratovalor SET contvalo_valor = contvaloValor
			WHERE contvalo_codigoid = novoValorId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_IPCAIBGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_IPCAIBGE`(IN contDatareajustado TIMESTAMP, IN contDataassinatura TIMESTAMP, IN contvaloValor DECIMAL(10,2), IN prazo INT, IN contvaloCodigoid INT, IN contPai INT, IN moedCodigoid INT, IN natuCodigoid INT, IN contvaloValorsemdesconto DECIMAL(10,2), IN contvaloValorsemimposto DECIMAL(10,2), IN contvaloSVA DECIMAL(5,2), IN contvaloSCM DECIMAL(5,2))
BEGIN
	DECLARE percentual DECIMAL(5,2);
	DECLARE percentualNovo DECIMAL(5,2) DEFAULT 0.00;
	DECLARE novoValorId INT;

	IF contDatareajustado IS NULL THEN
		SELECT IFNULL(ipcaibge_percentual, 0.00) INTO percentualNovo FROM ipcaibge
			WHERE DATE_FORMAT(ipcaibge_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDataassinatura, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	ELSE
		SELECT IFNULL(ipcaibge_percentual, 0.00) INTO percentualNovo FROM ipcaibge
			WHERE DATE_FORMAT(ipcaibge_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDatareajustado, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	END IF;
	IF percentualNovo > 0.00 THEN
		INSERT INTO contratovalor 
		(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
		VALUES
		(NULL, NULL, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValor+(contvaloValor*(percentualNovo/100.00))), (contvaloValorsemdesconto+(contvaloValorsemdesconto*(percentualNovo/100.00))), (contvaloValorsemimposto+(contvaloValorsemimposto*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

		SET novoValorId = LAST_INSERT_ID();

		UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
								 contvalo_proximocodigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE periodicidade SET contvalo_codigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE contrato SET cont_datareajustado = CURRENT_TIMESTAMP
		WHERE cont_codigoid = contPai;

		SET contvaloValor = 0.00;
		BLOCK3: BEGIN

			DECLARE doneFilho INT DEFAULT FALSE;
			DECLARE contvaloCodigoidFilho, contCodigoidFilho INT;
			DECLARE contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho DECIMAL(10,2);
			DECLARE curFilho CURSOR FOR
				SELECT cont.cont_codigoid,
					   contvalo.contvalo_codigoid,
					   contvalo.contvalo_valor,
					   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
					   IFNULL(contvalo.contvalo_valorsemimposto, 0.00)
				FROM contrato AS cont
				INNER JOIN contratovalor AS contvalo
					ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
						AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
				WHERE cont.cont_paicodigoid = contPai AND cont.stat_codigoid IN (1,2,3,12);

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET doneFilho = 1;
			OPEN curFilho;
				LOOP_CONTRATO_FILHO: LOOP
					FETCH curFilho INTO contCodigoidFilho, contvaloCodigoidFilho, contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho;
					IF doneFilho THEN
					  LEAVE LOOP_CONTRATO_FILHO;
					END IF;

					INSERT INTO contratovalor 
					(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
					VALUES
					(NULL, NULL, contvaloCodigoidFilho, contCodigoidFilho, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))), (contvaloValorsemdescontoFilho+(contvaloValorsemdescontoFilho*(percentualNovo/100.00))), (contvaloValorsemimpostoFilho+(contvaloValorsemimpostoFilho*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

					UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
											 contvalo_proximocodigoid = LAST_INSERT_ID()
					WHERE contvalo_codigoid = contvaloCodigoidFilho;
					SET contvaloValor = (contvaloValor+(contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))));
				END LOOP LOOP_CONTRATO_FILHO;
			CLOSE curFilho;
		END BLOCK3;
		IF contvaloValor > 0.00 THEN
			UPDATE contratovalor SET contvalo_valor = contvaloValor
			WHERE contvalo_codigoid = novoValorId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_IPCIEPE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_IPCIEPE`(IN contDatareajustado TIMESTAMP, IN contDataassinatura TIMESTAMP, IN contvaloValor DECIMAL(10,2), IN prazo INT, IN contvaloCodigoid INT, IN contPai INT, IN moedCodigoid INT, IN natuCodigoid INT, IN contvaloValorsemdesconto DECIMAL(10,2), IN contvaloValorsemimposto DECIMAL(10,2), IN contvaloSVA DECIMAL(5,2), IN contvaloSCM DECIMAL(5,2))
BEGIN
	DECLARE percentual DECIMAL(5,2);
	DECLARE percentualNovo DECIMAL(5,2) DEFAULT 0.00;
	DECLARE novoValorId INT;

	IF contDatareajustado IS NULL THEN
		SELECT IFNULL(ipciepe_percentual, 0.00) INTO percentualNovo FROM ipciepe
			WHERE DATE_FORMAT(ipciepe_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDataassinatura, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	ELSE
		SELECT IFNULL(ipciepe_percentual, 0.00) INTO percentualNovo FROM ipciepe
			WHERE DATE_FORMAT(ipciepe_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDatareajustado, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	END IF;
	IF percentualNovo > 0.00 THEN
		INSERT INTO contratovalor 
		(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
		VALUES
		(NULL, NULL, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValor+(contvaloValor*(percentualNovo/100.00))), (contvaloValorsemdesconto+(contvaloValorsemdesconto*(percentualNovo/100.00))), (contvaloValorsemimposto+(contvaloValorsemimposto*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

		SET novoValorId = LAST_INSERT_ID();

		UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
								 contvalo_proximocodigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE periodicidade SET contvalo_codigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE contrato SET cont_datareajustado = CURRENT_TIMESTAMP
		WHERE cont_codigoid = contPai;

		SET contvaloValor = 0.00;
		BLOCK3: BEGIN

			DECLARE doneFilho INT DEFAULT FALSE;
			DECLARE contvaloCodigoidFilho, contCodigoidFilho INT;
			DECLARE contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho DECIMAL(10,2);
			DECLARE curFilho CURSOR FOR
				SELECT cont.cont_codigoid,
					   contvalo.contvalo_codigoid,
					   contvalo.contvalo_valor,
					   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
					   IFNULL(contvalo.contvalo_valorsemimposto, 0.00)
				FROM contrato AS cont
				INNER JOIN contratovalor AS contvalo
					ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
						AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
				WHERE cont.cont_paicodigoid = contPai AND cont.stat_codigoid IN (1,2,3,12);

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET doneFilho = 1;
			OPEN curFilho;
				LOOP_CONTRATO_FILHO: LOOP
					FETCH curFilho INTO contCodigoidFilho, contvaloCodigoidFilho, contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho;
					IF doneFilho THEN
					  LEAVE LOOP_CONTRATO_FILHO;
					END IF;

					INSERT INTO contratovalor 
					(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
					VALUES
					(NULL, NULL, contvaloCodigoidFilho, contCodigoidFilho, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))), (contvaloValorsemdescontoFilho+(contvaloValorsemdescontoFilho*(percentualNovo/100.00))), (contvaloValorsemimpostoFilho+(contvaloValorsemimpostoFilho*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

					UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
											 contvalo_proximocodigoid = LAST_INSERT_ID()
					WHERE contvalo_codigoid = contvaloCodigoidFilho;
					SET contvaloValor = (contvaloValor+(contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))));
				END LOOP LOOP_CONTRATO_FILHO;
			CLOSE curFilho;
		END BLOCK3;
		IF contvaloValor > 0.00 THEN
			UPDATE contratovalor SET contvalo_valor = contvaloValor
			WHERE contvalo_codigoid = novoValorId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ATUALIZA_IST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ATUALIZA_IST`(IN contDatareajustado TIMESTAMP, IN contDataassinatura TIMESTAMP, IN contvaloValor DECIMAL(10,2), IN prazo INT, IN contvaloCodigoid INT, IN contPai INT, IN moedCodigoid INT, IN natuCodigoid INT, IN contvaloValorsemdesconto DECIMAL(10,2), IN contvaloValorsemimposto DECIMAL(10,2), IN contvaloSVA DECIMAL(5,2), IN contvaloSCM DECIMAL(5,2))
BEGIN
	DECLARE percentual DECIMAL(5,2);
	DECLARE percentualNovo DECIMAL(5,2) DEFAULT 0.00;
	DECLARE novoValorId INT;

	IF contDatareajustado IS NULL THEN
		SELECT IFNULL(ist_percentual, 0.00) INTO percentualNovo FROM ist
			WHERE DATE_FORMAT(ist_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDataassinatura, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	ELSE
		SELECT IFNULL(ist_percentual, 0.00) INTO percentualNovo FROM ist
			WHERE DATE_FORMAT(ist_prazo, '%Y-%m-01') = DATE_FORMAT(DATE_ADD(contDatareajustado, INTERVAL prazo MONTH), '%Y-%m-01') LIMIT 1;
	END IF;
	IF percentualNovo > 0.00 THEN
		INSERT INTO contratovalor 
		(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
		VALUES
		(NULL, NULL, contvaloCodigoid, contPai, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValor+(contvaloValor*(percentualNovo/100.00))), (contvaloValorsemdesconto+(contvaloValorsemdesconto*(percentualNovo/100.00))), (contvaloValorsemimposto+(contvaloValorsemimposto*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

		SET novoValorId = LAST_INSERT_ID();

		UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
								 contvalo_proximocodigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE periodicidade SET contvalo_codigoid = novoValorId
		WHERE contvalo_codigoid = contvaloCodigoid;

		UPDATE contrato SET cont_datareajustado = CURRENT_TIMESTAMP
		WHERE cont_codigoid = contPai;

		SET contvaloValor = 0.00;
		BLOCK3: BEGIN

			DECLARE doneFilho INT DEFAULT FALSE;
			DECLARE contvaloCodigoidFilho, contCodigoidFilho INT;
			DECLARE contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho DECIMAL(10,2);
			DECLARE curFilho CURSOR FOR
				SELECT cont.cont_codigoid,
					   contvalo.contvalo_codigoid,
					   contvalo.contvalo_valor,
					   IFNULL(contvalo.contvalo_valorsemdesconto, 0.00),
					   IFNULL(contvalo.contvalo_valorsemimposto, 0.00)
				FROM contrato AS cont
				INNER JOIN contratovalor AS contvalo
					ON ( contvalo.cont_codigoid = cont.cont_codigoid AND contvalo.contvalo_proximocodigoid IS NULL
						AND contvalo.contvalo_datafim IS NULL AND contvalo.natu_codigoid = 4 )
				WHERE cont.cont_paicodigoid = contPai AND cont.stat_codigoid IN (1,2,3,12);

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET doneFilho = 1;
			OPEN curFilho;
				LOOP_CONTRATO_FILHO: LOOP
					FETCH curFilho INTO contCodigoidFilho, contvaloCodigoidFilho, contvaloValorFilho, contvaloValorsemdescontoFilho, contvaloValorsemimpostoFilho;
					IF doneFilho THEN
					  LEAVE LOOP_CONTRATO_FILHO;
					END IF;

					INSERT INTO contratovalor 
					(contvalo_codigoid, contvalo_proximocodigoid, contvalo_anteriorcodigoid, cont_codigoid, moed_codigoid, natu_codigoid, contvalo_datainic, contvalo_datafim, contvalo_valor, contvalo_valorsemdesconto, contvalo_valorsemimposto, contvalo_SVA, contvalo_SCM)
					VALUES
					(NULL, NULL, contvaloCodigoidFilho, contCodigoidFilho, moedCodigoid, natuCodigoid, CURRENT_TIMESTAMP, NULL, (contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))), (contvaloValorsemdescontoFilho+(contvaloValorsemdescontoFilho*(percentualNovo/100.00))), (contvaloValorsemimpostoFilho+(contvaloValorsemimpostoFilho*(percentualNovo/100.00))), contvaloSVA, contvaloSCM);

					UPDATE contratovalor SET contvalo_datafim = CURRENT_TIMESTAMP,
											 contvalo_proximocodigoid = LAST_INSERT_ID()
					WHERE contvalo_codigoid = contvaloCodigoidFilho;
					SET contvaloValor = (contvaloValor+(contvaloValorFilho+(contvaloValorFilho*(percentualNovo/100.00))));
				END LOOP LOOP_CONTRATO_FILHO;
			CLOSE curFilho;
		END BLOCK3;
		IF contvaloValor > 0.00 THEN
			UPDATE contratovalor SET contvalo_valor = contvaloValor
			WHERE contvalo_codigoid = novoValorId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LIST_CONTRATO_MENSALIDADE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LIST_CONTRATO_MENSALIDADE`(IN data_base DATE)
BEGIN

	DECLARE dataVencimento DATE DEFAULT data_base;
	DECLARE ultimoDia INT DEFAULT DAY(LAST_DAY(dataVencimento));

SELECT DISTINCT cont.cont_codigoid,
	cont.clie_codigoid,
	filhos.cont_codigoid AS FILHO_ID,
	ativ.ativ_dataativado,
	ativfilhos.ativ_dataativado AS FILHO_ATIVACAO,
	contvalo.contvalo_valor,
	contvalofilho.contvalo_codigoid,
	contvalofilho.contvalo_valor AS FILHO_VALOR,
	natu.natu_codigoid,
	natu.natu_descricao,
	natufilho.natu_codigoid AS FILHO_NATUREZA_ID,
	natufilho.natu_descricao AS FILHO_NATUREZA,
	disc.descricao,
	contvalodisc.valor,
	contvalodiscfilho.valor AS valorFilho,
	discfilho.descricao AS FILHO_DESCRICAO,
	peri.peri_vencimento,
	ultimoDia,
	STR_TO_DATE(CONCAT(DATE_FORMAT(dataVencimento, '%Y-%m'), '-', IF(peri.peri_vencimento > ultimoDia, ultimoDia, peri.peri_vencimento)), '%Y-%m-%d') AS vencimento,
	dataVencimento,
	users.cnpj,
	grupserv.grupserv_codigoid,
	grupserv.grupserv_nome,
	serv.serv_nome,
	serv.serv_codigoid,

  custumer.tributaicms,
  custumer.delin
FROM contrato AS cont
	INNER JOIN contrato AS filhos ON (filhos.cont_paicodigoid = cont.cont_codigoid AND filhos.stat_codigoid = 1)

	LEFT JOIN luma.unidade AS unid ON (unid.unid_codigoid = cont.unid_codigoid)


	LEFT JOIN gcdb.Customers2users AS custuser ON (custuser.id_customers = unid.unid_stechcodigoid)

	LEFT JOIN gcdb.Customers AS custumer ON (custumer.CustomerID = custuser.id_customers)
	LEFT JOIN gcdb.cad_users AS users ON (users.id = custuser.id_users)

	INNER JOIN contratoservico AS contserv ON (contserv.cont_codigoid = cont.cont_codigoid)
	INNER JOIN servicocapacidade AS servcapa ON (servcapa.servcapa_codigoid = contserv.servcapa_codigoid)
	INNER JOIN servico AS serv ON (serv.serv_codigoid = servcapa.serv_codigoid)
	INNER JOIN capacidade AS capa ON (capa.capa_codigoid = servcapa.capa_codigoid)
	INNER JOIN gruposervico AS grupserv ON (grupserv.grupserv_codigoid = serv.grupserv_codigoid AND grupserv.grupserv_codigoid != 4)

	LEFT JOIN ativacao AS ativ ON (ativ.cont_codigoid = cont.cont_codigoid)
	LEFT JOIN ativacao AS ativfilhos ON (ativfilhos.cont_codigoid = filhos.cont_codigoid)

	INNER JOIN contratovalor AS contvalo ON (contvalo.cont_codigoid = cont.cont_codigoid)
	INNER JOIN contratovalor AS contvalofilho ON (contvalofilho.cont_codigoid = filhos.cont_codigoid AND contvalofilho.contvalo_datafim IS NULL AND contvalofilho.contvalo_valor > 0.00)

	LEFT JOIN periodicidade AS peri ON (peri.contvalo_codigoid = contvalo.contvalo_codigoid)

	LEFT JOIN contratovalor_discriminacao AS contvalodisc ON (contvalodisc.contvalo_codigoid = contvalo.contvalo_codigoid)
	LEFT JOIN contratovalor_discriminacao AS contvalodiscfilho ON (contvalodiscfilho.contvalo_codigoid = contvalofilho.contvalo_codigoid)

	LEFT JOIN discriminacao AS disc ON (disc.id_discriminacao = contvalodisc.discriminacao_codigoid)
	LEFT JOIN discriminacao AS discfilho ON (discfilho.id_discriminacao = contvalodiscfilho.discriminacao_codigoid)

	INNER JOIN natureza AS natu ON (natu.natu_codigoid = contvalo.natu_codigoid AND natu.natu_codigoid IN (4))
	INNER JOIN natureza AS natufilho ON (natufilho.natu_codigoid = contvalofilho.natu_codigoid AND natufilho.natu_codigoid IN (4))
WHERE STR_TO_DATE(CONCAT(DATE_FORMAT(dataVencimento, '%Y-%m'), '-', IF(peri.peri_vencimento > ultimoDia, ultimoDia, peri.peri_vencimento)), '%Y-%m-%d') = dataVencimento
AND cont.stat_codigoid = 1
AND filhos.stat_codigoid = 1
AND cont.clie_codigoid != 1000
AND ativ.ativ_dataativado IS NOT NULL
AND DATE_FORMAT(ativ.ativ_dataativado, '%Y-%m-%d') < dataVencimento
AND contvalodisc.valor > 1.00
AND cont.cont_proximocodigoid IS NULL

GROUP BY vencimento, cont.clie_codigoid, grupserv.grupserv_codigoid, serv.serv_codigoid, cont.cont_codigoid, filhos.cont_codigoid, natufilho.natu_codigoid, disc.descricao;

-- GROUP BY grupserv.grupserv_codigoid, serv.serv_codigoid, cont.clie_codigoid, cont.cont_codigoid, natu.natu_codigoid, filhos.cont_codigoid, contvalofilho.contvalo_codigoid, disc.descricao
-- ORDER BY grupserv.grupserv_codigoid, serv.serv_codigoid, cont.clie_codigoid, cont.cont_codigoid, natu.natu_codigoid, filhos.cont_codigoid, disc.descricao;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LIST_CONTRATO_MENSALIDADE_OUTROS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LIST_CONTRATO_MENSALIDADE_OUTROS`(IN data_base DATE)
BEGIN

	DECLARE dataVencimento DATE DEFAULT data_base;
	DECLARE ultimoDia INT DEFAULT DAY(LAST_DAY(dataVencimento));

	SELECT DISTINCT cont.cont_codigoid,
	cont.clie_codigoid,
	filhos.cont_codigoid AS FILHO_ID,
	ativ.ativ_dataativado,
	ativfilhos.ativ_dataativado AS FILHO_ATIVACAO,
	contvalo.contvalo_valor,
	contvalofilho.contvalo_codigoid,
	contvalofilho.contvalo_valor AS FILHO_VALOR,
	natu.natu_codigoid,
	natu.natu_descricao,
	natufilho.natu_codigoid AS FILHO_NATUREZA_ID,
	natufilho.natu_descricao AS FILHO_NATUREZA,
	disc.descricao,
	contvalodisc.valor,
	discfilho.descricao AS FILHO_DESCRICAO,
	peri.peri_vencimento,
	ultimoDia,
	STR_TO_DATE(CONCAT(DATE_FORMAT(dataVencimento, '%Y-%m'), '-', IF(peri.peri_vencimento > ultimoDia, ultimoDia, peri.peri_vencimento)), '%Y-%m-%d') AS vencimento,
	dataVencimento,
	users.cnpj,
	grupserv.grupserv_codigoid,
	grupserv.grupserv_nome,
	serv.serv_nome,
	serv.serv_codigoid
FROM contrato AS cont
	INNER JOIN contrato AS filhos ON (filhos.cont_paicodigoid = cont.cont_codigoid AND filhos.stat_codigoid = 1)

	LEFT JOIN luma.unidade AS unid ON (unid.unid_codigoid = cont.unid_codigoid)

	LEFT JOIN gcdb.Customers2users AS custuser ON (custuser.id_customers = unid.unid_stechcodigoid)

	LEFT JOIN gcdb.cad_users AS users ON (users.id = custuser.id_users)

	INNER JOIN contratoservico AS contserv ON (contserv.cont_codigoid = cont.cont_codigoid)
	INNER JOIN servicocapacidade AS servcapa ON (servcapa.servcapa_codigoid = contserv.servcapa_codigoid)
	INNER JOIN servico AS serv ON (serv.serv_codigoid = servcapa.serv_codigoid)
	INNER JOIN capacidade AS capa ON (capa.capa_codigoid = servcapa.capa_codigoid)
	INNER JOIN gruposervico AS grupserv ON (grupserv.grupserv_codigoid = serv.grupserv_codigoid AND grupserv.grupserv_codigoid != 4)

	LEFT JOIN ativacao AS ativ ON (ativ.cont_codigoid = cont.cont_codigoid)
	LEFT JOIN ativacao AS ativfilhos ON (ativfilhos.cont_codigoid = filhos.cont_codigoid)

	INNER JOIN contratovalor AS contvalo ON (contvalo.cont_codigoid = cont.cont_codigoid)
	INNER JOIN contratovalor AS contvalofilho ON (contvalofilho.cont_codigoid = filhos.cont_codigoid AND contvalofilho.contvalo_datafim IS NULL AND contvalofilho.contvalo_valor > 0.00)

	LEFT JOIN periodicidade AS peri ON (peri.contvalo_codigoid = contvalo.contvalo_codigoid)

	LEFT JOIN contratovalor_discriminacao AS contvalodisc ON (contvalodisc.contvalo_codigoid = contvalo.contvalo_codigoid)
	LEFT JOIN contratovalor_discriminacao AS contvalodiscfilho ON (contvalodiscfilho.contvalo_codigoid = contvalofilho.contvalo_codigoid)

	LEFT JOIN discriminacao AS disc ON (disc.id_discriminacao = contvalodisc.discriminacao_codigoid)
	LEFT JOIN discriminacao AS discfilho ON (discfilho.id_discriminacao = contvalodiscfilho.discriminacao_codigoid)

	INNER JOIN natureza AS natu ON (natu.natu_codigoid = contvalo.natu_codigoid AND natu.natu_codigoid IN (4))
	INNER JOIN natureza AS natufilho ON (natufilho.natu_codigoid = contvalofilho.natu_codigoid AND natufilho.natu_codigoid IN (4))
WHERE STR_TO_DATE(CONCAT(DATE_FORMAT(dataVencimento, '%Y-%m'), '-', IF(peri.peri_vencimento > ultimoDia, ultimoDia, peri.peri_vencimento)), '%Y-%m-%d') = dataVencimento
AND cont.clie_codigoid != 1000
AND ativ.ativ_dataativado IS NOT NULL
AND DATE_FORMAT(ativ.ativ_dataativado, '%Y-%m-%d') < dataVencimento
AND contvalodisc.valor IS NULL
AND cont.cont_proximocodigoid IS NULL

GROUP BY vencimento, cont.clie_codigoid, grupserv.grupserv_codigoid, serv.serv_codigoid, cont.cont_codigoid, filhos.cont_codigoid, natufilho.natu_codigoid, disc.descricao;

-- GROUP BY grupserv.grupserv_codigoid, serv.serv_codigoid, cont.clie_codigoid, cont.cont_codigoid, natu.natu_codigoid, filhos.cont_codigoid, contvalofilho.contvalo_codigoid, disc.descricao
-- ORDER BY grupserv.grupserv_codigoid, serv.serv_codigoid, cont.clie_codigoid, cont.cont_codigoid, natu.natu_codigoid, filhos.cont_codigoid, disc.descricao;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LIST_CONTRATO_MENSALIDADE_VOICE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LIST_CONTRATO_MENSALIDADE_VOICE`(IN data_base DATE)
BEGIN

	DECLARE dataVencimento DATE DEFAULT data_base;
	DECLARE ultimoDia INT DEFAULT DAY(LAST_DAY(dataVencimento));

	SELECT DISTINCT cont.cont_codigoid,
	cont.clie_codigoid,
	filhos.cont_codigoid AS FILHO_ID,
	ativ.ativ_dataativado,
	ativfilhos.ativ_dataativado AS FILHO_ATIVACAO,
	contvalo.contvalo_valor,
	contvalofilho.contvalo_codigoid,
	contvalofilho.contvalo_valor AS FILHO_VALOR,
	natu.natu_codigoid,
	natu.natu_descricao,
	natufilho.natu_codigoid AS FILHO_NATUREZA_ID,
	natufilho.natu_descricao AS FILHO_NATUREZA,
	disc.descricao,
	contvalodisc.valor,
	discfilho.descricao AS FILHO_DESCRICAO,
	peri.peri_vencimento,
	ultimoDia,
	STR_TO_DATE(CONCAT(DATE_FORMAT(dataVencimento, '%Y-%m'), '-', IF(peri.peri_vencimento > ultimoDia, ultimoDia, peri.peri_vencimento)), '%Y-%m-%d') AS vencimento,
	dataVencimento,
	users.cnpj,
	grupserv.grupserv_codigoid,
	grupserv.grupserv_nome,
	serv.serv_nome,
	serv.serv_codigoid
FROM contrato AS cont
	INNER JOIN contrato AS filhos ON (filhos.cont_paicodigoid = cont.cont_codigoid AND filhos.stat_codigoid = 1)

	LEFT JOIN luma.unidade AS unid ON (unid.unid_codigoid = cont.unid_codigoid)

	LEFT JOIN gcdb.Customers2users AS custuser ON (custuser.id_customers = unid.unid_stechcodigoid)

	LEFT JOIN gcdb.cad_users AS users ON (users.id = custuser.id_users)

	INNER JOIN contratoservico AS contserv ON (contserv.cont_codigoid = cont.cont_codigoid)
	INNER JOIN servicocapacidade AS servcapa ON (servcapa.servcapa_codigoid = contserv.servcapa_codigoid)
	INNER JOIN servico AS serv ON (serv.serv_codigoid = servcapa.serv_codigoid)
	INNER JOIN capacidade AS capa ON (capa.capa_codigoid = servcapa.capa_codigoid)
	INNER JOIN gruposervico AS grupserv ON (grupserv.grupserv_codigoid = serv.grupserv_codigoid AND grupserv.grupserv_codigoid = 4)

	LEFT JOIN ativacao AS ativ ON (ativ.cont_codigoid = cont.cont_codigoid)
	LEFT JOIN ativacao AS ativfilhos ON (ativfilhos.cont_codigoid = filhos.cont_codigoid)

	INNER JOIN contratovalor AS contvalo ON (contvalo.cont_codigoid = cont.cont_codigoid)
	INNER JOIN contratovalor AS contvalofilho ON (contvalofilho.cont_codigoid = filhos.cont_codigoid AND contvalofilho.contvalo_datafim IS NULL AND contvalofilho.contvalo_valor > 0.00)

	LEFT JOIN periodicidade AS peri ON (peri.contvalo_codigoid = contvalo.contvalo_codigoid)

	LEFT JOIN contratovalor_discriminacao AS contvalodisc ON (contvalodisc.contvalo_codigoid = contvalo.contvalo_codigoid)
	LEFT JOIN contratovalor_discriminacao AS contvalodiscfilho ON (contvalodiscfilho.contvalo_codigoid = contvalofilho.contvalo_codigoid)

	LEFT JOIN discriminacao AS disc ON (disc.id_discriminacao = contvalodisc.discriminacao_codigoid)
	LEFT JOIN discriminacao AS discfilho ON (discfilho.id_discriminacao = contvalodiscfilho.discriminacao_codigoid)

	INNER JOIN natureza AS natu ON (natu.natu_codigoid = contvalo.natu_codigoid AND natu.natu_codigoid IN (18,19))
	INNER JOIN natureza AS natufilho ON (natufilho.natu_codigoid = contvalofilho.natu_codigoid AND natufilho.natu_codigoid IN (18,19))
WHERE STR_TO_DATE(CONCAT(DATE_FORMAT(dataVencimento, '%Y-%m'), '-', IF(peri.peri_vencimento > ultimoDia, ultimoDia, peri.peri_vencimento)), '%Y-%m-%d') = dataVencimento
AND ativ.ativ_dataativado IS NOT NULL AND DATE_FORMAT(ativ.ativ_dataativado, '%Y-%m-%d') < dataVencimento
AND cont.clie_codigoid != 1000
AND cont.cont_proximocodigoid IS NULL

GROUP BY vencimento, cont.clie_codigoid, grupserv.grupserv_codigoid, serv.serv_codigoid, cont.cont_codigoid, filhos.cont_codigoid, natufilho.natu_codigoid;
-- GROUP BY vencimento, grupserv.grupserv_codigoid, serv.serv_codigoid, cont.clie_codigoid, cont.cont_codigoid, natu.natu_codigoid, filhos.cont_codigoid, contvalofilho.contvalo_codigoid, disc.descricao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `valor_ativacao_filho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `valor_ativacao_filho`()
BEGIN

DECLARE done INT DEFAULT FALSE;
DECLARE cont, contPai INT;
DECLARE contvalo, contvaloPai INT;
DECLARE cur1 CURSOR FOR select contrato.cont_codigoid,contrato.cont_paicodigoid from financeiro.contrato
						inner join financeiro.contratoservico using(cont_codigoid)
						inner join financeiro.servicocapacidade using(servcapa_codigoid)
						inner join financeiro.contratovalor as valoPai on contrato.cont_paicodigoid=valoPai.cont_codigoid and valoPai.natu_codigoid=1
						 left join financeiro.contratovalor as valoFilho on contrato.cont_codigoid=valoFilho.cont_codigoid and valoFilho.natu_codigoid=1
						where serv_codigoid=6 and valoFilho.contvalo_codigoid is null;
start transaction;

Open cur1;
read_loop: LOOP
    FETCH cur1 INTO cont, contPai;
    IF done THEN
      LEAVE read_loop;
    END IF;

	insert into financeiro.contratovalor (
		contvalo_proximocodigoid,
		contvalo_anteriorcodigoid,
		cont_codigoid,
		moed_codigoid,
		natu_codigoid,
		contvalo_datainic,
		contvalo_datafim,
		contvalo_valor,
		contvalo_valorsemdesconto,
		contvalo_valorsemimposto,
		contvalo_SVA,
		contvalo_SCM
	)
	select 
		contvalo_proximocodigoid,
		contvalo_anteriorcodigoid,
		cont,
		moed_codigoid,
		natu_codigoid,
		contvalo_datainic,
		contvalo_datafim,
		contvalo_valor,
		contvalo_valorsemdesconto,
		contvalo_valorsemimposto,
		contvalo_SVA,
		contvalo_SCM
	from financeiro.contratovalor
	where natu_codigoid=1 and cont_codigoid = contPai;

	select contvalo_codigoid into contvalo from contratovalor where cont_codigoid=cont and natu_codigoid=1;
	select contvalo_codigoid into contvaloPai from contratovalor where cont_codigoid=contPai and natu_codigoid=1;



	insert into financeiro.periodicidade (
		contvalo_codigoid,
		peri_periodicidadefatura,
		peri_periodicidadenota,
		peri_parcelasfatura,
		peri_parcelasnota,
		peri_vencimento,
		peri_datainc,
		peri_aposassinatura,
		peri_pospago,
		peri_numeroparcelas,
		peri_carenciadias,
		peri_carenciames,
		peri_carenciadatafixa,
		peri_vencimentodatafixa
	)
	select
		contvalo,
		peri_periodicidadefatura,
		peri_periodicidadenota,
		peri_parcelasfatura,
		peri_parcelasnota,
		peri_vencimento,
		peri_datainc,
		peri_aposassinatura,
		peri_pospago,
		peri_numeroparcelas,
		peri_carenciadias,
		peri_carenciames,
		peri_carenciadatafixa,
		peri_vencimentodatafixa
	from financeiro.periodicidade
	where contvalo_codigoid=contvaloPai;

	select valoFilho.contvalo_codigoid, valoPai.contvalo_codigoid from financeiro.contrato
	inner join financeiro.contratoservico using(cont_codigoid)
	inner join financeiro.servicocapacidade using(servcapa_codigoid)
	inner join financeiro.contratovalor as valoPai on contrato.cont_paicodigoid=valoPai.cont_codigoid and valoPai.natu_codigoid=1
	 left join financeiro.contratovalor as valoFilho on contrato.cont_codigoid=valoFilho.cont_codigoid and valoFilho.natu_codigoid=1
	 left join financeiro.periodicidade on valoFilho.contvalo_codigoid=periodicidade.contvalo_codigoid
	where serv_codigoid=6 and periodicidade.contvalo_codigoid is null;
    
  END LOOP;

Close cur1;

commit;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `realtorio`
--

/*!50001 DROP VIEW IF EXISTS `realtorio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `realtorio` AS select `municipio`.`id` AS `id`,`municipio`.`nome` AS `municipio`,`gcdb`.`adm_uf`.`sigla` AS `SIGLA`,`financeiro`.`status`.`stat_nome` AS `stat_nome`,`financeiro`.`servicocapacidade`.`serv_codigoid` AS `serv_codigoid`,if((`financeiro`.`servicocapacidade`.`serv_codigoid` in (20,6)),'VOICE','DADOS') AS `servicos` from ((((((((`financeiro`.`contrato` `pai` join `financeiro`.`contratoservico` on((`financeiro`.`contratoservico`.`cont_codigoid` = `pai`.`cont_codigoid`))) join `financeiro`.`servicocapacidade` on((`financeiro`.`contratoservico`.`servcapa_codigoid` = `financeiro`.`servicocapacidade`.`servcapa_codigoid`))) join `financeiro`.`servico` on((`financeiro`.`servicocapacidade`.`serv_codigoid` = `financeiro`.`servico`.`serv_codigoid`))) join `financeiro`.`status` on((`pai`.`stat_codigoid` = `financeiro`.`status`.`stat_codigoid`))) join `financeiro`.`contrato` `filho` on((`filho`.`cont_paicodigoid` = `pai`.`cont_codigoid`))) join `financeiro`.`enderecoentrega` on((`filho`.`endeentr_codigoid` = `financeiro`.`enderecoentrega`.`endeentr_codigoid`))) join `gcdb`.`adm_cidades` `municipio` on((`financeiro`.`enderecoentrega`.`endeentr_cidade` = `municipio`.`id`))) join `gcdb`.`adm_uf` on((`municipio`.`adm_uf_id` = `gcdb`.`adm_uf`.`id`))) where (`pai`.`stat_codigoid` in (1,4)) */;
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

-- Dump completed on 2018-02-01 17:42:40
