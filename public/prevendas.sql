
SET search_path = prevendas, pg_catalog;

--
-- TOC entry 204 (class 1259 OID 105020)
-- Name: capex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE capex (
    id serial NOT NULL,
    lpu_id integer,
    initial_speed integer,
    initial_speed_type_id integer,
    final_speed integer,
    final_speed_type_id integer,
    cost money,
    CONSTRAINT capex_pkey PRIMARY KEY (id)
);

--
-- TOC entry 163 (class 1259 OID 29125)
-- Name: distance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE distance (
    id serial NOT NULL,
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
    date_edit timestamp without time zone,
    CONSTRAINT distance_pkey PRIMARY KEY (id)
);

--
-- TOC entry 165 (class 1259 OID 29132)
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feature (
    id serial NOT NULL,
    name character varying NOT NULL,
    atri_codigoid bigint,
    mandatory boolean NOT NULL,
    service_id bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "group" integer,
    CONSTRAINT feature_pkey PRIMARY KEY (id)
);

--
-- TOC entry 166 (class 1259 OID 29139)
-- Name: feature_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feature_attribute (
    id serial NOT NULL,
    name character varying,
    feature_id integer,
    default_selected boolean DEFAULT false NOT NULL,
    active boolean DEFAULT true NOT NULL,
    CONSTRAINT feature_attribute_pkey PRIMARY KEY (id)
);

--
-- TOC entry 169 (class 1259 OID 29151)
-- Name: lpu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lpu (
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    service_id integer NOT NULL,
    author integer NOT NULL,
    date_record timestamp without time zone NOT NULL DEFAULT now(),
    date_valid timestamp without time zone,
    distance integer,
    active boolean DEFAULT true NOT NULL,
    min_contract_deadline integer DEFAULT 12,
    min_contract_unit integer DEFAULT 1,
    sla numeric(5,2),
    mode_codigoid integer,
    minimum_price numeric(10,2),
    online_sales boolean DEFAULT true NOT NULL,
    type character varying(1) DEFAULT 'P'::bpchar NOT NULL,
    CONSTRAINT lpu_pkey PRIMARY KEY (id)
);

CREATE TABLE lpu_customer (
    id serial NOT NULL,
    lpu_id integer,
    custumer integer,
    date_record timestamp without time zone,
    CONSTRAINT lpu_customer_pkey PRIMARY KEY (id)
);

--
-- TOC entry 172 (class 1259 OID 29162)
-- Name: lpu_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lpu_feature (
    id serial NOT NULL,
    activation_fare numeric(15,2),
    monthly_cost numeric(15,2),
    date_record timestamp without time zone,
    lpu_id bigint,
    date_valid timestamp without time zone,
    feature_attribute_id bigint,
    quantity integer,
    CONSTRAINT lpu_feature_pkey PRIMARY KEY (id)
);

--
-- TOC entry 175 (class 1259 OID 29169)
-- Name: lpu_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lpu_plan (
    id serial NOT NULL,
    lpu_id integer,
    plan_id integer,
    activation_fare numeric(10,2),
    monthly_cost numeric(10,2),
    franchise_cost numeric(10,2),
    discount_ipc numeric(10,2),
    CONSTRAINT lpu_plan_pkey PRIMARY KEY (id)
);

--
-- TOC entry 177 (class 1259 OID 29174)
-- Name: lpu_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lpu_point (
    id serial NOT NULL,
    lpu_id integer,
    point_id integer,
    date_record timestamp(0) without time zone,
    author integer,
    CONSTRAINT lpu_point_pkey PRIMARY KEY (id)
);

--
-- TOC entry 179 (class 1259 OID 29179)
-- Name: lpu_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lpu_price (
    id serial NOT NULL,
    lpu_id integer,
    region_id integer,
    price integer,
    CONSTRAINT lpu_price_pkey PRIMARY KEY (id)
);

--
-- TOC entry 181 (class 1259 OID 29184)
-- Name: number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE number (
    id serial NOT NULL,
    number_type_id integer NOT NULL,
    lpu_plan_id integer,
    activation_fare numeric(10,2),
    monthly_cost numeric(10,2),
    CONSTRAINT number_pkey PRIMARY KEY (id)
);

--
-- TOC entry 183 (class 1259 OID 29189)
-- Name: number_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE number_type (
    id serial NOT NULL,
    name character varying NOT NULL,
    CONSTRAINT number_type_pkey PRIMARY KEY (id)
);

--
-- TOC entry 185 (class 1259 OID 29197)
-- Name: plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plan (
    id serial NOT NULL,
    fee_codigoid integer,
    name character varying NOT NULL,
    max_ddr integer,
    date_record timestamp(0) without time zone,
    date_end timestamp(0) without time zone,
    author integer,
    CONSTRAINT plan_pkey PRIMARY KEY (id)
);

--
-- TOC entry 187 (class 1259 OID 29205)
-- Name: quotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quotation (
    id serial NOT NULL,
    author integer,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    client integer NOT NULL,
    service_id integer,
    speed integer,
    deadline integer,
    CONSTRAINT quotation_pkey PRIMARY KEY (id)
);

--
-- TOC entry 188 (class 1259 OID 29209)
-- Name: quotation_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quotation_address (
    id serial NOT NULL,
    cep character varying(8),
    street character varying(255),
    number character varying,
    lat numeric(15,10),
    lon numeric(15,10),
    quotation_id integer,
    selecao boolean,
    CONSTRAINT quotation_address_pkey PRIMARY KEY (id)
);

--
-- TOC entry 190 (class 1259 OID 29217)
-- Name: quotation_address_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quotation_address_point (
    id serial NOT NULL,
    quotation_address_id integer,
    point_id integer,
    distance numeric(10,2),
    approximate boolean DEFAULT false NOT NULL,
    lpus text,
    name character varying,
    CONSTRAINT quotation_address_point_pkey PRIMARY KEY (id)
);

--
-- TOC entry 193 (class 1259 OID 29228)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE region (
    id serial NOT NULL,
    name character varying(100),
    max integer,
    CONSTRAINT region_pkey PRIMARY KEY (id)
);

--
-- TOC entry 195 (class 1259 OID 29233)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE service (
    id serial NOT NULL,
    name character varying(100),
    serv_codigoid bigint,
    active boolean DEFAULT true,
    quotable boolean DEFAULT false NOT NULL,
    CONSTRAINT service_pkey PRIMARY KEY (id)
);

--
-- TOC entry 197 (class 1259 OID 29240)
-- Name: speed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE speed (
    id serial NOT NULL,
    speed integer,
    activation_fare numeric(15,2),
    monthly_cost numeric(15,2),
    lpu_id integer,
    speed_type_id integer,
    CONSTRAINT speed_pkey PRIMARY KEY (id)
);

--
-- TOC entry 199 (class 1259 OID 29245)
-- Name: speed_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE speed_type (
    id serial NOT NULL,
    name character varying(10),
    multiplier integer DEFAULT 1 NOT NULL,
    CONSTRAINT speed_type_pkey PRIMARY KEY (id)
);

