--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

-- Started on 2018-02-21 16:21:19 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 13 (class 2615 OID 25251)
-- Name: autorizacao; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA autorizacao;


ALTER SCHEMA autorizacao OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 28672)
-- Name: comercial; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA comercial;


ALTER SCHEMA comercial OWNER TO postgres;

--
-- TOC entry 5 (class 2615 OID 33969)
-- Name: contratos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA contratos;


ALTER SCHEMA contratos OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 33597)
-- Name: engenharia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA engenharia;


ALTER SCHEMA engenharia OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 33734)
-- Name: prevendas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA prevendas;


ALTER SCHEMA prevendas OWNER TO postgres;

--
-- TOC entry 4 (class 2615 OID 25089)
-- Name: troubleticket; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA troubleticket;


ALTER SCHEMA troubleticket OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 13955)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = troubleticket, pg_catalog;

--
-- TOC entry 439 (class 1255 OID 25090)
-- Name: last_update_reports(); Type: FUNCTION; Schema: troubleticket; Owner: postgres
--

CREATE FUNCTION last_update_reports() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    stInsert VARCHAR;
BEGIN
    UPDATE troubleticket.reports SET last_update = NEW.date WHERE reports.id = NEW.report_id;

    RETURN NEW;
END;
$$;


ALTER FUNCTION troubleticket.last_update_reports() OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 25091)
-- Name: last_update_update(); Type: FUNCTION; Schema: troubleticket; Owner: postgres
--

CREATE FUNCTION last_update_update() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    stSelect VARCHAR;
    reResult RECORD;
BEGIN
    stSelect := '
        SELECT MAX(date) AS data
             , report_id
          FROM troubleticket.history
      GROUP BY report_id
    ';

    FOR reResult IN EXECUTE stSelect
    LOOP
        RAISE NOTICE 'Executando boletim: %', reResult.report_id::varchar;
        UPDATE troubleticket.reports SET last_update = reResult.data WHERE reports.id = reResult.report_id;
    END LOOP;

    RETURN TRUE;
END;
$$;


ALTER FUNCTION troubleticket.last_update_update() OWNER TO postgres;

SET search_path = autorizacao, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 437 (class 1259 OID 33983)
-- Name: menu; Type: TABLE; Schema: autorizacao; Owner: postgres
--

CREATE TABLE menu (
    id integer NOT NULL,
    menu_id integer,
    nome character varying(20) NOT NULL,
    ativo boolean NOT NULL,
    lft integer NOT NULL,
    rgt integer NOT NULL
);


ALTER TABLE menu OWNER TO postgres;

--
-- TOC entry 436 (class 1259 OID 33981)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: autorizacao; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_id_seq OWNER TO postgres;

--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 436
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: autorizacao; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- TOC entry 222 (class 1259 OID 25255)
-- Name: regra; Type: TABLE; Schema: autorizacao; Owner: postgres
--

CREATE TABLE regra (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE regra OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25288)
-- Name: regra_id_seq; Type: SEQUENCE; Schema: autorizacao; Owner: postgres
--

CREATE SEQUENCE regra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regra_id_seq OWNER TO postgres;

--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 225
-- Name: regra_id_seq; Type: SEQUENCE OWNED BY; Schema: autorizacao; Owner: postgres
--

ALTER SEQUENCE regra_id_seq OWNED BY regra.id;


--
-- TOC entry 221 (class 1259 OID 25252)
-- Name: usuario; Type: TABLE; Schema: autorizacao; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    salt character varying(100) NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_cadastro timestamp(0) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25261)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: autorizacao; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 224
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: autorizacao; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 223 (class 1259 OID 25258)
-- Name: usuario_regra; Type: TABLE; Schema: autorizacao; Owner: postgres
--

CREATE TABLE usuario_regra (
    id_usuarios integer NOT NULL,
    id_regras integer NOT NULL,
    valor integer NOT NULL
);


ALTER TABLE usuario_regra OWNER TO postgres;

SET search_path = comercial, pg_catalog;

--
-- TOC entry 236 (class 1259 OID 28734)
-- Name: activation_deadline; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE activation_deadline (
    state character varying(2) NOT NULL,
    days_deadline integer NOT NULL
);


ALTER TABLE activation_deadline OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28741)
-- Name: agreement; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE agreement (
    id integer NOT NULL,
    ip character varying(45) NOT NULL,
    agreed boolean NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    proposal_id integer NOT NULL
);


ALTER TABLE agreement OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 28739)
-- Name: agreement_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE agreement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agreement_id_seq OWNER TO postgres;

--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 237
-- Name: agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE agreement_id_seq OWNED BY agreement.id;


--
-- TOC entry 240 (class 1259 OID 28749)
-- Name: bank_information; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE bank_information (
    id integer NOT NULL,
    cnpj character varying(14) NOT NULL,
    name character varying,
    number character varying(3),
    agency character varying(4),
    account character varying(20)
);


ALTER TABLE bank_information OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 28747)
-- Name: bank_information_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE bank_information_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bank_information_id_seq OWNER TO postgres;

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 239
-- Name: bank_information_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE bank_information_id_seq OWNED BY bank_information.id;


--
-- TOC entry 235 (class 1259 OID 28724)
-- Name: chance; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance (
    id integer NOT NULL,
    id_prospect integer NOT NULL,
    id_product integer NOT NULL,
    temperature integer NOT NULL,
    active boolean NOT NULL,
    description text,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_update timestamp(0) without time zone,
    id_followup integer,
    id_last_proposal integer,
    service_type integer NOT NULL,
    id_contract integer,
    closing_value numeric,
    closing_date timestamp(0) without time zone
);


ALTER TABLE chance OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 28760)
-- Name: chance_classification; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_classification (
    id integer NOT NULL,
    name character varying(250)
);


ALTER TABLE chance_classification OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 28758)
-- Name: chance_classification_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_classification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_classification_id_seq OWNER TO postgres;

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 241
-- Name: chance_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_classification_id_seq OWNED BY chance_classification.id;


--
-- TOC entry 244 (class 1259 OID 28768)
-- Name: chance_closed; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_closed (
    id integer NOT NULL,
    wallet_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    date_approval timestamp(0) without time zone,
    approved_by integer,
    active boolean DEFAULT false,
    chance_id integer,
    date_closed timestamp(0) without time zone,
    description text,
    id_chance_classification integer,
    tag text,
    delta real
);


ALTER TABLE chance_closed OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 28766)
-- Name: chance_closed_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_closed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_closed_id_seq OWNER TO postgres;

--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 243
-- Name: chance_closed_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_closed_id_seq OWNED BY chance_closed.id;


--
-- TOC entry 246 (class 1259 OID 28781)
-- Name: chance_contact; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_contact (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    telephone character varying(15),
    email character varying(120),
    chance_id integer NOT NULL,
    warn boolean DEFAULT true NOT NULL
);


ALTER TABLE chance_contact OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 28779)
-- Name: chance_contact_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_contact_id_seq OWNER TO postgres;

--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 245
-- Name: chance_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_contact_id_seq OWNED BY chance_contact.id;


--
-- TOC entry 234 (class 1259 OID 28722)
-- Name: chance_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_id_seq OWNER TO postgres;

--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 234
-- Name: chance_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_id_seq OWNED BY chance.id;


--
-- TOC entry 248 (class 1259 OID 28789)
-- Name: chance_inactive; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_inactive (
    id integer NOT NULL,
    chance_id integer,
    description text,
    record_date timestamp(0) without time zone DEFAULT now(),
    active boolean DEFAULT true
);


ALTER TABLE chance_inactive OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 28787)
-- Name: chance_inactive_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_inactive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_inactive_id_seq OWNER TO postgres;

--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 247
-- Name: chance_inactive_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_inactive_id_seq OWNED BY chance_inactive.id;


--
-- TOC entry 250 (class 1259 OID 28802)
-- Name: chance_inactive_log; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_inactive_log (
    id integer NOT NULL,
    chance_inactive_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    "user" integer,
    ev integer
);


ALTER TABLE chance_inactive_log OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 28800)
-- Name: chance_inactive_log_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_inactive_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_inactive_log_id_seq OWNER TO postgres;

--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 249
-- Name: chance_inactive_log_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_inactive_log_id_seq OWNED BY chance_inactive_log.id;


--
-- TOC entry 252 (class 1259 OID 28811)
-- Name: chance_indication; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_indication (
    id integer NOT NULL,
    type character varying(10),
    who character varying(200),
    email character varying(200),
    id_chance integer,
    warn boolean DEFAULT false
);


ALTER TABLE chance_indication OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 28809)
-- Name: chance_indication_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_indication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_indication_id_seq OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 251
-- Name: chance_indication_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_indication_id_seq OWNED BY chance_indication.id;


--
-- TOC entry 254 (class 1259 OID 28820)
-- Name: chance_status; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_status (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE chance_status OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 28818)
-- Name: chance_status_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_status_id_seq OWNER TO postgres;

--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 253
-- Name: chance_status_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_status_id_seq OWNED BY chance_status.id;


--
-- TOC entry 255 (class 1259 OID 28827)
-- Name: chance_tag; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_tag (
    id_chance integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE chance_tag OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 28834)
-- Name: chance_type; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE chance_type (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE chance_type OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 28832)
-- Name: chance_type_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE chance_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chance_type_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 256
-- Name: chance_type_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE chance_type_id_seq OWNED BY chance_type.id;


--
-- TOC entry 259 (class 1259 OID 28842)
-- Name: companies; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying(100),
    spid integer
);


ALTER TABLE companies OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 28840)
-- Name: companies_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companies_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 258
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- TOC entry 261 (class 1259 OID 28850)
-- Name: contract_denial_reason; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE contract_denial_reason (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    contract_denial_reason_category_id integer NOT NULL
);


ALTER TABLE contract_denial_reason OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 28858)
-- Name: contract_denial_reason_category; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE contract_denial_reason_category (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE contract_denial_reason_category OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 28856)
-- Name: contract_denial_reason_category_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE contract_denial_reason_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contract_denial_reason_category_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 262
-- Name: contract_denial_reason_category_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE contract_denial_reason_category_id_seq OWNED BY contract_denial_reason_category.id;


--
-- TOC entry 260 (class 1259 OID 28848)
-- Name: contract_denial_reason_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE contract_denial_reason_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contract_denial_reason_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 260
-- Name: contract_denial_reason_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE contract_denial_reason_id_seq OWNED BY contract_denial_reason.id;


--
-- TOC entry 265 (class 1259 OID 28866)
-- Name: costs; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE costs (
    id integer NOT NULL,
    service_id integer,
    interface integer,
    capex_equipament numeric(10,2),
    capex_fiber numeric(10,2),
    ip numeric(10,2),
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_end timestamp(0) without time zone DEFAULT NULL::timestamp(0) without time zone
);


ALTER TABLE costs OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 28864)
-- Name: costs_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE costs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE costs_id_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 264
-- Name: costs_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE costs_id_seq OWNED BY costs.id;


--
-- TOC entry 267 (class 1259 OID 28876)
-- Name: datacenter; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE datacenter (
    id integer NOT NULL,
    nome text,
    uf text,
    cidade integer,
    lat character varying(100),
    lon character varying(100),
    cep text,
    logradouro text,
    numero text,
    complemento text,
    bairro character varying(255)
);


ALTER TABLE datacenter OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 28874)
-- Name: datacenter_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE datacenter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datacenter_id_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 266
-- Name: datacenter_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE datacenter_id_seq OWNED BY datacenter.id;


--
-- TOC entry 269 (class 1259 OID 28887)
-- Name: discount_competence; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE discount_competence (
    id integer NOT NULL,
    id_user integer NOT NULL,
    date_record timestamp(6) without time zone NOT NULL,
    active boolean,
    percentage real NOT NULL,
    registrant integer NOT NULL
);


ALTER TABLE discount_competence OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 28885)
-- Name: discount_competence_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE discount_competence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discount_competence_id_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 268
-- Name: discount_competence_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE discount_competence_id_seq OWNED BY discount_competence.id;


--
-- TOC entry 271 (class 1259 OID 28895)
-- Name: discount_proposal; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE discount_proposal (
    id integer NOT NULL,
    user_id integer NOT NULL,
    date_inc timestamp(6) without time zone NOT NULL,
    proposal_id integer NOT NULL,
    tipo character varying(255) NOT NULL,
    descativval numeric(10,2) NOT NULL,
    descativporc numeric(10,2) NOT NULL,
    descmensval numeric(10,2) NOT NULL,
    descmensporc numeric(10,2) NOT NULL,
    motivo character varying(500) NOT NULL,
    status boolean,
    valorativ_atual money NOT NULL,
    valorativ_proposto money NOT NULL,
    valormens_atual money NOT NULL,
    valormens_proposto money NOT NULL,
    proposal_approved integer
);


ALTER TABLE discount_proposal OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 28893)
-- Name: discount_proposal_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE discount_proposal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discount_proposal_id_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 270
-- Name: discount_proposal_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE discount_proposal_id_seq OWNED BY discount_proposal.id;


--
-- TOC entry 273 (class 1259 OID 28906)
-- Name: discount_proposal_status; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE discount_proposal_status (
    id integer NOT NULL,
    depr_codigoid integer NOT NULL,
    user_id smallint NOT NULL,
    alcada numeric(10,2) NOT NULL,
    date_inc timestamp(6) without time zone NOT NULL,
    status character varying DEFAULT 'G'::character varying,
    motivo character varying(255)
);


ALTER TABLE discount_proposal_status OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 28904)
-- Name: discount_proposal_status_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE discount_proposal_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discount_proposal_status_id_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 272
-- Name: discount_proposal_status_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE discount_proposal_status_id_seq OWNED BY discount_proposal_status.id;


--
-- TOC entry 275 (class 1259 OID 28918)
-- Name: ev_change; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE ev_change (
    id integer NOT NULL,
    id_prospect integer
);


ALTER TABLE ev_change OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 28916)
-- Name: ev_change_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE ev_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ev_change_id_seq OWNER TO postgres;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 274
-- Name: ev_change_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE ev_change_id_seq OWNED BY ev_change.id;


--
-- TOC entry 277 (class 1259 OID 28926)
-- Name: favorite_address; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE favorite_address (
    id integer NOT NULL,
    viable_id integer NOT NULL,
    wallet_id integer NOT NULL,
    name character varying NOT NULL,
    prospect_id integer NOT NULL
);


ALTER TABLE favorite_address OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 28924)
-- Name: favorite_address_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE favorite_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorite_address_id_seq OWNER TO postgres;

--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 276
-- Name: favorite_address_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE favorite_address_id_seq OWNED BY favorite_address.id;


