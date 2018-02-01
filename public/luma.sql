-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 192.168.10.249    Database: luma
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
-- Table structure for table `_temp_movimentacao`
--

DROP TABLE IF EXISTS `_temp_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_temp_movimentacao` (
  `codigo` int(255) NOT NULL,
  `dataordem` datetime DEFAULT NULL,
  `origem` varchar(255) DEFAULT NULL,
  `destino` varchar(255) DEFAULT NULL,
  `destino_final` varchar(255) DEFAULT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  `solicitante` varchar(255) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `nfe` varchar(47) DEFAULT NULL,
  `ordem` varchar(255) DEFAULT NULL,
  `finalidade` varchar(255) DEFAULT NULL,
  `origem_id` int(11) DEFAULT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `destino_final_id` int(11) DEFAULT NULL,
  KEY `codigo` (`codigo`,`origem`,`destino`,`responsavel`,`solicitante`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_temp_unidade`
--

DROP TABLE IF EXISTS `_temp_unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_temp_unidade` (
  `unid_codigoid` int(11) NOT NULL,
  `tipo_nome` varchar(255) DEFAULT NULL,
  `unid_nome` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alcadacompras`
--

DROP TABLE IF EXISTS `alcadacompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alcadacompras` (
  `alca_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  `alca_valormaximo` decimal(10,2) NOT NULL,
  `alca_valormaximolimite` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`alca_codigoid`),
  UNIQUE KEY `unid_codigoid` (`unid_codigoid`),
  KEY `fk_alcadacompras_unidade1` (`unid_codigoid`),
  CONSTRAINT `fk_alcadacompras_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
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
  `atri_mascara` varchar(255) DEFAULT NULL,
  `atri_requeridosn` tinyint(1) NOT NULL,
  `atri_unicosn` tinyint(1) NOT NULL,
  `atri_tipohtml` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`atri_codigoid`),
  KEY `index_atributonome` (`atri_nome`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atributoinserirproduto`
--

DROP TABLE IF EXISTS `atributoinserirproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributoinserirproduto` (
  `atriinse_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `atri_codigoid` int(11) NOT NULL,
  `inse_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`atriinse_codigoid`),
  UNIQUE KEY `atri_codigoid` (`atri_codigoid`,`inse_codigoid`),
  KEY `fk_atributo` (`atri_codigoid`),
  KEY `fk_inserirproduto` (`inse_codigoid`),
  CONSTRAINT `atributoinserirproduto_ibfk_1` FOREIGN KEY (`atri_codigoid`) REFERENCES `atributo` (`atri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `atributoinserirproduto_ibfk_2` FOREIGN KEY (`inse_codigoid`) REFERENCES `inserirproduto` (`inse_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9022 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atributoproduto`
--

DROP TABLE IF EXISTS `atributoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributoproduto` (
  `atriprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `atriprod_valor` text,
  `prod_codigoid` int(11) NOT NULL,
  `atri_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`atriprod_codigoid`),
  UNIQUE KEY `prod_codigoid` (`prod_codigoid`,`atri_codigoid`),
  KEY `fk_atributoproduto_produto1` (`prod_codigoid`),
  KEY `fk_atributoproduto_atributo1` (`atri_codigoid`),
  CONSTRAINT `fk_atributoproduto_atributo1` FOREIGN KEY (`atri_codigoid`) REFERENCES `atributo` (`atri_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atributoproduto_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6425 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atributoprodutolote`
--

DROP TABLE IF EXISTS `atributoprodutolote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributoprodutolote` (
  `atriprodlote_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `atriprod_codigoid` int(11) NOT NULL,
  `lote_codigoid` int(11) NOT NULL,
  `aut_userid` int(11) DEFAULT NULL,
  `atriprodlote_dado` varchar(255) NOT NULL,
  `dataInc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`atriprodlote_codigoid`),
  KEY `fk_atributoprodutolote_lote1` (`lote_codigoid`),
  KEY `fk_atributoprodutolote_atributoproduto1` (`atriprod_codigoid`),
  CONSTRAINT `fk_atributoprodutolote_atributoproduto1` FOREIGN KEY (`atriprod_codigoid`) REFERENCES `atributoproduto` (`atriprod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atributoprodutolote_lote1` FOREIGN KEY (`lote_codigoid`) REFERENCES `lote` (`lote_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2487835 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `checaAtributoRepetido_INSERIR` AFTER INSERT ON `atributoprodutolote` FOR EACH ROW
BEGIN
	DECLARE total int default 0;
	DECLARE EXIT HANDLER FOR NOT FOUND begin end;

	IF NEW.atriprodlote_dado != 'DESCONHECIDO' THEN
		SELECT count(atributoprodutolote.atriprodlote_codigoid) INTO total
		FROM atributoprodutolote
		INNER JOIN atributoproduto ON atributoproduto.atriprod_codigoid=atributoprodutolote.atriprod_codigoid
		INNER JOIN atributo ON atributo.atri_codigoid=atributoproduto.atri_codigoid
		WHERE
			atributo.atri_unicosn=1 AND
			atributoprodutolote.atriprodlote_dado=NEW.atriprodlote_dado AND
			atributoprodutolote.atriprod_codigoid=NEW.atriprod_codigoid
		GROUP BY atributoprodutolote.atriprodlote_codigoid;
		
		IF total > 0 THEN
			SELECT 1/0 INTO total;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `checaAtributoRepetido_UPDATE` AFTER UPDATE ON `atributoprodutolote` FOR EACH ROW
BEGIN
	DECLARE total int default 0;
	DECLARE EXIT HANDLER FOR NOT FOUND begin end;

	IF NEW.atriprodlote_dado != 'DESCONHECIDO' THEN
		SELECT count(atributoprodutolote.atriprodlote_codigoid) INTO total
		FROM atributoprodutolote
		INNER JOIN atributoproduto ON atributoproduto.atriprod_codigoid=atributoprodutolote.atriprod_codigoid
		INNER JOIN atributo ON atributo.atri_codigoid=atributoproduto.atri_codigoid
		WHERE
			atributo.atri_unicosn=1 AND
			atributoprodutolote.atriprodlote_dado=NEW.atriprodlote_dado AND
			atributoprodutolote.atriprod_codigoid=NEW.atriprod_codigoid
		GROUP BY atributoprodutolote.atriprodlote_codigoid;
		
		IF total > 0 THEN
			SELECT 1/0 INTO total;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cate_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ncm_codigoid` int(11) DEFAULT NULL,
  `cate_nome` varchar(255) NOT NULL,
  `cate_descricao` varchar(255) NOT NULL,
  `cate_paicodigoid` int(11) DEFAULT NULL,
  `cate_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cate_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `cate_ordem` varchar(45) NOT NULL,
  PRIMARY KEY (`cate_codigoid`),
  KEY `fk_categoria` (`cate_paicodigoid`),
  KEY `fk_categoria_ncm1` (`ncm_codigoid`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`cate_paicodigoid`) REFERENCES `categoria` (`cate_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_ncm1` FOREIGN KEY (`ncm_codigoid`) REFERENCES `ncm` (`ncm_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoriaunidade`
--

DROP TABLE IF EXISTS `categoriaunidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriaunidade` (
  `cateunid_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cate_codigoid` int(11) NOT NULL,
  `unid_codigoid` int(11) NOT NULL,
  `cateunid_ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cateunid_codigoid`),
  UNIQUE KEY `cate_codigoid` (`cate_codigoid`,`unid_codigoid`),
  KEY `fk_categoriaunidade_categoria1` (`cate_codigoid`),
  KEY `fk_categoriaunidade_unidade1` (`unid_codigoid`),
  CONSTRAINT `fk_categoriaunidade_categoria1` FOREIGN KEY (`cate_codigoid`) REFERENCES `categoria` (`cate_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoriaunidade_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1772 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `centro_custo`
--

DROP TABLE IF EXISTS `centro_custo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_custo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `responsavel_id` int(11) NOT NULL,
  `pai_id` int(11) DEFAULT NULL,
  `codigo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_exclusao` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1',
  `ordem_interna` tinyint(1) DEFAULT '0',
  `diretor_id` int(11) NOT NULL,
  `alcada` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `centro_custo_uniq` (`codigo`),
  KEY `categoria_id` (`categoria_id`),
  KEY `pai_id` (`pai_id`),
  CONSTRAINT `centro_custo_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `centro_custo_categoria` (`id`),
  CONSTRAINT `centro_custo_ibfk_2` FOREIGN KEY (`pai_id`) REFERENCES `centro_custo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `centro_custo_categoria`
--

DROP TABLE IF EXISTS `centro_custo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_custo_categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `centro_custo_colaborador`
--

DROP TABLE IF EXISTS `centro_custo_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_custo_colaborador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centro_custo_id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `data_inclusao` datetime NOT NULL,
  `data_exclusao` datetime DEFAULT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `centro_custo_id` (`centro_custo_id`),
  CONSTRAINT `centro_custo_colaborador_ibfk_1` FOREIGN KEY (`centro_custo_id`) REFERENCES `centro_custo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1349 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `centro_ordem`
--

DROP TABLE IF EXISTS `centro_ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_ordem` (
  `centro_custo_id` int(11) NOT NULL,
  `orde_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`centro_custo_id`,`orde_codigoid`),
  KEY `orde_codigoid` (`orde_codigoid`),
  CONSTRAINT `centro_ordem_ibfk_1` FOREIGN KEY (`centro_custo_id`) REFERENCES `centro_custo` (`id`),
  CONSTRAINT `centro_ordem_ibfk_2` FOREIGN KEY (`orde_codigoid`) REFERENCES `ordem` (`orde_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condicao_pagamento`
--

DROP TABLE IF EXISTS `condicao_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicao_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condpag_codigo` varchar(3) NOT NULL,
  `condpag_descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `condicao_pagamento_uk1` (`condpag_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `convite`
--

DROP TABLE IF EXISTS `convite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convite` (
  `conv_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cota_codigoid` int(11) NOT NULL,
  `unid_codigoid` int(11) NOT NULL,
  `conv_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`conv_codigoid`),
  KEY `fk_convite_cotacao1_idx` (`cota_codigoid`),
  KEY `fk_convite_unidade1_idx` (`unid_codigoid`),
  CONSTRAINT `fk_convite_cotacao1` FOREIGN KEY (`cota_codigoid`) REFERENCES `cotacao` (`cota_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_convite_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=291186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacao`
--

DROP TABLE IF EXISTS `cotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacao` (
  `cota_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_codigoid` int(11) DEFAULT NULL,
  `autusuario_codigoid` int(11) NOT NULL,
  `cota_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cota_abertura` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cota_fechamento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cota_descricao` text,
  `cota_descricaofornecedor` text,
  `cota_enderecoentrega` text,
  `cota_informacao_adicional` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cota_codigoid`),
  KEY `tipo_codigoid` (`tipo_codigoid`),
  CONSTRAINT `cotacao_ibfk_1` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=11949 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacao_endereco`
--

DROP TABLE IF EXISTS `cotacao_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacao_endereco` (
  `cotaende_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cota_codigoid` int(11) NOT NULL,
  `ende_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`cotaende_codigoid`),
  UNIQUE KEY `cota_codigoid` (`cota_codigoid`,`ende_codigoid`),
  KEY `cota_codigoid_2` (`cota_codigoid`),
  KEY `ende_codigoid` (`ende_codigoid`),
  CONSTRAINT `cotacao_endereco_ibfk_1` FOREIGN KEY (`cota_codigoid`) REFERENCES `cotacao` (`cota_codigoid`),
  CONSTRAINT `cotacao_endereco_ibfk_2` FOREIGN KEY (`ende_codigoid`) REFERENCES `endereco` (`ende_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=5796 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacaoformapagamento`
--

DROP TABLE IF EXISTS `cotacaoformapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaoformapagamento` (
  `cotaformpaga_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cota_codigoid` int(11) NOT NULL,
  `cotaformpaga_forma` varchar(255) NOT NULL,
  `id_condicao_pagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`cotaformpaga_codigoid`),
  KEY `fk_cotacaoformapagamento_cotacao1_idx` (`cota_codigoid`),
  KEY `fk_cotacaoformapagamento_condicao_pagamento_ibfk1` (`id_condicao_pagamento`),
  CONSTRAINT `fk_cotacaoformapagamento_condicao_pagamento_ibfk1` FOREIGN KEY (`id_condicao_pagamento`) REFERENCES `condicao_pagamento` (`id`),
  CONSTRAINT `fk_cotacaoformapagamento_cotacao1` FOREIGN KEY (`cota_codigoid`) REFERENCES `cotacao` (`cota_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13178 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacaoproduto`
--

DROP TABLE IF EXISTS `cotacaoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaoproduto` (
  `cotaprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cota_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  `tipo_codigoid` int(11) DEFAULT NULL,
  `cotaprod_quantidade` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cotaprod_codigoid`),
  KEY `fk_cotacaoproduto_cotacao1` (`cota_codigoid`),
  KEY `fk_cotacaoproduto_produto1` (`prod_codigoid`),
  KEY `fk_cotacaoproduto_tipo1` (`tipo_codigoid`),
  CONSTRAINT `fk_cotacaoproduto_cotacao1` FOREIGN KEY (`cota_codigoid`) REFERENCES `cotacao` (`cota_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotacaoproduto_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotacaoproduto_tipo1` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30262 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacaosolicitacao`
--

DROP TABLE IF EXISTS `cotacaosolicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaosolicitacao` (
  `cotasoli_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `soli_codigoid` int(11) NOT NULL,
  `cota_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`cotasoli_codigoid`),
  KEY `fk_cotacaosolicitacao_solicitacao1_idx` (`soli_codigoid`),
  KEY `fk_cotacaosolicitacao_cotacao1_idx` (`cota_codigoid`),
  CONSTRAINT `fk_cotacaosolicitacao_cotacao1` FOREIGN KEY (`cota_codigoid`) REFERENCES `cotacao` (`cota_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotacaosolicitacao_solicitacao1` FOREIGN KEY (`soli_codigoid`) REFERENCES `solicitacao` (`soli_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10733 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacaounidade`
--

DROP TABLE IF EXISTS `cotacaounidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaounidade` (
  `cotaunid_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cota_codigoid` int(11) NOT NULL,
  `unid_codigoid` int(11) NOT NULL,
  `cotaunid_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cotaunid_hash` varchar(32) NOT NULL,
  `cotaunid_validade` int(11) NOT NULL,
  `cotaunid_frete` decimal(10,2) DEFAULT NULL,
  `cotaunid_tipofrete` varchar(255) DEFAULT NULL,
  `cotaunid_prazodeentrega` int(11) NOT NULL DEFAULT '0',
  `cotaunid_inseridopor` varchar(255) NOT NULL DEFAULT '0.0.0.0',
  `cotaunid_comentario` text,
  PRIMARY KEY (`cotaunid_codigoid`),
  KEY `fk_cotacaounidade_cotacao1_idx` (`cota_codigoid`),
  KEY `fk_cotacaounidade_unidade1_idx` (`unid_codigoid`),
  CONSTRAINT `fk_cotacaounidade_cotacao1` FOREIGN KEY (`cota_codigoid`) REFERENCES `cotacao` (`cota_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotacaounidade_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23654 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacaounidadeformapagamento`
--

DROP TABLE IF EXISTS `cotacaounidadeformapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaounidadeformapagamento` (
  `cotaunidformpaga_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cotaunid_codigoid` int(11) NOT NULL,
  `cotaunidformpaga_forma` varchar(255) NOT NULL,
  `id_condicao_pagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`cotaunidformpaga_codigoid`),
  KEY `fk_cotacaounidadeformapagamento_cotacaounidade1_idx` (`cotaunid_codigoid`),
  KEY `fk_cotacaounidadeformapagamento_condicao_pagamento_ibfk1` (`id_condicao_pagamento`),
  CONSTRAINT `fk_cotacaounidadeformapagamento_condicao_pagamento_ibfk1` FOREIGN KEY (`id_condicao_pagamento`) REFERENCES `condicao_pagamento` (`id`),
  CONSTRAINT `fk_cotacaounidadeformapagamento_cotacaounidade1` FOREIGN KEY (`cotaunid_codigoid`) REFERENCES `cotacaounidade` (`cotaunid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48649 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotacaounidadeproduto`
--

DROP TABLE IF EXISTS `cotacaounidadeproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotacaounidadeproduto` (
  `cotaunidprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `prod_codigoid` int(11) NOT NULL,
  `cotaunid_codigoid` int(11) NOT NULL,
  `cotaunidprod_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cotaunidprod_quantidade` decimal(10,2) NOT NULL,
  `cotaunidprod_valorunitario` decimal(10,2) NOT NULL,
  `cotaunidprod_valortotal` decimal(10,2) NOT NULL,
  `cotaunidprod_frete` decimal(10,2) DEFAULT NULL,
  `cotaunidprod_tipofrete` varchar(45) DEFAULT NULL,
  `cotaunidprod_substituicaotributaria` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cotaunidprod_codigoid`),
  KEY `fk_cotacaounidadeproduto_produto1_idx` (`prod_codigoid`),
  KEY `fk_cotacaounidadeproduto_cotacaounidade1_idx` (`cotaunid_codigoid`),
  CONSTRAINT `fk_cotacaounidadeproduto_cotacaounidade1` FOREIGN KEY (`cotaunid_codigoid`) REFERENCES `cotacaounidade` (`cotaunid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotacaounidadeproduto_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=145383 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `email_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_codigoid` int(11) NOT NULL,
  `email_pagina` varchar(255) NOT NULL,
  `email_assunto` varchar(255) NOT NULL,
  `email_corpo` text NOT NULL,
  `email_de` varchar(255) NOT NULL,
  `email_para` varchar(255) NOT NULL,
  `email_cc` varchar(255) DEFAULT NULL,
  `email_bcc` varchar(255) DEFAULT NULL,
  `email_anexo` varchar(255) DEFAULT NULL,
  `email_dataenvio` datetime NOT NULL,
  `email_datainc` datetime NOT NULL,
  `email_idoperacao` int(255) NOT NULL,
  `email_tipooperacao` varchar(255) NOT NULL,
  `email_prioridade` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`email_codigoid`),
  KEY `email_datainc` (`email_datainc`),
  KEY `email_tipooperacao` (`email_tipooperacao`),
  KEY `tipo_codigoid` (`tipo_codigoid`),
  KEY `email_idoperacao` (`email_idoperacao`),
  KEY `email_prioridade` (`email_prioridade`),
  KEY `email_anexo` (`email_anexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3898588 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailleitura`
--

DROP TABLE IF EXISTS `emailleitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailleitura` (
  `emailleitura_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `email_codigoid` int(11) NOT NULL,
  `emailleitura_datainc` datetime NOT NULL,
  `emailleitura_ip` varchar(50) NOT NULL,
  `emailleitura_informacao` varchar(255) NOT NULL,
  PRIMARY KEY (`emailleitura_codigoid`),
  KEY `fk_email_codigoid` (`email_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailmensagem`
--

DROP TABLE IF EXISTS `emailmensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailmensagem` (
  `emailmensagem_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `email_codigoid` int(11) NOT NULL,
  `emailmensagem_mensagem` varchar(255) NOT NULL,
  `emailmensagem_datainc` datetime NOT NULL,
  PRIMARY KEY (`emailmensagem_codigoid`),
  KEY `fk_emailmensagem_email1` (`email_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=5298808 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `ende_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  `ende_uf` varchar(2) NOT NULL,
  `ende_cidade` varchar(255) NOT NULL,
  `ende_endereco` text NOT NULL,
  `ende_numero` varchar(11) DEFAULT NULL,
  `ende_bairro` varchar(255) DEFAULT NULL,
  `ende_cep` varchar(10) DEFAULT NULL,
  `ende_longitude` varchar(45) DEFAULT NULL,
  `ende_latitude` varchar(45) DEFAULT NULL,
  `ende_referencia` text,
  `locale_codigoid` int(11) DEFAULT NULL COMMENT 'voice.locale',
  PRIMARY KEY (`ende_codigoid`),
  KEY `fk_unidadeendereco_unidade1` (`unid_codigoid`),
  CONSTRAINT `fk_unidadeendereco_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6243 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `esto_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`esto_codigoid`),
  KEY `fk_estoque_unidade1` (`unid_codigoid`),
  CONSTRAINT `fk_estoque_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoquehistorico`
--

DROP TABLE IF EXISTS `estoquehistorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoquehistorico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_responsavel` int(11) DEFAULT NULL,
  `id_estoque` int(11) NOT NULL,
  `data_crawler` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ciclo_crawler` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`),
  KEY `id_estoque` (`id_estoque`),
  CONSTRAINT `estoquehistorico_ibfk_1` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`esto_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=32530 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoqueproduto`
--

DROP TABLE IF EXISTS `estoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoqueproduto` (
  `estoprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `esto_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  `estoprod_minimo` float DEFAULT NULL,
  `estoprod_normal` float DEFAULT NULL,
  `estoprod_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`estoprod_codigoid`),
  UNIQUE KEY `esto_codigoid` (`esto_codigoid`,`prod_codigoid`),
  KEY `fk_estoqueproduto_estoque1` (`esto_codigoid`),
  KEY `fk_estoqueproduto_produto1` (`prod_codigoid`),
  CONSTRAINT `fk_estoqueproduto_estoque1` FOREIGN KEY (`esto_codigoid`) REFERENCES `estoque` (`esto_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estoqueproduto_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=642946 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoqueprodutohistorico`
--

DROP TABLE IF EXISTS `estoqueprodutohistorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoqueprodutohistorico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_estoquehistorico` int(11) NOT NULL,
  `minimo` float NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`,`id_estoquehistorico`),
  KEY `id_estoquehistorico` (`id_estoquehistorico`),
  CONSTRAINT `estoqueprodutohistorico_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`prod_codigoid`),
  CONSTRAINT `estoqueprodutohistorico_ibfk_2` FOREIGN KEY (`id_estoquehistorico`) REFERENCES `estoquehistorico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1287465 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finalidade`
--

DROP TABLE IF EXISTS `finalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finalidade` (
  `fina_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `fina_nome` varchar(255) NOT NULL,
  `fina_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fina_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedorproduto`
--

DROP TABLE IF EXISTS `fornecedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedorproduto` (
  `fornprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  `fornprod_ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornprod_codigoid`),
  UNIQUE KEY `prod` (`unid_codigoid`,`prod_codigoid`),
  KEY `fk_fornecedorproduto_unidade1` (`unid_codigoid`),
  KEY `fk_fornecedorproduto_produto1` (`prod_codigoid`),
  CONSTRAINT `fk_fornecedorproduto_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedorproduto_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5797 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impressora`
--

DROP TABLE IF EXISTS `impressora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impressora` (
  `impressora_id` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  `host` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fila` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `localizacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`impressora_id`),
  KEY `fk_unidade_impressora_idx` (`unid_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industrializacao`
--

DROP TABLE IF EXISTS `industrializacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industrializacao` (
  `indu_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `prod_codigoid` int(11) NOT NULL,
  `indu_quantidade` float NOT NULL,
  `indu_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `indu_fabricantecodigoid` int(11) NOT NULL,
  `indu_auditorcodigoid` int(11) DEFAULT NULL,
  `indu_alditoriadatainc` timestamp NULL DEFAULT NULL,
  `indu_aprovadosn` tinyint(1) DEFAULT NULL,
  `movi_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`indu_codigoid`),
  KEY `fk_industrializacao_produto1` (`prod_codigoid`),
  CONSTRAINT `fk_industrializacao_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industrializacaoestoqueproduto`
--

DROP TABLE IF EXISTS `industrializacaoestoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industrializacaoestoqueproduto` (
  `induestoprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `estoprod_codigoid` int(11) NOT NULL,
  `indu_codigoid` int(11) NOT NULL,
  `lote_codigoid` int(11) DEFAULT NULL,
  `induestoprod_quantidade` float NOT NULL,
  PRIMARY KEY (`induestoprod_codigoid`),
  KEY `fk_industrializacaoestoqueproduto_estoqueproduto1` (`estoprod_codigoid`),
  KEY `fk_industrializacaoestoqueproduto_industrializacao1` (`indu_codigoid`),
  KEY `fk_industrializacaoestoqueproduto_lote1` (`lote_codigoid`),
  CONSTRAINT `fk_industrializacaoestoqueproduto_estoqueproduto1` FOREIGN KEY (`estoprod_codigoid`) REFERENCES `estoqueproduto` (`estoprod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_industrializacaoestoqueproduto_industrializacao1` FOREIGN KEY (`indu_codigoid`) REFERENCES `industrializacao` (`indu_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_industrializacaoestoqueproduto_lote1` FOREIGN KEY (`lote_codigoid`) REFERENCES `lote` (`lote_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7845 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `infoseguranca`
--

DROP TABLE IF EXISTS `infoseguranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infoseguranca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `imagem` blob,
  `tela` varchar(50) DEFAULT NULL,
  `liberacao` char(1) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `direciona` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inserirproduto`
--

DROP TABLE IF EXISTS `inserirproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inserirproduto` (
  `inse_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cate_codigoid` int(11) NOT NULL,
  `medi_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) DEFAULT NULL,
  `ncm_codigoid` int(11) DEFAULT NULL,
  `inse_nome` varchar(255) NOT NULL,
  `inse_descricao` text NOT NULL,
  `inse_islance` int(11) DEFAULT NULL,
  `inse_solicitantecodigoid` int(11) NOT NULL,
  `inse_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inse_tecnicocodigoid` int(11) DEFAULT NULL,
  `inse_tecnicoaprovadosn` tinyint(1) DEFAULT NULL,
  `inse_tecnicoobservacao` text,
  `inse_tecnicodataalteracao` timestamp NULL DEFAULT NULL,
  `inse_materialcodigoid` int(11) DEFAULT NULL,
  `inse_materialaprovadosn` tinyint(1) DEFAULT NULL,
  `inse_materialobservacao` text,
  `inse_materialdataalteracao` timestamp NULL DEFAULT NULL,
  `inse_alteracao` tinyint(1) NOT NULL,
  `inse_imagens` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inse_codigoid`),
  KEY `fk_inserirproduto_categoria1` (`cate_codigoid`),
  KEY `fk_inserirproduto_medida1` (`medi_codigoid`),
  KEY `fk_inserirproduto_produto1` (`prod_codigoid`),
  KEY `fk_inserirproduto_ncm1` (`ncm_codigoid`),
  CONSTRAINT `fk_inserirproduto_categoria1` FOREIGN KEY (`cate_codigoid`) REFERENCES `categoria` (`cate_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inserirproduto_medida1` FOREIGN KEY (`medi_codigoid`) REFERENCES `medida` (`medi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inserirproduto_ncm1` FOREIGN KEY (`ncm_codigoid`) REFERENCES `ncm` (`ncm_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inserirproduto_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11084 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logbiometria`
--

DROP TABLE IF EXISTS `logbiometria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logbiometria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `acesso` char(1) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=656 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `lote_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `estoprod_codigoid` int(11) NOT NULL,
  `ordecotaunidprod` int(11) DEFAULT NULL,
  `lote_quantidade` decimal(10,2) NOT NULL,
  `lote_marcaelotefabricacao` varchar(255) DEFAULT NULL,
  `lote_datainc` datetime NOT NULL,
  PRIMARY KEY (`lote_codigoid`),
  KEY `fk_table1_estoqueproduto1` (`estoprod_codigoid`),
  KEY `fk_ordemcotacaounidadeproduto` (`ordecotaunidprod`),
  CONSTRAINT `fk_table1_estoqueproduto1` FOREIGN KEY (`estoprod_codigoid`) REFERENCES `estoqueproduto` (`estoprod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`ordecotaunidprod`) REFERENCES `ordemcotacaounidadeproduto` (`ordecotaunidprod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1293803 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER incrementa_estoqueproduto AFTER INSERT ON lote
  FOR EACH ROW BEGIN
    UPDATE estoqueproduto SET estoprod_total = (estoprod_total+NEW.lote_quantidade) WHERE estoprod_codigoid = NEW.estoprod_codigoid;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER atualizaestoqueproduto AFTER UPDATE ON lote
  FOR EACH ROW BEGIN
    IF NEW.lote_quantidade > OLD.lote_quantidade THEN
      UPDATE estoqueproduto SET estoprod_total = (estoprod_total+(NEW.lote_quantidade-OLD.lote_quantidade)) WHERE estoprod_codigoid = NEW.estoprod_codigoid;
ELSE
  IF NEW.lote_quantidade < OLD.lote_quantidade THEN
        UPDATE estoqueproduto SET estoprod_total = (estoprod_total-(OLD.lote_quantidade-NEW.lote_quantidade)) WHERE estoprod_codigoid = NEW.estoprod_codigoid;
  END IF;
END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `manutencao_causa`
--

DROP TABLE IF EXISTS `manutencao_causa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_causa` (
  `causa_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `causa` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`causa_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_classificacao`
--

DROP TABLE IF EXISTS `manutencao_classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_classificacao` (
  `class_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `classificacao` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`class_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_custo`
--

DROP TABLE IF EXISTS `manutencao_custo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_custo` (
  `cust_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `viat_baixaid` int(11) NOT NULL,
  `data_nf` date NOT NULL,
  `data_garantia` date NOT NULL,
  `status_codigoid` int(11) NOT NULL,
  `formpag_codigoid` int(11) NOT NULL,
  `tipo_codigoid` int(11) NOT NULL,
  `numero_nf` int(11) NOT NULL,
  PRIMARY KEY (`cust_codigoid`),
  KEY `fk_baixa_viatura_id` (`viat_baixaid`),
  KEY `fk_tipo_id` (`tipo_codigoid`),
  KEY `fk_forma_pagamento_id` (`formpag_codigoid`),
  KEY `fk_status_id` (`status_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_custo_item`
--

DROP TABLE IF EXISTS `manutencao_custo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_custo_item` (
  `custitem_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cust_codigoid` int(11) NOT NULL,
  `class_codigoid` int(11) NOT NULL,
  `causa_codigoid` int(11) NOT NULL,
  `descricao` varchar(100) CHARACTER SET latin1 NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`custitem_codigoid`),
  KEY `fk_causa_id` (`causa_codigoid`),
  KEY `fk_classificacao_id` (`class_codigoid`),
  KEY `fk_custo_id` (`cust_codigoid`),
  CONSTRAINT `fk_causa_id` FOREIGN KEY (`causa_codigoid`) REFERENCES `manutencao_causa` (`causa_codigoid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_classificacao_id` FOREIGN KEY (`class_codigoid`) REFERENCES `manutencao_classificacao` (`class_codigoid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_custo_id` FOREIGN KEY (`cust_codigoid`) REFERENCES `manutencao_custo` (`cust_codigoid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_custo_log`
--

DROP TABLE IF EXISTS `manutencao_custo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_custo_log` (
  `custlog_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data_inc` datetime NOT NULL,
  `acao` varchar(20) CHARACTER SET latin1 NOT NULL,
  `cust_codigoid` int(11) NOT NULL,
  `motivo` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`custlog_codigoid`),
  KEY `fk_cust_id` (`cust_codigoid`),
  CONSTRAINT `fk_cust_id` FOREIGN KEY (`cust_codigoid`) REFERENCES `manutencao_custo` (`cust_codigoid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_formapag`
--

DROP TABLE IF EXISTS `manutencao_formapag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_formapag` (
  `formapag_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `forma_pagamento` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`formapag_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_item_peca`
--

DROP TABLE IF EXISTS `manutencao_item_peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_item_peca` (
  `peca_codigoid` int(11) NOT NULL,
  `custitem_codigoid` int(11) NOT NULL,
  `valor_peca` decimal(10,2) NOT NULL,
  PRIMARY KEY (`peca_codigoid`,`custitem_codigoid`),
  KEY `fk_custo_item` (`custitem_codigoid`),
  CONSTRAINT `fk_custo_item` FOREIGN KEY (`custitem_codigoid`) REFERENCES `manutencao_custo_item` (`custitem_codigoid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pecas` FOREIGN KEY (`peca_codigoid`) REFERENCES `manutencao_pecas` (`peca_codigoid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_pecas`
--

DROP TABLE IF EXISTS `manutencao_pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_pecas` (
  `peca_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `peca` varchar(50) CHARACTER SET latin1 NOT NULL,
  `class_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`peca_codigoid`),
  KEY `fk_classificacao` (`class_codigoid`),
  CONSTRAINT `fk_classificacao` FOREIGN KEY (`class_codigoid`) REFERENCES `manutencao_classificacao` (`class_codigoid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_status`
--

DROP TABLE IF EXISTS `manutencao_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_status` (
  `status_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`status_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao_tipo`
--

DROP TABLE IF EXISTS `manutencao_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manutencao_tipo` (
  `tipo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`tipo_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrizmovimentacoes`
--

DROP TABLE IF EXISTS `matrizmovimentacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrizmovimentacoes` (
  `matrmovi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_decodigoid` int(11) NOT NULL,
  `tipo_paracodigoid` int(11) NOT NULL,
  `fina_codigoid` int(11) NOT NULL,
  `matrmovi_interna` tinyint(1) NOT NULL,
  `matrmovi_externa` tinyint(1) NOT NULL,
  PRIMARY KEY (`matrmovi_codigoid`),
  KEY `fk_matrizmovimentacoes_tipo1_idx` (`tipo_decodigoid`),
  KEY `fk_matrizmovimentacoes_tipo2_idx` (`tipo_paracodigoid`),
  KEY `fk_matrizmovimentacoes_finalidade1_idx` (`fina_codigoid`),
  CONSTRAINT `fk_matrizmovimentacoes_finalidade1` FOREIGN KEY (`fina_codigoid`) REFERENCES `finalidade` (`fina_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matrizmovimentacoes_tipo1` FOREIGN KEY (`tipo_decodigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matrizmovimentacoes_tipo2` FOREIGN KEY (`tipo_paracodigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4827 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matriznota`
--

DROP TABLE IF EXISTS `matriznota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriznota` (
  `matrnota_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_decodigoid` int(11) NOT NULL,
  `tipo_paracodigoid` int(11) NOT NULL,
  `fina_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`matrnota_codigoid`),
  KEY `fk_matriznota_tipo1_idx` (`tipo_decodigoid`),
  KEY `fk_matriznota_tipo2_idx` (`tipo_paracodigoid`),
  KEY `fk_matriznota_finalidade1_idx` (`fina_codigoid`),
  CONSTRAINT `fk_matriznota_finalidade1` FOREIGN KEY (`fina_codigoid`) REFERENCES `finalidade` (`fina_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriznota_tipo1` FOREIGN KEY (`tipo_decodigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriznota_tipo2` FOREIGN KEY (`tipo_paracodigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`medi_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motivo`
--

DROP TABLE IF EXISTS `motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivo` (
  `motivo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `motivo_motivo` varchar(255) NOT NULL,
  `motivo_ativo` int(11) NOT NULL,
  PRIMARY KEY (`motivo_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentacao` (
  `movi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_decodigoid` int(11) NOT NULL,
  `unid_paracodigoid` int(11) NOT NULL,
  `unid_destinofinalcodigoid` int(11) DEFAULT NULL,
  `usr_responsavel` int(11) unsigned NOT NULL,
  `usr_solicitante` int(11) unsigned DEFAULT NULL,
  `fina_codigoid` int(11) DEFAULT NULL,
  `movi_datainc` datetime NOT NULL,
  `movi_motivo` text NOT NULL,
  `movi_tipo` varchar(255) NOT NULL,
  `movi_entregador` varchar(255) DEFAULT NULL,
  `movi_documentoentregador` varchar(50) DEFAULT NULL,
  `movi_nfe` tinyint(1) DEFAULT NULL,
  `nfe_Id` varchar(47) DEFAULT NULL,
  `movi_automatica` tinyint(1) DEFAULT NULL,
  `movi_status_integracao` int(11) DEFAULT NULL,
  `cad_user_destino` int(11) DEFAULT NULL,
  `cad_user_origem` int(11) DEFAULT NULL,
  `operacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movi_codigoid`),
  KEY `fk_movimentacao_unidade1` (`unid_decodigoid`),
  KEY `fk_movimentacao_unidade2` (`unid_paracodigoid`),
  KEY `fk_movimentacao_finalidade1` (`fina_codigoid`),
  KEY `unid_destinofinalcodigoid` (`unid_destinofinalcodigoid`),
  KEY `idx_status_integracao` (`movi_status_integracao`),
  CONSTRAINT `fk_movimentacao_finalidade1` FOREIGN KEY (`fina_codigoid`) REFERENCES `finalidade` (`fina_codigoid`),
  CONSTRAINT `fk_movimentacao_unidade1` FOREIGN KEY (`unid_decodigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacao_unidade2` FOREIGN KEY (`unid_paracodigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `movimentacao_ibfk_1` FOREIGN KEY (`unid_destinofinalcodigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=494018 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `movimentacao_AINS` AFTER INSERT ON `movimentacao` FOR EACH ROW
BEGIN
	if new.unid_decodigoid = new.unid_paracodigoid and new.fina_codigoid != 17 then
		set new = 'Unidades invalida';
    end if;
    
    INSERT INTO `unidadenotificacao` (unidresp_codigoid, movi_codigoid)
	SELECT unidresp_codigoid, NEW.movi_codigoid FROM
		(SELECT * FROM unidaderesponsavel GROUP BY unid_codigoid DESC) AS unidresp
		WHERE unid_codigoid = NEW.unid_paracodigoid AND caduser_codigoid IS NOT null;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimentacao_transito`
--

DROP TABLE IF EXISTS `movimentacao_transito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentacao_transito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movi_codigoid` int(11) NOT NULL,
  `unid_codigoid` int(11) DEFAULT NULL,
  `movitrans_data_inc` datetime NOT NULL,
  `movitrans_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_movimentacao_transito_movimentacao_ibfk1` (`movi_codigoid`),
  KEY `fk_movimentacao_transito_unidade_ibfk1` (`unid_codigoid`),
  CONSTRAINT `fk_movimentacao_transito_movimentacao_ibfk1` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`),
  CONSTRAINT `fk_movimentacao_transito_unidade_ibfk1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimentacaoproduto`
--

DROP TABLE IF EXISTS `movimentacaoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentacaoproduto` (
  `moviprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `moviprod_quantidade` float(15,2) NOT NULL,
  `moviprod_valor` decimal(15,2) DEFAULT '0.00',
  `movi_codigoid` int(11) NOT NULL,
  `estoprod_codigoid` int(11) NOT NULL,
  `lote_codigoid` int(11) DEFAULT NULL,
  `ordecotaunidprod_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`moviprod_codigoid`),
  KEY `fk_movimentacaoproduto_movimentacao1` (`movi_codigoid`),
  KEY `fk_movimentacaoproduto_estoqueproduto1` (`estoprod_codigoid`),
  KEY `fk_movimentacaoproduto_lote1` (`lote_codigoid`),
  KEY `fk_movimentacaoproduto_ordemcotacaounidadeproduto1` (`ordecotaunidprod_codigoid`),
  CONSTRAINT `fk_movimentacaoproduto_estoqueproduto1` FOREIGN KEY (`estoprod_codigoid`) REFERENCES `estoqueproduto` (`estoprod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacaoproduto_lote1` FOREIGN KEY (`lote_codigoid`) REFERENCES `lote` (`lote_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacaoproduto_movimentacao1` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacaoproduto_ordemcotacaounidadeproduto1` FOREIGN KEY (`ordecotaunidprod_codigoid`) REFERENCES `ordemcotacaounidadeproduto` (`ordecotaunidprod`)
) ENGINE=InnoDB AUTO_INCREMENT=2103129 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `movimentacaoproduto_BEFORE_INSERT` BEFORE INSERT ON `movimentacaoproduto` FOR EACH ROW
BEGIN
	SET NEW.moviprod_valor=(SELECT
        IFNULL(valor_lote(NEW.lote_codigoid),
        IFNULL(valor_ordem(ep.prod_codigoid),
        IFNULL(valor_cotacao(ep.prod_codigoid),
        0.00)))
        AS valor
    FROM estoqueproduto ep WHERE estoprod_codigoid = NEW.estoprod_codigoid LIMIT 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ncm`
--

DROP TABLE IF EXISTS `ncm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ncm` (
  `ncm_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ncm_ncm` varchar(15) NOT NULL,
  `ncm_pai` int(11) DEFAULT NULL,
  `ncm_descricao` varchar(255) NOT NULL,
  `ncm_ipi` decimal(5,2) NOT NULL,
  `ncm_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ncm_dataalteracao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ncm_codigoid`),
  KEY `fk_ncm_ncm1` (`ncm_pai`),
  CONSTRAINT `fk_ncm_ncm1` FOREIGN KEY (`ncm_pai`) REFERENCES `ncm` (`ncm_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14415 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nf_recebimento`
--

DROP TABLE IF EXISTS `nf_recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nf_recebimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nf_cod` int(15) NOT NULL,
  `nf_serie` varchar(3) NOT NULL,
  `nf_emissao` datetime NOT NULL,
  `nf_cnpj` bigint(14) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_chave_nf` (`nf_cod`,`nf_serie`,`nf_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=789249 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nf_recebimento_item`
--

DROP TABLE IF EXISTS `nf_recebimento_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nf_recebimento_item` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `prod_codigoid` varchar(15) DEFAULT NULL,
  `quantidade` double(22,0) unsigned NOT NULL,
  `valor_total` double(22,0) unsigned NOT NULL,
  `nf_recebimento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nf_recebimento_item` (`nf_recebimento_id`) USING BTREE,
  CONSTRAINT `fk_nf_recebimento_item` FOREIGN KEY (`nf_recebimento_id`) REFERENCES `nf_recebimento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35582484 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem`
--

DROP TABLE IF EXISTS `ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem` (
  `orde_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_codigoid` int(11) NOT NULL,
  `orde_dataentrega` timestamp NULL DEFAULT NULL,
  `orde_enderecoentrega` text,
  `orde_descricao` text,
  `orde_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usua_codigoid` int(11) NOT NULL,
  `usua_aprovador` int(11) DEFAULT NULL,
  `orde_dataprevista` datetime DEFAULT NULL,
  `orde_informacao_adicional` varchar(255) DEFAULT NULL,
  `orde_status_integracao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orde_codigoid`),
  KEY `fk_ordem_tipo1_idx` (`tipo_codigoid`),
  CONSTRAINT `fk_ordem_tipo1` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13932 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_aprovacao`
--

DROP TABLE IF EXISTS `ordem_aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_aprovacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_aprovacao_id` int(11) NOT NULL,
  `ordem_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `data_inclusao` datetime NOT NULL,
  `informacao_adicional` text,
  `usuario_aprovador` int(11) DEFAULT NULL,
  `data_ultima_atualizacao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordem_id` (`ordem_id`),
  KEY `tipo_aprovacao_id` (`tipo_aprovacao_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `ordem_aprovacao_ibfk_1` FOREIGN KEY (`ordem_id`) REFERENCES `ordem` (`orde_codigoid`),
  CONSTRAINT `ordem_aprovacao_ibfk_2` FOREIGN KEY (`tipo_aprovacao_id`) REFERENCES `tipo_aprovacao` (`id`),
  CONSTRAINT `ordem_aprovacao_ibfk_3` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`tipo_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=2334 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ordem_aprovacao_AUPD` BEFORE UPDATE ON `ordem_aprovacao`
FOR EACH ROW
	SET NEW.data_ultima_atualizacao := NOW(); */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ordem_endereco`
--

DROP TABLE IF EXISTS `ordem_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_endereco` (
  `orde_codigoid` int(11) NOT NULL,
  `ende_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`orde_codigoid`,`ende_codigoid`),
  KEY `orde_codigoid` (`orde_codigoid`),
  KEY `ende_codigoid` (`ende_codigoid`),
  CONSTRAINT `ordem_endereco_ibfk_1` FOREIGN KEY (`orde_codigoid`) REFERENCES `ordem` (`orde_codigoid`),
  CONSTRAINT `ordem_endereco_ibfk_2` FOREIGN KEY (`ende_codigoid`) REFERENCES `endereco` (`ende_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_interna`
--

DROP TABLE IF EXISTS `ordem_interna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_interna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `codigo` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_nf_entrada`
--

DROP TABLE IF EXISTS `ordem_nf_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_nf_entrada` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nf_doc` int(9) NOT NULL,
  `nf_serie` varchar(3) NOT NULL,
  `nf_status` varchar(1) NOT NULL,
  `orde_codigoid` int(11) NOT NULL,
  `nf_emissao` datetime NOT NULL,
  `nf_quantidade` decimal(10,2) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ordem_nf_entrada_ibfk1` (`orde_codigoid`),
  CONSTRAINT `fk_ordem_nf_entrada_ibfk1` FOREIGN KEY (`orde_codigoid`) REFERENCES `ordem` (`orde_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=764936 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordemcancelar`
--

DROP TABLE IF EXISTS `ordemcancelar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordemcancelar` (
  `ordecanc_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `ordecanc_motivo` varchar(255) NOT NULL,
  `ordecanc_motivofornecedor` varchar(255) NOT NULL,
  `ordecanc_usr` int(11) NOT NULL,
  `ordecanc_tipo` int(11) NOT NULL,
  `ordecanc_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orde_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`ordecanc_codigoid`)
) ENGINE=MyISAM AUTO_INCREMENT=1867 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordemcotacaounidadeproduto`
--

DROP TABLE IF EXISTS `ordemcotacaounidadeproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordemcotacaounidadeproduto` (
  `ordecotaunidprod` int(11) NOT NULL AUTO_INCREMENT,
  `orde_codigoid` int(11) NOT NULL,
  `cotaunidprod_codigoid` int(11) NOT NULL,
  `ordecotaunidprod_quantidade` decimal(10,2) DEFAULT NULL,
  `ordecotaunidprod_pedida` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ordecotaunidprod`),
  KEY `fk_ordemcotacaounidadeproduto_ordem1_idx` (`orde_codigoid`),
  KEY `fk_ordemcotacaounidadeproduto_cotacaounidadeproduto1_idx` (`cotaunidprod_codigoid`),
  CONSTRAINT `fk_ordemcotacaounidadeproduto_cotacaounidadeproduto1` FOREIGN KEY (`cotaunidprod_codigoid`) REFERENCES `cotacaounidadeproduto` (`cotaunidprod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemcotacaounidadeproduto_ordem1` FOREIGN KEY (`orde_codigoid`) REFERENCES `ordem` (`orde_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19675 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordemmovimentacao`
--

DROP TABLE IF EXISTS `ordemmovimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordemmovimentacao` (
  `ordemovi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `movi_codigoid` int(11) NOT NULL,
  `orde_codigoid` int(11) NOT NULL,
  `ordemovi_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ordemovi_codigoid`),
  KEY `fk_orde_codigoid` (`orde_codigoid`),
  KEY `fk_movi_codigoid` (`movi_codigoid`),
  CONSTRAINT `ordemmovimentacao_ibfk_1` FOREIGN KEY (`orde_codigoid`) REFERENCES `ordem` (`orde_codigoid`),
  CONSTRAINT `ordemmovimentacao_ibfk_2` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=243096 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `pag_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `orde_codigoid` int(11) NOT NULL,
  `pag_parcela` int(11) NOT NULL,
  `pag_valorprevisto` decimal(10,2) NOT NULL,
  `pag_datainc` datetime NOT NULL,
  `pag_dataprevisto` datetime NOT NULL,
  `pag_dataefetivo` datetime DEFAULT NULL,
  `pag_valorefetivo` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`pag_codigoid`),
  KEY `orde_codigoid_idx` (`orde_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=14689 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pedi_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pedi_nome` varchar(255) NOT NULL,
  `pedi_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pedi_dataprazo` timestamp NULL DEFAULT NULL,
  `aut_usuario` int(11) NOT NULL,
  `pedistat_codigoid` int(11) NOT NULL DEFAULT '1',
  `pediarea_codigoid` int(11) NOT NULL,
  `unid_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pedi_codigoid`),
  KEY `area_codigoid` (`pediarea_codigoid`),
  KEY `unid_codigoid` (`unid_codigoid`),
  KEY `status` (`pedistat_codigoid`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`pediarea_codigoid`) REFERENCES `pedidoarea` (`pediarea_codigoid`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`),
  CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`pedistat_codigoid`) REFERENCES `pedidostatus` (`pedistat_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=55751 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedido_AINS` AFTER INSERT ON `pedido` FOR EACH ROW
begin
	SELECT proj_codigoid INTO @projId FROM projeto_pedido WHERE pedi_codigoid = NEW.pedi_codigoid;
	CALL calcularStatusProjeto(@projId);
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedido_AUPD` AFTER UPDATE ON `pedido` FOR EACH ROW
begin
	SELECT proj_codigoid INTO @projId FROM projeto_pedido WHERE pedi_codigoid = NEW.pedi_codigoid;
	CALL calcularStatusProjeto(@projId);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidoarea`
--

DROP TABLE IF EXISTS `pedidoarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoarea` (
  `pediarea_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pediarea_nome` varchar(255) NOT NULL,
  PRIMARY KEY (`pediarea_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidomovimentacao`
--

DROP TABLE IF EXISTS `pedidomovimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidomovimentacao` (
  `pedi_codigoid` int(11) NOT NULL,
  `movi_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`pedi_codigoid`,`movi_codigoid`),
  KEY `movi_codigoid` (`movi_codigoid`),
  CONSTRAINT `pedidomovimentacao_ibfk_1` FOREIGN KEY (`pedi_codigoid`) REFERENCES `pedido` (`pedi_codigoid`),
  CONSTRAINT `pedidomovimentacao_ibfk_2` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedidomovimentacao_AINS` AFTER INSERT ON `pedidomovimentacao` FOR EACH ROW
BEGIN
	UPDATE pedidoproduto SET pediprodstat_codigoid = CASE 
		WHEN pediprod_quantidade = 0 THEN 0
		WHEN pedidoproduto_entregue(pediprod_codigoid) >= pediprod_quantidade THEN 2
		WHEN pedidoproduto_entregue(pediprod_codigoid) < pediprod_quantidade THEN 3
		ELSE 1
	END WHERE pedi_codigoid = NEW.pedi_codigoid AND pediprodstat_codigoid != 5;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidoproduto`
--

DROP TABLE IF EXISTS `pedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoproduto` (
  `pediprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pedi_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  `pediprod_quantidade` float NOT NULL,
  `pediprodstat_codigoid` int(11) NOT NULL,
  `pediprodmot_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pediprod_codigoid`),
  KEY `prod_codigoid` (`prod_codigoid`),
  KEY `pediprodstat_codigoid` (`pediprodstat_codigoid`),
  KEY `pedi_codigoid` (`pedi_codigoid`),
  KEY `pedidoproduto_ibfk_7` (`pediprodmot_codigoid`),
  CONSTRAINT `pedidoproduto_ibfk_3` FOREIGN KEY (`pediprodstat_codigoid`) REFERENCES `pedidoprodutostatus` (`pediprodstat_codigoid`),
  CONSTRAINT `pedidoproduto_ibfk_5` FOREIGN KEY (`pedi_codigoid`) REFERENCES `pedido` (`pedi_codigoid`),
  CONSTRAINT `pedidoproduto_ibfk_6` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`),
  CONSTRAINT `pedidoproduto_ibfk_7` FOREIGN KEY (`pediprodmot_codigoid`) REFERENCES `pedidoprodutomotivo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123636 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedidoproduto_AINS` AFTER INSERT ON `pedidoproduto` FOR EACH ROW
BEGIN
SET @naoFinalizados = (SELECT COUNT(pediprod_codigoid) FROM pedidoproduto WHERE pediprodstat_codigoid NOT IN (2, 5) AND pedi_codigoid=NEW.pedi_codigoid);
SET @temNaoRespondida = (SELECT COUNT(pedireje_codigoid) > 0 FROM pedidorejeicao WHERE pedireje_aceito IS NULL AND pedi_codigoid = NEW.pedi_codigoid);

IF @temNaoRespondida THEN 
	CALL atualizaStatusPedido(NEW.pedi_codigoid, 2);
ELSEIF @naoFinalizados = 0 THEN 
	SET @naoCancelados  = (SELECT COUNT(pediprod_codigoid) FROM pedidoproduto WHERE pediprodstat_codigoid != 5 AND pedi_codigoid=NEW.pedi_codigoid);
	IF @naoCancelados > 0 THEN
		CALL atualizaStatusPedido(NEW.pedi_codigoid, 3);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedidoproduto_BUPD` BEFORE UPDATE ON `pedidoproduto` FOR EACH ROW
BEGIN
	SET @pediprod_separado = pedidoproduto_entregue(NEW.pediprod_codigoid);
	SET NEW.pediprodstat_codigoid = CASE 
		WHEN NEW.pediprodstat_codigoid != OLD.pediprodstat_codigoid THEN NEW.pediprodstat_codigoid
		WHEN OLD.pediprodstat_codigoid = 5 AND OLD.pediprod_quantidade != NEW.pediprod_quantidade THEN 0
		WHEN NEW.pediprod_quantidade = 0 THEN NEW.pediprodstat_codigoid
		WHEN @pediprod_separado >= NEW.pediprod_quantidade THEN 2
		WHEN @pediprod_separado < NEW.pediprod_quantidade THEN 3
		ELSE 1
	END;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedidoproduto_AUPD` AFTER UPDATE ON `pedidoproduto` FOR EACH ROW
BEGIN
SET @naoFinalizados = (SELECT COUNT(pediprod_codigoid) FROM pedidoproduto WHERE pediprodstat_codigoid NOT IN (2, 5) AND pedi_codigoid=NEW.pedi_codigoid);
SET @temNaoRespondida = (SELECT COUNT(pedireje_codigoid) > 0 FROM pedidorejeicao WHERE pedireje_aceito IS NULL AND pedi_codigoid = NEW.pedi_codigoid);

IF @temNaoRespondida THEN 
	CALL atualizaStatusPedido(NEW.pedi_codigoid, 2);
ELSEIF @naoFinalizados = 0 THEN 
	SET @naoCancelados  = (SELECT COUNT(pediprod_codigoid) FROM pedidoproduto WHERE pediprodstat_codigoid != 5 AND pedi_codigoid=NEW.pedi_codigoid);
	IF @naoCancelados > 0 THEN
		CALL atualizaStatusPedido(NEW.pedi_codigoid, 3);
	END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidoprodutomotivo`
--

DROP TABLE IF EXISTS `pedidoprodutomotivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoprodutomotivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidoprodutostatus`
--

DROP TABLE IF EXISTS `pedidoprodutostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoprodutostatus` (
  `pediprodstat_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pediprodstat_nome` varchar(255) NOT NULL,
  `pediprodstat_editavel` tinyint(1) NOT NULL DEFAULT '0',
  `pediprodstat_removivel` tinyint(1) NOT NULL DEFAULT '0',
  `pediprodstat_substituivel` tinyint(1) NOT NULL DEFAULT '0',
  `pediprodstat_visivel` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pediprodstat_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidorejeicao`
--

DROP TABLE IF EXISTS `pedidorejeicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidorejeicao` (
  `pedireje_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pedi_codigoid` int(11) NOT NULL,
  `pediresp_codigoid` int(11) NOT NULL,
  `pedireje_justificativa` text NOT NULL,
  `pedireje_aceito` tinyint(1) DEFAULT NULL COMMENT 'true se cancelado, false se for ser alterado',
  `aut_usuarioinc` int(11) NOT NULL,
  `pedireje_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aut_usuarioresp` int(11) DEFAULT NULL,
  `pedireje_dataresp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pedireje_codigoid`),
  KEY `fk_pedireje_pediresp` (`pediresp_codigoid`),
  KEY `fk_pedireje_pedi` (`pedi_codigoid`),
  CONSTRAINT `pedidorejeicao_ibfk_1` FOREIGN KEY (`pedi_codigoid`) REFERENCES `pedido` (`pedi_codigoid`),
  CONSTRAINT `pedidorejeicao_ibfk_2` FOREIGN KEY (`pediresp_codigoid`) REFERENCES `pedidoresposta` (`pediresp_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=2340 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedidorejeicao_AINS` AFTER INSERT ON `pedidorejeicao` FOR EACH ROW
begin
	IF NEW.pedireje_aceito IS NULL THEN
		CALL atualizaStatusPedido(NEW.pedi_codigoid, 2);
	END IF;
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `pedidorejeicao_AUPD` AFTER UPDATE ON `pedidorejeicao` FOR EACH ROW
begin
	SET @temNaoRespondida = (SELECT COUNT(pedireje_codigoid) > 0 FROM pedidorejeicao WHERE pedireje_aceito IS NULL AND pedi_codigoid = NEW.pedi_codigoid);
	IF @temNaoRespondida THEN
		CALL atualizaStatusPedido(NEW.pedi_codigoid, 2);
	ELSE 
		CALL atualizaStatusPedido(NEW.pedi_codigoid, 1);
	END IF;
	IF NEW.pedireje_aceito = 1 THEN 
		CALL subtrairRejeicaoPedido(NEW.pedireje_codigoid);
	END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidorejeicaoproduto`
--

DROP TABLE IF EXISTS `pedidorejeicaoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidorejeicaoproduto` (
  `pedirejeprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `prod_codigoid` int(11) NOT NULL,
  `pedireje_codigoid` int(11) NOT NULL,
  `pedirejeprod_quantidade` float NOT NULL,
  PRIMARY KEY (`pedirejeprod_codigoid`),
  KEY `pedireje_codigoid` (`pedireje_codigoid`),
  KEY `prod_codigoid` (`prod_codigoid`),
  CONSTRAINT `pedidorejeicaoproduto_ibfk_2` FOREIGN KEY (`pedireje_codigoid`) REFERENCES `pedidorejeicao` (`pedireje_codigoid`),
  CONSTRAINT `pedidorejeicaoproduto_ibfk_3` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=10484 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidoresposta`
--

DROP TABLE IF EXISTS `pedidoresposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoresposta` (
  `pediresp_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pediresp_resposta` varchar(255) NOT NULL,
  PRIMARY KEY (`pediresp_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidostatus`
--

DROP TABLE IF EXISTS `pedidostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidostatus` (
  `pedistat_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `pedistat_nome` varchar(255) NOT NULL,
  `pedistat_editavel` tinyint(1) NOT NULL DEFAULT '0',
  `pedistat_pendente` tinyint(1) NOT NULL,
  PRIMARY KEY (`pedistat_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pop`
--

DROP TABLE IF EXISTS `pop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pop` (
  `id_pop` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `regional_responsavel` varchar(100) DEFAULT NULL,
  `compartilhado` varchar(5000) DEFAULT NULL,
  `processo_acesso` varchar(5000) DEFAULT NULL,
  `contato_falta_luz` varchar(150) DEFAULT NULL,
  `anatel_registro` varchar(100) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `gerador` varchar(50) DEFAULT NULL,
  `cag` varchar(50) DEFAULT NULL,
  `ativo` char(1) DEFAULT NULL,
  `ramal` char(4) DEFAULT NULL,
  `usuario_aprovador` varchar(50) DEFAULT NULL,
  `observacao_aprovador` varchar(500) DEFAULT NULL,
  `data_aprovador` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pop`)
) ENGINE=InnoDB AUTO_INCREMENT=2623 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popautonomia`
--

DROP TABLE IF EXISTS `popautonomia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popautonomia` (
  `id_autonomia` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) DEFAULT NULL,
  `data_calculo` datetime DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `autonomia` float DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_autonomia`),
  KEY `id_pop` (`id_pop`)
) ENGINE=MyISAM AUTO_INCREMENT=2868 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popbateria`
--

DROP TABLE IF EXISTS `popbateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popbateria` (
  `id_baterias` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `modelo` varchar(200) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `usuario` varchar(80) DEFAULT NULL,
  `erro` varchar(5000) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `movimentacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_baterias`),
  KEY `id_pop` (`id_pop`),
  CONSTRAINT `popbateria_ibfk_1` FOREIGN KEY (`id_pop`) REFERENCES `pop` (`id_pop`)
) ENGINE=InnoDB AUTO_INCREMENT=6141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popconcessionaria`
--

DROP TABLE IF EXISTS `popconcessionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popconcessionaria` (
  `id_concessionaria` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) DEFAULT NULL,
  `id_nome_concessionaria` int(11) DEFAULT NULL,
  `fase` int(11) DEFAULT NULL,
  `tensao` int(11) DEFAULT NULL,
  `medidor` varchar(10) DEFAULT NULL,
  `ligacao` varchar(50) DEFAULT NULL,
  `titular` varchar(200) DEFAULT NULL,
  `paga_conta` varchar(200) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `usuario` varchar(80) DEFAULT NULL,
  `usuario_aprovador` varchar(50) DEFAULT NULL,
  `observacao_aprovador` varchar(500) DEFAULT NULL,
  `data_aprovador` datetime DEFAULT NULL,
  PRIMARY KEY (`id_concessionaria`),
  KEY `id_nome_concessionaria` (`id_nome_concessionaria`),
  KEY `id_pop` (`id_pop`),
  CONSTRAINT `popconcessionaria_ibfk_1` FOREIGN KEY (`id_nome_concessionaria`) REFERENCES `popnomeconcessionaria` (`id_nome_concessionaria`),
  CONSTRAINT `popconcessionaria_ibfk_2` FOREIGN KEY (`id_pop`) REFERENCES `pop` (`id_pop`)
) ENGINE=InnoDB AUTO_INCREMENT=2660 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popconsumo`
--

DROP TABLE IF EXISTS `popconsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popconsumo` (
  `id_consumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) DEFAULT NULL,
  `consumo_dc` varchar(20) DEFAULT NULL,
  `data_leitura` datetime DEFAULT NULL,
  `leitura1` varchar(50) DEFAULT NULL,
  `leitura2` varchar(50) DEFAULT NULL,
  `estimativa_tempo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_consumo`),
  KEY `id_pop` (`id_pop`),
  CONSTRAINT `popconsumo_ibfk_1` FOREIGN KEY (`id_pop`) REFERENCES `pop` (`id_pop`)
) ENGINE=InnoDB AUTO_INCREMENT=2868 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popestruturafisica`
--

DROP TABLE IF EXISTS `popestruturafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popestruturafisica` (
  `id_estrutura_fisica` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) DEFAULT NULL,
  `id_tipo_rf` int(11) DEFAULT NULL,
  `id_tipo_abrigo` int(11) DEFAULT NULL,
  `altura` varchar(15) DEFAULT NULL,
  `andares` int(11) DEFAULT NULL,
  `abordagemFO` varchar(100) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `usuario` varchar(80) DEFAULT NULL,
  `usuario_aprovador` varchar(50) DEFAULT NULL,
  `observacao_aprovador` varchar(500) DEFAULT NULL,
  `data_aprovador` datetime DEFAULT NULL,
  `feed_energia` smallint(6) DEFAULT '0',
  `biometria` smallint(6) DEFAULT '0',
  `chaves_acesso` smallint(6) DEFAULT NULL,
  `alcance_radio` int(11) NOT NULL DEFAULT '0',
  `possui_radio` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estrutura_fisica`),
  KEY `id_tipo_rf` (`id_tipo_rf`),
  KEY `id_tipo_abrigo` (`id_tipo_abrigo`),
  KEY `id_pop` (`id_pop`),
  CONSTRAINT `popestruturafisica_ibfk_2` FOREIGN KEY (`id_tipo_rf`) REFERENCES `poptiporf` (`id_tipo_rf`),
  CONSTRAINT `popestruturafisica_ibfk_3` FOREIGN KEY (`id_tipo_abrigo`) REFERENCES `poptipoabrigo` (`id_tipo_abrigo`),
  CONSTRAINT `popestruturafisica_ibfk_4` FOREIGN KEY (`id_pop`) REFERENCES `pop` (`id_pop`)
) ENGINE=InnoDB AUTO_INCREMENT=2499 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poplocalizacao`
--

DROP TABLE IF EXISTS `poplocalizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poplocalizacao` (
  `id_localizacao` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(100) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `referencia` varchar(500) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude_maps` varchar(20) DEFAULT NULL,
  `longitude_maps` varchar(20) DEFAULT NULL,
  `telefone1` varchar(20) DEFAULT NULL,
  `telefone2` varchar(20) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `uf` varchar(200) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `complemento_numero` varchar(15) DEFAULT NULL,
  `locale_codigoid` int(11) DEFAULT NULL COMMENT 'Billing.locale ',
  PRIMARY KEY (`id_localizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3044 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popnomeconcessionaria`
--

DROP TABLE IF EXISTS `popnomeconcessionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popnomeconcessionaria` (
  `id_nome_concessionaria` int(11) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(15) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_nome_concessionaria`)
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poprelacaolocalizacao`
--

DROP TABLE IF EXISTS `poprelacaolocalizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poprelacaolocalizacao` (
  `id_pop_localizacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_pop` int(11) DEFAULT NULL,
  `id_localizacao` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `Usuario` varchar(80) DEFAULT NULL,
  `usuario_aprovador` varchar(50) DEFAULT NULL,
  `observacao_aprovador` varchar(500) DEFAULT NULL,
  `data_aprovador` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pop_localizacao`),
  KEY `id_pop` (`id_pop`),
  KEY `id_localizacao` (`id_localizacao`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `poprelacaolocalizacao_ibfk_1` FOREIGN KEY (`id_pop`) REFERENCES `pop` (`id_pop`),
  CONSTRAINT `poprelacaolocalizacao_ibfk_2` FOREIGN KEY (`id_localizacao`) REFERENCES `poplocalizacao` (`id_localizacao`),
  CONSTRAINT `poprelacaolocalizacao_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `poptipolocalizacao` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3558 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poptipoabrigo`
--

DROP TABLE IF EXISTS `poptipoabrigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poptipoabrigo` (
  `id_tipo_abrigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_abrigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poptipolocalizacao`
--

DROP TABLE IF EXISTS `poptipolocalizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poptipolocalizacao` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poptiporf`
--

DROP TABLE IF EXISTS `poptiporf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poptiporf` (
  `id_tipo_rf` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_rf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `preco_medio`
--

DROP TABLE IF EXISTS `preco_medio`;
/*!50001 DROP VIEW IF EXISTS `preco_medio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `preco_medio` AS SELECT 
 1 AS `preco_medio`,
 1 AS `prod_codigoid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prod_similar_produto`
--

DROP TABLE IF EXISTS `prod_similar_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_similar_produto` (
  `prod_simila_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `similar_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  `data_inc` date DEFAULT NULL,
  PRIMARY KEY (`prod_simila_codigoid`),
  KEY `fk_produto_similar_has_produto_produto1_idx` (`prod_codigoid`),
  KEY `fk_produto_similar_has_produto_produto_similar1_idx` (`similar_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `prod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `cate_codigoid` int(11) NOT NULL,
  `medi_codigoid` int(11) NOT NULL,
  `ncm_codigoid` int(11) DEFAULT NULL,
  `prod_nome` varchar(255) NOT NULL,
  `prod_descricao` text,
  `prod_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `prod_islance` tinyint(1) DEFAULT NULL,
  `nome_nfe` varchar(200) DEFAULT NULL,
  `prod_garantia_estendida` tinyint(1) DEFAULT '0',
  `prod_importado` tinyint(1) DEFAULT '0',
  `prod_origem` varchar(255) DEFAULT NULL,
  `prod_classificacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prod_codigoid`),
  KEY `fk_produto_categoria` (`cate_codigoid`),
  KEY `fk_produto_medida1` (`medi_codigoid`),
  KEY `fk_produto_ncm1` (`ncm_codigoid`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`cate_codigoid`) REFERENCES `categoria` (`cate_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_medida1` FOREIGN KEY (`medi_codigoid`) REFERENCES `medida` (`medi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_ncm1` FOREIGN KEY (`ncm_codigoid`) REFERENCES `ncm` (`ncm_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto_similar`
--

DROP TABLE IF EXISTS `produto_similar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_similar` (
  `produto_similar_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `data_inc` date DEFAULT NULL,
  PRIMARY KEY (`produto_similar_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `proj_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `proj_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aut_usuario` int(11) NOT NULL,
  `proj_observacao` text,
  `proj_documento` text,
  `pedistat_codigoid` int(11) NOT NULL DEFAULT '1',
  `desig_codigoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`proj_codigoid`),
  KEY `aut_usuario` (`aut_usuario`),
  KEY `pedistat_codigoid` (`pedistat_codigoid`),
  KEY `desig_codigodi` (`desig_codigoid`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`pedistat_codigoid`) REFERENCES `pedidostatus` (`pedistat_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=18512 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projeto_pedido`
--

DROP TABLE IF EXISTS `projeto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_pedido` (
  `proj_codigoid` int(11) NOT NULL,
  `pedi_codigoid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`proj_codigoid`,`pedi_codigoid`),
  CONSTRAINT `projeto_pedido_ibfk_1` FOREIGN KEY (`proj_codigoid`) REFERENCES `projeto` (`proj_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `projeto_pedido_AINS` AFTER INSERT ON `projeto_pedido` FOR EACH ROW
	CALL calcularStatusProjeto(NEW.proj_codigoid) */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `projeto_pedido_AUPD` AFTER UPDATE ON `projeto_pedido` FOR EACH ROW
	CALL calcularStatusProjeto(NEW.proj_codigoid) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `remessa`
--

DROP TABLE IF EXISTS `remessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rem_data_criacao` datetime NOT NULL,
  `rem_data_retorno` datetime DEFAULT NULL,
  `rem_arquivo_fornecedores` varchar(255) NOT NULL,
  `rem_arquivo_produtos` varchar(255) NOT NULL,
  `rem_arquivo_pedidos` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessa_ordem`
--

DROP TABLE IF EXISTS `remessa_ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessa_ordem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rem_id` int(11) NOT NULL,
  `orde_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_ordem_ordem_ibfk1` (`orde_codigoid`),
  KEY `remessa_ordem_remessa_ibfk1` (`rem_id`),
  CONSTRAINT `remessa_ordem_ordem_ibfk1` FOREIGN KEY (`orde_codigoid`) REFERENCES `ordem` (`orde_codigoid`),
  CONSTRAINT `remessa_ordem_remessa_ibfk1` FOREIGN KEY (`rem_id`) REFERENCES `remessa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3641 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessa_ordem_log`
--

DROP TABLE IF EXISTS `remessa_ordem_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessa_ordem_log` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_remessa_ordem` int(11) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_ordem_log_ibfk1` (`id_remessa_ordem`),
  CONSTRAINT `remessa_ordem_log_ibfk1` FOREIGN KEY (`id_remessa_ordem`) REFERENCES `remessa_ordem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89870 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessa_recebimento`
--

DROP TABLE IF EXISTS `remessa_recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessa_recebimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime NOT NULL,
  `data_retorno` datetime DEFAULT NULL,
  `arquivo_recebimento` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessa_recebimento_ordem`
--

DROP TABLE IF EXISTS `remessa_recebimento_ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessa_recebimento_ordem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ordem` int(11) NOT NULL,
  `id_remessa_recebimento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_remessa_recebimento` (`id_remessa_recebimento`),
  KEY `id_ordem` (`id_ordem`),
  CONSTRAINT `remessa_recebimento_ordem_ibfk_1` FOREIGN KEY (`id_remessa_recebimento`) REFERENCES `remessa_recebimento` (`id`),
  CONSTRAINT `remessa_recebimento_ordem_ibfk_2` FOREIGN KEY (`id_ordem`) REFERENCES `ordem` (`orde_codigoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessa_recebimento_ordem_log`
--

DROP TABLE IF EXISTS `remessa_recebimento_ordem_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessa_recebimento_ordem_log` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_remessa_recebimento_ordem` int(11) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_remessa_recebimento_ordem` (`id_remessa_recebimento_ordem`),
  CONSTRAINT `remessa_recebimento_ordem_log_ibfk_1` FOREIGN KEY (`id_remessa_recebimento_ordem`) REFERENCES `remessa_recebimento_ordem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessamovi`
--

DROP TABLE IF EXISTS `remessamovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessamovi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rem_data_criacao` datetime NOT NULL,
  `rem_data_retorno` datetime DEFAULT NULL,
  `rem_arquivo_clientes` varchar(255) NOT NULL,
  `rem_arquivo_produtos` varchar(255) NOT NULL,
  `rem_arquivo_movimentacoes` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7024 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessamovi_movimentacao`
--

DROP TABLE IF EXISTS `remessamovi_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessamovi_movimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remmovi_id` int(11) NOT NULL,
  `movi_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remessamovi_movimentacao_movimentacao_ibfk1` (`movi_codigoid`),
  KEY `remessamovi_movimentacao_remessamovi_ibfk1` (`remmovi_id`),
  CONSTRAINT `remessamovi_movimentacao_movimentacao_ibfk1` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`),
  CONSTRAINT `remessamovi_movimentacao_remessamovi_ibfk1` FOREIGN KEY (`remmovi_id`) REFERENCES `remessamovi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11693 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remessamovi_movimentacao_log`
--

DROP TABLE IF EXISTS `remessamovi_movimentacao_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remessamovi_movimentacao_log` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_remessamovi_movimentacao` int(11) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remessamovi_movimentacao_log_ibfk1` (`id_remessamovi_movimentacao`),
  CONSTRAINT `remessamovi_movimentacao_log_ibfk1` FOREIGN KEY (`id_remessamovi_movimentacao`) REFERENCES `remessamovi_movimentacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52538 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saldodata`
--

DROP TABLE IF EXISTS `saldodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldodata` (
  `saldodata_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_codigoid` int(11) NOT NULL,
  `esto_codigoid` int(11) DEFAULT NULL,
  `saldodata_data` date NOT NULL,
  `saldodata_saldo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`saldodata_codigoid`),
  KEY `foreing_index1` (`tipo_codigoid`),
  KEY `foreing_index2` (`esto_codigoid`),
  CONSTRAINT `saldodata_ibfk_1` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `saldodata_ibfk_2` FOREIGN KEY (`esto_codigoid`) REFERENCES `estoque` (`esto_codigoid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16390148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao` (
  `soli_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  `soli_datainc` datetime NOT NULL,
  `usua_codigoid` int(11) NOT NULL,
  `soli_prazoentrerga` date DEFAULT NULL,
  `soli_ativo` tinyint(1) DEFAULT NULL,
  `soli_observacao` text,
  `soli_observacaofornecedor` text,
  `ordem_interna_id` int(11) DEFAULT NULL,
  `cad_user_filial` int(11) NOT NULL DEFAULT '24362',
  `centro_custo_id` int(11) DEFAULT NULL,
  `soli_limite` decimal(10,2) NOT NULL,
  `soli_endereco_entrega` text,
  `soli_cer` text,
  PRIMARY KEY (`soli_codigoid`),
  KEY `fk_solicitacao_unidade1` (`unid_codigoid`),
  KEY `solicitacao_ordem_interna_ibfk_1` (`ordem_interna_id`) USING BTREE,
  KEY `solicitacao_ibfk_1` (`centro_custo_id`),
  CONSTRAINT `fk_solicitacao_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `solicitacao_ibfk_1` FOREIGN KEY (`centro_custo_id`) REFERENCES `centro_custo` (`id`),
  CONSTRAINT `solicitacao_ordem_interna_ibfk_1` FOREIGN KEY (`ordem_interna_id`) REFERENCES `ordem_interna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12073 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `SOLICITACAO_APROVACAO` AFTER INSERT ON `solicitacao` FOR
EACH ROW
BEGIN
INSERT INTO luma.solicitacaoaprovacao (soli_codigoid, tipo_codigoid, usr_codigoid, soliapro_motivo,
soliapro_data, soliapro_datainc,tipo_aprovacao_id)
values(NEW.soli_codigoid, 78, NULL, NULL, NULL, CURRENT_TIMESTAMP,2);
if NEW.soli_limite > 3000 then
INSERT INTO luma.solicitacaoaprovacao (soli_codigoid, tipo_codigoid, usr_codigoid, soliapro_motivo,
soliapro_data, soliapro_datainc,tipo_aprovacao_id)
values(NEW.soli_codigoid, 78, NULL, NULL, NULL, CURRENT_TIMESTAMP,3);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `solicitacaoaprovacao`
--

DROP TABLE IF EXISTS `solicitacaoaprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacaoaprovacao` (
  `soliapro_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `soli_codigoid` int(11) NOT NULL,
  `tipo_codigoid` int(11) NOT NULL DEFAULT '78',
  `usr_codigoid` int(11) DEFAULT NULL,
  `soliapro_motivo` text,
  `soliapro_data` timestamp NULL DEFAULT NULL,
  `soliapro_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_aprovacao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`soliapro_codigoid`),
  KEY `soli_codigoid` (`soli_codigoid`),
  KEY `tipo_codigoid` (`tipo_codigoid`),
  KEY `fk_solicitacaoaprovacao_tipo_aprovacao_ibfk1` (`tipo_aprovacao_id`),
  CONSTRAINT `fk_solicitacaoaprovacao_tipo_aprovacao_ibfk1` FOREIGN KEY (`tipo_aprovacao_id`) REFERENCES `tipo_aprovacao` (`id`),
  CONSTRAINT `solicitacaoaprovacao_ibfk_1` FOREIGN KEY (`soli_codigoid`) REFERENCES `solicitacao` (`soli_codigoid`),
  CONSTRAINT `solicitacaoaprovacao_ibfk_2` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=18407 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitacaoproduto`
--

DROP TABLE IF EXISTS `solicitacaoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacaoproduto` (
  `soliprod_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `soli_codigoid` int(11) NOT NULL,
  `prod_codigoid` int(11) NOT NULL,
  `tipo_codigoid` int(11) NOT NULL DEFAULT '29',
  `soliprod_quantidade` float NOT NULL,
  PRIMARY KEY (`soliprod_codigoid`),
  KEY `fk_solicitacaoproduto_solicitacao1` (`soli_codigoid`),
  KEY `fk_solicitacaoproduto_produto1` (`prod_codigoid`),
  KEY `fk_solicitacaoproduto_tipo1` (`tipo_codigoid`),
  CONSTRAINT `fk_solicitacaoestoque_produto1` FOREIGN KEY (`prod_codigoid`) REFERENCES `produto` (`prod_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitacaoestoque_solicitacao1` FOREIGN KEY (`soli_codigoid`) REFERENCES `solicitacao` (`soli_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitacaoproduto_tipo1` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32018 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testejob`
--

DROP TABLE IF EXISTS `testejob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testejob` (
  `data` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2015 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `tipo_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_nome` varchar(45) NOT NULL,
  `tipo_tipo` int(11) NOT NULL,
  PRIMARY KEY (`tipo_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_aprovacao`
--

DROP TABLE IF EXISTS `tipo_aprovacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_aprovacao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipounidade`
--

DROP TABLE IF EXISTS `tipounidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipounidade` (
  `tipounid_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_codigoid` int(11) NOT NULL,
  `unid_codigoid` int(11) NOT NULL,
  PRIMARY KEY (`tipounid_codigoid`),
  UNIQUE KEY `tipo_codigoid` (`tipo_codigoid`,`unid_codigoid`),
  KEY `fk_tipounidade_tipo1` (`tipo_codigoid`),
  KEY `fk_tipounidade_unidade1` (`unid_codigoid`),
  CONSTRAINT `fk_tipounidade_tipo1` FOREIGN KEY (`tipo_codigoid`) REFERENCES `tipo` (`tipo_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipounidade_unidade1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60874 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade` (
  `unid_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_paicodigoid` int(11) DEFAULT NULL,
  `circ_codigoid` int(11) DEFAULT NULL,
  `endeentr_codigoid` int(11) DEFAULT NULL,
  `unid_nome` varchar(100) NOT NULL,
  `unid_stechcodigoid` int(11) DEFAULT NULL,
  `unid_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `unid_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `unid_oculto` tinyint(1) NOT NULL DEFAULT '0',
  `unid_localdeentrega` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`unid_codigoid`),
  KEY `fk_unidade_unidade1` (`unid_paicodigoid`),
  KEY `unid_ativo` (`unid_ativo`),
  KEY `unidade_circ_index` (`circ_codigoid`),
  CONSTRAINT `fk_unidade_unidade1` FOREIGN KEY (`unid_paicodigoid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60952 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER criaestoque AFTER INSERT ON unidade
 FOR EACH ROW BEGIN
    INSERT INTO estoque (unid_codigoid) VALUES (NEW.unid_codigoid);
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `unidadenotificacao`
--

DROP TABLE IF EXISTS `unidadenotificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadenotificacao` (
  `unidnoti_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unidresp_codigoid` int(11) NOT NULL,
  `movi_codigoid` int(11) NOT NULL,
  `unidnoti_enviada` tinyint(1) DEFAULT '0' COMMENT 'Significa o envio para a TABELA de email. Nada além disto.',
  PRIMARY KEY (`unidnoti_codigoid`),
  KEY `unidnoti_unidresp_fk` (`unidresp_codigoid`),
  KEY `unidnoti_movi_fk` (`movi_codigoid`),
  CONSTRAINT `fk1` FOREIGN KEY (`unidresp_codigoid`) REFERENCES `unidaderesponsavel` (`unidresp_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=228187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidaderesponsavel`
--

DROP TABLE IF EXISTS `unidaderesponsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidaderesponsavel` (
  `unidresp_codigoid` int(11) NOT NULL AUTO_INCREMENT,
  `unid_codigoid` int(11) NOT NULL,
  `unidresp_datacadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Precisa ser o horario da modificação',
  `caduser_codigoid` int(11) DEFAULT NULL,
  `unidresp_digest` tinyint(1) NOT NULL,
  PRIMARY KEY (`unidresp_codigoid`),
  KEY `unidresp_esto_fk` (`unid_codigoid`),
  CONSTRAINT `unidaderesponsavel_ibfk_1` FOREIGN KEY (`unid_codigoid`) REFERENCES `unidade` (`unid_codigoid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viat_cor_predominante`
--

DROP TABLE IF EXISTS `viat_cor_predominante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viat_cor_predominante` (
  `id_viat_cor_predominante` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL DEFAULT 'INDEFINIDA',
  PRIMARY KEY (`id_viat_cor_predominante`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura`
--

DROP TABLE IF EXISTS `viatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura` (
  `viaturaid` int(11) NOT NULL AUTO_INCREMENT,
  `viat_cad_usuarioid` int(11) NOT NULL,
  `viat_numero` int(11) NOT NULL,
  `viat_unidadeid` int(11) DEFAULT NULL,
  `viat_modeloid` int(11) NOT NULL,
  `viat_ano_fabricacao` int(4) DEFAULT NULL,
  `viat_ano_modelo` int(4) DEFAULT NULL,
  `viat_especie_id` int(11) DEFAULT NULL,
  `id_viat_cor_predominante` int(11) DEFAULT NULL,
  `viat_placa` varchar(45) NOT NULL,
  `viat_renavan` varchar(45) NOT NULL,
  `viat_chassi` varchar(45) NOT NULL,
  `viat_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `viat_passageiro` int(2) DEFAULT NULL,
  `viat_combustivel` varchar(45) DEFAULT NULL,
  `viat_ativo` tinyint(1) DEFAULT '1',
  `viat_reboque` tinyint(1) DEFAULT NULL,
  `viat_id_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`viaturaid`),
  KEY `fk_viatura_modelo1_idx` (`viat_modeloid`),
  KEY `fk_viatura_unidade_idx` (`viat_unidadeid`),
  CONSTRAINT `fk_marca_modelo` FOREIGN KEY (`viat_modeloid`) REFERENCES `viatura_modelo` (`viat_modeloid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidade_viatura` FOREIGN KEY (`viat_unidadeid`) REFERENCES `unidade` (`unid_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_alienacao`
--

DROP TABLE IF EXISTS `viatura_alienacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_alienacao` (
  `viatura_alienacaoid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `alie_user_alienado` int(11) DEFAULT NULL,
  `alie_cad_usuarioid` int(11) DEFAULT NULL,
  `alie_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `alie_data_prevista` timestamp NULL DEFAULT NULL,
  `alie_data_final` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`viatura_alienacaoid`),
  KEY `fk_viatura_alienacao_viatura1_idx` (`viaturaid`),
  CONSTRAINT `fk_viatura` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_apolice_seguro`
--

DROP TABLE IF EXISTS `viatura_apolice_seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_apolice_seguro` (
  `viat_apoliceid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `apoli_cad_usersid` int(11) NOT NULL,
  `apoli_numero` varchar(100) DEFAULT NULL,
  `apoli_fone_atendimento` varchar(45) DEFAULT NULL,
  `apoli_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `apoli_data_vencimento` timestamp NULL DEFAULT NULL,
  `apoli_datafim` timestamp NULL DEFAULT NULL,
  `apoli_sistechcid` int(11) DEFAULT NULL,
  PRIMARY KEY (`viat_apoliceid`),
  KEY `fk_apolice_viatura1_idx` (`viaturaid`),
  CONSTRAINT `fk_viatura_aplice` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_baixa`
--

DROP TABLE IF EXISTS `viatura_baixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_baixa` (
  `viat_baixaid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `baixa_cad_usuarioid` int(11) NOT NULL,
  `baixa_motivo` varchar(255) NOT NULL,
  `baixa_destino_sistechid` int(11) NOT NULL,
  `baixa_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `baixa_data_prevista` timestamp NULL DEFAULT NULL,
  `baixa_datafim` timestamp NULL DEFAULT NULL,
  `baixa_permanente` tinyint(1) DEFAULT NULL,
  `observacao_retorno` varchar(255) DEFAULT NULL,
  `baixa_retorno_usuarioid` int(11) DEFAULT NULL,
  `baixa_valor` decimal(10,2) DEFAULT NULL,
  `quilometragem_saida` int(11) DEFAULT NULL,
  `quilometragem_retorno` int(11) DEFAULT NULL,
  `baixa_tipo` int(11) NOT NULL,
  PRIMARY KEY (`viat_baixaid`),
  KEY `fk_baixa_viatura1_idx` (`viaturaid`),
  KEY `fk_viatura_baixa_1_idx` (`quilometragem_saida`),
  KEY `fk_viatura_baixa_2_idx` (`quilometragem_retorno`),
  CONSTRAINT `fk_viatura_` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_baixa_1` FOREIGN KEY (`quilometragem_saida`) REFERENCES `viatura_quilometragem` (`viat_quilometragemid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_baixa_2` FOREIGN KEY (`quilometragem_retorno`) REFERENCES `viatura_quilometragem` (`viat_quilometragemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_cad_user_ultilizador`
--

DROP TABLE IF EXISTS `viatura_cad_user_ultilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_cad_user_ultilizador` (
  `viat_cad_user_ultilizadorid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `cad_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `data_inc` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`viat_cad_user_ultilizadorid`),
  KEY `fk_viatura_cad_user_ultilizador_viatura_idx` (`viaturaid`),
  KEY `fk_viatura_cad_user_ultilizador_cad_user_idx` (`cad_user_id`),
  CONSTRAINT `fk_viatura_cad_user_ultilizador_cad_user` FOREIGN KEY (`cad_user_id`) REFERENCES `gcdb`.`cad_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_cad_user_ultilizador_viatura` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1099 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_credencial`
--

DROP TABLE IF EXISTS `viatura_credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_credencial` (
  `viat_cartaoid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `credenci_tipo` int(11) DEFAULT NULL,
  `credenci_cad_usuarioid` int(11) DEFAULT NULL,
  `credenci_datainc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credenci_numero` varchar(45) DEFAULT NULL,
  `credenci_data_vencimento` timestamp NULL DEFAULT NULL,
  `credenci_datafim` timestamp NULL DEFAULT NULL,
  `credenci_observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`viat_cartaoid`),
  KEY `fk_cartao_chip_viatura1_idx` (`viaturaid`),
  KEY `fk_credencial_tipo_idx` (`credenci_tipo`),
  CONSTRAINT `fk_viatura_credencial` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_destinatario`
--

DROP TABLE IF EXISTS `viatura_destinatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_destinatario` (
  `viat_cad_usuarioid` int(11) NOT NULL COMMENT 'Id do usuário',
  PRIMARY KEY (`viat_cad_usuarioid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_documento`
--

DROP TABLE IF EXISTS `viatura_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_documento` (
  `viat_documentoid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `doc_cad_usuarioid` int(11) DEFAULT NULL,
  `tipo_documento` int(11) DEFAULT NULL,
  `doc_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `doc_vencimento` timestamp NULL DEFAULT NULL,
  `doc_imagem` varchar(255) DEFAULT NULL,
  `doc_principal` tinyint(1) DEFAULT NULL,
  `doc_numero` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`viat_documentoid`),
  KEY `fk_documento_tipo_idx` (`tipo_documento`),
  KEY `fk_proprietario_idx` (`viaturaid`),
  CONSTRAINT `fk_proprietario` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=760 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_especie`
--

DROP TABLE IF EXISTS `viatura_especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_especie` (
  `viat_especie_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`viat_especie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_limite`
--

DROP TABLE IF EXISTS `viatura_limite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_limite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viatura_id` int(11) NOT NULL,
  `limite` decimal(7,2) NOT NULL,
  `author` int(11) NOT NULL,
  `date_record` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viatura_id` (`viatura_id`),
  CONSTRAINT `viatura_limite_ibfk_1` FOREIGN KEY (`viatura_id`) REFERENCES `viatura` (`viaturaid`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_marca`
--

DROP TABLE IF EXISTS `viatura_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_marca` (
  `viat_marcaid` int(11) NOT NULL AUTO_INCREMENT,
  `marca_cad_usuarioid` int(11) DEFAULT NULL,
  `marca_nome` varchar(128) NOT NULL,
  `marca_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `marca_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`viat_marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_modelo`
--

DROP TABLE IF EXISTS `viatura_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_modelo` (
  `viat_modeloid` int(11) NOT NULL AUTO_INCREMENT,
  `viat_marcaid` int(11) NOT NULL,
  `model_cad_usuarioid` int(11) DEFAULT NULL,
  `model_cnh` varchar(5) DEFAULT NULL,
  `modelo` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `model_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `model_imagem` varchar(255) DEFAULT NULL,
  `model_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`viat_modeloid`),
  KEY `fk_modelo_marca_viatura1_idx` (`viat_marcaid`),
  CONSTRAINT `fk_modelo_marcar_v` FOREIGN KEY (`viat_marcaid`) REFERENCES `viatura_marca` (`viat_marcaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_motorista`
--

DROP TABLE IF EXISTS `viatura_motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_motorista` (
  `id_viatura_motorista` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `registrante` int(11) NOT NULL,
  `rh_id_documento` int(11) NOT NULL,
  `movi_codigoid` int(11) DEFAULT NULL,
  `id_colaborador` int(11) NOT NULL,
  `assinado` tinyint(1) NOT NULL,
  `id_colaborador_aprovador` int(11) DEFAULT NULL,
  `data_aprovacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_inc` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id_viatura_motorista`),
  KEY `fk_viatura_motorista_idx` (`viaturaid`),
  KEY `fk_movime_motorista_idx` (`movi_codigoid`),
  KEY `fk_viatura_motorista_doc_idx` (`rh_id_documento`),
  KEY `fk_viatura_motorista_rh_colaborador_idx` (`id_colaborador`),
  KEY `fk_viatura_motorista_rh_colaborador_aprovador_idx` (`id_colaborador_aprovador`),
  CONSTRAINT `fk_movime_motorista` FOREIGN KEY (`movi_codigoid`) REFERENCES `movimentacao` (`movi_codigoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_motorista` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_motorista_rh_colaborador` FOREIGN KEY (`id_colaborador`) REFERENCES `rh`.`rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_motorista_rh_colaborador_aprovador` FOREIGN KEY (`id_colaborador_aprovador`) REFERENCES `rh`.`rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viatura_motorista_rh_documento` FOREIGN KEY (`rh_id_documento`) REFERENCES `rh`.`rh_documento` (`id_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_proprietario`
--

DROP TABLE IF EXISTS `viatura_proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_proprietario` (
  `viat_proprietario` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `prop_sistechcid` int(11) DEFAULT NULL,
  `prop_cad_usuarioid` int(11) NOT NULL,
  `prop_alteracao_usuarioid` int(11) DEFAULT NULL,
  `prop_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `prop_data_alteracao` timestamp NULL DEFAULT NULL,
  `prop_motivo_alteracao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`viat_proprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_quilometragem`
--

DROP TABLE IF EXISTS `viatura_quilometragem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_quilometragem` (
  `viat_quilometragemid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `quilome_tipo_leitura` int(11) DEFAULT NULL,
  `quilome_cad_usuarioid` int(11) DEFAULT NULL,
  `quilometragem` varchar(100) DEFAULT NULL,
  `quilome_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`viat_quilometragemid`),
  KEY `fk_kilometragem_viatura1_idx` (`viaturaid`),
  KEY `fk_kilometragem_tipo_idx` (`quilome_tipo_leitura`),
  CONSTRAINT `fk_quilometra` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=752 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_rastreador`
--

DROP TABLE IF EXISTS `viatura_rastreador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_rastreador` (
  `viat_rastreadorid` int(11) NOT NULL AUTO_INCREMENT,
  `viaturaid` int(11) NOT NULL,
  `rast_cad_usuarioid` int(11) DEFAULT NULL,
  `rast_usuarioid_alteracao` int(11) DEFAULT NULL,
  `rast_motivo_alteracao` varchar(255) DEFAULT NULL,
  `rast_data_alteracao` timestamp NULL DEFAULT NULL,
  `rast_datainc` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rast_numero` varchar(100) DEFAULT NULL,
  `rast_chip` varchar(45) DEFAULT NULL,
  `rast_chip_numero` varchar(45) DEFAULT NULL,
  `rast_operadora` varchar(50) NOT NULL,
  `rast_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`viat_rastreadorid`),
  KEY `fk_viatura_rastreador_viatura1_idx` (`viaturaid`),
  CONSTRAINT `fk_viatura_rastr` FOREIGN KEY (`viaturaid`) REFERENCES `viatura` (`viaturaid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viatura_saldo`
--

DROP TABLE IF EXISTS `viatura_saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viatura_saldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viatura_id` int(11) NOT NULL,
  `viatura_placa` varchar(10) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `date_record` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `viatura_id` (`viatura_id`),
  CONSTRAINT `viatura_saldo_ibfk_1` FOREIGN KEY (`viatura_id`) REFERENCES `viatura` (`viaturaid`)
) ENGINE=InnoDB AUTO_INCREMENT=173868 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `view_produtos_adquiridos`
--

DROP TABLE IF EXISTS `view_produtos_adquiridos`;
/*!50001 DROP VIEW IF EXISTS `view_produtos_adquiridos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_produtos_adquiridos` AS SELECT 
 1 AS `numero_nota`,
 1 AS `data_nota`,
 1 AS `cate_ordem`,
 1 AS `cate_nome`,
 1 AS `movi_codigoid`,
 1 AS `movi_datainc`,
 1 AS `movi_motivo`,
 1 AS `orde_codigoid`,
 1 AS `tipo_codigoid`,
 1 AS `orde_dataentrega`,
 1 AS `prod_codigoid`,
 1 AS `prod_nome`,
 1 AS `quantidade_produtos`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'luma'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `POP_BATERIA` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = latin1 */ ;;
/*!50003 SET character_set_results = latin1 */ ;;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE EVENT `POP_BATERIA` ON SCHEDULE EVERY 2 HOUR STARTS '2014-12-16 09:40:47' ON COMPLETION NOT PRESERVE ENABLE DO call atualizaHistoricoBateria() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_cotacao` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = latin1 */ ;;
/*!50003 SET character_set_results = latin1 */ ;;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE EVENT `update_cotacao` ON SCHEDULE EVERY 30 MINUTE STARTS '2013-02-13 15:56:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
UPDATE cotacao SET tipo_codigoid = 45 WHERE CURRENT_TIMESTAMP < cota_abertura AND tipo_codigoid != 35;
UPDATE cotacao SET tipo_codigoid = 31 WHERE CURRENT_TIMESTAMP BETWEEN cota_abertura AND cota_fechamento AND tipo_codigoid NOT IN (32,33,35,36);
UPDATE cotacao SET tipo_codigoid = 32 WHERE cota_codigoid IN (SELECT cota.cota_codigoid FROM (SELECT cota_codigoid FROM cotacao WHERE cota_fechamento < CURRENT_TIMESTAMP AND tipo_codigoid NOT IN (32,33,35,36)) AS cota LEFT JOIN cotacaounidade AS cotaunid ON (cota.cota_codigoid = cotaunid.cota_codigoid) WHERE cotaunid.cota_codigoid IS NULL);
UPDATE cotacao SET tipo_codigoid = 33 WHERE cota_codigoid IN (SELECT cota.cota_codigoid FROM (SELECT cota_codigoid FROM cotacao WHERE cota_fechamento < CURRENT_TIMESTAMP AND tipo_codigoid NOT IN (32,33,35,36)) AS cota INNER JOIN cotacaounidade AS cotaunid ON (cota.cota_codigoid = cotaunid.cota_codigoid) GROUP BY cota.cota_codigoid HAVING COUNT(cota.cota_codigoid) > 0);
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'luma'
--
/*!50003 DROP FUNCTION IF EXISTS `getCountMelhorOferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCountMelhorOferta`(IDCOTACAO INT, UNIDADE INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE quant INT;

		select count(melhor) INTO quant from (SELECT IF(temporario.menor >= MIN(UP.cotaunidprod_valorunitario), 'melhorOF', 'piorOF') as melhor
		FROM cotacaoproduto as CP 
		INNER JOIN produto as P ON(P.prod_codigoid = CP.prod_codigoid) 
		LEFT JOIN cotacaounidadeproduto as UP ON(UP.prod_codigoid = P.prod_codigoid) 
		INNER JOIN cotacaounidade AS U ON(U.cotaunid_codigoid = UP.cotaunid_codigoid) 
		INNER JOIN (SELECT MIN(cotaunidprod_valorunitario) AS menor, cotaunidprod.prod_codigoid, 
									IF(cotaunid.cotaunid_frete IS NULL , 'N', ROUND(cotaunid.cotaunid_frete/
									((SELECT SUM(cotaprod.cotaprod_quantidade) AS total FROM cotacao AS cota
									INNER JOIN cotacaoproduto AS cotaprod ON(cotaprod.cota_codigoid = cota.cota_codigoid)
									WHERE cota.cota_codigoid = IDCOTACAO)
									)*cotaunidprod.cotaunidprod_quantidade,2)+cotaunidprod.cotaunidprod_valortotal) AS subtotal2
								FROM cotacaounidadeproduto AS cotaunidprod
								INNER JOIN cotacaounidade AS cotaunid ON (cotaunid.cotaunid_codigoid = cotaunidprod.cotaunid_codigoid AND cotaunid.cota_codigoid= IDCOTACAO)
								GROUP BY cotaunidprod.prod_codigoid, cotaunid.cota_codigoid) AS temporario ON (temporario.prod_codigoid = UP.prod_codigoid)
		INNER JOIN(SELECT cotaunidprod.prod_codigoid, IF(cotaunid.cotaunid_frete IS NULL , 'N', ROUND(cotaunid.cotaunid_frete/
									((SELECT SUM(cotaprod.cotaprod_quantidade) AS total FROM cotacao AS cota
									INNER JOIN cotacaoproduto AS cotaprod ON(cotaprod.cota_codigoid = cota.cota_codigoid)
									WHERE cota.cota_codigoid = IDCOTACAO)
									)*cotaunidprod.cotaunidprod_quantidade,2)+cotaunidprod.cotaunidprod_valortotal) AS subtotal, cotaunidprod.cotaunidprod_quantidade FROM cotacaounidade AS cotaunid
									INNER JOIN cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
									WHERE unid_codigoid = UNIDADE AND cotaunid.cota_codigoid = IDCOTACAO) AS quantidade ON(quantidade.prod_codigoid = UP.prod_codigoid)
		WHERE U.cota_codigoid=IDCOTACAO AND U.unid_codigoid=UNIDADE
		GROUP BY P.prod_codigoid, U.cota_codigoid having melhor = 'melhorOF'
		ORDER BY P.prod_nome ASC ) as contar;

RETURN quant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCountPiorOferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCountPiorOferta`(IDCOTACAO INT, UNIDADE INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE quant INT;

		select count(melhor) INTO quant from (SELECT IF(temporario.menor >= MIN(UP.cotaunidprod_valorunitario), 'melhorOF', 'piorOF')
		FROM cotacaoproduto as CP 
		INNER JOIN produto as P ON(P.prod_codigoid = CP.prod_codigoid) 
		LEFT JOIN cotacaounidadeproduto as UP ON(UP.prod_codigoid = P.prod_codigoid) 
		INNER JOIN cotacaounidade AS U ON(U.cotaunid_codigoid = UP.cotaunid_codigoid) 
		INNER JOIN (SELECT MIN(cotaunidprod_valorunitario) AS menor, cotaunidprod.prod_codigoid, 
									IF(cotaunid.cotaunid_frete IS NULL , 'N', ROUND(cotaunid.cotaunid_frete/
									((SELECT SUM(cotaprod.cotaprod_quantidade) AS total FROM cotacao AS cota
									INNER JOIN cotacaoproduto AS cotaprod ON(cotaprod.cota_codigoid = cota.cota_codigoid)
									WHERE cota.cota_codigoid = IDCOTACAO)
									)*cotaunidprod.cotaunidprod_quantidade,2)+cotaunidprod.cotaunidprod_valortotal) AS subtotal2
								FROM cotacaounidadeproduto AS cotaunidprod
								INNER JOIN cotacaounidade AS cotaunid ON (cotaunid.cotaunid_codigoid = cotaunidprod.cotaunid_codigoid AND cotaunid.cota_codigoid= IDCOTACAO)
								GROUP BY cotaunidprod.prod_codigoid, cotaunid.cota_codigoid) AS temporario ON (temporario.prod_codigoid = UP.prod_codigoid)
		INNER JOIN(SELECT cotaunidprod.prod_codigoid, IF(cotaunid.cotaunid_frete IS NULL , 'N', ROUND(cotaunid.cotaunid_frete/
									((SELECT SUM(cotaprod.cotaprod_quantidade) AS total FROM cotacao AS cota
									INNER JOIN cotacaoproduto AS cotaprod ON(cotaprod.cota_codigoid = cota.cota_codigoid)
									WHERE cota.cota_codigoid = IDCOTACAO)
									)*cotaunidprod.cotaunidprod_quantidade,2)+cotaunidprod.cotaunidprod_valortotal) AS subtotal, cotaunidprod.cotaunidprod_quantidade FROM cotacaounidade AS cotaunid
									INNER JOIN cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
									WHERE unid_codigoid = UNIDADE AND cotaunid.cota_codigoid = IDCOTACAO) AS quantidade ON(quantidade.prod_codigoid = UP.prod_codigoid)
		WHERE U.cota_codigoid=IDCOTACAO AND U.unid_codigoid=UNIDADE
		GROUP BY P.prod_codigoid, U.cota_codigoid having melhor = 'piorOF'
		ORDER BY P.prod_nome ASC ) as contar;

RETURN quant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCountProdCotacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCountProdCotacao`(IDCOTACAO INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE quant INT;

		SELECT COUNT(cotaprod.cotaprod_codigoid) as quat INTO quant
		FROM cotacaoproduto as cotaprod
		WHERE cotaprod.cota_codigoid= IDCOTACAO;

RETURN quant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `MELHOR_COTACAO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `MELHOR_COTACAO`(unidCodigoid INT, cotaCodigoid INT) RETURNS varchar(50) CHARSET latin1
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
	DECLARE status_cotacao VARCHAR(50);
	DECLARE tipo_cotacao INTEGER DEFAULT 0;
	DECLARE dataInicio TIMESTAMP;
	DECLARE dataFinal TIMESTAMP;

	SELECT tipo_codigoid, cota_abertura, cota_fechamento INTO tipo_cotacao, dataInicio, dataFinal FROM luma.cotacao AS cota WHERE cota.cota_codigoid = cotaCodigoid;
	
	IF tipo_cotacao = 31 THEN
		EM_COTACAO: BEGIN
			DECLARE prod_codigoid INTEGER DEFAULT 0;
			DECLARE cotaprod_quantidade INTEGER DEFAULT 0;
			DECLARE current_cotaunidprod INTEGER DEFAULT 0;
			DECLARE current_value DECIMAL(10,2) DEFAULT 0.00;
			DECLARE current_total DECIMAL(10,2) DEFAULT 0.00;
			DECLARE other_cotaunidprod INTEGER DEFAULT 0;
			DECLARE other_value DECIMAL(10,2) DEFAULT 0.00;
			DECLARE other_total DECIMAL(10,2) DEFAULT 0.00;

			DECLARE melhor INTEGER DEFAULT 0;
			DECLARE pior INTEGER DEFAULT 0;
			DECLARE totalProdutos INTEGER DEFAULT 0;
			DECLARE naoCotou INTEGER DEFAULT 0;

			DECLARE cotacaoprodutos CURSOR FOR
				SELECT DISTINCT cotaprod.prod_codigoid,
					cotaprod.cotaprod_quantidade,
					currentCotacao.cotaunidprod_codigoid AS current_cotaunidprod,
					currentCotacao.cotaunidprod_valorunitario AS current_value,
					currentCotacao.cotaunidprod_valortotal AS current_total,
					otherCotacao.cotaunidprod_codigoid AS other_cotaunidprod,
					MIN(otherCotacao.cotaunidprod_valorunitario) AS other_value,
					otherCotacao.cotaunidprod_valortotal AS other_total
				FROM luma.cotacao AS cota
				INNER JOIN luma.cotacaoproduto AS cotaprod ON (cotaprod.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN (
					SELECT DISTINCT cotaunid.cotaunid_codigoid,
							cotaunid.cota_codigoid,
							cotaunidprod.prod_codigoid,
							cotaunidprod.cotaunidprod_codigoid,
							cotaunidprod.cotaunidprod_quantidade,
							cotaunidprod.cotaunidprod_valorunitario,
							cotaunidprod.cotaunidprod_valortotal
					FROM luma.cotacaounidade AS cotaunid
					INNER JOIN luma.cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
					WHERE cotaunid.cota_codigoid = cotaCodigoid AND cotaunid.unid_codigoid = unidCodigoid
					GROUP BY cotaunid.cota_codigoid, cotaunidprod.prod_codigoid
				) AS currentCotacao ON (currentCotacao.cota_codigoid = cota.cota_codigoid AND currentCotacao.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN (
					SELECT DISTINCT cotaunid.cotaunid_codigoid,
							cotaunid.cota_codigoid,
							cotaunidprod.prod_codigoid,
							cotaunidprod.cotaunidprod_codigoid,
							cotaunidprod.cotaunidprod_quantidade,
							MIN(cotaunidprod.cotaunidprod_valorunitario) AS cotaunidprod_valorunitario,
							cotaunidprod.cotaunidprod_valortotal
					FROM luma.cotacaounidade AS cotaunid
					INNER JOIN luma.cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
					WHERE cotaunid.cota_codigoid = cotaCodigoid AND cotaunid.unid_codigoid != unidCodigoid
					GROUP BY cotaunid.cota_codigoid, cotaunidprod.prod_codigoid
				) AS otherCotacao ON (otherCotacao.cota_codigoid = cota.cota_codigoid AND otherCotacao.prod_codigoid = cotaprod.prod_codigoid)
				WHERE cota.cota_codigoid = cotaCodigoid
				GROUP BY cota.cota_codigoid, cotaprod.prod_codigoid;

				DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
				OPEN cotacaoprodutos;
				LOOP_COTACAO: LOOP
					FETCH cotacaoprodutos INTO prod_codigoid,
											   cotaprod_quantidade,
											   current_cotaunidprod,
											   current_value,
											   current_total,
											   other_cotaunidprod,
											   other_value,
											   other_total;
					IF finished THEN
						LEAVE LOOP_COTACAO;
					END IF;
					SET totalProdutos = (totalProdutos+1);
					IF current_value IS NULL OR current_value = 0.00 THEN
						SET naoCotou = (naoCotou+1);
					ELSEIF current_value < other_value THEN
						SET melhor = (melhor+1);
					ELSEIF current_value > other_value THEN
						SET pior = (pior+1);
					ELSE
						SET pior = (pior+1);
					END IF;
				END LOOP LOOP_COTACAO;
				CLOSE cotacaoprodutos;
				IF naoCotou = totalProdutos THEN
					SET status_cotacao = 'Não cotou';
				ELSEIF pior = totalProdutos THEN
					SET status_cotacao = 'Pior';
				ELSEIF melhor = totalProdutos THEN
					SET status_cotacao = 'Melhor Cotacao';
				ELSEIF melhor > 0 AND melhor < totalProdutos THEN
					SET status_cotacao = 'Melhor Parcial';
				END IF;
		END EM_COTACAO;
	ELSEIF tipo_cotacao = 32 THEN
		SET status_cotacao = 'Não cotou';
	ELSEIF tipo_cotacao = 33 THEN
		FECHADA_COM_COTACAO: BEGIN
			DECLARE prod_codigoid INTEGER DEFAULT 0;
			DECLARE cotaprod_quantidade INTEGER DEFAULT 0;
			DECLARE current_cotaunidprod INTEGER DEFAULT 0;
			DECLARE current_value DECIMAL(10,2) DEFAULT 0.00;
			DECLARE current_total DECIMAL(10,2) DEFAULT 0.00;
			DECLARE other_cotaunidprod INTEGER DEFAULT 0;
			DECLARE other_value DECIMAL(10,2) DEFAULT 0.00;
			DECLARE other_total DECIMAL(10,2) DEFAULT 0.00;

			DECLARE melhor INTEGER DEFAULT 0;
			DECLARE pior INTEGER DEFAULT 0;
			DECLARE totalProdutos INTEGER DEFAULT 0;
			DECLARE naoCotou INTEGER DEFAULT 0;

			DECLARE cotacaoprodutos CURSOR FOR
				SELECT DISTINCT cotaprod.prod_codigoid,
					cotaprod.cotaprod_quantidade,
					currentCotacao.cotaunidprod_codigoid AS current_cotaunidprod,
					currentCotacao.cotaunidprod_valorunitario AS current_value,
					currentCotacao.cotaunidprod_valortotal AS current_total,
					otherCotacao.cotaunidprod_codigoid AS other_cotaunidprod,
					MIN(otherCotacao.cotaunidprod_valorunitario) AS other_value,
					otherCotacao.cotaunidprod_valortotal AS other_total
				FROM luma.cotacao AS cota
				INNER JOIN luma.cotacaoproduto AS cotaprod ON (cotaprod.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN (
					SELECT DISTINCT cotaunid.cotaunid_codigoid,
							cotaunid.cota_codigoid,
							cotaunidprod.prod_codigoid,
							cotaunidprod.cotaunidprod_codigoid,
							cotaunidprod.cotaunidprod_quantidade,
							cotaunidprod.cotaunidprod_valorunitario,
							cotaunidprod.cotaunidprod_valortotal
					FROM luma.cotacaounidade AS cotaunid
					INNER JOIN luma.cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
					WHERE cotaunid.cota_codigoid = cotaCodigoid AND cotaunid.unid_codigoid = unidCodigoid
					GROUP BY cotaunid.cota_codigoid, cotaunidprod.prod_codigoid
				) AS currentCotacao ON (currentCotacao.cota_codigoid = cota.cota_codigoid AND currentCotacao.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN (
					SELECT DISTINCT cotaunid.cotaunid_codigoid,
							cotaunid.cota_codigoid,
							cotaunidprod.prod_codigoid,
							cotaunidprod.cotaunidprod_codigoid,
							cotaunidprod.cotaunidprod_quantidade,
							MIN(cotaunidprod.cotaunidprod_valorunitario) AS cotaunidprod_valorunitario,
							cotaunidprod.cotaunidprod_valortotal
					FROM luma.cotacaounidade AS cotaunid
					INNER JOIN luma.cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
					WHERE cotaunid.cota_codigoid = cotaCodigoid AND cotaunid.unid_codigoid != unidCodigoid
					GROUP BY cotaunid.cota_codigoid, cotaunidprod.prod_codigoid
				) AS otherCotacao ON (otherCotacao.cota_codigoid = cota.cota_codigoid AND otherCotacao.prod_codigoid = cotaprod.prod_codigoid)
				WHERE cota.cota_codigoid = cotaCodigoid
				GROUP BY cota.cota_codigoid, cotaprod.prod_codigoid;
				DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
				OPEN cotacaoprodutos;
				LOOP_COTACAO: LOOP
					FETCH cotacaoprodutos INTO prod_codigoid,
											   cotaprod_quantidade,
											   current_cotaunidprod,
											   current_value,
											   current_total,
											   other_cotaunidprod,
											   other_value,
											   other_total;
					IF finished THEN
						LEAVE LOOP_COTACAO;
					END IF;
					SET totalProdutos = (totalProdutos+1);
					IF current_value IS NULL OR current_value = 0.00 THEN
						SET naoCotou = (naoCotou+1);
					ELSEIF current_value < other_value THEN
						SET status_cotacao = CONCAT(current_value, '<', other_value);
						SET melhor = (melhor+1);
					ELSEIF current_value > other_value THEN
						SET pior = (pior+1);
					ELSE
						SET pior = (pior+1);
					END IF;
				END LOOP LOOP_COTACAO;
				CLOSE cotacaoprodutos;
				IF naoCotou = totalProdutos THEN
					SET status_cotacao = 'Não cotou';
				ELSEIF pior = totalProdutos THEN
					SET status_cotacao = 'Pior';
				ELSEIF melhor = totalProdutos THEN
					SET status_cotacao = 'Melhor Cotacao';
				ELSEIF melhor > 0 AND melhor < totalProdutos THEN
					SET status_cotacao = 'Melhor Parcial';
				END IF;
		END FECHADA_COM_COTACAO;
	ELSEIF tipo_cotacao = 35 THEN
		SET status_cotacao = 'Cancelado';
	ELSEIF tipo_cotacao = 36 THEN
		OC_GERADA: BEGIN
			DECLARE cota_codigoid INTEGER DEFAULT 0;
			DECLARE cota_abertura TIMESTAMP;
			DECLARE cota_fechamento TIMESTAMP;
			DECLARE cotaunid_codigoid INTEGER DEFAULT 0;
			DECLARE tipo_codigoid INTEGER DEFAULT 0;
			DECLARE tipo_nome VARCHAR(50);
			DECLARE ordetipo_nome VARCHAR(50);
			DECLARE ordetipo_codigoid INTEGER DEFAULT 0;
			DECLARE prodcota INTEGER DEFAULT 0;
			DECLARE prodcotaunid INTEGER DEFAULT 0;
			DECLARE prodordecotaunid INTEGER DEFAULT 0;

			DECLARE melhor INTEGER DEFAULT 0;
			DECLARE pior INTEGER DEFAULT 0;
			DECLARE totalProdutos INTEGER DEFAULT 0;
			DECLARE naoCotou INTEGER DEFAULT 0;

			DECLARE ordemCompra CURSOR FOR
				SELECT DISTINCT cota.cota_codigoid,
								cota.cota_abertura,
								cota.cota_fechamento,
								cotaunid.cotaunid_codigoid,
								tipo.tipo_codigoid,
								tipo.tipo_nome,
								ordetipo.tipo_codigoid AS ordetipo_codigoid,
								ordetipo.tipo_nome AS ordetipo_nome,
								COUNT(cotaprod.cotaprod_codigoid) AS prodcota,
								COUNT(cotaunidprod.cotaunidprod_codigoid) AS prodcotaunid,
								COUNT(ordecotaunidprod.ordecotaunidprod) AS prodordecotaunid
				FROM convite AS conv
				INNER JOIN cotacao AS cota
					ON (cota.cota_codigoid = conv.cota_codigoid)
				INNER JOIN cotacaoproduto AS cotaprod
					ON (cotaprod.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN cotacaounidade AS cotaunid
					ON (cotaunid.cota_codigoid = conv.cota_codigoid AND cotaunid.unid_codigoid = conv.unid_codigoid)
				LEFT JOIN cotacaounidadeproduto AS cotaunidprod
					ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid AND cotaunidprod.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN ordemcotacaounidadeproduto AS ordecotaunidprod
					ON (ordecotaunidprod.cotaunidprod_codigoid = cotaunidprod.cotaunidprod_codigoid)
				LEFT JOIN ordem AS orde
					ON (orde.orde_codigoid = ordecotaunidprod.orde_codigoid)
				INNER JOIN tipo AS tipo
					ON (tipo.tipo_codigoid = cota.tipo_codigoid)
				LEFT JOIN tipo AS ordetipo
					ON (ordetipo.tipo_codigoid = orde.tipo_codigoid)
				WHERE conv.unid_codigoid = unidCodigoid AND conv.cota_codigoid = cotaCodigoid
				GROUP BY cota.cota_codigoid, cotaunid.cotaunid_codigoid
				ORDER BY cota.cota_codigoid DESC;
				DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
				SET status_cotacao = 'Não Cotou';
				OPEN ordemCompra;
				LOOP_OC: LOOP
					FETCH ordemCompra INTO cota_codigoid,
										   cota_abertura,
										   cota_fechamento,
										   cotaunid_codigoid,
										   tipo_codigoid,
										   tipo_nome,
										   ordetipo_codigoid,
										   ordetipo_nome,
										   prodcota,
										   prodcotaunid,
										   prodordecotaunid;
					IF finished THEN
						LEAVE LOOP_OC;
					END IF;
					IF tipo_codigoid = 35 THEN
						SET status_cotacao = 'Cancelada';
					ELSEIF tipo_codigoid = 36 AND prodcotaunid = 0 THEN
						SET status_cotacao = 'Não Cotou';
					ELSEIF tipo_codigoid = 36 AND prodcotaunid > 0 AND prodordecotaunid = 0 THEN
						SET status_cotacao = 'Perdeu';
					ELSEIF ordetipo_codigoid IN (46, 47, 48, 49, 52, 53, 58, 59) THEN
						IF ordetipo_codigoid = 46 THEN
							SET status_cotacao = 'Aguardando Liberação';
						ELSEIF ordetipo_codigoid = 47 AND prodordecotaunid > 0 AND prodordecotaunid = prodcota THEN
							SET status_cotacao = 'Ganhou';
						ELSEIF ordetipo_codigoid = 47 AND prodordecotaunid > 0 AND prodordecotaunid != prodcota THEN
							SET status_cotacao = 'Ganhou Parcial';
						ELSEIF ordetipo_codigoid = 48 THEN
							SET status_cotacao = 'Cancelada';
						ELSEIF ordetipo_codigoid = 49 THEN
							SET status_cotacao = 'Pendente de Valor Frete';
						ELSEIF ordetipo_codigoid = 52 AND prodordecotaunid > 0 AND prodordecotaunid = prodcota THEN
							SET status_cotacao = 'Ganhou';
						ELSEIF ordetipo_codigoid = 52 AND prodordecotaunid > 0 AND prodordecotaunid != prodcota THEN
							SET status_cotacao = 'Ganhou Parcial';
						ELSEIF ordetipo_codigoid = 53 AND prodordecotaunid > 0 AND prodordecotaunid != prodcota THEN
							SET status_cotacao = 'Ganhou Parcial';
						ELSEIF ordetipo_codigoid = 53 AND prodordecotaunid > 0 AND prodordecotaunid = prodcota THEN
							SET status_cotacao = 'Ganhou';
						ELSEIF ordetipo_codigoid = 58 THEN
							SET status_cotacao = 'Cancelada';
						ELSEIF ordetipo_codigoid = 59 THEN
							SET status_cotacao = 'Cancelada';
						END IF;
					ELSEIF tipo_codigoid = 36 AND prodordecotaunid > 0 AND prodordecotaunid = prodcota THEN
						SET status_cotacao = 'Ganhou';
					ELSEIF tipo_codigoid = 36 AND prodordecotaunid > 0 AND prodordecotaunid != prodcota THEN
						SET status_cotacao = 'Ganhou Parcial';
					ELSE
						SET status_cotacao = 'X-Y-X-Y-X';
					END IF;
				END LOOP LOOP_OC;
				CLOSE ordemCompra;
		END OC_GERADA;
	ELSEIF (tipo_cotacao = 45) OR (dataInicio < CURRENT_TIMESTAMP) THEN
		SET status_cotacao = 'Aguardando iniciar';
	ELSE
		SET status_cotacao = 'Tipo Indefinido';
	END IF;
	RETURN status_cotacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `MELHOR_OFERTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `MELHOR_OFERTA`(unidCodigoid INT, cotaCodigoid INT, prodCodigoid INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE status_cotacao VARCHAR(50);
	DECLARE tipo_cotacao INTEGER DEFAULT 0;
	DECLARE dataInicio TIMESTAMP;
	DECLARE dataFinal TIMESTAMP;

	SELECT tipo_codigoid,
		   cota_abertura,
		   cota_fechamento
	INTO tipo_cotacao,
		 dataInicio,
		 dataFinal
	FROM luma.cotacao AS cota WHERE cota.cota_codigoid = cotaCodigoid;

	IF tipo_cotacao IN (31, 33, 36) THEN
		SET status_cotacao = 'TESTE';
		EM_COTACAO: BEGIN
			DECLARE finished INTEGER DEFAULT 0;

			DECLARE cotaunid INTEGER DEFAULT 0;
			DECLARE cotaunidprod INTEGER DEFAULT 0;
			DECLARE cotaunidprodValor DECIMAL(10,2);

			DECLARE quantidade INTEGER DEFAULT 0;
			DECLARE produto INTEGER DEFAULT 0;

			DECLARE othercota INTEGER DEFAULT 0;
			DECLARE othercotaprod INTEGER DEFAULT 0;
			DECLARE othercotaprodValor DECIMAL(10,2);

			DECLARE cotauniorde INTEGER DEFAULT 0;
			DECLARE cotaunidordeprod INTEGER DEFAULT 0;
			DECLARE tipoorde INTEGER DEFAULT 0;

			DECLARE cotacaoprodutos CURSOR FOR
				SELECT DISTINCT cotaunid.unid_codigoid AS unid,
							cotaunidprod.cotaunidprod_codigoid AS cotaunidprod,
							cotaunidprod.cotaunidprod_valorunitario AS cotaunidprod_valor,
							cotaprod.cotaprod_quantidade AS quantidade,
							cotaprod.prod_codigoid AS produto,
							otherCotacao.unid_codigoid AS othercota,
							otherCotacao.cotaunidprod_codigoid AS othercotaprod,
							MIN(otherCotacao.cotaunidprod_valorunitario) AS othercotaprod_valor,
							orde.orde_codigoid AS cotauniorde,
							ordecotaunidprod.ordecotaunidprod AS cotaunidordeprod,
							tipoorde.tipo_codigoid
				FROM luma.cotacao AS cota
				INNER JOIN cotacaoproduto AS cotaprod ON (cotaprod.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN cotacaounidade AS cotaunid
					ON (cotaunid.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN cotacaounidadeproduto AS cotaunidprod
					ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid AND cotaunidprod.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN (
					SELECT DISTINCT cotaunid.unid_codigoid,
									cotaunid.cota_codigoid,
									cotaunidprod.prod_codigoid,
									cotaunidprod.cotaunidprod_codigoid,
									cotaunidprod.cotaunidprod_quantidade,
									MIN(cotaunidprod.cotaunidprod_valorunitario) AS cotaunidprod_valorunitario,
									cotaunidprod.cotaunidprod_valortotal,
									ordcotaunidprod.cotaunidprod_codigoid other_ordecotaprod
					FROM luma.cotacaounidade AS cotaunid
					INNER JOIN luma.cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
					LEFT JOIN luma.ordemcotacaounidadeproduto AS ordcotaunidprod ON (ordcotaunidprod.cotaunidprod_codigoid = cotaunidprod.cotaunidprod_codigoid)
					WHERE cotaunid.cota_codigoid = cotaCodigoid AND cotaunid.unid_codigoid != unidCodigoid AND cotaunidprod.prod_codigoid = prodCodigoid
					GROUP BY cotaunid.unid_codigoid, cotaunid.cota_codigoid, cotaunidprod.prod_codigoid
				) AS otherCotacao ON (otherCotacao.cota_codigoid = cota.cota_codigoid AND otherCotacao.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN ordemcotacaounidadeproduto AS ordecotaunidprod
					ON ((ordecotaunidprod.cotaunidprod_codigoid = cotaunidprod.cotaunidprod_codigoid) OR (ordecotaunidprod.cotaunidprod_codigoid = otherCotacao.other_ordecotaprod))
				LEFT JOIN ordem AS orde
					ON (orde.orde_codigoid = ordecotaunidprod.orde_codigoid)
				LEFT JOIN tipo AS tipoorde
					ON (tipoorde.tipo_codigoid = orde.tipo_codigoid)

				WHERE cota.cota_codigoid = cotaCodigoid
				AND cotaunid.unid_codigoid = unidCodigoid
				AND cotaprod.prod_codigoid = prodCodigoid
				AND (
					otherCotacao.cotaunidprod_codigoid IS NOT NULL
					OR cotaunidprod.cotaunidprod_codigoid IS NOT NULL
				)
				GROUP BY cotaunid.cota_codigoid, cotaprod.prod_codigoid
				ORDER BY cotaprod.prod_codigoid;

				DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
				OPEN cotacaoprodutos;
				
				FETCH cotacaoprodutos
				INTO cotaunid,
					 cotaunidprod,
					 cotaunidprodValor,
					 quantidade,
					 produto,
					 othercota,
					 othercotaprod,
					 othercotaprodValor,
					 cotauniorde,
					 cotaunidordeprod,
					 tipoorde;

				CLOSE cotacaoprodutos;

				IF cotaunidprodValor IS NULL THEN
					SET status_cotacao = 'Não Cotou';
				ELSEIF tipo_cotacao IN (31, 33) THEN
					IF (cotaunidprodValor <= othercotaprodValor) OR (othercotaprodValor IS NULL) THEN
						SET status_cotacao = 'Melhor Oferta';
					ELSE
						SET status_cotacao = 'Pior Oferta';
					END IF;
				ELSE-- 36 --
					IF tipoorde IN (48, 58, 59) THEN
						SET status_cotacao = 'O.C. Cancelada';
					ELSEIF tipoorde IN (46, 47, 49, 52, 53) AND ((cotaunidprodValor <= othercotaprodValor) OR (othercotaprodValor IS NULL)) THEN
						SET status_cotacao = 'Ganhou';
					ELSEIF tipoorde IN (46, 47, 49, 52, 53) THEN
						SET status_cotacao = 'Perdeu';
					ELSE
						SET status_cotacao = 'Perdeu';
					END IF;
				END IF;
			END EM_COTACAO;
	ELSEIF tipo_cotacao = 32 THEN
		SET status_cotacao = 'Não Cotou';
	ELSEIF tipo_cotacao = 35 THEN
		SET status_cotacao = 'Cancelada';
	ELSEIF tipo_cotacao = 45 THEN
		SET status_cotacao = 'Aguardando Iniciar';
	ELSE
		SET status_cotacao = 'Não Achou o Tipo';
	END IF;
	RETURN status_cotacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `MELHOR_OFERTA_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `MELHOR_OFERTA_2`(unidCodigoid INT, cotaCodigoid INT, prodCodigoid INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE status_cotacao VARCHAR(50);
	DECLARE tipo_cotacao INTEGER DEFAULT 0;
	DECLARE dataInicio TIMESTAMP;
	DECLARE dataFinal TIMESTAMP;

	SELECT tipo_codigoid,
		   cota_abertura,
		   cota_fechamento
	INTO tipo_cotacao,
		 dataInicio,
		 dataFinal
	FROM luma.cotacao AS cota WHERE cota.cota_codigoid = cotaCodigoid;

	IF tipo_cotacao IN (31, 33, 36) THEN
		SET status_cotacao = 'TESTE';
		EM_COTACAO: BEGIN
			DECLARE finished INTEGER DEFAULT 0;

			DECLARE cotaunid INTEGER DEFAULT 0;
			DECLARE cotaunidprod INTEGER DEFAULT 0;
			DECLARE cotaunidprodValor DECIMAL(10,2);

			DECLARE quantidade INTEGER DEFAULT 0;
			DECLARE produto INTEGER DEFAULT 0;

			DECLARE othercota INTEGER DEFAULT 0;
			DECLARE othercotaprod INTEGER DEFAULT 0;
			DECLARE othercotaprodValor DECIMAL(10,2);

			DECLARE cotauniorde INTEGER DEFAULT 0;
			DECLARE cotaunidordeprod INTEGER DEFAULT 0;
			DECLARE tipoorde INTEGER DEFAULT 0;

			DECLARE cotacaoprodutos CURSOR FOR
				SELECT DISTINCT cotaunid.unid_codigoid AS unid,
							cotaunidprod.cotaunidprod_codigoid AS cotaunidprod,
							cotaunidprod.cotaunidprod_valorunitario AS cotaunidprod_valor,
							cotaprod.cotaprod_quantidade AS quantidade,
							cotaprod.prod_codigoid AS produto,
							otherCotacao.unid_codigoid AS othercota,
							otherCotacao.cotaunidprod_codigoid AS othercotaprod,
							MIN(otherCotacao.cotaunidprod_valorunitario) AS othercotaprod_valor,
							orde.orde_codigoid AS cotauniorde,
							ordecotaunidprod.ordecotaunidprod AS cotaunidordeprod,
							tipoorde.tipo_codigoid
				FROM luma.cotacao AS cota
				INNER JOIN cotacaoproduto AS cotaprod ON (cotaprod.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN cotacaounidade AS cotaunid
					ON (cotaunid.cota_codigoid = cota.cota_codigoid)
				LEFT JOIN cotacaounidadeproduto AS cotaunidprod
					ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid AND cotaunidprod.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN (
					SELECT DISTINCT cotaunid.unid_codigoid,
									cotaunid.cota_codigoid,
									cotaunidprod.prod_codigoid,
									cotaunidprod.cotaunidprod_codigoid,
									cotaunidprod.cotaunidprod_quantidade,
									MIN(cotaunidprod.cotaunidprod_valorunitario) AS cotaunidprod_valorunitario,
									cotaunidprod.cotaunidprod_valortotal,
									ordcotaunidprod.cotaunidprod_codigoid other_ordecotaprod
					FROM luma.cotacaounidade AS cotaunid
					INNER JOIN luma.cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunid_codigoid = cotaunid.cotaunid_codigoid)
					LEFT JOIN luma.ordemcotacaounidadeproduto AS ordcotaunidprod ON (ordcotaunidprod.cotaunidprod_codigoid = cotaunidprod.cotaunidprod_codigoid)
					WHERE cotaunid.cota_codigoid = cotaCodigoid AND cotaunid.unid_codigoid != unidCodigoid AND cotaunidprod.prod_codigoid = prodCodigoid
					GROUP BY cotaunid.unid_codigoid, cotaunid.cota_codigoid, cotaunidprod.prod_codigoid
				) AS otherCotacao ON (otherCotacao.cota_codigoid = cota.cota_codigoid AND otherCotacao.prod_codigoid = cotaprod.prod_codigoid)
				LEFT JOIN ordemcotacaounidadeproduto AS ordecotaunidprod
					ON ((ordecotaunidprod.cotaunidprod_codigoid = cotaunidprod.cotaunidprod_codigoid))
				LEFT JOIN ordem AS orde
					ON (orde.orde_codigoid = ordecotaunidprod.orde_codigoid)
				LEFT JOIN tipo AS tipoorde
					ON (tipoorde.tipo_codigoid = orde.tipo_codigoid)

				WHERE cota.cota_codigoid = cotaCodigoid
				AND cotaunid.unid_codigoid = unidCodigoid
				AND cotaprod.prod_codigoid = prodCodigoid
				AND (
					otherCotacao.cotaunidprod_codigoid IS NOT NULL
					OR cotaunidprod.cotaunidprod_codigoid IS NOT NULL
				)
				GROUP BY cotaunid.cota_codigoid, cotaprod.prod_codigoid
				ORDER BY cotaprod.prod_codigoid;

				DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
				OPEN cotacaoprodutos;
				
				FETCH cotacaoprodutos
				INTO cotaunid,
					 cotaunidprod,
					 cotaunidprodValor,
					 quantidade,
					 produto,
					 othercota,
					 othercotaprod,
					 othercotaprodValor,
					 cotauniorde,
					 cotaunidordeprod,
					 tipoorde;

				CLOSE cotacaoprodutos;

				IF cotaunidprodValor IS NULL THEN
					SET status_cotacao = 'Não Cotou';
				ELSEIF tipo_cotacao IN (31, 33) THEN
					IF (cotaunidprodValor <= othercotaprodValor) OR (othercotaprodValor IS NULL) THEN
						SET status_cotacao = 'Melhor Oferta';
					ELSE
						SET status_cotacao = 'Pior Oferta';
					END IF;
				ELSE-- 36 --
					IF tipoorde IN (48, 58, 59) THEN
						SET status_cotacao = 'O.C. Cancelada';
					-- ELSEIF tipoorde IN (46, 47, 49, 52, 53) AND ((cotaunidprodValor <= othercotaprodValor) OR (othercotaprodValor IS NULL)) THEN
					ELSEIF tipoorde IN (46, 47, 49, 52, 53) AND (cotaunidordeprod is not null) THEN
						SET status_cotacao = 'Ganhou';
					ELSEIF tipoorde IN (46, 47, 49, 52, 53) THEN
						SET status_cotacao = 'Perdeu';
					ELSE
						SET status_cotacao = 'Perdeu';
					END IF;
				END IF;
			END EM_COTACAO;
	ELSEIF tipo_cotacao = 32 THEN
		SET status_cotacao = 'Não Cotou';
	ELSEIF tipo_cotacao = 35 THEN
		SET status_cotacao = 'Cancelada';
	ELSEIF tipo_cotacao = 45 THEN
		SET status_cotacao = 'Aguardando Iniciar';
	ELSE
		SET status_cotacao = 'Não Achou o Tipo';
	END IF;
	RETURN status_cotacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Motoristaviatura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Motoristaviatura`(viat int) RETURNS text CHARSET latin1
BEGIN
	declare motora varchar(255);
    
    select group_concat(rh.rh_colaborador.nome SEPARATOR ', ') into motora 
    from luma.viatura 
    inner join luma.viatura_motorista using(viaturaid)
    inner join rh.rh_documento on 
    rh.rh_documento.id_documento =  luma.viatura_motorista.rh_id_documento
    inner join rh.rh_colaborador on 
    rh.rh_colaborador.id_colaborador = luma.viatura_motorista.id_colaborador
    where luma.viatura.viaturaid = viat 
    AND luma.viatura_motorista.data_fim IS NULL;
   
RETURN motora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `new_function` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `new_function`(aut_usuario int) RETURNS text CHARSET latin1
BEGIN
	declare id text;
    declare departamentos text;
    declare colaboradores text;
    declare colaboradorRetorno text; 
       
	select GROUP_CONCAT(id_departamento SEPARATOR ',') into id from rh.rh_colaborador 
	inner join rh_colaborador_departamento using(id_colaborador)
    where id_alt_usuario_sistech = aut_usuario and boss = 1  ;
    
    if id is not null then
	set colaboradorRetorno = CONCAT(',',(select GROUP_CONCAT(nome SEPARATOR ',') from rh.rh_colaborador 
						     inner join rh_colaborador_departamento using(id_colaborador)
						     where id_departamento in(id) 
                             and id_alt_usuario_sistech is not null
                             and id_alt_usuario_sistech <> aut_usuario));
                             
	end if;
    
	WHILE id is not null DO
       select GROUP_CONCAT(id_departamento SEPARATOR ',') into departamentos
	   from rh_departamento where id_departamento_asc in(id);
       
		   if departamentos is not null then
				select GROUP_CONCAT(nome SEPARATOR ',') into colaboradores from rh.rh_colaborador 
							   inner join rh_colaborador_departamento using(id_colaborador)
							   where id_departamento in(departamentos) and id_alt_usuario_sistech is not null;
				SET colaboradorRetorno = CONCAT(', ', colaboradores, colaboradorRetorno);           
		   end if;
	   SET id = departamentos;
	END WHILE;
      
    return colaboradorRetorno;
    
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `pedidoproduto_entregue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `pedidoproduto_entregue`(pedidoproduto INT) RETURNS int(11)
BEGIN
RETURN (SELECT SUM(moviprod_quantidade)
	FROM luma.pedidoproduto 
		JOIN luma.pedidomovimentacao USING(pedi_codigoid)
		JOIN luma.movimentacaoproduto USING(movi_codigoid)
		JOIN luma.estoqueproduto USING(estoprod_codigoid, prod_codigoid)
	WHERE pediprod_codigoid = pedidoproduto
	GROUP BY pediprod_codigoid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `pedido_finalizavel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `pedido_finalizavel`(pedidoId INT) RETURNS int(11)
BEGIN
	SELECT (
		IFNULL(SUM(estoque.unid_codigoid = pedido.unid_codigoid), 0) >= count(DISTINCT pediprod_codigoid)
		OR pedido.unid_codigoid IS NULL
	)  AS entregue
	INTO @entregue
	FROM luma.pedido
		JOIN pedidoproduto ON(pedidoproduto.pedi_codigoid = pedido.pedi_codigoid AND pedidoproduto.pediprodstat_codigoid != 5)
		JOIN produto ON(produto.prod_codigoid = pedidoproduto.prod_codigoid)
		LEFT JOIN pedidomovimentacao ON(pedidomovimentacao.pedi_codigoid = pedido.pedi_codigoid)
		LEFT JOIN movimentacaoproduto USING(movi_codigoid)
		LEFT JOIN lote USING(lote_codigoid)
		LEFT JOIN estoqueproduto ON(estoqueproduto.estoprod_codigoid = lote.estoprod_codigoid)
		LEFT JOIN estoque USING(esto_codigoid)
	WHERE pedido.pedi_codigoid = pedidoId 
		AND prod_islance = 0
	;
RETURN @entregue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `quantidadeProdutoCotacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `quantidadeProdutoCotacao`(IDCOTACAO INT, IDPRODUTO INT) RETURNS float
BEGIN
	DECLARE quant FLOAT;

	SELECT cotaprod.cotaprod_quantidade INTO quant
	FROM cotacaoproduto as cotaprod
	WHERE cota_codigoid=IDCOTACAO and prod_codigoid=IDPRODUTO;

	RETURN quant;
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
	SELECT COUNT(proj.proj_codigoid) INTO temProjeto FROM luma.projeto proj WHERE proj.desig_codigoid = desig_codigoid;
RETURN temProjeto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TipoMotorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `TipoMotorista`(viat int) RETURNS text CHARSET latin1
BEGIN
	declare tipo text;
    
    select rh.rh_documento_tipo.descricao into tipo 
    from luma.viatura 
    inner join luma.viatura_motorista using(viaturaid)
    inner join rh.rh_documento on 
    rh.rh_documento.id_documento = luma.viatura_motorista.rh_id_documento
    inner join rh.rh_documento_tipo using(id_documento_tipo)
    where luma.viatura.viaturaid = viat 
    
    AND luma.viatura_motorista.data_fim IS NULL LIMIT 1;
   
RETURN tipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valor_cotacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valor_cotacao`(prodCodigoid INT) RETURNS decimal(10,2)
BEGIN
    DECLARE valor DECIMAL(10,2);
    DECLARE quantidade DECIMAL(10,2);

    SELECT SUM(cotaunidprod.cotaunidprod_valortotal) INTO valor FROM cotacaounidadeproduto AS cotaunidprod
    WHERE cotaunidprod.prod_codigoid = prodCodigoid
    GROUP BY cotaunidprod.prod_codigoid;

    SELECT SUM(cotaunidprod.cotaunidprod_quantidade) INTO quantidade FROM cotacaounidadeproduto AS cotaunidprod
    WHERE cotaunidprod.prod_codigoid = prodCodigoid
    GROUP BY cotaunidprod.prod_codigoid;

RETURN (valor/quantidade);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valor_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valor_lote`(loteCodigoid INT) RETURNS decimal(10,2)
BEGIN
DECLARE valor DECIMAL(10,2);

SELECT cotaunidprod.cotaunidprod_valorunitario INTO valor FROM lote AS lote
INNER JOIN ordemcotacaounidadeproduto AS ordecotaunidprod ON (ordecotaunidprod.ordecotaunidprod = lote.ordecotaunidprod)
INNER JOIN cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunidprod_codigoid = ordecotaunidprod.cotaunidprod_codigoid)
WHERE lote.lote_codigoid = loteCodigoid;

RETURN valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valor_ordem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valor_ordem`(prodCodigoid INT) RETURNS decimal(10,2)
BEGIN
DECLARE valor DECIMAL(10,2);
DECLARE quantidade DECIMAL(10,2);

SELECT SUM(cotaunidprod.cotaunidprod_valortotal) INTO valor FROM ordemcotacaounidadeproduto AS ordemcotaunidprod
INNER JOIN ordem AS orde ON (orde.orde_codigoid = ordemcotaunidprod.orde_codigoid)
INNER JOIN cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunidprod_codigoid = ordemcotaunidprod.cotaunidprod_codigoid)
WHERE cotaunidprod.prod_codigoid = prodCodigoid AND orde.tipo_codigoid IN (47,49,52,53)
GROUP BY cotaunidprod.prod_codigoid;

SELECT SUM(cotaunidprod.cotaunidprod_quantidade) INTO quantidade FROM ordemcotacaounidadeproduto AS ordemcotaunidprod
INNER JOIN ordem AS orde ON (orde.orde_codigoid = ordemcotaunidprod.orde_codigoid)
INNER JOIN cotacaounidadeproduto AS cotaunidprod ON (cotaunidprod.cotaunidprod_codigoid = ordemcotaunidprod.cotaunidprod_codigoid)
WHERE cotaunidprod.prod_codigoid = prodCodigoid AND orde.tipo_codigoid IN (47,49,52,53)
GROUP BY cotaunidprod.prod_codigoid;

RETURN (valor/quantidade);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ajusta_lote_movimentacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ajusta_lote_movimentacao`()
BEGIN
	DECLARE finished TINYINT(1);
    declare v_lote_codigoid int;
    declare v_estoprod_codigoid int;
    declare v_estoprod_total int;
    
    DECLARE lotes CURSOR FOR 
    select lote_codigoid
         from movimentacao
        inner join movimentacao_transito    using(movi_codigoid)
        inner join movimentacaoproduto      using(movi_codigoid)
        inner join estoqueproduto           using(estoprod_codigoid)
        inner join lote                     using(lote_codigoid)
        inner join produto                  using(prod_codigoid)
        where prod_islance=0
          and movitrans_status=0
          and lote_quantidade=1;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    open lotes;
    
    laco_1:loop
       
    FETCH lotes INTO v_lote_codigoid;
    
    IF finished THEN
        LEAVE laco_1;
    END IF;

    select estoprod_codigoid,estoprod_total
      into v_estoprod_codigoid,v_estoprod_total
      from lote 
     inner join estoqueproduto using(estoprod_codigoid)
     where lote_codigoid = v_lote_codigoid ;

    update lote
       set lote_quantidade =0
     where lote_codigoid= v_lote_codigoid;

    update estoqueproduto
       set estoprod_total = v_estoprod_total
     where estoprod_codigoid = v_estoprod_codigoid;

    end loop laco_1;
    
    
	CLOSE lotes; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizaHistoricoBateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `atualizaHistoricoBateria`()
begin
	declare pop int;
	declare modeloRotina varchar(200);
	declare quantidadeCursor int;
	declare movimentacao int;
	declare dataMovimentacao datetime;
	declare idBateria int;
	declare finished integer DEFAULT 0;
	declare de int;
	declare para int;
	declare qtdVerifica int;
	declare qtdTotal int;
	declare capacidadeLocal varchar(200);
	declare corpoEmail varchar(5000);
	declare nomePop varchar(100);
	declare enderecoPop varchar(100);
	declare lumaId int;
	declare mensagem varchar(80);
	declare dataInicio datetime;
	declare enviaEmail bool default false;
	declare linhaEmail varchar(5000);
	declare modeloEmail varchar(50);
	declare quantidadeEmail varchar(50);
	declare capacidadeEmail varchar(50);
	declare cont integer default 0;
  declare cursorAnterior int default 0;

	declare laco cursor for 
		
	SELECT prod.prod_nome,movi.movi_codigoid,unid.unid_stechcodigoid,
	moviprod.moviprod_quantidade,movi.movi_datainc,movi.unid_decodigoid,
	movi.unid_paracodigoid,estoprod.prod_codigoid
	FROM movimentacao AS movi
	INNER JOIN movimentacaoproduto AS moviprod ON (moviprod.movi_codigoid = movi.movi_codigoid)
	INNER JOIN estoqueproduto AS estoprod ON (estoprod.estoprod_codigoid = moviprod.estoprod_codigoid)
	INNER JOIN produto AS prod ON (prod.prod_codigoid = estoprod.prod_codigoid)
	INNER JOIN unidade AS unid ON (unid.unid_codigoid = movi.unid_decodigoid or unid.unid_codigoid = movi.unid_paracodigoid) 
	inner join categoria cat on (cat.cate_codigoid = prod.cate_codigoid)
	inner join tipounidade tu on (unid.unid_codigoid=tu.unid_codigoid) 

	-- inner join atributoproduto ap on (ap.atriprod_codigoid=prod.prod_codigoid)-- ficar de olho
	where cat.cate_ordem='8.2.4' and tu.tipo_codigoid=5 and movi.movi_tipo<>'edição'
  and unid.unid_stechcodigoid is not null
  and not exists(select 1 from popbateria bat where bat.movimentacao=movi.movi_codigoid)
  -- and movi.movi_codigoid <> 38779
  -- and movi.unid_paracodigoid=1307
	order by movi.movi_datainc asc ;
  -- where cat.cate_ordem='8.2.4' and tu.tipo_codigoid=5 and movi.movi_tipo<>'edição' 
  -- and movi.movi_tipo like 'POP%'

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;	
	open laco;
	laco2:LOOP

	fetch laco into modeloRotina,movimentacao,pop,quantidadeCursor,dataMovimentacao,de,para,lumaId;
	
	IF finished THEN
    LEAVE laco2;
    END IF;

	set nomePop = (select nome from pop where id_pop=pop limit 1);
	set enderecoPop = (
		select l.endereco from poprelacaolocalizacao rl
		inner join poplocalizacao l on (rl.id_localizacao=l.id_localizacao)
		where rl.id_pop=pop and rl.id_tipo=1 and rl.data_fim is null);
	
	set corpoEmail="<html>
	<body>
	<span>Alerta - Problema com quantidade de baterias</span><br><br>
	<span>Data de geração do alerta: #DATA#</span><br>
	<span>POP - #POP# (#POPENDERECO#)</span><br><br>
	<span>Este e-mail informa que o POP em questão possui uma quantidade de
	baterias incorreta, não sendo possível o cadastramento no sistema
	de gestão de Pontos de Presença, nem o cálculo de autonomia.</span><br><br>
	<span style='font-weight: bold;'>ATENÇÃO: este é um erro crítico e pode afetar 
	diretamente a operação da rede, providências devem ser tomadas
	imediatamente.</span><br><br>
	<span>Lembre-se que as informações de baterias para o cálculo
	de autonomia e capacidade do POP são baseadas no estoque da unidade em
	questão. É imprescindível que sejam cadastradas corretamente
	as baterias, com todos os atributos, para que o sistema possa realizar a análise
	</span><br><br>
	<span>Relação das baterias do POP:</span><br><br>
	#LISTABATERIAS
	<br><br><span>Faça sempre seu melhor, e integre um time de vencedores.</span><br><br>
	</body>
	</html>";

	set capacidadeLocal = 
		(SELECT al.atriprodlote_dado
		FROM atributoproduto ap
		INNER JOIN atributoprodutolote al ON ( ap.atriprod_codigoid = al.atriprod_codigoid ) 
		inner join produto p on (p.prod_codigoid=ap.prod_codigoid)
		WHERE ap.atri_codigoid=13 
		AND p.prod_nome=modeloRotina
		limit 1);

/*
set pop=117;
set quantidadeCursor=4;
set lumaId=179;
set de=8956;
set dataMovimentacao='2013-07-16'; 
 */
     
set enviaEmail=false;
   if(cursorAnterior <>  movimentacao) -- ultima alteracao
     then  

		if exists(select 1 from unidade u
			inner join tipounidade tu on (u.unid_codigoid=tu.unid_codigoid)
			where tu.tipo_codigoid=5 and u.unid_codigoid in (de) limit 1)	 	
		then
 -- select 'de';
   
		   if((select data_inicio from popbateria 
				where id_pop=pop and modelo=lumaId and data_fim is null
				order by data_inicio desc limit 1) <= dataMovimentacao)   
		   then 
			set qtdVerifica=(select sum(quantidade) from popbateria where data_fim is null and id_pop=pop and modelo=lumaId);		  
      set quantidadeCursor = (select count(moviprod_quantidade) from movimentacaoproduto where movi_codigoid=movimentacao and estoprod_codigoid in 
                              (select estoprod_codigoid from estoqueproduto where prod_codigoid in (178,179,2485,177,3428,3970,3810)));
			if(qtdVerifica >= quantidadeCursor) 
			then
			 set qtdTotal=(qtdVerifica-quantidadeCursor);
			 if((qtdTotal % 4) = 0)
			 then
				set qtdTotal=(select quantidade from popbateria where data_fim is null and id_pop=pop and modelo=lumaId order by data_inicio asc limit 1);	
				set qtdTotal=(qtdTotal-quantidadeCursor);

				update popbateria set data_fim=dataMovimentacao
				where id_pop=pop and modelo=lumaId  
				and data_fim is null order by data_inicio asc limit 1;

			--	 insert into popbateria values(null,pop,capacidadeLocal,qtdTotal,  
			--	 lumaId,dataMovimentacao,null,'SISTEMA',null,'DE',movimentacao);
        insert into popbateria values(null,pop,capacidadeLocal,quantidadeCursor,   
				 lumaId,dataMovimentacao,dataMovimentacao,'SISTEMA',null,'DE',movimentacao);
    
			 else 
				update popbateria set data_fim=dataMovimentacao
				where id_pop=pop and modelo=lumaId 
			    and data_fim is null order by data_inicio asc;
			   
				 insert into popbateria values(null,pop,capacidadeLocal,qtdTotal,
			    lumaId,dataMovimentacao,dataMovimentacao,'SISTEMA','SALDO NÃO É MÚLTIPLO DE 4','DE',movimentacao);	

				/*insert into email values(null,54,'JOB','Alerta - Problema com quantidade de baterias',replace(replace(replace(replace(replace(corpoEmail,'#POP#',nomePop),'#POPENDERECO#',enderecoPop),'#DATA#',DATE_FORMAT(now(),'%d/%c/%Y')),'#QUANTIDADE#',cast(quantidadeCursor as char)),'#CAPACIDADE#',cast(capacidadeLocal as char)),'Sistemas SouthTech Telecom <sistemas@stech.net.br>','rwiedemann@stech.net.br',null,null,null,now(),now(),pop,'movimentacao');*/
        set enviaEmail=true;
			end if;
			else
				update popbateria set data_fim=dataMovimentacao
				where id_pop=pop and modelo=lumaId 
				order by data_inicio asc;

				if((select count(*) from popbateria where id_pop=pop and data_fim is null) = 0)
				then
					set mensagem='POP SEM BATERIA';
				else
					set mensagem=null;
				end if;
				  insert into popbateria values(null,pop,capacidadeLocal,quantidadeCursor,
			    lumaId,dataMovimentacao,dataMovimentacao,'SISTEMA',mensagem,'DE',movimentacao);
            end if; 
           end if;
	    else  
--  select 'para';

		  if(((select data_inicio from popbateria where id_pop=pop 
				and data_fim is null and modelo=lumaId and data_fim is null
				order by data_inicio desc limit 1) <= dataMovimentacao) or
		  not exists(select 1 from popbateria where id_pop=pop and modelo=lumaId and data_fim is null))
		  then	

        set qtdVerifica=(select ifnull(sum(quantidade),0) from popbateria where data_fim is null and id_pop=pop and modelo=lumaId);	
        set quantidadeCursor = (select count(moviprod_quantidade) from movimentacaoproduto where movi_codigoid=movimentacao and estoprod_codigoid in 
                              (select estoprod_codigoid from estoqueproduto where prod_codigoid in (178,179,2485,177,3428,3970,3810)));
		    if not exists(select 1 from popbateria where id_pop=pop and modelo=lumaId)
		    then
			    set qtdVerifica=quantidadeCursor;
		    else
			    set qtdVerifica=qtdVerifica+quantidadeCursor;
		    end if;

      if((qtdVerifica % 4) = 0)
			then
 
         update popbateria set erro=null where id_pop=pop and data_fim is not null;

			   insert into popbateria values(null,pop,capacidadeLocal,quantidadeCursor,
			   lumaId,dataMovimentacao,null,'SISTEMA',null,'PARA',movimentacao);

			/* if(((select sum(quantidade) from popbateria where id_pop=pop and modelo=lumaId 
					and movimentacao=movimentacao and data_fim is null) % 4) = 0)
			 then
	
				update popbateria set data_fim=null,erro=null where id_pop=pop and modelo=lumaId and movimentacao=movimentacao;
			end if;
		 
			update popbateria set erro=null where id_pop=pop and data_fim is not null and erro in ('POP SEM BATERIA','SALDO NÃO É MÚLTIPLO DE 4');
			*/
      else 

			   insert into popbateria values(null,pop,capacidadeLocal,quantidadeCursor,
			   lumaId,dataMovimentacao,null,'SISTEMA','SALDO NÃO É MÚLTIPLO DE 4','PARA',movimentacao);	

			   /*insert into email values(null,54,'JOB','Alerta - Problema com quantidade de baterias',replace(replace(replace(replace(replace(corpoEmail,'#POP#',nomePop),'#POPENDERECO#',enderecoPop),'#DATA#',DATE_FORMAT(now(),'%d/%c/%Y')),'#QUANTIDADE#',cast(quantidadeCursor as char)),'#CAPACIDADE#',cast(capacidadeLocal as char)),'Sistemas SouthTech Telecom <sistemas@stech.net.br>','rwiedemann@stech.net.br',null,null,null,now(),now(),pop,'movimentacao');*/
         set enviaEmail=true;
			end if;
          end if;
	   end if; 


      end if;  
        SET cursorAnterior=movimentacao;
       
-- ####################################################ENVIA E-MAIL, busca todas baterias ativas do POP
     -- set enviaEmail=true;
     if(enviaEmail = true)
     then
      create temporary table dados (
        id integer primary key auto_increment,
        modelo varchar(5),
        quantidade varchar(5),
        capacidade varchar(5)
      ) ENGINE=MEMORY;

      insert into dados
      select null,modelo,quantidade,capacidade from popbateria where id_pop=pop and data_fim is null;

        set cont=1;
        set linhaEmail='';
        while(cont < (select count(*) from popbateria where id_pop=pop and data_fim is null)+1) do
           set modeloEmail = (select modelo from dados where id=cont);
           set quantidadeEmail = (select quantidade from dados where id=cont);
           set capacidadeEmail = (select capacidade from dados where id=cont);
 
           set linhaEmail=concat(linhaEmail,concat('<span>LUMA ID (',modeloEmail,'): Quantidade ',quantidadeEmail,', Capacidade unitária ',capacidadeEmail,' Ah</span>'));
                       
          set cont=cont+1;
        end while;
       
            -- insert into email values(null,54,'JOB','Alerta - Problema com quantidade de baterias',replace(replace(replace(replace(replace(replace(corpoEmail,'#POP#',nomePop),'#POPENDERECO#',enderecoPop),'#DATA#',DATE_FORMAT(now(),'%d/%c/%Y')),'#QUANTIDADE#',cast(quantidadeCursor as char)),'#CAPACIDADE#',cast(capacidadeLocal as char)),'#LISTABATERIAS',linhaEmail),'Sistemas SouthTech Telecom <sistemas@stech.net.br>','rwiedemann@stech.net.br',null,null,null,now(),now(),pop,'movimentacao');
              
      drop table dados;
     end if; 
-- ####################################################
    
	 end LOOP laco2;  
	close laco; 
	/*insert into testejob values(null,now());*/
	/*insert into popbateria values(null,6,6,6,6,now(),now(),'JOB','JOB','JOB');*/
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizaStatusPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `atualizaStatusPedido`(in pedido_id integer, in msg integer)
BEGIN
	SELECT pedistat_codigoid INTO @pedistat FROM pedido WHERE pedi_codigoid = pedido_id;
	UPDATE pedido SET pedistat_codigoid = CASE @pedistat
		WHEN 1 THEN IF(msg IN (1, 2, 3, 5), msg, IF(msg = 4 AND
			(SELECT count(*) FROM pedidoproduto WHERE pedi_codigoid = pedido_id)>0, 0, 4))
		WHEN 2 THEN IF(msg IN (1, 2, 5), msg, 0)
		WHEN 3 THEN IF(msg IN (3, 5), msg, IF(msg = 4 AND pedido_finalizavel(pedido_id), 4, 0))
		WHEN 4 THEN 0
		ELSE 0
	END WHERE pedi_codigoid = pedido_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizaStatusProjeto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `atualizaStatusProjeto`(in projeto_id integer, in msg integer)
BEGIN
	SELECT pedistat_codigoid INTO @projstat FROM projeto WHERE proj_codigoid = projeto_id;
	UPDATE projeto SET pedistat_codigoid = CASE @projstat
		WHEN 1 THEN IF(msg IN (1, 2, 3, 5), msg, 0)
		WHEN 2 THEN IF(msg IN (1, 2, 5), msg, 0)
		WHEN 3 THEN IF(msg IN (1, 3, 4, 5), msg, 0)
		WHEN 4 THEN IF(msg IN (4), msg, 0)
		ELSE 0
	END WHERE proj_codigoid = projeto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculaAutonomia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `calculaAutonomia`(in pop integer,in consumo integer,in estimativa integer,in capacidade integer,in leitura1 varchar(50),in leitura2 varchar(50),in dataleitura datetime,out valor integer)
begin
/*Variavel
Consumo DC:		      10	I
Indice de carga:		80%	S
Capacidade Banco:		200	Ah
						
FORMULAR  - Ah / I x S		*/

  declare autonomia float;
  declare hora varchar(10);
  declare data2 varchar(40);

  set hora = (SELECT DATE_FORMAT( now(),'%H:%i:%s' ));
  set data2 = CONCAT(CAST(dataleitura AS CHAR(10))," ", hora) ; 

	set autonomia = (capacidade / consumo) * estimativa;
  set autonomia = (autonomia / 100);

   update popautonomia set ativo=0 where id_pop=pop;
  -- atualiza popconsumo
   insert into popautonomia values(null,pop,data2,capacidade,autonomia,1);

  -- atualiza popconsumo
   insert into popconsumo values(null,pop,consumo,data2,leitura1,leitura2,estimativa);

	select autonomia;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcularStatusProjeto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `calcularStatusProjeto`(in projeto_id integer)
BEGIN
	IF (SELECT COUNT(*)=0 FROM pedido JOIN projeto_pedido USING(pedi_codigoid) WHERE pedistat_codigoid != 5 AND proj_codigoid=projeto_id)
		THEN CALL atualizaStatusProjeto(projeto_id, 5);
	ELSEIF (SELECT COUNT(*)=0 FROM pedido JOIN projeto_pedido USING(pedi_codigoid) WHERE pedistat_codigoid != 4 AND proj_codigoid=projeto_id)
		THEN CALL atualizaStatusProjeto(projeto_id, 4);
	ELSEIF (SELECT COUNT(*)=0 FROM pedido JOIN projeto_pedido USING(pedi_codigoid) JOIN pedidoproduto USING(pedi_codigoid) WHERE pedistat_codigoid NOT IN (3, 4) AND proj_codigoid=projeto_id)
		THEN CALL atualizaStatusProjeto(projeto_id, 3);
	ELSEIF (SELECT COUNT(*)>0 FROM pedido JOIN projeto_pedido USING(pedi_codigoid) WHERE pedistat_codigoid = 2 AND proj_codigoid=projeto_id)
		THEN CALL atualizaStatusProjeto(projeto_id, 2);
	ELSEIF (SELECT COUNT(*)>0 FROM pedido JOIN projeto_pedido USING(pedi_codigoid) WHERE pedistat_codigoid = 1 AND proj_codigoid=projeto_id)
		THEN CALL atualizaStatusProjeto(projeto_id, 1);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletaNotaEletronica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `deletaNotaEletronica`(in movimentacaoEntrada integer)
BLOCK1: BEGIN

	DECLARE excecao TINYINT(1);
	DECLARE finished TINYINT(1);
	DECLARE contador INTEGER;
	DECLARE movimentacao INTEGER;
	DECLARE quantidade INTEGER;
	DECLARE nfecodigoid INTEGER;
	DECLARE envinfecodigoid INTEGER;

	DECLARE lacoMovimentacao CURSOR FOR
	SELECT movi_codigoid, COUNT(movi_codigoid) AS quantidade
	FROM nfe.NFe
	WHERE movi_codigoid = movimentacaoEntrada
	GROUP BY movi_codigoid
	HAVING COUNT(movi_codigoid) > 100
	ORDER BY COUNT(movi_codigoid) DESC;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excecao = 1;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
	OPEN lacoMovimentacao;
	laco_1:LOOP

		SET contador = 1;
		FETCH lacoMovimentacao INTO movimentacao, quantidade;

		SELECT CONCAT('movimentacao ',CAST(movimentacao AS CHAR), ': ', CAST(quantidade AS CHAR));

		IF finished THEN
			LEAVE laco_1;
		END IF;

		BLOCK2: BEGIN

			DECLARE infNFeCodigoid INTEGER;
			DECLARE finishedNFe TINYINT(1);

			DECLARE lacoNFe CURSOR FOR
			SELECT n.NFe_codigoid,n.enviNFe_codigoid
			FROM nfe.NFe n
			INNER JOIN nfe.enviNFe e ON (e.enviNFe_codigoid=n.enviNFe_codigoid)
			WHERE e.enviNFe_enviado=0 AND n.movi_codigoid=movimentacao
			ORDER BY enviNFe_codigoid DESC;

			DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedNFe = 1;

			OPEN lacoNFe;
			laco_2:LOOP

				FETCH lacoNFe INTO nfecodigoid, envinfecodigoid;
				
				SELECT CONCAT('Envio ',CAST(envinfecodigoid AS CHAR), ': ', CAST(nfecodigoid AS CHAR));

				SELECT infNFe_codigoid INTO infNFeCodigoid FROM infNFe WHERE NFe_codigoid = nfecodigoid;

				IF finishedNFe THEN
					LEAVE laco_2;
				END IF;

				BLOCK3: BEGIN

					DECLARE finishedProduto TINYINT(1);
					DECLARE lacoProduto CURSOR FOR
					SELECT det_codigoid FROM nfe.det WHERE infNFe_codigoid = infNFe_codigoid;

					DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedProduto = 1;
					
					OPEN lacoProduto;
					
					laco_3:LOOP
						IF finishedProduto THEN
							LEAVE laco_3;
						END IF;
					END LOOP laco_3;
					CLOSE lacoProduto;

				END BLOCK3;

				IF(contador = (quantidade - 1)) THEN
					LEAVE laco_1;
				END IF;

				SET contador = contador + 1;
				
			END LOOP laco_2;
			CLOSE lacoNFe;

		END BLOCK2;

	END LOOP laco_1;  
	CLOSE lacoMovimentacao; 

END BLOCK1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emailRemessaDemonstracao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `emailRemessaDemonstracao`()
begin
	declare finished integer DEFAULT 0;
  declare nfeCursor varchar(10);
  declare situacaoCursor varchar(50);
  declare dataInicioCursor datetime;
  declare usuarioCursor varchar(50);
  declare emailCursor varchar(500);	
  declare corpoEmail varchar(5000);
  declare destinatarioCursor varchar(100);

	declare laco cursor for 
		
	select nfe,situacao,data_inicio,usuario,email,destinatario
  from nfe.remessa_demonstracao
  where data_inicio < date_sub(now(), interval 50 day) and data_fim is null;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;	
	open laco;
	laco2:LOOP

	fetch laco into nfeCursor,situacaoCursor,dataInicioCursor,usuarioCursor,emailCursor,destinatarioCursor;
	
	IF finished THEN
    LEAVE laco2;
    END IF;

   set corpoEmail="<html><body><span>Alerta - Problema na devolução de produtos</span><br><br><span>Data de geração do alerta: #DATA#</span><br><span>Este e-mail informa que os produtos vinculados a NFe - #NFE# no dia #DIA# gravado pelo #USUARIO#, estão pendentes de devolução a mais de 50 dias.</span><br><br><span style='font-weight: bold;'>ATENÇÃO: isto pode causar problema juridíco.</span><br><br><span>DESTINATÁRIO: #DESTINATARIO#</span><br><br><span>Faça sempre seu melhor, e integre um time de vencedores.</span><br><br></body></html>";
   set corpoEmail = replace(replace(replace(replace(replace(corpoEmail,'#DATA#',DATE_FORMAT(now(),'%d/%c/%Y')),'#NFE#',nfeCursor),'#USUARIO#',usuarioCursor),'#DESTINATARIO#',destinatarioCursor),'#DIA#',DATE_FORMAT(dataInicioCursor,'%d/%c/%Y'));

   insert into email values(null,54,'JOB','Alerta - Problema com NFe',corpoEmail,'Sistemas SouthTech Telecom <sistemas@stech.net.br>','rwiedemann@stech.net.br',null,null,null,now(),now(),nfeCursor,'nfe_remessa_devolucao');

	 end LOOP laco2;  
	close laco; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackNfe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `rollbackNfe`(in movimentacaoEntrada integer)
BLOCK1: BEGIN

  declare finished integer DEFAULT 0;
  declare movimentacao integer;
  declare quantidade integer;
  declare nfecodigoid integer(15);
  declare envinfecodigoid integer;
  declare contador integer;
  declare infnfecursor integer;
  DECLARE excecao SMALLINT DEFAULT 0;
  declare resposta varchar(100);
  declare emitcursor integer;
  declare destcursor integer;
  declare detcursor integer;
  declare impostocursor integer;
  declare icmscursor integer;
  declare piscursor integer;
  declare cofinscursor integer;
  declare totalcursor integer;
  declare envinfecursor integer;
  declare infadiccursor integer;
  declare retconscursor integer;
  declare prodcursor integer;
  declare dicursor integer;


  declare laco cursor for   
  select movi_codigoid,count(movi_codigoid) 
  from nfe.NFe where NFe_codigoid=43034
 
 
  group by movi_codigoid;
 


  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excecao = 1;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;	
	open laco;
	laco2:LOOP

  set contador = 1;

	fetch laco into movimentacao,quantidade;
	
  IF finished THEN
    LEAVE laco2;
    END IF;
        BLOCK2: BEGIN
        declare finishedInterno integer DEFAULT 0;

        declare lacoInterno cursor for
        select n.NFe_codigoid,n.enviNFe_codigoid 
        from nfe.NFe n  
        inner join nfe.enviNFe e on (e.enviNFe_codigoid=n.enviNFe_codigoid)
        -- where e.enviNFe_enviado=0 and n.movi_codigoid=movimentacao 
          where n.movi_codigoid=movimentacao
        order by enviNFe_codigoid desc;
     
   
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedInterno = 1;	
	      open lacoInterno;
	      laco3:LOOP
    
        fetch lacoInterno into nfecodigoid,envinfecodigoid;

        IF finishedInterno THEN
        LEAVE laco3;
        END IF;
                    
          set infnfecursor = (select infNFe_codigoid from nfe.infNFe where NFe_codigoid=nfecodigoid);
          set emitcursor = (select emit_codigoid from nfe.emit where infNFe_codigoid=infnfecursor);
          set destcursor = (select dest_codigoid from nfe.dest where infNFe_codigoid=infnfecursor);
          set envinfecursor = (select enviNFe_codigoid from nfe.NFe where NFe_codigoid=nfecodigoid);  
  
           START TRANSACTION; 

            delete from nfe.ide where infNFe_codigoid=infnfecursor; 
            delete from nfe.enderEmit where emit_codigoid=emitcursor;
            delete from nfe.emit where emit_codigoid=emitcursor;
            delete from nfe.enderDest where dest_codigoid=destcursor;
            delete from nfe.dest where dest_codigoid=destcursor;
            

            BLOCK3: BEGIN
            declare finishedProduto integer DEFAULT 0;

            declare lacoProduto cursor for
            select det_codigoid from nfe.det where infNFe_codigoid=infnfecursor;

            
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedProduto = 1;	
	          open lacoProduto;
	          laco4:LOOP

              fetch lacoProduto into detcursor;
                        
              IF finishedProduto THEN
              LEAVE laco4;
              END IF;

              set prodcursor = (select prod_codigoid from nfe.prod where det_codigoid=detcursor);
              set dicursor = (select DI_codigoid from nfe.DI where prod_codigoid=prodcursor);
              delete from nfe.adi where DI_codigoid=dicursor;     
              delete from nfe.DI where prod_codigoid=prodcursor;
              delete from nfe.prod where det_codigoid=detcursor;

              set impostocursor = (select imposto_codigoid from nfe.imposto where det_codigoid=detcursor);
              set icmscursor = (select ICMS_codigoid from nfe.ICMS where imposto_codigoid=impostocursor);
            
              delete from nfe.ICMS90 where ICMS_codigoid=icmscursor; 
              delete from nfe.ICMS00 where ICMS_codigoid=icmscursor; 
              delete from nfe.ICMS40 where ICMS_codigoid=icmscursor;
              delete from nfe.ICMS where ICMS_codigoid=icmscursor;         
                  
              set piscursor = (select PIS_codigoid from nfe.PIS where imposto_codigoid=impostocursor);                   
              delete from nfe.PISQtde where PIS_codigoid=piscursor;
              delete from nfe.PISOutr where PIS_codigoid=piscursor;
              delete from nfe.PISAliq where PIS_codigoid=piscursor;      
              delete from nfe.PISNT where PIS_codigoid=piscursor;  
              delete from nfe.PIS where imposto_codigoid=impostocursor;
                  
              set cofinscursor = (select COFINS_codigoid from nfe.COFINS where imposto_codigoid=impostocursor);
              delete from nfe.COFINSQtde where COFINS_codigoid=cofinscursor;
              delete from nfe.COFINSOutr where COFINS_codigoid=cofinscursor;     
              delete from nfe.COFINSAliq where COFINS_codigoid=cofinscursor;
              delete from nfe.COFINSNT where COFINS_codigoid=cofinscursor;
              delete from nfe.COFINS where imposto_codigoid=impostocursor;                

              delete from nfe.imposto where det_codigoid=detcursor;  
              delete from nfe.det where det_codigoid=detcursor;        
                 
             end LOOP laco4;  
	           close lacoProduto;           
          END BLOCK3;

          set totalcursor = (select total_codigoid from nfe.total where infNFe_codigoid=infnfecursor);  
          delete from nfe.ICMSTot where total_codigoid=totalcursor;    
          delete from nfe.total where infNFe_codigoid=infnfecursor;
          delete from nfe.transp where infNFe_codigoid=infnfecursor;   
              
          delete from nfe.nfe_aprovacao where NFe_codigoid=nfecodigoid;    
          delete from nfe.nfeProc where NFe_codigoid=nfecodigoid;
          delete from nfe.log_erro where NFe_codigoid=nfecodigoid;   
          delete from nfe.evento where NFe_codigoid=nfecodigoid; 
          delete from nfe.entrega where infNFe_codigoid=infnfecursor;  

          set infadiccursor = (select infAdic_codigoid from nfe.infAdic where infNFe_codigoid=infnfecursor);
          delete from nfe.obsCont where infAdic_codigoid=infadiccursor;
          delete from nfe.obsFisco where infAdic_codigoid=infadiccursor;
          delete from nfe.procRef where infAdic_codigoid=infadiccursor;
          delete from nfe.infAdic where infNFe_codigoid=infnfecursor;
          
          delete from nfe.avulsa where infNFe_codigoid=infnfecursor;
          delete from nfe.cana where infNFe_codigoid=infnfecursor;
          delete from nfe.cobr where infNFe_codigoid=infnfecursor;
          delete from nfe.compra where infNFe_codigoid=infnfecursor;  
          delete from nfe.exporta where infNFe_codigoid=infnfecursor;
          delete from nfe.retirada where infNFe_codigoid=infnfecursor; 

            -- select CONCAT('nfe_codigoid - ',nfecodigoid);
            -- select concat('envinfecodigoid - ',envinfecodigoid); 

                                                
          delete from nfe.infNFe where NFe_codigoid=nfecodigoid;             
          delete from nfe.NFe where NFe_codigoid=nfecodigoid;         

  /*
         set retconscursor = (select retConsReciNFe_codigoid from nfe.retConsReciNFe where enviNFe_codigoid=envinfecursor);
           delete from nfe.protNFe where retConsReciNFe_codigoid=retconscursor;
           delete from nfe.retConsReciNFe where enviNFe_codigoid=envinfecursor;

           delete from nfe.retEnviNFe where enviNFe_codigoid=envinfecursor;
           delete from nfe.enviNFe where enviNFe_codigoid=envinfecursor; */
                     
         IF excecao = 1 
          THEN
				      SET resposta = concat('Erro ao gravar dados -',movimentacao );
           show errors;
          -- SHOW WARNINGS;
				  ROLLBACK;
	      ELSE
				   SET resposta = 'Salvo com sucesso!';
           -- ROLLBACK;
           commit;
	       END IF; 

           select resposta;
        --  select quantidade;
          
          if(contador = (quantidade - 1)) then
            close lacoInterno;
            leave laco3;
          end if; 
     
          set contador = contador + 1;
             
         end LOOP laco3;  
	      close lacoInterno; 
        END BLOCK2;  
        
   end LOOP laco2;  
	close laco; 

END BLOCK1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subtrairRejeicaoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `subtrairRejeicaoPedido`(in pedidorejeicao_id integer)
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE pedirejeProdId, pedirejeQtd INT;
	DECLARE curRejeprod CURSOR FOR SELECT prod_codigoid, pedirejeprod_quantidade FROM pedidorejeicaoproduto WHERE pedireje_codigoid = pedidorejeicao_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN curRejeprod;
	SELECT pedi_codigoid into @pedido_id FROM pedidorejeicao WHERE pedireje_codigoid = pedidorejeicao_id;
	produtos: LOOP
		FETCH curRejeprod INTO pedirejeProdId, pedirejeQtd;
		IF done THEN 
			LEAVE produtos; 
		END IF;
		UPDATE pedidoproduto 
			SET pediprod_quantidade = pediprod_quantidade - pedirejeQtd 
			WHERE prod_codigoid = pedirejeProdId AND pedi_codigoid = @pedido_id AND pediprodstat_codigoid != 5;
	END LOOP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testenfe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `testenfe`(in movimentacaoEntrada integer)
BLOCK1: BEGIN       
  declare finished integer DEFAULT 0;
  declare finishedInterno integer DEFAULT 0;
  declare movimentacao integer;
  declare quantidade integer;
  declare nfecodigoid integer(15);
  declare envinfecodigoid integer;
  declare contador integer;
  declare infnfecursor integer;
  DECLARE excecao SMALLINT DEFAULT 0;
  declare resposta varchar(100);
  declare emitcursor integer;
  declare destcursor integer;
  declare detcursor integer;
  declare impostocursor integer;
  declare icmscursor integer;
  declare piscursor integer;
  declare cofinscursor integer;
  declare totalcursor integer;
  declare envinfecursor integer;
  declare infadiccursor integer;

   

  declare laco cursor for   
  select movi_codigoid,count(movi_codigoid) 
  from nfe.NFe
  where movi_codigoid=movimentacaoEntrada
  group by movi_codigoid
  having count(movi_codigoid)>100
 order by count(movi_codigoid) desc; -- limit 1;


  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excecao = 1;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;	
	open laco;
	laco2:LOOP

  set contador = 1;


        CREATE TEMPORARY TABLE temp
          (
            movimentacao_temp varchar(10),
            nfe_temp varchar(10)
          )ENGINE=MEMORY;

	fetch laco into movimentacao,quantidade;
	
  IF finished THEN
    LEAVE laco2;
    END IF;
        BLOCK2: BEGIN
      
       declare lacoInterno cursor for
        select n.NFe_codigoid,n.enviNFe_codigoid 
        from nfe.NFe n  
        -- inner join nfe.enviNFe e on (e.enviNFe_codigoid=n.enviNFe_codigoid)
        -- where e.enviNFe_enviado=0 and n.movi_codigoid=movimentacao 
        where n.movi_codigoid=movimentacao
        order by enviNFe_codigoid desc; -- limit 10;
        
    
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedInterno = 1;	
	      open lacoInterno;
	      laco3:LOOP
    
        fetch lacoInterno into nfecodigoid,envinfecodigoid;

        IF finishedInterno THEN
        LEAVE laco3;
        END IF;
         
          -- select CONCAT('nfe_codigoid - ',nfecodigoid);
             
          set infnfecursor = (select infNFe_codigoid from nfe.infNFe where NFe_codigoid=nfecodigoid);
          set emitcursor = (select emit_codigoid from nfe.emit where infNFe_codigoid=infnfecursor);
          set destcursor = (select dest_codigoid from nfe.dest where infNFe_codigoid=infnfecursor);
          set envinfecursor = (select enviNFe_codigoid from nfe.NFe where NFe_codigoid=nfecodigoid);  
  
         -- START TRANSACTION;
              
              insert into temp values(movimentacao,nfecodigoid); 
              -- select *from temp;

            /*delete from nfe.ide where infNFe_codigoid=infnfecursor; 
            delete from nfe.enderEmit where emit_codigoid=emitcursor;
            delete from nfe.emit where emit_codigoid=emitcursor;
            delete from nfe.enderDest where dest_codigoid=destcursor;
            delete from nfe.dest where dest_codigoid=destcursor;*/
            
            
           /* BLOCK3: BEGIN
            declare lacoProduto cursor for
            select det_codigoid from nfe.det where infNFe_codigoid=infnfecursor;

            DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;	
	          open lacoProduto;
	          laco4:LOOP

              fetch lacoProduto into detcursor;
                        
              IF finished THEN
              LEAVE laco4;
              END IF;

                   select concat('det - ',detcursor); 
              delete from nfe.prod where det_codigoid=detcursor;

              set impostocursor = (select imposto_codigoid from nfe.imposto where det_codigoid=detcursor);
              set icmscursor = (select ICMS_codigoid from nfe.ICMS where imposto_codigoid=impostocursor);
            select concat('impos - ',impostocursor);
              select concat('icms - ',icmscursor);
            
              delete from nfe.ICMS40 where ICMS_codigoid=icmscursor;
              delete from nfe.ICMS where ICMS_codigoid=icmscursor;         
                  
              set piscursor = (select PIS_codigoid from nfe.PIS where imposto_codigoid=impostocursor);      
              delete from nfe.PISNT where PIS_codigoid=piscursor;  
              delete from nfe.PIS where imposto_codigoid=impostocursor;
                  select concat('pis - ',piscursor);
                  
              set cofinscursor = (select COFINS_codigoid from nfe.COFINS where imposto_codigoid=impostocursor);
              delete from nfe.COFINSNT where COFINS_codigoid=cofinscursor;
              delete from nfe.COFINS where imposto_codigoid=impostocursor;
                  select concat('cofins - ',cofinscursor);                  

              delete from nfe.imposto where det_codigoid=detcursor;       
                 
             end LOOP laco4;  
	           close lacoProduto;           
          END BLOCK3; */

          /*set totalcursor = (select total_codigoid from nfe.total where infNFe_codigoid=infnfecursor);  
          delete from nfe.ICMSTot where total_codigoid=totalcursor;    
          delete from nfe.total where infNFe_codigoid=infnfecursor;
          delete from nfe.transp where infNFe_codigoid=infnfecursor;   
              
          delete from nfe.nfe_aprovacao where NFe_codigoid=nfecodigoid;    
          delete from nfe.nfeProc where NFe_codigoid=nfecodigoid;
          delete from nfe.log_erro where NFe_codigoid=nfecodigoid;   
          delete from nfe.evento where NFe_codigoid=nfecodigoid; 
          delete from nfe.entrega where infNFe_codigoid=infnfecursor;  

          set infadiccursor = (select infAdic_codigoid from nfe.infAdic where infNFe_codigoid=infnfecursor);
          delete from nfe.obsCont where infAdic_codigoid=infadiccursor;
          delete from nfe.obsFisco where infAdic_codigoid=infadiccursor;
          delete from nfe.procRef where infAdic_codigoid=infadiccursor;
          delete from nfe.infAdic where infNFe_codigoid=infnfecursor;
          

          delete from nfe.avulsa where infNFe_codigoid=infnfecursor;
          delete from nfe.cana where infNFe_codigoid=infnfecursor;
          delete from nfe.cobr where infNFe_codigoid=infnfecursor;
          delete from nfe.compra where infNFe_codigoid=infnfecursor;  
          delete from nfe.exporta where infNFe_codigoid=infnfecursor;
          delete from nfe.retirada where infNFe_codigoid=infnfecursor; 

          delete from nfe.det where infNFe_codigoid=infnfecursor;                                              
          delete from nfe.infNFe where NFe_codigoid=nfecodigoid;             
          delete from nfe.NFe where NFe_codigoid=nfecodigoid;         
          delete from nfe.enviNFe where enviNFe_codigoid=envinfecursor; */
             
         
        /* IF excecao = 1 
          THEN
				      SET resposta = 'Erro ao gravar dados - NFecodigoid';
           show errors;
          SHOW WARNINGS;
				  ROLLBACK;
	      ELSE
				   SET resposta = 'Salvo com sucesso!';
				   COMMIT;
           -- ROLLBACK;
	       END IF; */


          if(contador = (quantidade - 1)) then
            close lacoInterno;
            leave laco3;
          end if; 

          set contador = contador + 1;

             
         end LOOP laco3;  
	      close lacoInterno; 
        END BLOCK2;            
      
      

   end LOOP laco2;  
	close laco; 

          select *from temp;
           drop table temp;

END BLOCK1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `voltaMovimentacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `voltaMovimentacao`(in movimentacaoEntrada integer)
begin
  declare origem integer;
  declare destino integer;
  declare produto integer;
  declare finished integer DEFAULT 0;
  declare estoprod integer;
  declare movimentacaoQuantidade integer;
  declare estoqueQuantidade integer;
  declare estoqueOrigem integer;
  declare lote integer;
  

   declare laco cursor for 
  select e.prod_codigoid,e.estoprod_codigoid,p.moviprod_quantidade,e.estoprod_total,p.lote_codigoid  
  from luma.movimentacaoproduto p 
  inner join luma.estoqueproduto e on (p.estoprod_codigoid=e.estoprod_codigoid)
  where p.movi_codigoid=movimentacaoEntrada;

  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;	
	open laco;
	laco2:LOOP

	fetch laco into produto,estoprod,movimentacaoQuantidade,estoqueQuantidade,lote;
	
	IF finished THEN
    LEAVE laco2;
    END IF;
      set origem = (select unid_decodigoid from luma.movimentacao where movi_codigoid=movimentacaoEntrada);
      set destino = (select unid_paracodigoid from luma.movimentacao where movi_codigoid=movimentacaoEntrada);
  
      select origem;
      select destino;

      -- tratamento para verificar se o produto movimentado ainda está no estoque destino
      if(movimentacaoQuantidade <= estoqueQuantidade) then
        select 'entro1';
        -- retira quantidade do estoque destino
        update luma.estoqueproduto set estoprod_total = (estoprod_total - movimentacaoQuantidade) where estoprod_codigoid=estoprod;
        -- insere quantidade no estoque origem
        set estoqueOrigem = (select esto_codigoid from luma.estoque where unid_codigoid=origem);       
    
        select estoqueOrigem;
        select produto;

        if exists(select 1 from luma.estoqueproduto where esto_codigoid=estoqueOrigem and prod_codigoid=produto) then
           select 'entro2';                   
          update luma.estoqueproduto set estoprod_total = (estoprod_total + movimentacaoQuantidade) where estoprod_codigoid=estoqueOrigem;
        else 
           select 'entro3';         
           insert into luma.estoqueproduto values(null,estoqueOrigem,produto,null,null,movimentacaoQuantidade);
        end if; 

        if(lote <> null) then
            if((select lote_quantidade from luma.lote where estoprod_codigoid=estoprod and lote_codigoid=lote) > 0) then
              update luma.lote set lote_quantidade = (lote_quantidade - movimentacaoQuantidade) 
              where estoprod_codigoid=estoprod and lote_codigoid=lote; 
    

             -- if exits(select 1 from luma.lote where estoprod_codigoid=estoqueOrigem and lote_codigoid=lote) then            
             -- end if;  
                                          
            end if;
        end if;
      end if;    
	 end LOOP laco2;  
	close laco; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `preco_medio`
--

/*!50001 DROP VIEW IF EXISTS `preco_medio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.10.247` SQL SECURITY DEFINER */
/*!50001 VIEW `preco_medio` AS select ifnull(`valor_ordem`(`produto`.`prod_codigoid`),ifnull(`valor_cotacao`(`produto`.`prod_codigoid`),0.00)) AS `preco_medio`,`produto`.`prod_codigoid` AS `prod_codigoid` from `produto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_produtos_adquiridos`
--

/*!50001 DROP VIEW IF EXISTS `view_produtos_adquiridos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_produtos_adquiridos` AS select substr(`movi`.`movi_motivo`,(locate(':',`movi`.`movi_motivo`) + 1),((locate('::',`movi`.`movi_motivo`) - 1) - locate(':',`movi`.`movi_motivo`))) AS `numero_nota`,date_format(str_to_date(substr(`movi`.`movi_motivo`,(locate('Data:',`movi`.`movi_motivo`) + 5),10),'%d/%m/%Y'),'%Y-%m-%d') AS `data_nota`,`cate`.`cate_ordem` AS `cate_ordem`,`cate`.`cate_nome` AS `cate_nome`,`movi`.`movi_codigoid` AS `movi_codigoid`,`movi`.`movi_datainc` AS `movi_datainc`,`movi`.`movi_motivo` AS `movi_motivo`,`orde`.`orde_codigoid` AS `orde_codigoid`,`orde`.`tipo_codigoid` AS `tipo_codigoid`,`orde`.`orde_dataentrega` AS `orde_dataentrega`,`prod`.`prod_codigoid` AS `prod_codigoid`,`prod`.`prod_nome` AS `prod_nome`,`moviprod`.`moviprod_quantidade` AS `quantidade_produtos` from (((((((`movimentacao` `movi` join `movimentacaoproduto` `moviprod` on(((`moviprod`.`movi_codigoid` = `movi`.`movi_codigoid`) and (`movi`.`movi_tipo` = 'Recebimento de Material')))) join `estoqueproduto` `estoprod` on((`estoprod`.`estoprod_codigoid` = `moviprod`.`estoprod_codigoid`))) join `produto` `prod` on((`prod`.`prod_codigoid` = `estoprod`.`prod_codigoid`))) join `categoria` `cate` on((`cate`.`cate_codigoid` = `prod`.`cate_codigoid`))) left join `lote` on((`lote`.`lote_codigoid` = `moviprod`.`lote_codigoid`))) left join `ordemmovimentacao` `ordemovi` on((`ordemovi`.`movi_codigoid` = `movi`.`movi_codigoid`))) left join `ordem` `orde` on(((`orde`.`orde_codigoid` = `ordemovi`.`orde_codigoid`) and (`orde`.`tipo_codigoid` in (52,53))))) */;
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

-- Dump completed on 2018-02-01 17:43:54
