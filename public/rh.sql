-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 192.168.10.249    Database: rh
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
-- Table structure for table `rh_advertencia`
--

DROP TABLE IF EXISTS `rh_advertencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_advertencia` (
  `id_advertencia` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `data_inc` date DEFAULT NULL,
  PRIMARY KEY (`id_advertencia`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_atributo_benefico_colaborador`
--

DROP TABLE IF EXISTS `rh_atributo_benefico_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_atributo_benefico_colaborador` (
  `id_atributo_benefico_colaborador` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador_beneficio` int(11) NOT NULL,
  `id_beneficio_atributo` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `valor_decimal` decimal(10,2) DEFAULT NULL,
  `valor_data` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_atributo_benefico_colaborador`),
  KEY `fk_rh_atributo_benefico_colaborador_rh_colaborador_benefici_idx` (`id_colaborador_beneficio`),
  KEY `fk_rh_atributo_benefico_colaborador_rh_beneficio_atributo1_idx` (`id_beneficio_atributo`)
) ENGINE=InnoDB AUTO_INCREMENT=7814 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_banco_definicao`
--

DROP TABLE IF EXISTS `rh_banco_definicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_banco_definicao` (
  `id_banco_definicao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_banco_definicao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_banco_operacao`
--

DROP TABLE IF EXISTS `rh_banco_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_banco_operacao` (
  `id_banco_operacao` int(11) NOT NULL AUTO_INCREMENT,
  `operacao` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_banco_operacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_beneficio`
--

DROP TABLE IF EXISTS `rh_beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_beneficio` (
  `id_beneficio` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `cartao_luma` tinyint(1) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `motivo_edicao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_beneficio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_beneficio_atributo`
--

DROP TABLE IF EXISTS `rh_beneficio_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_beneficio_atributo` (
  `id_beneficio_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `id_beneficio` int(11) NOT NULL,
  `id_beneficio_tipo_atributo` int(11) NOT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_beneficio_atributo`),
  KEY `fk_rh_beneficio_atributo_rh_beneficio1_idx` (`id_beneficio`),
  KEY `fk_rh_beneficio_atributo_rh_beneficio_tipo_atributo1_idx` (`id_beneficio_tipo_atributo`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_beneficio_tipo_atributo`
--

DROP TABLE IF EXISTS `rh_beneficio_tipo_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_beneficio_tipo_atributo` (
  `id_beneficio_tipo_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `mascara` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_beneficio_tipo_atributo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_bonificacao_recorrente`
--

DROP TABLE IF EXISTS `rh_bonificacao_recorrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_bonificacao_recorrente` (
  `id_bonificacao_recorrente` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `percentual` int(5) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_bonificacao_recorrente`),
  KEY `fk_rh_bonificacao_recorrente_rh_colaborador1_idx` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_cargo`
--

DROP TABLE IF EXISTS `rh_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_cargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_cargo_material` int(11) DEFAULT NULL,
  `motivo_edicao` varchar(255) DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `nivel` varchar(5) DEFAULT NULL,
  `id_grupo_sistech` int(11) DEFAULT NULL,
  `crea` tinyint(1) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`),
  KEY `fk_rh_cargo_rh_tipo_cargo1_idx` (`id_tipo_cargo`),
  KEY `fk_rh_cargo_rh_grupo_material1_idx` (`id_cargo_material`),
  CONSTRAINT `fk_rh_cargo_rh_grupo_material1` FOREIGN KEY (`id_cargo_material`) REFERENCES `rh_grupo_material` (`id_cargo_material`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_cargo_rh_tipo_cargo1` FOREIGN KEY (`id_tipo_cargo`) REFERENCES `rh_tipo_cargo` (`id_tipo_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_cargo_ordenado`
--

DROP TABLE IF EXISTS `rh_cargo_ordenado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_cargo_ordenado` (
  `id_cargo_ordenado` int(11) NOT NULL AUTO_INCREMENT,
  `id_cargo` int(11) NOT NULL,
  `ordenado_cargo` decimal(10,2) DEFAULT NULL,
  `periculosidade` float DEFAULT NULL,
  `insalubridade` float DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `motivo_edicao` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cargo_ordenado`),
  KEY `fk_rh_cargo_ordenado_rh_cargo1_idx` (`id_cargo`),
  CONSTRAINT `fk_rh_cargo_ordenado_rh_cargo1` FOREIGN KEY (`id_cargo`) REFERENCES `rh_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_categoria_ocorrencia`
--

DROP TABLE IF EXISTS `rh_categoria_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_categoria_ocorrencia` (
  `id_categoria_ocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `advertencia` tinyint(1) DEFAULT NULL,
  `email_gestor` tinyint(1) DEFAULT NULL,
  `email_rh` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador`
--

DROP TABLE IF EXISTS `rh_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador` (
  `id_colaborador` int(11) NOT NULL AUTO_INCREMENT,
  `id_cad_user_sistech` int(11) DEFAULT NULL,
  `id_alt_usuario_sistech` int(11) DEFAULT NULL,
  `id_tipo_colaborador` int(11) DEFAULT NULL,
  `id_colaborador_pai` int(11) DEFAULT NULL,
  `unid_codigoid` int(11) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  `fone` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `local_nascimento` int(11) DEFAULT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `filiacao_profissao` varchar(255) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  `id_colaborador_anterior` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_colaborador`),
  KEY `fk_rh_colaborador_rh_tipo_colaborador1_idx` (`id_tipo_colaborador`),
  KEY `fk_rh_colaborador_rh_colaborador1_idx` (`id_colaborador_pai`),
  KEY `fk_rh_colaborador_id_alt_usuario_sistech_idx` (`id_alt_usuario_sistech`),
  CONSTRAINT `fk_rh_colaborador_rh_colaborador1` FOREIGN KEY (`id_colaborador_pai`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_colaborador_rh_tipo_colaborador1` FOREIGN KEY (`id_tipo_colaborador`) REFERENCES `rh_tipo_colaborador` (`id_tipo_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3909 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rh`.`rh_colaborador_AUPD`
AFTER UPDATE ON `rh`.`rh_colaborador`
FOR EACH ROW
begin
if new.cpf <> old.cpf then
update rh.rh_documento set rh_documento.numero = new.cpf where rh_documento.id_documento_tipo = 1 and rh_documento.id_colaborador = old.id_colaborador;
end if;
if new.id_alt_usuario_sistech <> old.id_alt_usuario_sistech	then
update gcdb.aut_usuarios set gcdb.aut_usuarios.nome = old.nome where gcdb.aut_usuarios.id = new.id_alt_usuario_sistech;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rh_colaborador_banco`
--

DROP TABLE IF EXISTS `rh_colaborador_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_banco` (
  `id_colaborador_banco` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `id_banco_definicao` int(11) NOT NULL,
  `id_banco_operacao` int(11) NOT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `portabilidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_colaborador_banco`),
  KEY `fk_rh_colaborador_banco_rh_colaborador1_idx` (`id_colaborador`),
  KEY `fk_rh_colaborador_banco_rh_conta_definicao1_idx` (`id_banco_definicao`),
  KEY `fk_rh_colaborador_banco_rh_banco_operacao1_idx` (`id_banco_operacao`)
) ENGINE=InnoDB AUTO_INCREMENT=1319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_beneficio`
--

DROP TABLE IF EXISTS `rh_colaborador_beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_beneficio` (
  `id_colaborador_beneficio` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `id_beneficio` int(11) NOT NULL,
  `registrante` int(11) DEFAULT NULL,
  `registrante_aprovacao` int(11) DEFAULT NULL,
  `data_aprovacao` timestamp NULL DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_colaborador_beneficio`),
  KEY `fk_rh_colaborador_beneficio_rh_pessoa1_idx` (`id_colaborador`),
  KEY `fk_rh_colaborador_beneficio_rh_beneficio_tipo1_idx` (`id_beneficio`)
) ENGINE=InnoDB AUTO_INCREMENT=2272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_cargo`
--

DROP TABLE IF EXISTS `rh_colaborador_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_cargo` (
  `id_colaborador_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `data_prevista` timestamp NULL DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `cancelado` tinyint(1) DEFAULT '0',
  `processado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_colaborador_cargo`),
  KEY `fk_rh_colaborador_has_rh_cargo_rh_cargo1_idx` (`id_cargo`),
  KEY `fk_rh_colaborador_has_rh_cargo_rh_colaborador1_idx` (`id_colaborador`),
  CONSTRAINT `fk_rh_colaborador_has_rh_cargo_rh_cargo1` FOREIGN KEY (`id_cargo`) REFERENCES `rh_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_colaborador_has_rh_cargo_rh_colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1764 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_departamento`
--

DROP TABLE IF EXISTS `rh_colaborador_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_departamento` (
  `id_colaborador_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_departamento` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `data_inc` date DEFAULT NULL,
  `boss` tinyint(1) DEFAULT NULL,
  `aprova_sa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_colaborador_departamento`),
  KEY `fk_rh_departamento_has_rh_colaborador_rh_colaborador1_idx` (`id_colaborador`),
  KEY `fk_rh_departamento_has_rh_colaborador_rh_departamento1_idx` (`id_departamento`),
  CONSTRAINT `fk_rh_departamento_has_rh_colaborador_rh_colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_departamento_has_rh_colaborador_rh_departamento1` FOREIGN KEY (`id_departamento`) REFERENCES `rh_departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2923 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_empresa_anterior`
--

DROP TABLE IF EXISTS `rh_colaborador_empresa_anterior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_empresa_anterior` (
  `id_emprego_anterior` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `data_final` timestamp NULL DEFAULT NULL,
  `cargo` varchar(75) DEFAULT NULL,
  `salario` decimal(15,2) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_emprego_anterior`),
  KEY `fk_rh_emprego_anterior_rh_colaborador1_idx` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_ferias`
--

DROP TABLE IF EXISTS `rh_colaborador_ferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_ferias` (
  `id_colaborador_ferias` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `data_inc` datetime DEFAULT NULL,
  `data_inicial` date DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  `registrante` int(11) NOT NULL,
  PRIMARY KEY (`id_colaborador_ferias`),
  KEY `fk_rh_colaborador_ferias_rh_colaborador1_idx` (`id_colaborador`),
  CONSTRAINT `fk_rh_colaborador_ferias_rh_colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_filial`
--

DROP TABLE IF EXISTS `rh_colaborador_filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_filial` (
  `id_colaborador_filial` int(11) NOT NULL AUTO_INCREMENT,
  `sistech_codigoid` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_prevista` timestamp NULL DEFAULT NULL,
  `data_inicial` timestamp NULL DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_fim` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `motivo_edicao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_colaborador_filial`),
  KEY `fk_rh_colaborador_filial_rh_colaborador1_idx` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=1875 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_colaborador_formacao`
--

DROP TABLE IF EXISTS `rh_colaborador_formacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_colaborador_formacao` (
  `id_colaborador_formacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `escolaridade` varchar(255) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL,
  `data_prevista` datetime DEFAULT NULL,
  `data_inicial` datetime DEFAULT NULL,
  `data_final` datetime DEFAULT NULL,
  PRIMARY KEY (`id_colaborador_formacao`),
  KEY `fk_rh_colaborador_formacao_rh_colaborador1_idx` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_contrato`
--

DROP TABLE IF EXISTS `rh_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_contrato` (
  `id_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_prevista` date DEFAULT NULL,
  `contrato_principal` int(11) DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_contrato`),
  KEY `fk_rh_contrato_rh_colaborador1_idx` (`id_colaborador`),
  CONSTRAINT `fk_rh_contrato_rh_colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1393 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_curso`
--

DROP TABLE IF EXISTS `rh_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `curso` varchar(255) DEFAULT NULL,
  `tipo_curso` varchar(45) DEFAULT NULL,
  `instituicao` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `data_conclusao` timestamp NULL DEFAULT NULL,
  `horas_curso` varchar(45) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `fk_rh_curso_rh_colaborador1_idx` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_demissao`
--

DROP TABLE IF EXISTS `rh_demissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_demissao` (
  `id_demissao` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `data_inc` datetime DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_demissao` date DEFAULT NULL,
  `pendencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_demissao`),
  KEY `fk_rh_demissao_rh_colaborador1_idx` (`id_colaborador`),
  CONSTRAINT `fk_rh_demissao_rh_colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_departamento`
--

DROP TABLE IF EXISTS `rh_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_departamento` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_departamento_asc` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `staff` tinyint(1) DEFAULT NULL,
  `data_inc` date DEFAULT NULL,
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_departamento`),
  KEY `fk_rh_departamento_rh_departamento1_idx` (`id_departamento_asc`),
  CONSTRAINT `fk_rh_departamento_rh_departamento1` FOREIGN KEY (`id_departamento_asc`) REFERENCES `rh_departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_departamento_cargo`
--

DROP TABLE IF EXISTS `rh_departamento_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_departamento_cargo` (
  `rh_departamento_id_departamento` int(11) NOT NULL,
  `rh_cargo_id_cargo` int(11) NOT NULL,
  PRIMARY KEY (`rh_departamento_id_departamento`,`rh_cargo_id_cargo`),
  KEY `fk_rh_departamento_has_rh_cargo_rh_cargo1_idx` (`rh_cargo_id_cargo`),
  KEY `fk_rh_departamento_has_rh_cargo_rh_departamento1_idx` (`rh_departamento_id_departamento`),
  CONSTRAINT `fk_rh_departamento_has_rh_cargo_rh_cargo1` FOREIGN KEY (`rh_cargo_id_cargo`) REFERENCES `rh_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_departamento_has_rh_cargo_rh_departamento1` FOREIGN KEY (`rh_departamento_id_departamento`) REFERENCES `rh_departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_documento`
--

DROP TABLE IF EXISTS `rh_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_documento` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `id_documento_tipo` int(11) NOT NULL,
  `data_expedicao` timestamp NULL DEFAULT NULL,
  `data_vencimento` timestamp NULL DEFAULT NULL,
  `numero` varchar(80) DEFAULT NULL,
  `url_documento` varchar(255) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `fk_rh_documento_rh_colaborador1_idx` (`id_colaborador`),
  KEY `fk_rh_documento_rh_documento_tipo1_idx` (`id_documento_tipo`),
  CONSTRAINT `fk_colaborador` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo` FOREIGN KEY (`id_documento_tipo`) REFERENCES `rh_documento_tipo` (`id_documento_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_documento_atributo`
--

DROP TABLE IF EXISTS `rh_documento_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_documento_atributo` (
  `id_documento_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_atributo` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `pagina` int(11) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `refencia_historico` int(11) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_documento_atributo`),
  KEY `fk_rh_documento_atributo_rh_tipo_atributo1_idx` (`id_tipo_atributo`),
  KEY `fk_rh_documento_atributo_rh_documento1_idx1` (`id_documento`),
  CONSTRAINT `fk_rh_documento_atributo_rh_documento1` FOREIGN KEY (`id_documento`) REFERENCES `rh_documento` (`id_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22507 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_documento_gen`
--

DROP TABLE IF EXISTS `rh_documento_gen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_documento_gen` (
  `id_documento_gen` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `sistech_tmp_id` int(11) DEFAULT NULL,
  `sistech_tmp_historico_id` int(11) DEFAULT NULL,
  `sessao` varchar(45) DEFAULT NULL,
  `data_inc` datetime DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `registrante_retorno` int(11) DEFAULT NULL,
  `data_retorno` datetime DEFAULT NULL,
  PRIMARY KEY (`id_documento_gen`),
  KEY `fk_rh_documento_gen_rh_colaborador1_idx` (`id_colaborador`),
  KEY `fk_rh_documento_gen_rh_documento1_idx` (`id_documento`),
  CONSTRAINT `fk_rh_documento_gen_rh_colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `rh_colaborador` (`id_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_documento_gen_rh_documento1` FOREIGN KEY (`id_documento`) REFERENCES `rh_documento` (`id_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3551 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_documento_tipo`
--

DROP TABLE IF EXISTS `rh_documento_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_documento_tipo` (
  `id_documento_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_documento_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_grupo_material`
--

DROP TABLE IF EXISTS `rh_grupo_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_grupo_material` (
  `id_cargo_material` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cargo_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_ocorrencia_horario`
--

DROP TABLE IF EXISTS `rh_ocorrencia_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_ocorrencia_horario` (
  `idocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria_ocorrencia` int(11) NOT NULL,
  `data_inc` datetime DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `intervalo_inicio` varchar(45) DEFAULT NULL,
  `intervalo_fim` varchar(45) DEFAULT NULL,
  `hora_saida` datetime DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  `registrante_leitura` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `data_leitura` datetime DEFAULT NULL,
  `id_documento_gen` int(11) DEFAULT NULL,
  PRIMARY KEY (`idocorrencia`),
  KEY `fk_rh_ocorrencia_horario_rh_categoria_ocorrencia1_idx` (`id_categoria_ocorrencia`),
  KEY `fk_rh_ocorrencia_horario_rh_ocorrencia_ponto_idx` (`id_documento_gen`),
  CONSTRAINT `fk_rh_ocorrencia_horario_rh_categoria_ocorrencia1` FOREIGN KEY (`id_categoria_ocorrencia`) REFERENCES `rh_categoria_ocorrencia` (`id_categoria_ocorrencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rh_ocorrencia_horario_rh_ocorrencia_ponto` FOREIGN KEY (`id_documento_gen`) REFERENCES `rh_documento_gen` (`id_documento_gen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1693 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_pergunta_informativa`
--

DROP TABLE IF EXISTS `rh_pergunta_informativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_pergunta_informativa` (
  `id_pergunta_informativa` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(255) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_pergunta_informativa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_premio`
--

DROP TABLE IF EXISTS `rh_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_premio` (
  `id_premio` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  `registrante_edicao` int(11) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `data_edicao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_premio`),
  KEY `fk_rh_premio_rh_colaborador1_idx` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_prod_grupo`
--

DROP TABLE IF EXISTS `rh_prod_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_prod_grupo` (
  `id_prod_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `produto_similar_codigoid` int(11) DEFAULT NULL,
  `id_cargo_material` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_prod_grupo`),
  KEY `fk_rh_prod_grupo_rh_grupo_material1_idx` (`id_cargo_material`),
  CONSTRAINT `fk_rh_prod_grupo_rh_grupo_material1` FOREIGN KEY (`id_cargo_material`) REFERENCES `rh_grupo_material` (`id_cargo_material`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_resposta_informativa_colaborador`
--

DROP TABLE IF EXISTS `rh_resposta_informativa_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_resposta_informativa_colaborador` (
  `id_resposta_informativa_colaborador` int(11) NOT NULL AUTO_INCREMENT,
  `id_pergunta_informativa` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `resposta` varchar(255) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `registrante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_resposta_informativa_colaborador`),
  KEY `fk_rh_pergunta_informativa_has_rh_colaborador_rh_colaborado_idx` (`id_colaborador`),
  KEY `fk_rh_pergunta_informativa_has_rh_colaborador_rh_pergunta_i_idx` (`id_pergunta_informativa`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_tipo_atributo`
--

DROP TABLE IF EXISTS `rh_tipo_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_tipo_atributo` (
  `id_tipo_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_atributo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_tipo_cargo`
--

DROP TABLE IF EXISTS `rh_tipo_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_tipo_cargo` (
  `id_tipo_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(85) DEFAULT NULL,
  `data_inc` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rh_tipo_colaborador`
--

DROP TABLE IF EXISTS `rh_tipo_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rh_tipo_colaborador` (
  `id_tipo_colaborador` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_ocorrencia`
--

DROP TABLE IF EXISTS `temp_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_ocorrencia` (
  `idocorrencia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'rh'
--

--
-- Dumping routines for database 'rh'
--
/*!50003 DROP FUNCTION IF EXISTS `buscaSubordinados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `buscaSubordinados`(aut_usuario int) RETURNS text CHARSET latin1
BEGIN
	declare id text;
    declare departamentos text;
    declare colaboradores text;
    declare colaboradorRetorno text; 
       
	select GROUP_CONCAT(id_departamento SEPARATOR ',') into id from rh.rh_colaborador 
	inner join rh_colaborador_departamento using(id_colaborador)
    where id_alt_usuario_sistech = aut_usuario and boss = 1  ;
    
    if id is not null then
	set colaboradorRetorno = CONCAT(',',(select GROUP_CONCAT(id_alt_usuario_sistech SEPARATOR ',') from rh.rh_colaborador 
						     inner join rh_colaborador_departamento using(id_colaborador)
						     where id_departamento in(id) 
                             and id_alt_usuario_sistech is not null
                             and id_alt_usuario_sistech <> aut_usuario));
                             
	end if;
    
	WHILE id is not null DO
       select GROUP_CONCAT(id_departamento SEPARATOR ',') into departamentos
	   from rh_departamento where id_departamento_asc in(id);
       
		   if departamentos is not null then
				select GROUP_CONCAT(id_alt_usuario_sistech SEPARATOR ',') into colaboradores from rh.rh_colaborador 
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
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `new_procedure`(in id_departamento_find INT)
BEGIN
	

		select distinct dptChildren.id_departamento, dptChildren.nome from rh.rh_departamento dptDad
		left join rh.rh_departamento dptChildren on dptChildren.id_departamento_asc = dptDad.id_departamento
		left join rh.rh_colaborador_departamento dptPersonal on (dptPersonal.id_departamento in(dptDad.id_departamento, dptChildren.id_departamento))
		where dptDad.id_departamento = id_departamento_find;
		
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_LEFT_RIGHT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_LEFT_RIGHT`(IN idDepartamento INT)
BEGIN
	DECLARE idDepartamentoPai INT;
	DECLARE lftPai INT;
    
--    SET SQL_SAFE_UPDATES = 0;
            
	SELECT IFNULL(id_departamento_asc, 0) INTO idDepartamentoPai FROM rh.rh_departamento WHERE id_departamento = idDepartamento;
    
    IF idDepartamentoPai > 0 THEN
    
		SELECT lft INTO lftPai FROM rh.rh_departamento WHERE id_departamento = idDepartamentoPai;
        
		UPDATE rh.rh_departamento SET rgt = rgt + 2 WHERE rgt > lftPai;
		UPDATE rh.rh_departamento SET lft = lft + 2 WHERE lft > lftPai;
        
		UPDATE rh.rh_departamento SET lft = (lftPai + 1),
           rgt = (lftPai + 2) WHERE id_departamento = idDepartamento;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_tst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`192.168.10.247` PROCEDURE `update_tst`(p1 int)
begin 

  label1: LOOP
    call UPDATE_LEFT_RIGHT(p1);
    SET p1 = p1 + 1;
    IF p1 < 523 THEN
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  SET @x = p1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-01 17:44:24