--
-- TOC entry 279 (class 1259 OID 28937)
-- Name: followup; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE followup (
    id integer NOT NULL,
    chance_id integer,
    action_id integer,
    next_action_id integer,
    status_id integer,
    temperature integer,
    description text,
    next_action_date timestamp(0) without time zone,
    date_record timestamp(0) without time zone DEFAULT now(),
    file text,
    person integer,
    wallet integer,
    id_contract integer
);


ALTER TABLE followup OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 28949)
-- Name: followup_action; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE followup_action (
    id integer NOT NULL,
    name character varying(100),
    subacao boolean DEFAULT true,
    parent_id integer,
    visivel boolean DEFAULT true
);


ALTER TABLE followup_action OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 28947)
-- Name: followup_action_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE followup_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE followup_action_id_seq OWNER TO postgres;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 280
-- Name: followup_action_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE followup_action_id_seq OWNED BY followup_action.id;


--
-- TOC entry 283 (class 1259 OID 28959)
-- Name: followup_contact; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE followup_contact (
    id integer NOT NULL,
    sistech_id integer,
    chance_contact_id integer,
    followup_id integer
);


ALTER TABLE followup_contact OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 28957)
-- Name: followup_contact_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE followup_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE followup_contact_id_seq OWNER TO postgres;

--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 282
-- Name: followup_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE followup_contact_id_seq OWNED BY followup_contact.id;


--
-- TOC entry 278 (class 1259 OID 28935)
-- Name: followup_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE followup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE followup_id_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 278
-- Name: followup_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE followup_id_seq OWNED BY followup.id;


--
-- TOC entry 285 (class 1259 OID 28967)
-- Name: global_address; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE global_address (
    id integer NOT NULL,
    name character varying(2044) NOT NULL,
    cep character varying(2044) NOT NULL,
    city integer NOT NULL,
    complement text NOT NULL,
    date_record timestamp(0) without time zone NOT NULL,
    district character varying(2044) NOT NULL,
    lat character varying(2044) NOT NULL,
    lon character varying(2044) NOT NULL,
    street character varying(2044) NOT NULL,
    uf character varying(2044) NOT NULL,
    active boolean NOT NULL,
    number integer NOT NULL
);


ALTER TABLE global_address OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 28965)
-- Name: global_address_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE global_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE global_address_id_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 284
-- Name: global_address_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE global_address_id_seq OWNED BY global_address.id;


--
-- TOC entry 287 (class 1259 OID 28978)
-- Name: goal; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE goal (
    id integer NOT NULL,
    name character varying(100),
    function character varying(100),
    goal_type_id integer
);


ALTER TABLE goal OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 28986)
-- Name: goal_history; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE goal_history (
    id integer NOT NULL,
    goal_wallet_id integer,
    score numeric(9,2),
    date_record timestamp(0) without time zone DEFAULT now()
);


ALTER TABLE goal_history OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 28984)
-- Name: goal_history_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE goal_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goal_history_id_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 288
-- Name: goal_history_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE goal_history_id_seq OWNED BY goal_history.id;


--
-- TOC entry 286 (class 1259 OID 28976)
-- Name: goal_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE goal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goal_id_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 286
-- Name: goal_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE goal_id_seq OWNED BY goal.id;


--
-- TOC entry 291 (class 1259 OID 28995)
-- Name: goal_type; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE goal_type (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE goal_type OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 28993)
-- Name: goal_type_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE goal_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goal_type_id_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 290
-- Name: goal_type_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE goal_type_id_seq OWNED BY goal_type.id;


--
-- TOC entry 293 (class 1259 OID 29003)
-- Name: goal_wallet; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE goal_wallet (
    id integer NOT NULL,
    wallet_id integer,
    goal_id integer,
    score numeric(10,2),
    team character varying(100),
    active boolean,
    chance_id integer
);


ALTER TABLE goal_wallet OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 29001)
-- Name: goal_wallet_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE goal_wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goal_wallet_id_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 292
-- Name: goal_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE goal_wallet_id_seq OWNED BY goal_wallet.id;


--
-- TOC entry 295 (class 1259 OID 29011)
-- Name: group_item; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE group_item (
    id integer NOT NULL,
    group_id integer,
    product_luma integer,
    quantity real
);


ALTER TABLE group_item OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 29009)
-- Name: group_item_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE group_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_item_id_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 294
-- Name: group_item_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE group_item_id_seq OWNED BY group_item.id;


--
-- TOC entry 297 (class 1259 OID 29019)
-- Name: grupo; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE grupo (
    id integer NOT NULL,
    group_name character varying(80) NOT NULL,
    group_description text,
    ativo boolean DEFAULT true
);


ALTER TABLE grupo OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 29017)
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupo_id_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 296
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE grupo_id_seq OWNED BY grupo.id;


--
-- TOC entry 299 (class 1259 OID 29031)
-- Name: information; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE information (
    id integer NOT NULL,
    description text
);


ALTER TABLE information OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 29029)
-- Name: information_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE information_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE information_id_seq OWNER TO postgres;

--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 298
-- Name: information_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE information_id_seq OWNED BY information.id;


--
-- TOC entry 301 (class 1259 OID 29042)
-- Name: lost_action; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE lost_action (
    id integer NOT NULL,
    name character varying(200),
    parent_id integer,
    visible boolean,
    "select" boolean
);


ALTER TABLE lost_action OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 29040)
-- Name: lost_action_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE lost_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lost_action_id_seq OWNER TO postgres;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 300
-- Name: lost_action_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE lost_action_id_seq OWNED BY lost_action.id;


--
-- TOC entry 303 (class 1259 OID 29050)
-- Name: lost_chance; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE lost_chance (
    id integer NOT NULL,
    chance_id integer,
    lost_action_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    wallet integer,
    description text
);


ALTER TABLE lost_chance OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 29048)
-- Name: lost_chance_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE lost_chance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lost_chance_id_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 302
-- Name: lost_chance_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE lost_chance_id_seq OWNED BY lost_chance.id;


--
-- TOC entry 305 (class 1259 OID 29062)
-- Name: number_imported; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE number_imported (
    id integer NOT NULL,
    number_imported character varying(15),
    ddd character varying(3)
);


ALTER TABLE number_imported OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 29060)
-- Name: number_imported_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE number_imported_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE number_imported_id_seq OWNER TO postgres;

--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 304
-- Name: number_imported_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE number_imported_id_seq OWNED BY number_imported.id;


--
-- TOC entry 307 (class 1259 OID 29070)
-- Name: proposal; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal (
    id integer NOT NULL,
    activation_fare money,
    monthly_cost money,
    speed integer,
    speed_unit integer,
    activation_days integer,
    contract_deadline integer,
    contract_unit integer,
    followup_id integer,
    description text,
    active boolean DEFAULT true,
    latitude character varying(100),
    longitude character varying(100),
    date_limit integer,
    price_right money,
    viable_id integer,
    lpu_id integer,
    monthly_cost_no_discount money,
    activation_fare_no_discount money,
    attribs text DEFAULT '{}'::text NOT NULL,
    cnpj character varying(14),
    bank_information_id integer,
    plan_type integer,
    franchise_cost money,
    franchise_cost_no_discount money,
    accept boolean,
    pay_day integer,
    has_permanence_term boolean DEFAULT false,
    contrato_sthima integer
);


ALTER TABLE proposal OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 29084)
-- Name: proposal_address; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_address (
    id integer NOT NULL,
    uf text,
    city integer,
    cep text,
    street text,
    number text,
    complement text,
    proposal_id integer,
    district character varying
);


ALTER TABLE proposal_address OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 29082)
-- Name: proposal_address_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_address_id_seq OWNER TO postgres;

--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 308
-- Name: proposal_address_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_address_id_seq OWNED BY proposal_address.id;


--
-- TOC entry 311 (class 1259 OID 29095)
-- Name: proposal_benefits; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_benefits (
    id integer NOT NULL,
    proposal_id integer,
    investment_value money,
    monthly_bonus_value money,
    activation_bonus_value money,
    permanence_deadline integer,
    permanence_unit integer
);


ALTER TABLE proposal_benefits OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 29093)
-- Name: proposal_benefits_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_benefits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_benefits_id_seq OWNER TO postgres;

--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 310
-- Name: proposal_benefits_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_benefits_id_seq OWNED BY proposal_benefits.id;


--
-- TOC entry 313 (class 1259 OID 29103)
-- Name: proposal_circuit; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_circuit (
    id integer NOT NULL,
    proposal_id integer,
    viable_id integer,
    discount numeric(10,2),
    lpu_id integer,
    speed integer,
    speed_unit integer,
    activation_fare money,
    activation_fare_no_discount money,
    monthly_cost money,
    monthly_cost_no_discount money,
    attribs text,
    percentual_lpu_discount real DEFAULT 0 NOT NULL,
    sva_activation_fare_discount money DEFAULT 0 NOT NULL,
    sva_monthly_cost_discount money DEFAULT 0 NOT NULL,
    sva_max_percentual_discount real DEFAULT 0 NOT NULL,
    final_client character varying(255)
);


ALTER TABLE proposal_circuit OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 29101)
-- Name: proposal_circuit_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_circuit_id_seq OWNER TO postgres;

--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 312
-- Name: proposal_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_circuit_id_seq OWNED BY proposal_circuit.id;


--
-- TOC entry 315 (class 1259 OID 29118)
-- Name: proposal_circuit_sva; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_circuit_sva (
    id integer NOT NULL,
    proposal_circuit_id integer NOT NULL,
    sva_id integer NOT NULL,
    ativation_fare money DEFAULT 0 NOT NULL,
    monthly_cost money DEFAULT 0 NOT NULL
);


ALTER TABLE proposal_circuit_sva OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 29116)
-- Name: proposal_circuit_sva_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_circuit_sva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_circuit_sva_id_seq OWNER TO postgres;

--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 314
-- Name: proposal_circuit_sva_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_circuit_sva_id_seq OWNED BY proposal_circuit_sva.id;


--
-- TOC entry 317 (class 1259 OID 29128)
-- Name: proposal_circuit_sva_products; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_circuit_sva_products (
    id integer NOT NULL,
    proposal_circuit_sva_id integer NOT NULL,
    external_id integer,
    name character varying(255) NOT NULL,
    amount integer NOT NULL,
    type character varying(100) NOT NULL
);


ALTER TABLE proposal_circuit_sva_products OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 29126)
-- Name: proposal_circuit_sva_products_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_circuit_sva_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_circuit_sva_products_id_seq OWNER TO postgres;

--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 316
-- Name: proposal_circuit_sva_products_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_circuit_sva_products_id_seq OWNED BY proposal_circuit_sva_products.id;


--
-- TOC entry 319 (class 1259 OID 29136)
-- Name: proposal_document; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_document (
    id integer NOT NULL,
    proposal_id integer NOT NULL,
    proposal_odt_id integer,
    odt_file character varying,
    pdf_file character varying,
    user_id integer,
    dateinc timestamp(0) without time zone,
    dategen timestamp(0) without time zone
);


ALTER TABLE proposal_document OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 29134)
-- Name: proposal_document_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_document_id_seq OWNER TO postgres;

--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 318
-- Name: proposal_document_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_document_id_seq OWNED BY proposal_document.id;


--
-- TOC entry 321 (class 1259 OID 29147)
-- Name: proposal_feature; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_feature (
    id integer NOT NULL,
    atrivalo_codigoid integer,
    value character varying,
    activation_fare money,
    monthly_cost money,
    proposal_id integer,
    quantity integer
);


ALTER TABLE proposal_feature OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 29145)
-- Name: proposal_feature_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_feature_id_seq OWNER TO postgres;

--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 320
-- Name: proposal_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_feature_id_seq OWNED BY proposal_feature.id;


--
-- TOC entry 306 (class 1259 OID 29068)
-- Name: proposal_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_id_seq OWNER TO postgres;

--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 306
-- Name: proposal_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_id_seq OWNED BY proposal.id;


--
-- TOC entry 323 (class 1259 OID 29158)
-- Name: proposal_information; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_information (
    proposal_id integer NOT NULL,
    information_id integer NOT NULL
);


ALTER TABLE proposal_information OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 29156)
-- Name: proposal_information_proposal_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_information_proposal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_information_proposal_id_seq OWNER TO postgres;

--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 322
-- Name: proposal_information_proposal_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_information_proposal_id_seq OWNED BY proposal_information.proposal_id;


--
-- TOC entry 325 (class 1259 OID 29166)
-- Name: proposal_number; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_number (
    id integer NOT NULL,
    proposal_id integer,
    number_type integer,
    quantity integer,
    activation_fare money,
    monthly_cost money
);


ALTER TABLE proposal_number OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 29164)
-- Name: proposal_number_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_number_id_seq OWNER TO postgres;

--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 324
-- Name: proposal_number_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_number_id_seq OWNED BY proposal_number.id;


--
-- TOC entry 326 (class 1259 OID 29172)
-- Name: proposal_number_imported; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_number_imported (
    proposal_id integer NOT NULL,
    number_imported_id integer NOT NULL
);


ALTER TABLE proposal_number_imported OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 29179)
-- Name: proposal_odt; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_odt (
    id integer NOT NULL,
    filename character varying(200),
    service_id integer,
    date_record timestamp(0) without time zone,
    author integer,
    active boolean
);


ALTER TABLE proposal_odt OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 29177)
-- Name: proposal_odt_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_odt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_odt_id_seq OWNER TO postgres;

--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 327
-- Name: proposal_odt_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_odt_id_seq OWNED BY proposal_odt.id;


--
-- TOC entry 330 (class 1259 OID 29187)
-- Name: proposal_protocol; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_protocol (
    id integer NOT NULL,
    proposal_id integer NOT NULL,
    client text,
    salesman text,
    activation_value character varying,
    monthly_payment character varying,
    date_record timestamp(0) without time zone NOT NULL,
    name_protocol character varying NOT NULL,
    date_proposal date,
    service character varying NOT NULL,
    status integer NOT NULL,
    date_assignment timestamp(0) without time zone,
    delta money,
    prev_monthly_payment character varying(2044) DEFAULT NULL::character varying,
    prev_delta money,
    prev_speed character varying(2044) DEFAULT NULL::character varying,
    activation_rule integer,
    estimated_date timestamp(0) without time zone,
    date_payment timestamp(0) without time zone DEFAULT NULL::timestamp(0) without time zone,
    fare integer,
    activation_date date,
    revenue_filial_id integer,
    business_rule_id integer,
    has_early_fare boolean,
    early_fare_due_date date,
    fare_quote_quantity integer,
    fare_periodicity character varying(60),
    fare_due_day integer,
    fare_bank_id integer,
    fare_delivery_type_id integer,
    has_grace_period boolean,
    grace_period_number character varying(60),
    grace_period_type character varying(60),
    comment text
);


ALTER TABLE proposal_protocol OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 29201)
-- Name: proposal_protocol_historic; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_protocol_historic (
    id integer NOT NULL,
    date_inc timestamp(0) without time zone NOT NULL,
    proposal_protocol_id integer NOT NULL,
    aut_usuarios_id integer NOT NULL,
    department character varying(60) NOT NULL,
    proposal_protocol_status_id integer NOT NULL,
    reason_denial text NOT NULL,
    contract_denial_reason_id integer
);


ALTER TABLE proposal_protocol_historic OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 29199)
-- Name: proposal_protocol_historic_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_protocol_historic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_protocol_historic_id_seq OWNER TO postgres;

--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 331
-- Name: proposal_protocol_historic_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_protocol_historic_id_seq OWNED BY proposal_protocol_historic.id;


--
-- TOC entry 329 (class 1259 OID 29185)
-- Name: proposal_protocol_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_protocol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_protocol_id_seq OWNER TO postgres;

--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 329
-- Name: proposal_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_protocol_id_seq OWNED BY proposal_protocol.id;


--
-- TOC entry 334 (class 1259 OID 29212)
-- Name: proposal_protocol_status; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_protocol_status (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE proposal_protocol_status OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 29210)
-- Name: proposal_protocol_status_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_protocol_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_protocol_status_id_seq OWNER TO postgres;

--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 333
-- Name: proposal_protocol_status_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_protocol_status_id_seq OWNED BY proposal_protocol_status.id;


--
-- TOC entry 336 (class 1259 OID 29223)
-- Name: proposal_responsible; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_responsible (
    id integer NOT NULL,
    proposal_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying,
    cpf character varying,
    birthday date,
    phone character varying,
    cellphone character varying,
    email character varying,
    cad_users_id integer
);


ALTER TABLE proposal_responsible OWNER TO postgres;

--
-- TOC entry 335 (class 1259 OID 29221)
-- Name: proposal_responsible_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_responsible_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_responsible_id_seq OWNER TO postgres;

--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 335
-- Name: proposal_responsible_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_responsible_id_seq OWNED BY proposal_responsible.id;


--
-- TOC entry 338 (class 1259 OID 29234)
-- Name: proposal_responsible_type; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_responsible_type (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE proposal_responsible_type OWNER TO postgres;

--
-- TOC entry 337 (class 1259 OID 29232)
-- Name: proposal_responsible_type_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_responsible_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_responsible_type_id_seq OWNER TO postgres;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 337
-- Name: proposal_responsible_type_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_responsible_type_id_seq OWNED BY proposal_responsible_type.id;


--
-- TOC entry 340 (class 1259 OID 29245)
-- Name: proposal_status; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_status (
    id integer NOT NULL,
    valproposal_id boolean,
    physical_proposal_pendency boolean,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_update timestamp(0) without time zone,
    motivo_proposta_invalida text,
    pending_seller boolean,
    id_reason integer
);


ALTER TABLE proposal_status OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 29243)
-- Name: proposal_status_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_status_id_seq OWNER TO postgres;

--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 339
-- Name: proposal_status_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_status_id_seq OWNED BY proposal_status.id;


--
-- TOC entry 342 (class 1259 OID 29257)
-- Name: proposal_time_counters; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_time_counters (
    id integer NOT NULL,
    proposal_id integer NOT NULL,
    initial_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    final_date timestamp(0) without time zone,
    proposal_time_counters_stacks_id integer NOT NULL,
    proposal_protocol_status_id integer
);


ALTER TABLE proposal_time_counters OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 29255)
-- Name: proposal_time_counters_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_time_counters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_time_counters_id_seq OWNER TO postgres;

--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 341
-- Name: proposal_time_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_time_counters_id_seq OWNED BY proposal_time_counters.id;


--
-- TOC entry 344 (class 1259 OID 29266)
-- Name: proposal_time_counters_stacks; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE proposal_time_counters_stacks (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    deadline integer NOT NULL
);


ALTER TABLE proposal_time_counters_stacks OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 29264)
-- Name: proposal_time_counters_stacks_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE proposal_time_counters_stacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_time_counters_stacks_id_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 343
-- Name: proposal_time_counters_stacks_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE proposal_time_counters_stacks_id_seq OWNED BY proposal_time_counters_stacks.id;


--
-- TOC entry 233 (class 1259 OID 28704)
-- Name: prospect; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE prospect (
    id integer NOT NULL,
    id_wallet integer NOT NULL,
    id_tag integer,
    id_cliente integer NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_update timestamp(0) without time zone,
    active boolean DEFAULT true NOT NULL,
    client_name character varying(200) NOT NULL,
    cid integer,
    fake_name character varying(200)
);


ALTER TABLE prospect OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 28702)
-- Name: prospect_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE prospect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prospect_id_seq OWNER TO postgres;

--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 232
-- Name: prospect_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE prospect_id_seq OWNED BY prospect.id;


--
-- TOC entry 346 (class 1259 OID 29274)
-- Name: ranking; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE ranking (
    id integer NOT NULL,
    points integer,
    team character varying(200),
    date_record timestamp(0) without time zone DEFAULT now(),
    total integer,
    ciclo integer DEFAULT 1
);


ALTER TABLE ranking OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 29272)
-- Name: ranking_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ranking_id_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 345
-- Name: ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE ranking_id_seq OWNED BY ranking.id;


--
-- TOC entry 348 (class 1259 OID 29284)
-- Name: reason_category; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE reason_category (
    id integer NOT NULL,
    category character varying(255) NOT NULL,
    status boolean NOT NULL,
    date_record time(6) without time zone
);


ALTER TABLE reason_category OWNER TO postgres;

--
-- TOC entry 347 (class 1259 OID 29282)
-- Name: reason_category_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE reason_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reason_category_id_seq OWNER TO postgres;

--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 347
-- Name: reason_category_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE reason_category_id_seq OWNED BY reason_category.id;


--
-- TOC entry 350 (class 1259 OID 29292)
-- Name: requirement; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE requirement (
    id integer NOT NULL,
    name character varying NOT NULL,
    luma_id integer,
    unit character varying(10)
);


ALTER TABLE requirement OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 29290)
-- Name: requirement_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE requirement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE requirement_id_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 349
-- Name: requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE requirement_id_seq OWNED BY requirement.id;


--
-- TOC entry 352 (class 1259 OID 29303)
-- Name: return_reason; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE return_reason (
    id integer NOT NULL,
    reason character varying(255) NOT NULL,
    category_id integer NOT NULL,
    status boolean NOT NULL,
    date_record timestamp(6) without time zone
);


ALTER TABLE return_reason OWNER TO postgres;

--
-- TOC entry 351 (class 1259 OID 29301)
-- Name: return_reason_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE return_reason_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE return_reason_id_seq OWNER TO postgres;

--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 351
-- Name: return_reason_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE return_reason_id_seq OWNED BY return_reason.id;


--
-- TOC entry 227 (class 1259 OID 28675)
-- Name: service; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE service (
    id integer NOT NULL,
    name character varying(100),
    servico_contrato integer NOT NULL,
    multiple_circuits boolean DEFAULT false NOT NULL,
    location_service integer,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE service OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28673)
-- Name: service_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_id_seq OWNER TO postgres;

--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 226
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 354 (class 1259 OID 29311)
-- Name: sva; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE sva (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    nickname character varying(100) NOT NULL
);


ALTER TABLE sva OWNER TO postgres;

--
-- TOC entry 353 (class 1259 OID 29309)
-- Name: sva_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE sva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sva_id_seq OWNER TO postgres;

--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 353
-- Name: sva_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE sva_id_seq OWNED BY sva.id;


--
-- TOC entry 231 (class 1259 OID 28695)
-- Name: tag; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(7) NOT NULL,
    status boolean DEFAULT true NOT NULL
);


ALTER TABLE tag OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 28693)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_id_seq OWNER TO postgres;

--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 230
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE tag_id_seq OWNED BY tag.id;


--
-- TOC entry 356 (class 1259 OID 29319)
-- Name: team; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE team (
    id integer NOT NULL,
    teamtype_id integer NOT NULL,
    team_name character varying(150),
    team_active boolean DEFAULT true NOT NULL,
    team_date_record timestamp(0) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE team OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 29317)
-- Name: team_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_id_seq OWNER TO postgres;

--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 355
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- TOC entry 358 (class 1259 OID 29329)
-- Name: team_state; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE team_state (
    id integer NOT NULL,
    team_id integer NOT NULL,
    teamstate_uf character varying(2) NOT NULL,
    teamstate_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    teamstate_active boolean DEFAULT true NOT NULL
);


ALTER TABLE team_state OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 29327)
-- Name: team_state_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE team_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_state_id_seq OWNER TO postgres;

--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 357
-- Name: team_state_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE team_state_id_seq OWNED BY team_state.id;


--
-- TOC entry 360 (class 1259 OID 29339)
-- Name: team_type; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE team_type (
    id integer NOT NULL,
    teamtype_name character varying(150),
    teamtype_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    teamtype_active boolean DEFAULT true NOT NULL
);


ALTER TABLE team_type OWNER TO postgres;

--
-- TOC entry 359 (class 1259 OID 29337)
-- Name: team_type_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE team_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_type_id_seq OWNER TO postgres;

--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 359
-- Name: team_type_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE team_type_id_seq OWNED BY team_type.id;


--
-- TOC entry 362 (class 1259 OID 29349)
-- Name: team_user; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE team_user (
    id integer NOT NULL,
    team_id integer NOT NULL,
    user_id integer NOT NULL,
    teamuser_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    teamuser_active boolean DEFAULT true NOT NULL
);


ALTER TABLE team_user OWNER TO postgres;

--
-- TOC entry 361 (class 1259 OID 29347)
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE team_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_user_id_seq OWNER TO postgres;

--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 361
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE team_user_id_seq OWNED BY team_user.id;


--
-- TOC entry 364 (class 1259 OID 29359)
-- Name: thirdservice; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE thirdservice (
    id integer NOT NULL,
    name character varying NOT NULL,
    date_record timestamp(0) without time zone NOT NULL,
    cost numeric(10,2) NOT NULL,
    user_registrant integer NOT NULL,
    active boolean NOT NULL,
    type integer NOT NULL
);


ALTER TABLE thirdservice OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 29357)
-- Name: thirdservice_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE thirdservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thirdservice_id_seq OWNER TO postgres;

--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 363
-- Name: thirdservice_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE thirdservice_id_seq OWNED BY thirdservice.id;


--
-- TOC entry 366 (class 1259 OID 29370)
-- Name: type_thirdservice; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE type_thirdservice (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean NOT NULL,
    acronyn character varying NOT NULL
);


ALTER TABLE type_thirdservice OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 29368)
-- Name: type_thirdservice_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE type_thirdservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE type_thirdservice_id_seq OWNER TO postgres;

--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 365
-- Name: type_thirdservice_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE type_thirdservice_id_seq OWNED BY type_thirdservice.id;


--
-- TOC entry 368 (class 1259 OID 29381)
-- Name: viable; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable (
    id integer NOT NULL,
    lat character varying(100) NOT NULL,
    lon character varying(100) NOT NULL,
    cep character varying(100) NOT NULL,
    steet text NOT NULL,
    number character varying(2044) NOT NULL,
    complement text,
    viable boolean DEFAULT false,
    hash character varying(65),
    uf character varying(2) NOT NULL,
    city integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    viable_status integer NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    author integer NOT NULL,
    chance_id integer,
    speed_type integer NOT NULL,
    min_activation numeric(12,2),
    min_monthly numeric(12,2),
    district character varying NOT NULL,
    speed integer NOT NULL,
    interface integer NOT NULL,
    coords text,
    shadow_lpu_id integer,
    price_zone integer,
    fiber_distance numeric(10,2),
    fiber_unit character varying(10),
    cont_codigoid integer,
    next_viable_id integer,
    latlon_manual boolean DEFAULT false NOT NULL,
    days_deadline integer NOT NULL,
    skip_engineer boolean,
    request_contract_deadline integer,
    request_contract_deadline_unit integer,
    interface_real integer NOT NULL,
    comment text,
    troca_endereco boolean DEFAULT false NOT NULL,
    pair integer,
    capilares integer,
    comment_presale text,
    total_fo numeric(10,2),
    id_group_sva integer,
    network_type character varying,
    id_datacenter integer,
    espaco_datacenter boolean DEFAULT false NOT NULL,
    delivery_place character varying,
    comment_voice text
);


ALTER TABLE viable OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 29394)
-- Name: viable_approval; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_approval (
    id integer NOT NULL,
    author integer,
    date_record timestamp(0) without time zone,
    viable_id integer,
    approved boolean,
    obs text,
    prev_viable_status integer NOT NULL,
    attachment character varying,
    deadline_approval timestamp(0) without time zone NOT NULL,
    date_approval timestamp(0) without time zone,
    min_ativation_days integer,
    network_type character varying
);


ALTER TABLE viable_approval OWNER TO postgres;

--
-- TOC entry 369 (class 1259 OID 29392)
-- Name: viable_approval_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_approval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_approval_id_seq OWNER TO postgres;

--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 369
-- Name: viable_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_approval_id_seq OWNED BY viable_approval.id;


--
-- TOC entry 372 (class 1259 OID 29405)
-- Name: viable_approval_thirdservice; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_approval_thirdservice (
    id integer NOT NULL,
    viable_approval_id integer NOT NULL,
    thirdservice_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    price numeric(10,2) NOT NULL,
    viable integer
);


ALTER TABLE viable_approval_thirdservice OWNER TO postgres;

--
-- TOC entry 371 (class 1259 OID 29403)
-- Name: viable_approval_thirdservice_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_approval_thirdservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_approval_thirdservice_id_seq OWNER TO postgres;

--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 371
-- Name: viable_approval_thirdservice_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_approval_thirdservice_id_seq OWNED BY viable_approval_thirdservice.id;


--
-- TOC entry 374 (class 1259 OID 29413)
-- Name: viable_document; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_document (
    id integer NOT NULL,
    viable_id integer NOT NULL,
    document_id integer,
    author integer NOT NULL,
    active boolean NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now(),
    filename character varying(100),
    path character varying(200) NOT NULL
);


ALTER TABLE viable_document OWNER TO postgres;

--
-- TOC entry 373 (class 1259 OID 29411)
-- Name: viable_document_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_document_id_seq OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 373
-- Name: viable_document_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_document_id_seq OWNED BY viable_document.id;


--
-- TOC entry 376 (class 1259 OID 29422)
-- Name: viable_feature; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_feature (
    id integer NOT NULL,
    featureattribute_id integer,
    viable_id integer,
    quantity integer,
    viable_feature_id integer
);


ALTER TABLE viable_feature OWNER TO postgres;

--
-- TOC entry 375 (class 1259 OID 29420)
-- Name: viable_feature_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_feature_id_seq OWNER TO postgres;

--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 375
-- Name: viable_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_feature_id_seq OWNED BY viable_feature.id;


--
-- TOC entry 367 (class 1259 OID 29379)
-- Name: viable_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_id_seq OWNER TO postgres;

--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 367
-- Name: viable_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_id_seq OWNED BY viable.id;


--
-- TOC entry 377 (class 1259 OID 29428)
-- Name: viable_point; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_point (
    viable_id integer NOT NULL,
    point_id integer NOT NULL
);


ALTER TABLE viable_point OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 29435)
-- Name: viable_requirement; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_requirement (
    id integer NOT NULL,
    viable_id integer,
    requirement_id integer,
    quantity numeric(10,2),
    price money,
    group_id integer,
    goal integer
);


ALTER TABLE viable_requirement OWNER TO postgres;

--
-- TOC entry 378 (class 1259 OID 29433)
-- Name: viable_requirement_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_requirement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_requirement_id_seq OWNER TO postgres;

--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 378
-- Name: viable_requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_requirement_id_seq OWNED BY viable_requirement.id;


--
-- TOC entry 381 (class 1259 OID 29443)
-- Name: viable_status; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE viable_status (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE viable_status OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 29441)
-- Name: viable_status_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE viable_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viable_status_id_seq OWNER TO postgres;

--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 380
-- Name: viable_status_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE viable_status_id_seq OWNED BY viable_status.id;


--
-- TOC entry 383 (class 1259 OID 29451)
-- Name: vip; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE vip (
    id integer NOT NULL,
    user_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    active boolean,
    description text,
    level_id integer
);


ALTER TABLE vip OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 29449)
-- Name: vip_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE vip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vip_id_seq OWNER TO postgres;

--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 382
-- Name: vip_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE vip_id_seq OWNED BY vip.id;


--
-- TOC entry 385 (class 1259 OID 29463)
-- Name: vip_level; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE vip_level (
    id integer NOT NULL,
    level integer,
    name character varying(100)
);


ALTER TABLE vip_level OWNER TO postgres;

--
-- TOC entry 384 (class 1259 OID 29461)
-- Name: vip_level_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE vip_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vip_level_id_seq OWNER TO postgres;

--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 384
-- Name: vip_level_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE vip_level_id_seq OWNED BY vip_level.id;


--
-- TOC entry 229 (class 1259 OID 28685)
-- Name: wallet; Type: TABLE; Schema: comercial; Owner: postgres
--

CREATE TABLE wallet (
    id integer NOT NULL,
    id_ev integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_update timestamp(0) without time zone
);


ALTER TABLE wallet OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28683)
-- Name: wallet_id_seq; Type: SEQUENCE; Schema: comercial; Owner: postgres
--

CREATE SEQUENCE wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wallet_id_seq OWNER TO postgres;

--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 228
-- Name: wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: comercial; Owner: postgres
--

ALTER SEQUENCE wallet_id_seq OWNED BY wallet.id;


SET search_path = engenharia, pg_catalog;

--
-- TOC entry 391 (class 1259 OID 33616)
-- Name: kmz; Type: TABLE; Schema: engenharia; Owner: postgres
--

CREATE TABLE kmz (
    id integer NOT NULL,
    name character varying(500),
    latitude numeric(25,20),
    longitude numeric(25,20),
    type_id integer,
    kmz_file_id integer,
    active boolean,
    color character varying(6),
    date_valid timestamp without time zone,
    max_speed integer,
    radius integer,
    interface character varying(3),
    prox boolean,
    error boolean,
    tipo_arquivo character varying(15),
    coordenadas_poligono character varying,
    activation_deadline integer
);


ALTER TABLE kmz OWNER TO postgres;

--
-- TOC entry 387 (class 1259 OID 33600)
-- Name: kmz_file; Type: TABLE; Schema: engenharia; Owner: postgres
--

CREATE TABLE kmz_file (
    id integer NOT NULL,
    filename character varying(100),
    date_record timestamp without time zone,
    user_id character varying(4),
    path character varying(100)
);


ALTER TABLE kmz_file OWNER TO postgres;

--
-- TOC entry 386 (class 1259 OID 33598)
-- Name: kmz_file_id_seq; Type: SEQUENCE; Schema: engenharia; Owner: postgres
--

CREATE SEQUENCE kmz_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kmz_file_id_seq OWNER TO postgres;

--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 386
-- Name: kmz_file_id_seq; Type: SEQUENCE OWNED BY; Schema: engenharia; Owner: postgres
--

ALTER SEQUENCE kmz_file_id_seq OWNED BY kmz_file.id;


--
-- TOC entry 390 (class 1259 OID 33614)
-- Name: kmz_id_seq; Type: SEQUENCE; Schema: engenharia; Owner: postgres
--

CREATE SEQUENCE kmz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kmz_id_seq OWNER TO postgres;

--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 390
-- Name: kmz_id_seq; Type: SEQUENCE OWNED BY; Schema: engenharia; Owner: postgres
--

ALTER SEQUENCE kmz_id_seq OWNED BY kmz.id;


--
-- TOC entry 395 (class 1259 OID 33654)
-- Name: location; Type: TABLE; Schema: engenharia; Owner: postgres
--

CREATE TABLE location (
    id integer NOT NULL,
    latitude numeric(25,20),
    longitude numeric(25,20),
    location_id integer,
    point_id integer,
    radius integer
);


ALTER TABLE location OWNER TO postgres;

--
-- TOC entry 394 (class 1259 OID 33652)
-- Name: location_id_seq; Type: SEQUENCE; Schema: engenharia; Owner: postgres
--

CREATE SEQUENCE location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location_id_seq OWNER TO postgres;

--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 394
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: engenharia; Owner: postgres
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- TOC entry 393 (class 1259 OID 33637)
-- Name: point; Type: TABLE; Schema: engenharia; Owner: postgres
--

CREATE TABLE point (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    color character varying(7) NOT NULL,
    type_id integer NOT NULL,
    date_valid timestamp without time zone,
    max_speed integer,
    interface character varying(3) NOT NULL,
    active boolean NOT NULL,
    location_type integer NOT NULL,
    author integer NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    circ_codigoid integer,
    activation_deadline integer,
    state character varying(2) NOT NULL
);


ALTER TABLE point OWNER TO postgres;

--
-- TOC entry 392 (class 1259 OID 33635)
-- Name: point_id_seq; Type: SEQUENCE; Schema: engenharia; Owner: postgres
--

CREATE SEQUENCE point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE point_id_seq OWNER TO postgres;

--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 392
-- Name: point_id_seq; Type: SEQUENCE OWNED BY; Schema: engenharia; Owner: postgres
--

ALTER SEQUENCE point_id_seq OWNED BY point.id;


--
-- TOC entry 389 (class 1259 OID 33608)
-- Name: type; Type: TABLE; Schema: engenharia; Owner: postgres
--

CREATE TABLE type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE type OWNER TO postgres;

--
-- TOC entry 388 (class 1259 OID 33606)
-- Name: type_id_seq; Type: SEQUENCE; Schema: engenharia; Owner: postgres
--

CREATE SEQUENCE type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE type_id_seq OWNER TO postgres;

--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 388
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: engenharia; Owner: postgres
--

ALTER SEQUENCE type_id_seq OWNED BY type.id;


SET search_path = prevendas, pg_catalog;

--
-- TOC entry 397 (class 1259 OID 33765)
-- Name: capex; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE capex (
    id integer NOT NULL,
    lpu_id integer,
    initial_speed integer,
    initial_speed_type_id integer,
    final_speed integer,
    final_speed_type_id integer,
    cost money
);


ALTER TABLE capex OWNER TO postgres;

--
-- TOC entry 396 (class 1259 OID 33763)
-- Name: capex_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE capex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE capex_id_seq OWNER TO postgres;

--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 396
-- Name: capex_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE capex_id_seq OWNED BY capex.id;


--
-- TOC entry 399 (class 1259 OID 33773)
-- Name: distance; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE distance (
    id integer NOT NULL,
    service_id integer,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    min_distance numeric(10,2) NOT NULL,
    max_distance numeric(10,2) NOT NULL,
    price numeric(10,2) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    author integer,
    min_speed integer,
    max_speed integer,
    author_edit integer,
    date_edit timestamp without time zone
);


ALTER TABLE distance OWNER TO postgres;

--
-- TOC entry 398 (class 1259 OID 33771)
-- Name: distance_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distance_id_seq OWNER TO postgres;

--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 398
-- Name: distance_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE distance_id_seq OWNED BY distance.id;


--
-- TOC entry 401 (class 1259 OID 33783)
-- Name: feature; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE feature (
    id integer NOT NULL,
    name character varying NOT NULL,
    atri_codigoid bigint,
    mandatory boolean NOT NULL,
    service_id bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "group" integer
);


ALTER TABLE feature OWNER TO postgres;

--
-- TOC entry 403 (class 1259 OID 33795)
-- Name: feature_attribute; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE feature_attribute (
    id integer NOT NULL,
    name character varying,
    feature_id integer,
    default_selected boolean DEFAULT false NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE feature_attribute OWNER TO postgres;

--
-- TOC entry 402 (class 1259 OID 33793)
-- Name: feature_attribute_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE feature_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feature_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 402
-- Name: feature_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE feature_attribute_id_seq OWNED BY feature_attribute.id;


--
-- TOC entry 400 (class 1259 OID 33781)
-- Name: feature_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feature_id_seq OWNER TO postgres;

--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 400
-- Name: feature_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE feature_id_seq OWNED BY feature.id;


--
-- TOC entry 405 (class 1259 OID 33808)
-- Name: lpu; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE lpu (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    service_id integer NOT NULL,
    author integer NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_valid timestamp(0) without time zone,
    distance integer,
    active boolean DEFAULT true NOT NULL,
    min_contract_deadline integer DEFAULT 12,
    min_contract_unit integer DEFAULT 1,
    sla numeric(5,2),
    mode_codigoid integer,
    minimum_price numeric(10,2),
    online_sales boolean DEFAULT false NOT NULL,
    type character varying(1) DEFAULT 'P'::bpchar NOT NULL
);


ALTER TABLE lpu OWNER TO postgres;

--
-- TOC entry 407 (class 1259 OID 33820)
-- Name: lpu_customer; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE lpu_customer (
    id integer NOT NULL,
    lpu_id integer,
    custumer integer,
    date_record timestamp without time zone
);


ALTER TABLE lpu_customer OWNER TO postgres;

--
-- TOC entry 406 (class 1259 OID 33818)
-- Name: lpu_customer_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE lpu_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lpu_customer_id_seq OWNER TO postgres;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 406
-- Name: lpu_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE lpu_customer_id_seq OWNED BY lpu_customer.id;


--
-- TOC entry 409 (class 1259 OID 33828)
-- Name: lpu_feature; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE lpu_feature (
    id integer NOT NULL,
    activation_fare numeric(15,2),
    monthly_cost numeric(15,2),
    date_record timestamp without time zone,
    lpu_id bigint,
    date_valid timestamp without time zone,
    feature_attribute_id bigint,
    quantity integer
);


ALTER TABLE lpu_feature OWNER TO postgres;

--
-- TOC entry 408 (class 1259 OID 33826)
-- Name: lpu_feature_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE lpu_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lpu_feature_id_seq OWNER TO postgres;

--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 408
-- Name: lpu_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE lpu_feature_id_seq OWNED BY lpu_feature.id;


--
-- TOC entry 404 (class 1259 OID 33806)
-- Name: lpu_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE lpu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lpu_id_seq OWNER TO postgres;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 404
-- Name: lpu_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE lpu_id_seq OWNED BY lpu.id;


--
-- TOC entry 411 (class 1259 OID 33836)
-- Name: lpu_plan; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE lpu_plan (
    id integer NOT NULL,
    lpu_id integer,
    plan_id integer,
    activation_fare numeric(10,2),
    monthly_cost numeric(10,2),
    franchise_cost numeric(10,2),
    discount_ipc numeric(10,2)
);


ALTER TABLE lpu_plan OWNER TO postgres;

--
-- TOC entry 410 (class 1259 OID 33834)
-- Name: lpu_plan_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE lpu_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lpu_plan_id_seq OWNER TO postgres;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 410
-- Name: lpu_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE lpu_plan_id_seq OWNED BY lpu_plan.id;


--
-- TOC entry 413 (class 1259 OID 33844)
-- Name: lpu_point; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE lpu_point (
    id integer NOT NULL,
    lpu_id integer,
    point_id integer,
    date_record timestamp(0) without time zone,
    author integer
);


ALTER TABLE lpu_point OWNER TO postgres;

--
-- TOC entry 412 (class 1259 OID 33842)
-- Name: lpu_point_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE lpu_point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lpu_point_id_seq OWNER TO postgres;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 412
-- Name: lpu_point_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE lpu_point_id_seq OWNED BY lpu_point.id;


--
-- TOC entry 415 (class 1259 OID 33852)
-- Name: lpu_price; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE lpu_price (
    id integer NOT NULL,
    lpu_id integer,
    region_id integer,
    price integer
);


ALTER TABLE lpu_price OWNER TO postgres;

--
-- TOC entry 414 (class 1259 OID 33850)
-- Name: lpu_price_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE lpu_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lpu_price_id_seq OWNER TO postgres;

--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 414
-- Name: lpu_price_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE lpu_price_id_seq OWNED BY lpu_price.id;


--
-- TOC entry 417 (class 1259 OID 33860)
-- Name: number; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE number (
    id integer NOT NULL,
    number_type_id integer NOT NULL,
    lpu_plan_id integer,
    activation_fare numeric(10,2),
    monthly_cost numeric(10,2)
);


ALTER TABLE number OWNER TO postgres;

--
-- TOC entry 416 (class 1259 OID 33858)
-- Name: number_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE number_id_seq OWNER TO postgres;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 416
-- Name: number_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE number_id_seq OWNED BY number.id;


--
-- TOC entry 419 (class 1259 OID 33868)
-- Name: number_type; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE number_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE number_type OWNER TO postgres;

--
-- TOC entry 418 (class 1259 OID 33866)
-- Name: number_type_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE number_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE number_type_id_seq OWNER TO postgres;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 418
-- Name: number_type_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE number_type_id_seq OWNED BY number_type.id;


--
-- TOC entry 421 (class 1259 OID 33879)
-- Name: plan; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE plan (
    id integer NOT NULL,
    fee_codigoid integer,
    name character varying NOT NULL,
    max_ddr integer,
    date_record timestamp(0) without time zone,
    date_end timestamp(0) without time zone,
    author integer
);


ALTER TABLE plan OWNER TO postgres;

--
-- TOC entry 420 (class 1259 OID 33877)
-- Name: plan_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_id_seq OWNER TO postgres;

--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 420
-- Name: plan_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE plan_id_seq OWNED BY plan.id;


--
-- TOC entry 423 (class 1259 OID 33890)
-- Name: quotation; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE quotation (
    id integer NOT NULL,
    author integer,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    client integer NOT NULL,
    service_id integer,
    speed integer,
    deadline integer
);


ALTER TABLE quotation OWNER TO postgres;

--
-- TOC entry 425 (class 1259 OID 33899)
-- Name: quotation_address; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE quotation_address (
    id integer NOT NULL,
    cep character varying(8),
    street character varying(255),
    number character varying,
    lat numeric(15,10),
    lon numeric(15,10),
    quotation_id integer,
    selecao boolean
);


ALTER TABLE quotation_address OWNER TO postgres;

--
-- TOC entry 424 (class 1259 OID 33897)
-- Name: quotation_address_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE quotation_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotation_address_id_seq OWNER TO postgres;

--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 424
-- Name: quotation_address_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE quotation_address_id_seq OWNED BY quotation_address.id;


--
-- TOC entry 427 (class 1259 OID 33910)
-- Name: quotation_address_point; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE quotation_address_point (
    id integer NOT NULL,
    quotation_address_id integer,
    point_id integer,
    distance numeric(10,2),
    approximate boolean DEFAULT false NOT NULL,
    lpus text,
    name character varying
);


ALTER TABLE quotation_address_point OWNER TO postgres;

--
-- TOC entry 426 (class 1259 OID 33908)
-- Name: quotation_address_point_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE quotation_address_point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotation_address_point_id_seq OWNER TO postgres;

--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 426
-- Name: quotation_address_point_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE quotation_address_point_id_seq OWNED BY quotation_address_point.id;


--
-- TOC entry 422 (class 1259 OID 33888)
-- Name: quotation_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE quotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quotation_id_seq OWNER TO postgres;

--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 422
-- Name: quotation_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE quotation_id_seq OWNED BY quotation.id;


--
-- TOC entry 429 (class 1259 OID 33922)
-- Name: region; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE region (
    id integer NOT NULL,
    name character varying(100),
    max integer
);


ALTER TABLE region OWNER TO postgres;

--
-- TOC entry 428 (class 1259 OID 33920)
-- Name: region_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE region_id_seq OWNER TO postgres;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 428
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE region_id_seq OWNED BY region.id;


--
-- TOC entry 431 (class 1259 OID 33930)
-- Name: service; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE service (
    id integer NOT NULL,
    name character varying(100),
    serv_codigoid bigint,
    active boolean DEFAULT true,
    quotable boolean DEFAULT false NOT NULL
);


ALTER TABLE service OWNER TO postgres;

--
-- TOC entry 430 (class 1259 OID 33928)
-- Name: service_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_id_seq OWNER TO postgres;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 430
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- TOC entry 433 (class 1259 OID 33940)
-- Name: speed; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE speed (
    id integer NOT NULL,
    speed integer,
    activation_fare numeric(15,2),
    monthly_cost numeric(15,2),
    lpu_id integer,
    speed_type_id integer
);


ALTER TABLE speed OWNER TO postgres;

--
-- TOC entry 432 (class 1259 OID 33938)
-- Name: speed_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE speed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE speed_id_seq OWNER TO postgres;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 432
-- Name: speed_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE speed_id_seq OWNED BY speed.id;


--
-- TOC entry 435 (class 1259 OID 33948)
-- Name: speed_type; Type: TABLE; Schema: prevendas; Owner: postgres
--

CREATE TABLE speed_type (
    id integer NOT NULL,
    name character varying(10),
    multiplier integer DEFAULT 1 NOT NULL
);


ALTER TABLE speed_type OWNER TO postgres;

--
-- TOC entry 434 (class 1259 OID 33946)
-- Name: speed_type_id_seq; Type: SEQUENCE; Schema: prevendas; Owner: postgres
--

CREATE SEQUENCE speed_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE speed_type_id_seq OWNER TO postgres;

--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 434
-- Name: speed_type_id_seq; Type: SEQUENCE OWNED BY; Schema: prevendas; Owner: postgres
--

ALTER SEQUENCE speed_type_id_seq OWNED BY speed_type.id;


SET search_path = troubleticket, pg_catalog;

--
-- TOC entry 202 (class 1259 OID 25092)
-- Name: circuits_cache; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE circuits_cache (
    id integer NOT NULL,
    designation character varying(255) NOT NULL,
    final_client character varying(255) NOT NULL,
    uf_ponta_a character varying(255) NOT NULL,
    client_id integer,
    sla character varying(255),
    city character varying(255)
);


ALTER TABLE circuits_cache OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25098)
-- Name: clients_cache; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE clients_cache (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    nivel character varying(255) NOT NULL
);


ALTER TABLE clients_cache OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25104)
-- Name: colaborators_cache; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE colaborators_cache (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE colaborators_cache OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25107)
-- Name: configs; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE configs (
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE configs OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25113)
-- Name: history; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE history (
    id integer NOT NULL,
    report_id integer NOT NULL,
    subcase_id integer,
    comment text NOT NULL,
    date timestamp without time zone NOT NULL,
    reason text,
    support_level character varying(255),
    report_status integer NOT NULL,
    usuario character varying(255)
);


ALTER TABLE history OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25119)
-- Name: history_id_seq; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_id_seq OWNER TO postgres;

--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 207
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: troubleticket; Owner: postgres
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;


--
-- TOC entry 208 (class 1259 OID 25121)
-- Name: messages; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE messages (
    id integer NOT NULL,
    report_id integer NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    reference_repository character varying(255) NOT NULL,
    reference_id character varying(255) NOT NULL,
    viewed_by integer
);


ALTER TABLE messages OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25127)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO postgres;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 209
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: troubleticket; Owner: postgres
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- TOC entry 210 (class 1259 OID 25132)
-- Name: pops_cache; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE pops_cache (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE pops_cache OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25135)
-- Name: providers_cache; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE providers_cache (
    id integer NOT NULL,
    cnpj character varying(255) NOT NULL,
    razao_social character varying(255),
    nome_fantasia character varying(255)
);


ALTER TABLE providers_cache OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25141)
-- Name: reports; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE reports (
    id integer NOT NULL,
    parent_id integer,
    circuit_id integer NOT NULL,
    designation character varying(255) NOT NULL,
    initial_date timestamp without time zone NOT NULL,
    final_date timestamp without time zone,
    type integer NOT NULL,
    description text,
    stack integer NOT NULL,
    operator_report_identifier character varying(255),
    responsible character varying(255),
    requester_name character varying(255),
    requester_phone character varying(255),
    requester_email character varying(255),
    cause character varying(255),
    failure character varying(255),
    failure_local character varying(255),
    problem character varying(255),
    status integer NOT NULL,
    solution character varying(255),
    tme_counter integer,
    paused_counter integer,
    solved_counter integer,
    tmr_counter integer,
    noc_counter integer,
    sn1_counter integer,
    sn2_counter integer,
    coc_counter integer,
    displacement_counter integer,
    infra_counter integer,
    field_counter integer,
    client_counter integer,
    sn1 integer,
    sn2 integer,
    code character varying(255) NOT NULL,
    close_reason text,
    symptom integer,
    stretch text,
    sn3 integer,
    sn3_counter integer,
    voz integer,
    voz_counter integer,
    last_update timestamp without time zone,
    created_by_client boolean NOT NULL,
    service_channel integer,
    closed_symptom integer,
    structure character varying(255),
    element character varying(255),
    pop_id integer,
    provider_id integer,
    incident character varying(255),
    created_by_system integer,
    mantainer_counter integer,
    first_combat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    reopen_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    attendance_protocol character varying(255) DEFAULT NULL::character varying,
    opening_classification integer,
    service_type integer,
    monitoring_counter integer,
    opening_user integer,
    closing_user integer,
    bi_counter integer,
    issue character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE reports OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25151)
-- Name: reports_ba_sequence; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE reports_ba_sequence
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_ba_sequence OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25153)
-- Name: reports_bi_sequence; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE reports_bi_sequence
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_bi_sequence OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25155)
-- Name: reports_bs_sequence; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE reports_bs_sequence
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_bs_sequence OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25157)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1
    CYCLE;


ALTER TABLE reports_id_seq OWNER TO postgres;

--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 216
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: troubleticket; Owner: postgres
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- TOC entry 217 (class 1259 OID 25159)
-- Name: subcases; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE subcases (
    id integer NOT NULL,
    team character varying(255),
    forecast time without time zone,
    status integer NOT NULL,
    type integer NOT NULL,
    report_id integer NOT NULL,
    code character varying(255) NOT NULL,
    list_of_materials text,
    id_activity integer,
    activity_type character varying(12),
    provider integer,
    maintainer integer,
    maintainer_contact character varying(255) DEFAULT NULL::character varying,
    phone character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    ticket character varying(255) DEFAULT NULL::character varying,
    element character varying(255) DEFAULT NULL::character varying,
    cause character varying(255) DEFAULT NULL::character varying,
    problem character varying(255) DEFAULT NULL::character varying,
    solution character varying(255) DEFAULT NULL::character varying,
    comment text,
    opening_user integer,
    closing_user integer,
    tme_counter integer,
    paused_counter integer,
    third_team_counter integer,
    displacement_counter integer,
    infra_counter integer,
    field_counter integer,
    client_counter integer,
    tmr_counter integer,
    initial_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    final_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE subcases OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25175)
-- Name: subcases_id_seq; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE subcases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subcases_id_seq OWNER TO postgres;

--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 218
-- Name: subcases_id_seq; Type: SEQUENCE OWNED BY; Schema: troubleticket; Owner: postgres
--

ALTER SEQUENCE subcases_id_seq OWNED BY subcases.id;


--
-- TOC entry 219 (class 1259 OID 25177)
-- Name: time_counters; Type: TABLE; Schema: troubleticket; Owner: postgres
--

CREATE TABLE time_counters (
    id integer NOT NULL,
    report_id integer NOT NULL,
    initial_date timestamp without time zone NOT NULL,
    final_date timestamp without time zone,
    stack integer NOT NULL,
    subcase_id integer,
    subcase_status integer,
    report_status integer DEFAULT 0 NOT NULL
);


ALTER TABLE time_counters OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25181)
-- Name: time_counters_id_seq; Type: SEQUENCE; Schema: troubleticket; Owner: postgres
--

CREATE SEQUENCE time_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE time_counters_id_seq OWNER TO postgres;

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 220
-- Name: time_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: troubleticket; Owner: postgres
--

ALTER SEQUENCE time_counters_id_seq OWNED BY time_counters.id;


SET search_path = autorizacao, pg_catalog;

--
-- TOC entry 4667 (class 2604 OID 33986)
-- Name: menu id; Type: DEFAULT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 4488 (class 2604 OID 25290)
-- Name: regra id; Type: DEFAULT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY regra ALTER COLUMN id SET DEFAULT nextval('regra_id_seq'::regclass);


--
-- TOC entry 4485 (class 2604 OID 25263)
-- Name: usuario id; Type: DEFAULT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


SET search_path = comercial, pg_catalog;

--
-- TOC entry 4504 (class 2604 OID 28744)
-- Name: agreement id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY agreement ALTER COLUMN id SET DEFAULT nextval('agreement_id_seq'::regclass);


--
-- TOC entry 4505 (class 2604 OID 28752)
-- Name: bank_information id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY bank_information ALTER COLUMN id SET DEFAULT nextval('bank_information_id_seq'::regclass);


--
-- TOC entry 4502 (class 2604 OID 28727)
-- Name: chance id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance ALTER COLUMN id SET DEFAULT nextval('chance_id_seq'::regclass);


--
-- TOC entry 4506 (class 2604 OID 28763)
-- Name: chance_classification id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_classification ALTER COLUMN id SET DEFAULT nextval('chance_classification_id_seq'::regclass);


--
-- TOC entry 4507 (class 2604 OID 28771)
-- Name: chance_closed id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_closed ALTER COLUMN id SET DEFAULT nextval('chance_closed_id_seq'::regclass);


--
-- TOC entry 4510 (class 2604 OID 28784)
-- Name: chance_contact id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_contact ALTER COLUMN id SET DEFAULT nextval('chance_contact_id_seq'::regclass);


--
-- TOC entry 4512 (class 2604 OID 28792)
-- Name: chance_inactive id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_inactive ALTER COLUMN id SET DEFAULT nextval('chance_inactive_id_seq'::regclass);


--
-- TOC entry 4515 (class 2604 OID 28805)
-- Name: chance_inactive_log id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_inactive_log ALTER COLUMN id SET DEFAULT nextval('chance_inactive_log_id_seq'::regclass);


--
-- TOC entry 4517 (class 2604 OID 28814)
-- Name: chance_indication id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_indication ALTER COLUMN id SET DEFAULT nextval('chance_indication_id_seq'::regclass);


--
-- TOC entry 4519 (class 2604 OID 28823)
-- Name: chance_status id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_status ALTER COLUMN id SET DEFAULT nextval('chance_status_id_seq'::regclass);


--
-- TOC entry 4520 (class 2604 OID 28837)
-- Name: chance_type id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_type ALTER COLUMN id SET DEFAULT nextval('chance_type_id_seq'::regclass);


--
-- TOC entry 4521 (class 2604 OID 28845)
-- Name: companies id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- TOC entry 4522 (class 2604 OID 28853)
-- Name: contract_denial_reason id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY contract_denial_reason ALTER COLUMN id SET DEFAULT nextval('contract_denial_reason_id_seq'::regclass);


--
-- TOC entry 4523 (class 2604 OID 28861)
-- Name: contract_denial_reason_category id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY contract_denial_reason_category ALTER COLUMN id SET DEFAULT nextval('contract_denial_reason_category_id_seq'::regclass);


--
-- TOC entry 4524 (class 2604 OID 28869)
-- Name: costs id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY costs ALTER COLUMN id SET DEFAULT nextval('costs_id_seq'::regclass);


--
-- TOC entry 4527 (class 2604 OID 28879)
-- Name: datacenter id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY datacenter ALTER COLUMN id SET DEFAULT nextval('datacenter_id_seq'::regclass);


--
-- TOC entry 4528 (class 2604 OID 28890)
-- Name: discount_competence id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY discount_competence ALTER COLUMN id SET DEFAULT nextval('discount_competence_id_seq'::regclass);


--
-- TOC entry 4529 (class 2604 OID 28898)
-- Name: discount_proposal id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY discount_proposal ALTER COLUMN id SET DEFAULT nextval('discount_proposal_id_seq'::regclass);


--
-- TOC entry 4530 (class 2604 OID 28909)
-- Name: discount_proposal_status id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY discount_proposal_status ALTER COLUMN id SET DEFAULT nextval('discount_proposal_status_id_seq'::regclass);


--
-- TOC entry 4532 (class 2604 OID 28921)
-- Name: ev_change id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY ev_change ALTER COLUMN id SET DEFAULT nextval('ev_change_id_seq'::regclass);


--
-- TOC entry 4533 (class 2604 OID 28929)
-- Name: favorite_address id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY favorite_address ALTER COLUMN id SET DEFAULT nextval('favorite_address_id_seq'::regclass);


--
-- TOC entry 4534 (class 2604 OID 28940)
-- Name: followup id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY followup ALTER COLUMN id SET DEFAULT nextval('followup_id_seq'::regclass);


--
-- TOC entry 4536 (class 2604 OID 28952)
-- Name: followup_action id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY followup_action ALTER COLUMN id SET DEFAULT nextval('followup_action_id_seq'::regclass);


--
-- TOC entry 4539 (class 2604 OID 28962)
-- Name: followup_contact id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY followup_contact ALTER COLUMN id SET DEFAULT nextval('followup_contact_id_seq'::regclass);


--
-- TOC entry 4540 (class 2604 OID 28970)
-- Name: global_address id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY global_address ALTER COLUMN id SET DEFAULT nextval('global_address_id_seq'::regclass);


--
-- TOC entry 4541 (class 2604 OID 28981)
-- Name: goal id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal ALTER COLUMN id SET DEFAULT nextval('goal_id_seq'::regclass);


--
-- TOC entry 4542 (class 2604 OID 28989)
-- Name: goal_history id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal_history ALTER COLUMN id SET DEFAULT nextval('goal_history_id_seq'::regclass);


--
-- TOC entry 4544 (class 2604 OID 28998)
-- Name: goal_type id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal_type ALTER COLUMN id SET DEFAULT nextval('goal_type_id_seq'::regclass);


--
-- TOC entry 4545 (class 2604 OID 29006)
-- Name: goal_wallet id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal_wallet ALTER COLUMN id SET DEFAULT nextval('goal_wallet_id_seq'::regclass);


--
-- TOC entry 4546 (class 2604 OID 29014)
-- Name: group_item id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY group_item ALTER COLUMN id SET DEFAULT nextval('group_item_id_seq'::regclass);


--
-- TOC entry 4547 (class 2604 OID 29022)
-- Name: grupo id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY grupo ALTER COLUMN id SET DEFAULT nextval('grupo_id_seq'::regclass);


--
-- TOC entry 4549 (class 2604 OID 29034)
-- Name: information id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY information ALTER COLUMN id SET DEFAULT nextval('information_id_seq'::regclass);


--
-- TOC entry 4550 (class 2604 OID 29045)
-- Name: lost_action id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_action ALTER COLUMN id SET DEFAULT nextval('lost_action_id_seq'::regclass);


--
-- TOC entry 4551 (class 2604 OID 29053)
-- Name: lost_chance id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_chance ALTER COLUMN id SET DEFAULT nextval('lost_chance_id_seq'::regclass);


--
-- TOC entry 4553 (class 2604 OID 29065)
-- Name: number_imported id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY number_imported ALTER COLUMN id SET DEFAULT nextval('number_imported_id_seq'::regclass);


--
-- TOC entry 4554 (class 2604 OID 29073)
-- Name: proposal id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal ALTER COLUMN id SET DEFAULT nextval('proposal_id_seq'::regclass);


--
-- TOC entry 4558 (class 2604 OID 29087)
-- Name: proposal_address id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_address ALTER COLUMN id SET DEFAULT nextval('proposal_address_id_seq'::regclass);


--
-- TOC entry 4559 (class 2604 OID 29098)
-- Name: proposal_benefits id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_benefits ALTER COLUMN id SET DEFAULT nextval('proposal_benefits_id_seq'::regclass);


--
-- TOC entry 4560 (class 2604 OID 29106)
-- Name: proposal_circuit id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_circuit ALTER COLUMN id SET DEFAULT nextval('proposal_circuit_id_seq'::regclass);


--
-- TOC entry 4565 (class 2604 OID 29121)
-- Name: proposal_circuit_sva id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_circuit_sva ALTER COLUMN id SET DEFAULT nextval('proposal_circuit_sva_id_seq'::regclass);


--
-- TOC entry 4568 (class 2604 OID 29131)
-- Name: proposal_circuit_sva_products id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_circuit_sva_products ALTER COLUMN id SET DEFAULT nextval('proposal_circuit_sva_products_id_seq'::regclass);


--
-- TOC entry 4569 (class 2604 OID 29139)
-- Name: proposal_document id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_document ALTER COLUMN id SET DEFAULT nextval('proposal_document_id_seq'::regclass);


--
-- TOC entry 4570 (class 2604 OID 29150)
-- Name: proposal_feature id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_feature ALTER COLUMN id SET DEFAULT nextval('proposal_feature_id_seq'::regclass);


--
-- TOC entry 4571 (class 2604 OID 29161)
-- Name: proposal_information proposal_id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_information ALTER COLUMN proposal_id SET DEFAULT nextval('proposal_information_proposal_id_seq'::regclass);


--
-- TOC entry 4572 (class 2604 OID 29169)
-- Name: proposal_number id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_number ALTER COLUMN id SET DEFAULT nextval('proposal_number_id_seq'::regclass);


--
-- TOC entry 4573 (class 2604 OID 29182)
-- Name: proposal_odt id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_odt ALTER COLUMN id SET DEFAULT nextval('proposal_odt_id_seq'::regclass);


--
-- TOC entry 4574 (class 2604 OID 29190)
-- Name: proposal_protocol id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_protocol ALTER COLUMN id SET DEFAULT nextval('proposal_protocol_id_seq'::regclass);


--
-- TOC entry 4578 (class 2604 OID 29204)
-- Name: proposal_protocol_historic id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_protocol_historic ALTER COLUMN id SET DEFAULT nextval('proposal_protocol_historic_id_seq'::regclass);


--
-- TOC entry 4579 (class 2604 OID 29215)
-- Name: proposal_protocol_status id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_protocol_status ALTER COLUMN id SET DEFAULT nextval('proposal_protocol_status_id_seq'::regclass);


--
-- TOC entry 4580 (class 2604 OID 29226)
-- Name: proposal_responsible id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_responsible ALTER COLUMN id SET DEFAULT nextval('proposal_responsible_id_seq'::regclass);


--
-- TOC entry 4581 (class 2604 OID 29237)
-- Name: proposal_responsible_type id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_responsible_type ALTER COLUMN id SET DEFAULT nextval('proposal_responsible_type_id_seq'::regclass);


--
-- TOC entry 4582 (class 2604 OID 29248)
-- Name: proposal_status id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_status ALTER COLUMN id SET DEFAULT nextval('proposal_status_id_seq'::regclass);


--
-- TOC entry 4584 (class 2604 OID 29260)
-- Name: proposal_time_counters id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_time_counters ALTER COLUMN id SET DEFAULT nextval('proposal_time_counters_id_seq'::regclass);


--
-- TOC entry 4586 (class 2604 OID 29269)
-- Name: proposal_time_counters_stacks id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_time_counters_stacks ALTER COLUMN id SET DEFAULT nextval('proposal_time_counters_stacks_id_seq'::regclass);


--
-- TOC entry 4499 (class 2604 OID 28707)
-- Name: prospect id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY prospect ALTER COLUMN id SET DEFAULT nextval('prospect_id_seq'::regclass);


--
-- TOC entry 4587 (class 2604 OID 29277)
-- Name: ranking id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY ranking ALTER COLUMN id SET DEFAULT nextval('ranking_id_seq'::regclass);


--
-- TOC entry 4590 (class 2604 OID 29287)
-- Name: reason_category id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY reason_category ALTER COLUMN id SET DEFAULT nextval('reason_category_id_seq'::regclass);


--
-- TOC entry 4591 (class 2604 OID 29295)
-- Name: requirement id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY requirement ALTER COLUMN id SET DEFAULT nextval('requirement_id_seq'::regclass);


--
-- TOC entry 4592 (class 2604 OID 29306)
-- Name: return_reason id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY return_reason ALTER COLUMN id SET DEFAULT nextval('return_reason_id_seq'::regclass);


--
-- TOC entry 4491 (class 2604 OID 28678)
-- Name: service id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 4593 (class 2604 OID 29314)
-- Name: sva id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY sva ALTER COLUMN id SET DEFAULT nextval('sva_id_seq'::regclass);


--
-- TOC entry 4497 (class 2604 OID 28698)
-- Name: tag id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY tag ALTER COLUMN id SET DEFAULT nextval('tag_id_seq'::regclass);


--
-- TOC entry 4594 (class 2604 OID 29322)
-- Name: team id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- TOC entry 4597 (class 2604 OID 29332)
-- Name: team_state id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team_state ALTER COLUMN id SET DEFAULT nextval('team_state_id_seq'::regclass);


--
-- TOC entry 4600 (class 2604 OID 29342)
-- Name: team_type id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team_type ALTER COLUMN id SET DEFAULT nextval('team_type_id_seq'::regclass);


--
-- TOC entry 4603 (class 2604 OID 29352)
-- Name: team_user id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team_user ALTER COLUMN id SET DEFAULT nextval('team_user_id_seq'::regclass);


--
-- TOC entry 4606 (class 2604 OID 29362)
-- Name: thirdservice id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY thirdservice ALTER COLUMN id SET DEFAULT nextval('thirdservice_id_seq'::regclass);


--
-- TOC entry 4607 (class 2604 OID 29373)
-- Name: type_thirdservice id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY type_thirdservice ALTER COLUMN id SET DEFAULT nextval('type_thirdservice_id_seq'::regclass);


--
-- TOC entry 4608 (class 2604 OID 29384)
-- Name: viable id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable ALTER COLUMN id SET DEFAULT nextval('viable_id_seq'::regclass);


--
-- TOC entry 4615 (class 2604 OID 29397)
-- Name: viable_approval id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_approval ALTER COLUMN id SET DEFAULT nextval('viable_approval_id_seq'::regclass);


--
-- TOC entry 4616 (class 2604 OID 29408)
-- Name: viable_approval_thirdservice id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_approval_thirdservice ALTER COLUMN id SET DEFAULT nextval('viable_approval_thirdservice_id_seq'::regclass);


--
-- TOC entry 4617 (class 2604 OID 29416)
-- Name: viable_document id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_document ALTER COLUMN id SET DEFAULT nextval('viable_document_id_seq'::regclass);


--
-- TOC entry 4619 (class 2604 OID 29425)
-- Name: viable_feature id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_feature ALTER COLUMN id SET DEFAULT nextval('viable_feature_id_seq'::regclass);


--
-- TOC entry 4620 (class 2604 OID 29438)
-- Name: viable_requirement id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_requirement ALTER COLUMN id SET DEFAULT nextval('viable_requirement_id_seq'::regclass);


--
-- TOC entry 4621 (class 2604 OID 29446)
-- Name: viable_status id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_status ALTER COLUMN id SET DEFAULT nextval('viable_status_id_seq'::regclass);


--
-- TOC entry 4622 (class 2604 OID 29454)
-- Name: vip id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY vip ALTER COLUMN id SET DEFAULT nextval('vip_id_seq'::regclass);


--
-- TOC entry 4624 (class 2604 OID 29466)
-- Name: vip_level id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY vip_level ALTER COLUMN id SET DEFAULT nextval('vip_level_id_seq'::regclass);


--
-- TOC entry 4494 (class 2604 OID 28688)
-- Name: wallet id; Type: DEFAULT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY wallet ALTER COLUMN id SET DEFAULT nextval('wallet_id_seq'::regclass);


SET search_path = engenharia, pg_catalog;

--
-- TOC entry 4627 (class 2604 OID 33619)
-- Name: kmz id; Type: DEFAULT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY kmz ALTER COLUMN id SET DEFAULT nextval('kmz_id_seq'::regclass);


--
-- TOC entry 4625 (class 2604 OID 33603)
-- Name: kmz_file id; Type: DEFAULT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY kmz_file ALTER COLUMN id SET DEFAULT nextval('kmz_file_id_seq'::regclass);


--
-- TOC entry 4630 (class 2604 OID 33657)
-- Name: location id; Type: DEFAULT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- TOC entry 4628 (class 2604 OID 33640)
-- Name: point id; Type: DEFAULT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY point ALTER COLUMN id SET DEFAULT nextval('point_id_seq'::regclass);


--
-- TOC entry 4626 (class 2604 OID 33611)
-- Name: type id; Type: DEFAULT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY type ALTER COLUMN id SET DEFAULT nextval('type_id_seq'::regclass);


SET search_path = prevendas, pg_catalog;

--
-- TOC entry 4631 (class 2604 OID 33768)
-- Name: capex id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY capex ALTER COLUMN id SET DEFAULT nextval('capex_id_seq'::regclass);


--
-- TOC entry 4632 (class 2604 OID 33776)
-- Name: distance id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY distance ALTER COLUMN id SET DEFAULT nextval('distance_id_seq'::regclass);


--
-- TOC entry 4635 (class 2604 OID 33786)
-- Name: feature id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY feature ALTER COLUMN id SET DEFAULT nextval('feature_id_seq'::regclass);


--
-- TOC entry 4637 (class 2604 OID 33798)
-- Name: feature_attribute id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY feature_attribute ALTER COLUMN id SET DEFAULT nextval('feature_attribute_id_seq'::regclass);


--
-- TOC entry 4640 (class 2604 OID 33811)
-- Name: lpu id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu ALTER COLUMN id SET DEFAULT nextval('lpu_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 33823)
-- Name: lpu_customer id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_customer ALTER COLUMN id SET DEFAULT nextval('lpu_customer_id_seq'::regclass);


--
-- TOC entry 4648 (class 2604 OID 33831)
-- Name: lpu_feature id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_feature ALTER COLUMN id SET DEFAULT nextval('lpu_feature_id_seq'::regclass);


--
-- TOC entry 4649 (class 2604 OID 33839)
-- Name: lpu_plan id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_plan ALTER COLUMN id SET DEFAULT nextval('lpu_plan_id_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 33847)
-- Name: lpu_point id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_point ALTER COLUMN id SET DEFAULT nextval('lpu_point_id_seq'::regclass);


--
-- TOC entry 4651 (class 2604 OID 33855)
-- Name: lpu_price id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_price ALTER COLUMN id SET DEFAULT nextval('lpu_price_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 33863)
-- Name: number id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY number ALTER COLUMN id SET DEFAULT nextval('number_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 33871)
-- Name: number_type id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY number_type ALTER COLUMN id SET DEFAULT nextval('number_type_id_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 33882)
-- Name: plan id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY plan ALTER COLUMN id SET DEFAULT nextval('plan_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 33893)
-- Name: quotation id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY quotation ALTER COLUMN id SET DEFAULT nextval('quotation_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 33902)
-- Name: quotation_address id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY quotation_address ALTER COLUMN id SET DEFAULT nextval('quotation_address_id_seq'::regclass);


--
-- TOC entry 4658 (class 2604 OID 33913)
-- Name: quotation_address_point id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY quotation_address_point ALTER COLUMN id SET DEFAULT nextval('quotation_address_point_id_seq'::regclass);


--
-- TOC entry 4660 (class 2604 OID 33925)
-- Name: region id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('region_id_seq'::regclass);


--
-- TOC entry 4661 (class 2604 OID 33933)
-- Name: service id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 33943)
-- Name: speed id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY speed ALTER COLUMN id SET DEFAULT nextval('speed_id_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 33951)
-- Name: speed_type id; Type: DEFAULT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY speed_type ALTER COLUMN id SET DEFAULT nextval('speed_type_id_seq'::regclass);


SET search_path = troubleticket, pg_catalog;

--
-- TOC entry 4465 (class 2604 OID 25183)
-- Name: history id; Type: DEFAULT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- TOC entry 4466 (class 2604 OID 25184)
-- Name: messages id; Type: DEFAULT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- TOC entry 4470 (class 2604 OID 25185)
-- Name: reports id; Type: DEFAULT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- TOC entry 4482 (class 2604 OID 25186)
-- Name: subcases id; Type: DEFAULT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY subcases ALTER COLUMN id SET DEFAULT nextval('subcases_id_seq'::regclass);


--
-- TOC entry 4484 (class 2604 OID 25187)
-- Name: time_counters id; Type: DEFAULT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY time_counters ALTER COLUMN id SET DEFAULT nextval('time_counters_id_seq'::regclass);


SET search_path = autorizacao, pg_catalog;

--
-- TOC entry 4928 (class 2606 OID 33988)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 25295)
-- Name: regra regras_pkey; Type: CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY regra
    ADD CONSTRAINT regras_pkey PRIMARY KEY (id);


--
-- TOC entry 4490 (class 2606 OID 33980)
-- Name: usuario_regra usuario_regra_check; Type: CHECK CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE usuario_regra
    ADD CONSTRAINT usuario_regra_check CHECK (((valor >= 1) OR (valor <= 15))) NOT VALID;


--
-- TOC entry 4699 (class 2606 OID 25297)
-- Name: usuario_regra usuario_regra_pkey; Type: CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY usuario_regra
    ADD CONSTRAINT usuario_regra_pkey PRIMARY KEY (id_usuarios, id_regras);


--
-- TOC entry 4693 (class 2606 OID 25285)
-- Name: usuario usuarios_pkey; Type: CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 25287)
-- Name: usuario usuarios_unique; Type: CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuarios_unique UNIQUE (username);


SET search_path = comercial, pg_catalog;

--
-- TOC entry 4715 (class 2606 OID 28738)
-- Name: activation_deadline activation_deadline_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY activation_deadline
    ADD CONSTRAINT activation_deadline_pkey PRIMARY KEY (state);


--
-- TOC entry 4717 (class 2606 OID 28746)
-- Name: agreement agreement_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY agreement
    ADD CONSTRAINT agreement_pkey PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 28757)
-- Name: bank_information banc_information_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY bank_information
    ADD CONSTRAINT banc_information_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 28765)
-- Name: chance_classification chance_classification_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_classification
    ADD CONSTRAINT chance_classification_pkey PRIMARY KEY (id);


--
-- TOC entry 4723 (class 2606 OID 28778)
-- Name: chance_closed chance_closed_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_closed
    ADD CONSTRAINT chance_closed_pkey PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 28786)
-- Name: chance_contact chance_contact_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_contact
    ADD CONSTRAINT chance_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 28808)
-- Name: chance_inactive_log chance_inactive_log_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_inactive_log
    ADD CONSTRAINT chance_inactive_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 28799)
-- Name: chance_inactive chance_inactive_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_inactive
    ADD CONSTRAINT chance_inactive_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 28817)
-- Name: chance_indication chance_indication_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_indication
    ADD CONSTRAINT chance_indication_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 28733)
-- Name: chance chance_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance
    ADD CONSTRAINT chance_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 28825)
-- Name: chance_status chance_status_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_status
    ADD CONSTRAINT chance_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 28831)
-- Name: chance_tag chance_tag_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_tag
    ADD CONSTRAINT chance_tag_pkey PRIMARY KEY (id_tag, id_chance);


--
-- TOC entry 4741 (class 2606 OID 28839)
-- Name: chance_type chance_type_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_type
    ADD CONSTRAINT chance_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 28847)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 28863)
-- Name: contract_denial_reason_category contract_denial_reason_category_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY contract_denial_reason_category
    ADD CONSTRAINT contract_denial_reason_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 28855)
-- Name: contract_denial_reason contract_denial_reason_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY contract_denial_reason
    ADD CONSTRAINT contract_denial_reason_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 28873)
-- Name: costs costs_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY costs
    ADD CONSTRAINT costs_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 28884)
-- Name: datacenter datacenter_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY datacenter
    ADD CONSTRAINT datacenter_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 28892)
-- Name: discount_competence discount_competence_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY discount_competence
    ADD CONSTRAINT discount_competence_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 28903)
-- Name: discount_proposal discount_proposal_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY discount_proposal
    ADD CONSTRAINT discount_proposal_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 28915)
-- Name: discount_proposal_status discount_proposal_status_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY discount_proposal_status
    ADD CONSTRAINT discount_proposal_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 28923)
-- Name: ev_change ev_change_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY ev_change
    ADD CONSTRAINT ev_change_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 28934)
-- Name: favorite_address favorite_address_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY favorite_address
    ADD CONSTRAINT favorite_address_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 28956)
-- Name: followup_action followup_action_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY followup_action
    ADD CONSTRAINT followup_action_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 28964)
-- Name: followup_contact followup_contact_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY followup_contact
    ADD CONSTRAINT followup_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 28946)
-- Name: followup followup_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY followup
    ADD CONSTRAINT followup_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 28975)
-- Name: global_address global_address_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY global_address
    ADD CONSTRAINT global_address_pkey PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 28992)
-- Name: goal_history goal_history_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal_history
    ADD CONSTRAINT goal_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 28983)
-- Name: goal goal_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal
    ADD CONSTRAINT goal_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 29000)
-- Name: goal_type goal_type_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal_type
    ADD CONSTRAINT goal_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 29008)
-- Name: goal_wallet goal_wallet_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY goal_wallet
    ADD CONSTRAINT goal_wallet_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 29016)
-- Name: group_item group_item_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY group_item
    ADD CONSTRAINT group_item_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 29028)
-- Name: grupo group_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 29039)
-- Name: information information_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY information
    ADD CONSTRAINT information_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 29047)
-- Name: lost_action lost_action_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_action
    ADD CONSTRAINT lost_action_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 29059)
-- Name: lost_chance lost_chance_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_chance
    ADD CONSTRAINT lost_chance_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 29067)
-- Name: number_imported number_imported_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY number_imported
    ADD CONSTRAINT number_imported_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 29092)
-- Name: proposal_address proposal_address_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_address
    ADD CONSTRAINT proposal_address_pkey PRIMARY KEY (id);


--
-- TOC entry 4799 (class 2606 OID 29100)
-- Name: proposal_benefits proposal_benefits_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_benefits
    ADD CONSTRAINT proposal_benefits_pkey PRIMARY KEY (id);


--
-- TOC entry 4801 (class 2606 OID 29115)
-- Name: proposal_circuit proposal_circuit_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_circuit
    ADD CONSTRAINT proposal_circuit_pkey PRIMARY KEY (id);


--
-- TOC entry 4803 (class 2606 OID 29125)
-- Name: proposal_circuit_sva proposal_circuit_sva_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_circuit_sva
    ADD CONSTRAINT proposal_circuit_sva_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 29133)
-- Name: proposal_circuit_sva_products proposal_circuit_sva_products_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_circuit_sva_products
    ADD CONSTRAINT proposal_circuit_sva_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 29144)
-- Name: proposal_document proposal_document_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_document
    ADD CONSTRAINT proposal_document_pkey PRIMARY KEY (id);


--
-- TOC entry 4809 (class 2606 OID 29155)
-- Name: proposal_feature proposal_feature_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_feature
    ADD CONSTRAINT proposal_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 29163)
-- Name: proposal_information proposal_information_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_information
    ADD CONSTRAINT proposal_information_pkey PRIMARY KEY (proposal_id, information_id);


--
-- TOC entry 4815 (class 2606 OID 29176)
-- Name: proposal_number_imported proposal_number_imported_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_number_imported
    ADD CONSTRAINT proposal_number_imported_pkey PRIMARY KEY (proposal_id, number_imported_id);


--
-- TOC entry 4813 (class 2606 OID 29171)
-- Name: proposal_number proposal_number_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_number
    ADD CONSTRAINT proposal_number_pkey PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 29184)
-- Name: proposal_odt proposal_odt_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_odt
    ADD CONSTRAINT proposal_odt_pkey PRIMARY KEY (id);


--
-- TOC entry 4795 (class 2606 OID 29081)
-- Name: proposal proposal_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT proposal_pkey PRIMARY KEY (id);


--
-- TOC entry 4821 (class 2606 OID 29209)
-- Name: proposal_protocol_historic proposal_protocol_historic_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_protocol_historic
    ADD CONSTRAINT proposal_protocol_historic_pkey PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 29198)
-- Name: proposal_protocol proposal_protocol_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_protocol
    ADD CONSTRAINT proposal_protocol_pkey PRIMARY KEY (id);


--
-- TOC entry 4823 (class 2606 OID 29220)
-- Name: proposal_protocol_status proposal_protocol_status_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_protocol_status
    ADD CONSTRAINT proposal_protocol_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4825 (class 2606 OID 29231)
-- Name: proposal_responsible proposal_responsible_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_responsible
    ADD CONSTRAINT proposal_responsible_pkey PRIMARY KEY (id);


--
-- TOC entry 4827 (class 2606 OID 29242)
-- Name: proposal_responsible_type proposal_responsible_type_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_responsible_type
    ADD CONSTRAINT proposal_responsible_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4829 (class 2606 OID 29254)
-- Name: proposal_status proposal_status_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_status
    ADD CONSTRAINT proposal_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4831 (class 2606 OID 29263)
-- Name: proposal_time_counters proposal_time_counters_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_time_counters
    ADD CONSTRAINT proposal_time_counters_pkey PRIMARY KEY (id);


--
-- TOC entry 4833 (class 2606 OID 29271)
-- Name: proposal_time_counters_stacks proposal_time_counters_stacks_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY proposal_time_counters_stacks
    ADD CONSTRAINT proposal_time_counters_stacks_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 28711)
-- Name: prospect prospect_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY prospect
    ADD CONSTRAINT prospect_pkey PRIMARY KEY (id);


--
-- TOC entry 4835 (class 2606 OID 29281)
-- Name: ranking ranking_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);


--
-- TOC entry 4837 (class 2606 OID 29289)
-- Name: reason_category reason_category_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY reason_category
    ADD CONSTRAINT reason_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4839 (class 2606 OID 29300)
-- Name: requirement requirement_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY requirement
    ADD CONSTRAINT requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 4841 (class 2606 OID 29308)
-- Name: return_reason return_reason_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY return_reason
    ADD CONSTRAINT return_reason_pkey PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 28682)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- TOC entry 4843 (class 2606 OID 29316)
-- Name: sva sva_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY sva
    ADD CONSTRAINT sva_pkey PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 28701)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- TOC entry 4845 (class 2606 OID 29326)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- TOC entry 4847 (class 2606 OID 29336)
-- Name: team_state team_state_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team_state
    ADD CONSTRAINT team_state_pkey PRIMARY KEY (id);


--
-- TOC entry 4849 (class 2606 OID 29346)
-- Name: team_type team_type_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team_type
    ADD CONSTRAINT team_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4851 (class 2606 OID 29356)
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4853 (class 2606 OID 29367)
-- Name: thirdservice thirdservice_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY thirdservice
    ADD CONSTRAINT thirdservice_pkey PRIMARY KEY (id);


--
-- TOC entry 4855 (class 2606 OID 29378)
-- Name: type_thirdservice type_thirdservice_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY type_thirdservice
    ADD CONSTRAINT type_thirdservice_pkey PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 29402)
-- Name: viable_approval viable_approval_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_approval
    ADD CONSTRAINT viable_approval_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 29410)
-- Name: viable_approval_thirdservice viable_approval_thirdservice_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_approval_thirdservice
    ADD CONSTRAINT viable_approval_thirdservice_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 29419)
-- Name: viable_document viable_document_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_document
    ADD CONSTRAINT viable_document_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 29427)
-- Name: viable_feature viable_feature_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_feature
    ADD CONSTRAINT viable_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 4858 (class 2606 OID 29391)
-- Name: viable viable_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable
    ADD CONSTRAINT viable_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 29432)
-- Name: viable_point viable_point_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_point
    ADD CONSTRAINT viable_point_pkey PRIMARY KEY (viable_id, point_id);


--
-- TOC entry 4870 (class 2606 OID 29440)
-- Name: viable_requirement viable_requirement_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_requirement
    ADD CONSTRAINT viable_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 29448)
-- Name: viable_status viable_status_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable_status
    ADD CONSTRAINT viable_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 29468)
-- Name: vip_level vip_level_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY vip_level
    ADD CONSTRAINT vip_level_pkey PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 29460)
-- Name: vip vip_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY vip
    ADD CONSTRAINT vip_pkey PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 28692)
-- Name: wallet wallet_pkey; Type: CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY wallet
    ADD CONSTRAINT wallet_pkey PRIMARY KEY (id);


SET search_path = engenharia, pg_catalog;

--
-- TOC entry 4878 (class 2606 OID 33605)
-- Name: kmz_file kmz_file_pkey; Type: CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY kmz_file
    ADD CONSTRAINT kmz_file_pkey PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 33624)
-- Name: kmz kmz_pkey; Type: CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY kmz
    ADD CONSTRAINT kmz_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 33659)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 33646)
-- Name: point point_pkey; Type: CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY point
    ADD CONSTRAINT point_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 33613)
-- Name: type type_pk; Type: CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY type
    ADD CONSTRAINT type_pk PRIMARY KEY (id);


SET search_path = prevendas, pg_catalog;

--
-- TOC entry 4888 (class 2606 OID 33770)
-- Name: capex capex_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY capex
    ADD CONSTRAINT capex_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 33780)
-- Name: distance distance_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY distance
    ADD CONSTRAINT distance_pkey PRIMARY KEY (id);


--
-- TOC entry 4894 (class 2606 OID 33805)
-- Name: feature_attribute feature_attribute_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY feature_attribute
    ADD CONSTRAINT feature_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 4892 (class 2606 OID 33792)
-- Name: feature feature_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY feature
    ADD CONSTRAINT feature_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 33825)
-- Name: lpu_customer lpu_customer_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_customer
    ADD CONSTRAINT lpu_customer_pkey PRIMARY KEY (id);


--
-- TOC entry 4900 (class 2606 OID 33833)
-- Name: lpu_feature lpu_feature_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_feature
    ADD CONSTRAINT lpu_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 4896 (class 2606 OID 33817)
-- Name: lpu lpu_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu
    ADD CONSTRAINT lpu_pkey PRIMARY KEY (id);


--
-- TOC entry 4902 (class 2606 OID 33841)
-- Name: lpu_plan lpu_plan_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_plan
    ADD CONSTRAINT lpu_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 4904 (class 2606 OID 33849)
-- Name: lpu_point lpu_point_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_point
    ADD CONSTRAINT lpu_point_pkey PRIMARY KEY (id);


--
-- TOC entry 4906 (class 2606 OID 33857)
-- Name: lpu_price lpu_price_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY lpu_price
    ADD CONSTRAINT lpu_price_pkey PRIMARY KEY (id);


--
-- TOC entry 4908 (class 2606 OID 33865)
-- Name: number number_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY number
    ADD CONSTRAINT number_pkey PRIMARY KEY (id);


--
-- TOC entry 4910 (class 2606 OID 33876)
-- Name: number_type number_type_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY number_type
    ADD CONSTRAINT number_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4912 (class 2606 OID 33887)
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (id);


--
-- TOC entry 4916 (class 2606 OID 33907)
-- Name: quotation_address quotation_address_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY quotation_address
    ADD CONSTRAINT quotation_address_pkey PRIMARY KEY (id);


--
-- TOC entry 4918 (class 2606 OID 33919)
-- Name: quotation_address_point quotation_address_point_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY quotation_address_point
    ADD CONSTRAINT quotation_address_point_pkey PRIMARY KEY (id);


--
-- TOC entry 4914 (class 2606 OID 33896)
-- Name: quotation quotation_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (id);


--
-- TOC entry 4920 (class 2606 OID 33927)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 4922 (class 2606 OID 33937)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 33945)
-- Name: speed speed_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY speed
    ADD CONSTRAINT speed_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 33954)
-- Name: speed_type speed_type_pkey; Type: CONSTRAINT; Schema: prevendas; Owner: postgres
--

ALTER TABLE ONLY speed_type
    ADD CONSTRAINT speed_type_pkey PRIMARY KEY (id);


SET search_path = troubleticket, pg_catalog;

--
-- TOC entry 4669 (class 2606 OID 25189)
-- Name: circuits_cache circuits_cache_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY circuits_cache
    ADD CONSTRAINT circuits_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 4671 (class 2606 OID 25191)
-- Name: clients_cache clientes_cache_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY clients_cache
    ADD CONSTRAINT clientes_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 4673 (class 2606 OID 25193)
-- Name: colaborators_cache colaborators_cache_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY colaborators_cache
    ADD CONSTRAINT colaborators_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 25195)
-- Name: configs configs_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY configs
    ADD CONSTRAINT configs_pkey PRIMARY KEY (name);


--
-- TOC entry 4677 (class 2606 OID 25197)
-- Name: history history_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 25199)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 25203)
-- Name: pops_cache pops_cache_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY pops_cache
    ADD CONSTRAINT pops_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 25205)
-- Name: providers_cache providers_cache_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY providers_cache
    ADD CONSTRAINT providers_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 4686 (class 2606 OID 25207)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 25209)
-- Name: subcases subcases_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY subcases
    ADD CONSTRAINT subcases_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 25211)
-- Name: time_counters time_counters_pkey; Type: CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY time_counters
    ADD CONSTRAINT time_counters_pkey PRIMARY KEY (id);


SET search_path = comercial, pg_catalog;

--
-- TOC entry 4710 (class 1259 OID 33533)
-- Name: fki_chance_chance_type_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_chance_type_id_fkey ON chance USING btree (service_type);


--
-- TOC entry 4724 (class 1259 OID 33545)
-- Name: fki_chance_closed_chance_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_closed_chance_id_fkey ON chance_closed USING btree (chance_id);


--
-- TOC entry 4727 (class 1259 OID 33539)
-- Name: fki_chance_contact_chance_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_contact_chance_id_fkey ON chance_contact USING btree (chance_id);


--
-- TOC entry 4711 (class 1259 OID 33527)
-- Name: fki_chance_followup_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_followup_id_fkey ON chance USING btree (id_followup);


--
-- TOC entry 4730 (class 1259 OID 33551)
-- Name: fki_chance_inactive_chance_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_inactive_chance_id_fkey ON chance_inactive USING btree (chance_id);


--
-- TOC entry 4735 (class 1259 OID 33557)
-- Name: fki_chance_indication_chance_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_indication_chance_id_fkey ON chance_indication USING btree (id_chance);


--
-- TOC entry 4712 (class 1259 OID 33515)
-- Name: fki_chance_prospect_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_prospect_id_fkey ON chance USING btree (id_prospect);


--
-- TOC entry 4713 (class 1259 OID 33521)
-- Name: fki_chance_service_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_chance_service_id_fkey ON chance USING btree (id_product);


--
-- TOC entry 4784 (class 1259 OID 33586)
-- Name: fki_lost_action_lost_action_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_lost_action_lost_action_id_fkey ON lost_action USING btree (parent_id);


--
-- TOC entry 4787 (class 1259 OID 33563)
-- Name: fki_lost_chance_chance_id_pkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_lost_chance_chance_id_pkey ON lost_chance USING btree (chance_id);


--
-- TOC entry 4788 (class 1259 OID 33580)
-- Name: fki_lost_chance_lost_action_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_lost_chance_lost_action_id_fkey ON lost_chance USING btree (lost_action_id);


--
-- TOC entry 4789 (class 1259 OID 33574)
-- Name: fki_lost_chance_wallet_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_lost_chance_wallet_id_fkey ON lost_chance USING btree (wallet);


--
-- TOC entry 4856 (class 1259 OID 33592)
-- Name: fki_viabel_chance_id_fkey; Type: INDEX; Schema: comercial; Owner: postgres
--

CREATE INDEX fki_viabel_chance_id_fkey ON viable USING btree (chance_id);


SET search_path = troubleticket, pg_catalog;

--
-- TOC entry 4684 (class 1259 OID 25212)
-- Name: reports_code; Type: INDEX; Schema: troubleticket; Owner: postgres
--

CREATE UNIQUE INDEX reports_code ON reports USING btree (code);


--
-- TOC entry 4687 (class 1259 OID 25213)
-- Name: subcases_code; Type: INDEX; Schema: troubleticket; Owner: postgres
--

CREATE UNIQUE INDEX subcases_code ON subcases USING btree (code);


--
-- TOC entry 4959 (class 2620 OID 25214)
-- Name: history last_update_reports_trigger; Type: TRIGGER; Schema: troubleticket; Owner: postgres
--

CREATE TRIGGER last_update_reports_trigger AFTER INSERT OR UPDATE ON history FOR EACH ROW EXECUTE PROCEDURE last_update_reports();


SET search_path = autorizacao, pg_catalog;

--
-- TOC entry 4958 (class 2606 OID 33989)
-- Name: menu menu_menu_fkey; Type: FK CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_menu_fkey FOREIGN KEY (menu_id) REFERENCES menu(id);


--
-- TOC entry 4937 (class 2606 OID 25313)
-- Name: usuario_regra usuario_regra_regras_fkey; Type: FK CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY usuario_regra
    ADD CONSTRAINT usuario_regra_regras_fkey FOREIGN KEY (id_regras) REFERENCES regra(id);


--
-- TOC entry 4936 (class 2606 OID 25308)
-- Name: usuario_regra usuario_regra_usuarios_fkey; Type: FK CONSTRAINT; Schema: autorizacao; Owner: postgres
--

ALTER TABLE ONLY usuario_regra
    ADD CONSTRAINT usuario_regra_usuarios_fkey FOREIGN KEY (id_usuarios) REFERENCES usuario(id);


SET search_path = comercial, pg_catalog;

--
-- TOC entry 4943 (class 2606 OID 33528)
-- Name: chance chance_chance_type_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance
    ADD CONSTRAINT chance_chance_type_id_fkey FOREIGN KEY (service_type) REFERENCES chance_type(id);


--
-- TOC entry 4944 (class 2606 OID 33540)
-- Name: chance_closed chance_closed_chance_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_closed
    ADD CONSTRAINT chance_closed_chance_id_fkey FOREIGN KEY (chance_id) REFERENCES chance(id);


--
-- TOC entry 4945 (class 2606 OID 33534)
-- Name: chance_contact chance_contact_chance_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_contact
    ADD CONSTRAINT chance_contact_chance_id_fkey FOREIGN KEY (chance_id) REFERENCES chance(id);


--
-- TOC entry 4942 (class 2606 OID 33522)
-- Name: chance chance_followup_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance
    ADD CONSTRAINT chance_followup_id_fkey FOREIGN KEY (id_followup) REFERENCES followup(id);


--
-- TOC entry 4946 (class 2606 OID 33546)
-- Name: chance_inactive chance_inactive_chance_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_inactive
    ADD CONSTRAINT chance_inactive_chance_id_fkey FOREIGN KEY (chance_id) REFERENCES chance(id);


--
-- TOC entry 4947 (class 2606 OID 33552)
-- Name: chance_indication chance_indication_chance_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance_indication
    ADD CONSTRAINT chance_indication_chance_id_fkey FOREIGN KEY (id_chance) REFERENCES chance(id);


--
-- TOC entry 4940 (class 2606 OID 33510)
-- Name: chance chance_prospect_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance
    ADD CONSTRAINT chance_prospect_id_fkey FOREIGN KEY (id_prospect) REFERENCES prospect(id);


--
-- TOC entry 4941 (class 2606 OID 33516)
-- Name: chance chance_service_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY chance
    ADD CONSTRAINT chance_service_id_fkey FOREIGN KEY (id_product) REFERENCES service(id);


--
-- TOC entry 4948 (class 2606 OID 33581)
-- Name: lost_action lost_action_lost_action_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_action
    ADD CONSTRAINT lost_action_lost_action_id_fkey FOREIGN KEY (parent_id) REFERENCES lost_action(id);


--
-- TOC entry 4949 (class 2606 OID 33558)
-- Name: lost_chance lost_chance_chance_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_chance
    ADD CONSTRAINT lost_chance_chance_id_fkey FOREIGN KEY (chance_id) REFERENCES chance(id);


--
-- TOC entry 4951 (class 2606 OID 33575)
-- Name: lost_chance lost_chance_lost_action_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_chance
    ADD CONSTRAINT lost_chance_lost_action_id_fkey FOREIGN KEY (lost_action_id) REFERENCES lost_action(id);


--
-- TOC entry 4950 (class 2606 OID 33569)
-- Name: lost_chance lost_chance_wallet_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY lost_chance
    ADD CONSTRAINT lost_chance_wallet_id_fkey FOREIGN KEY (wallet) REFERENCES wallet(id);


--
-- TOC entry 4938 (class 2606 OID 28712)
-- Name: prospect prospect_tag_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY prospect
    ADD CONSTRAINT prospect_tag_id_fkey FOREIGN KEY (id_tag) REFERENCES tag(id);


--
-- TOC entry 4939 (class 2606 OID 28717)
-- Name: prospect prospect_wallet_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY prospect
    ADD CONSTRAINT prospect_wallet_id_fkey FOREIGN KEY (id_wallet) REFERENCES wallet(id);


--
-- TOC entry 4952 (class 2606 OID 33587)
-- Name: viable viabel_chance_id_fkey; Type: FK CONSTRAINT; Schema: comercial; Owner: postgres
--

ALTER TABLE ONLY viable
    ADD CONSTRAINT viabel_chance_id_fkey FOREIGN KEY (chance_id) REFERENCES chance(id);


SET search_path = engenharia, pg_catalog;

--
-- TOC entry 4953 (class 2606 OID 33625)
-- Name: kmz kmz_kmz_file_id_kmz_file_id_fkey; Type: FK CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY kmz
    ADD CONSTRAINT kmz_kmz_file_id_kmz_file_id_fkey FOREIGN KEY (kmz_file_id) REFERENCES kmz_file(id);


--
-- TOC entry 4954 (class 2606 OID 33630)
-- Name: kmz kmz_type_id_type_id; Type: FK CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY kmz
    ADD CONSTRAINT kmz_type_id_type_id FOREIGN KEY (type_id) REFERENCES type(id);


--
-- TOC entry 4956 (class 2606 OID 33660)
-- Name: location location_location_id_location_id_fk; Type: FK CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_location_id_location_id_fk FOREIGN KEY (location_id) REFERENCES location(id);


--
-- TOC entry 4957 (class 2606 OID 33665)
-- Name: location location_point_id_point_id_fk; Type: FK CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_point_id_point_id_fk FOREIGN KEY (point_id) REFERENCES point(id);


--
-- TOC entry 4955 (class 2606 OID 33647)
-- Name: point point_type_id_type_id_fk; Type: FK CONSTRAINT; Schema: engenharia; Owner: postgres
--

ALTER TABLE ONLY point
    ADD CONSTRAINT point_type_id_type_id_fk FOREIGN KEY (type_id) REFERENCES type(id);


SET search_path = troubleticket, pg_catalog;

--
-- TOC entry 4929 (class 2606 OID 25215)
-- Name: history history_report_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_report_id FOREIGN KEY (report_id) REFERENCES reports(id);


--
-- TOC entry 4930 (class 2606 OID 25220)
-- Name: history history_subcase_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_subcase_id FOREIGN KEY (subcase_id) REFERENCES subcases(id);


--
-- TOC entry 4931 (class 2606 OID 25225)
-- Name: messages messages_report_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_report_id FOREIGN KEY (report_id) REFERENCES reports(id);


--
-- TOC entry 4932 (class 2606 OID 25230)
-- Name: reports reports_parent_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_parent_id FOREIGN KEY (parent_id) REFERENCES reports(id);


--
-- TOC entry 4933 (class 2606 OID 25235)
-- Name: subcases subcases_report_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY subcases
    ADD CONSTRAINT subcases_report_id FOREIGN KEY (report_id) REFERENCES reports(id);


--
-- TOC entry 4934 (class 2606 OID 25240)
-- Name: time_counters time_counters_report_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY time_counters
    ADD CONSTRAINT time_counters_report_id FOREIGN KEY (report_id) REFERENCES reports(id);


--
-- TOC entry 4935 (class 2606 OID 25245)
-- Name: time_counters time_counters_subcase_id; Type: FK CONSTRAINT; Schema: troubleticket; Owner: postgres
--

ALTER TABLE ONLY time_counters
    ADD CONSTRAINT time_counters_subcase_id FOREIGN KEY (subcase_id) REFERENCES subcases(id);


-- Completed on 2018-02-21 16:21:20 -03

--
-- PostgreSQL database dump complete
--

