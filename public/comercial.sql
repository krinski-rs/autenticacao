CREATE SCHEMA comercial;

SET search_path = comercial, pg_catalog;

--
-- TOC entry 278 (class 1259 OID 17778)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE service (
    id serial NOT NULL,
    name character varying(100),
    servico_contrato integer NOT NULL,
    multiple_circuits boolean NOT NULL DEFAULT false,
    location_service integer,
    active boolean NOT NULL DEFAULT true,
    CONSTRAINT service_pkey PRIMARY KEY (id)
);

--
-- TOC entry 314 (class 1259 OID 17899)
-- Name: wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wallet (
    id serial NOT NULL,
    id_ev integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    date_record timestamp(0) without time zone NOT NULL DEFAULT now(),
    date_update timestamp(0) without time zone,
    CONSTRAINT wallet_pkey PRIMARY KEY (id)
);

--
-- TOC entry 279 (class 1259 OID 17783)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tag (
    id serial NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(7) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    CONSTRAINT tag_pkey PRIMARY KEY (id)
);

--
-- TOC entry 270 (class 1259 OID 17748)
-- Name: prospect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prospect (
    id serial NOT NULL,
    id_wallet integer NOT NULL,
    id_tag integer,
    id_cliente integer NOT NULL,
    date_record timestamp(0) without time zone NOT NULL DEFAULT now(),
    date_update timestamp(0) without time zone,
    active boolean NOT NULL DEFAULT true,
    client_name character varying(200) NOT NULL,
    cid integer,
    fake_name character varying(200),
    CONSTRAINT prospect_pkey PRIMARY KEY (id),
    CONSTRAINT prospect_tag_id_fkey FOREIGN KEY (id_tag)
      REFERENCES comercial.tag (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT prospect_wallet_id_fkey FOREIGN KEY (id_wallet)
      REFERENCES comercial.wallet (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

--
-- TOC entry 182 (class 1259 OID 17415)
-- Name: chance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance (

    id serial NOT NULL,
    id_prospect integer NOT NULL,
    id_product integer NOT NULL,
    temperature integer NOT NULL,
    active boolean NOT NULL,
    description text,
    date_record timestamp(0) without time zone NOT NULL DEFAULT now(),
    date_update timestamp(0) without time zone,
    id_followup integer,
    id_last_proposal integer,
    service_type integer NOT NULL,
    id_contract integer,
    closing_value numeric,
    closing_date timestamp(0) without time zone,
    CONSTRAINT chance_pkey PRIMARY KEY (id)
);

--
-- TOC entry 176 (class 1259 OID 17396)
-- Name: activation_deadline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE activation_deadline (
    state character varying(2) NOT NULL,
    days_deadline integer NOT NULL,
    CONSTRAINT activation_deadline_pkey PRIMARY KEY (state)
);

CREATE TABLE agreement (
    id serial NOT NULL,
    ip character varying(45) NOT NULL,
    agreed boolean NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    proposal_id integer NOT NULL,
    CONSTRAINT agreement_pkey PRIMARY KEY (id)
);

--
-- TOC entry 179 (class 1259 OID 17405)
-- Name: bank_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bank_information (
    id serial NOT NULL,
    cnpj character varying(14) NOT NULL,
    name character varying,
    number character varying(3),
    agency character varying(4),
    account character varying(20),
    CONSTRAINT banc_information_pkey PRIMARY KEY (id)
);

--
-- TOC entry 183 (class 1259 OID 17423)
-- Name: chance_classification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_classification (
    id serial NOT NULL,
    name character varying(250),
    CONSTRAINT chance_classification_pkey PRIMARY KEY (id)
);

--
-- TOC entry 185 (class 1259 OID 17428)
-- Name: chance_closed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_closed (
    id serial NOT NULL,
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
    delta real,
    CONSTRAINT chance_closed_pkey PRIMARY KEY (id)
);

--
-- TOC entry 188 (class 1259 OID 17440)
-- Name: chance_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_contact (
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    telephone character varying(15),
    email character varying(120),
    chance_id integer NOT NULL,
    warn boolean NOT NULL DEFAULT true,
    CONSTRAINT chance_contact_pkey PRIMARY KEY (id)
);

--
-- TOC entry 190 (class 1259 OID 17446)
-- Name: chance_inactive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_inactive (
    id serial NOT NULL,
    chance_id integer,
    description text,
    record_date timestamp(0) without time zone DEFAULT now(),
    active boolean DEFAULT true,
    CONSTRAINT chance_inactive_pkey PRIMARY KEY (id)
);

--
-- TOC entry 191 (class 1259 OID 17455)
-- Name: chance_inactive_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_inactive_log (
    id serial NOT NULL,
    chance_inactive_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    "user" integer,
    ev integer,
    CONSTRAINT chance_inactive_log_pkey PRIMARY KEY (id)
);

--
-- TOC entry 193 (class 1259 OID 17461)
-- Name: chance_indication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_indication (
    id serial NOT NULL,
    type character varying(10),
    who character varying(200),
    email character varying(200),
    id_chance integer,
    warn boolean DEFAULT false,
    CONSTRAINT chance_indication_pkey PRIMARY KEY (id)
);

--
-- TOC entry 196 (class 1259 OID 17470)
-- Name: chance_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_status (
    id serial NOT NULL,
    name character varying(100),
    CONSTRAINT chance_status_pkey PRIMARY KEY (id)
);

--
-- TOC entry 197 (class 1259 OID 17474)
-- Name: chance_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_tag (
    id_chance integer NOT NULL,
    id_tag integer NOT NULL,
    CONSTRAINT chance_tag_pkey PRIMARY KEY (id_tag, id_chance)
);

--
-- TOC entry 198 (class 1259 OID 17477)
-- Name: chance_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chance_type (
    id serial NOT NULL,
    name character varying(100),
    CONSTRAINT chance_type_pkey PRIMARY KEY (id)
);

--
-- TOC entry 200 (class 1259 OID 17485)
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE companies (
    id serial NOT NULL,
    name character varying(100),
    spid integer,
    CONSTRAINT companies_pkey PRIMARY KEY (id)
);

--
-- TOC entry 320 (class 1259 OID 25326)
-- Name: contract_denial_reason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contract_denial_reason (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    contract_denial_reason_category_id integer NOT NULL,
    CONSTRAINT contract_denial_reason_pkey PRIMARY KEY (id)
);

--
-- TOC entry 318 (class 1259 OID 25317)
-- Name: contract_denial_reason_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contract_denial_reason_category (
    id serial NOT NULL,
    name character varying(80) NOT NULL,
    CONSTRAINT contract_denial_reason_category_pkey PRIMARY KEY (id)
);

--
-- TOC entry 201 (class 1259 OID 17489)
-- Name: costs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE costs (
    id serial NOT NULL,
    service_id integer,
    interface integer,
    capex_equipament numeric(10,2),
    capex_fiber numeric(10,2),
    ip numeric(10,2),
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_end timestamp(0) without time zone DEFAULT NULL::timestamp(0) without time zone,
    CONSTRAINT costs_pkey PRIMARY KEY (id)
);

--
-- TOC entry 332 (class 1259 OID 36868)
-- Name: datacenter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE datacenter (
    id serial NOT NULL,
    nome text,
    uf text,
    cidade integer,
    lat character varying(100),
    lon character varying(100),
    cep text,
    logradouro text,
    numero text,
    complemento text,
    bairro character varying(255),
    CONSTRAINT datacenter_pkey PRIMARY KEY (id)
);

--
-- TOC entry 203 (class 1259 OID 17495)
-- Name: discount_competence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE discount_competence (
    id serial NOT NULL,
    id_user integer NOT NULL,
    date_record timestamp(6) without time zone NOT NULL,
    active boolean,
    percentage real NOT NULL,
    registrant integer NOT NULL,
    CONSTRAINT discount_competence_pkey PRIMARY KEY (id)
);

--
-- TOC entry 205 (class 1259 OID 17500)
-- Name: discount_proposal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE discount_proposal (
    id serial NOT NULL,
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
    proposal_approved integer,
    CONSTRAINT discount_proposal_pkey PRIMARY KEY (id)
);

--
-- TOC entry 207 (class 1259 OID 17508)
-- Name: discount_proposal_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE discount_proposal_status (
    id serial NOT NULL,
    depr_codigoid integer NOT NULL,
    user_id smallint NOT NULL,
    alcada numeric(10,2) NOT NULL,
    date_inc timestamp(6) without time zone NOT NULL,
    status character varying DEFAULT 'G'::character varying,
    motivo character varying(255),
    CONSTRAINT discount_proposal_status_pkey PRIMARY KEY (id)
);

--
-- TOC entry 210 (class 1259 OID 17519)
-- Name: ev_change; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ev_change (
    id serial NOT NULL,
    id_prospect integer,
    CONSTRAINT ev_change_pkey PRIMARY KEY (id)
);

--
-- TOC entry 211 (class 1259 OID 17523)
-- Name: favorite_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE favorite_address (
    id serial NOT NULL,
    viable_id integer NOT NULL,
    wallet_id integer NOT NULL,
    name character varying NOT NULL,
    prospect_id integer NOT NULL,
    CONSTRAINT favorite_address_pkey PRIMARY KEY (id)
);

--
-- TOC entry 214 (class 1259 OID 17533)
-- Name: followup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE followup (
    id serial NOT NULL,
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
    id_contract integer,
    CONSTRAINT followup_pkey PRIMARY KEY (id)
);

--
-- TOC entry 216 (class 1259 OID 17543)
-- Name: followup_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE followup_action (
    id serial NOT NULL,
    name character varying(100),
    subacao boolean DEFAULT true,
    parent_id integer,
    visivel boolean DEFAULT true,
    CONSTRAINT followup_action_pkey PRIMARY KEY (id)
);

--
-- TOC entry 217 (class 1259 OID 17549)
-- Name: followup_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE followup_contact (
    id serial NOT NULL,
    sistech_id integer,
    chance_contact_id integer,
    followup_id integer,
    CONSTRAINT followup_contact_pkey PRIMARY KEY (id)
);

--
-- TOC entry 219 (class 1259 OID 17554)
-- Name: global_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE global_address (
    id serial NOT NULL,
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
    number integer NOT NULL,
    CONSTRAINT global_address_pkey PRIMARY KEY (id)
);

--
-- TOC entry 222 (class 1259 OID 17564)
-- Name: goal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE goal (
    id serial NOT NULL,
    name character varying(100),
    function character varying(100),
    goal_type_id integer,
    CONSTRAINT goal_pkey PRIMARY KEY (id)
);

--
-- TOC entry 224 (class 1259 OID 17570)
-- Name: goal_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE goal_history (
    id serial NOT NULL,
    goal_wallet_id integer,
    score numeric(9,2),
    date_record timestamp(0) without time zone DEFAULT now(),
    CONSTRAINT goal_history_pkey PRIMARY KEY (id)
);

--
-- TOC entry 226 (class 1259 OID 17577)
-- Name: goal_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE goal_type (
    id serial NOT NULL,
    name character varying(100),
    CONSTRAINT goal_type_pkey PRIMARY KEY (id)
);

--
-- TOC entry 228 (class 1259 OID 17583)
-- Name: goal_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE goal_wallet (
    id serial NOT NULL,
    wallet_id integer,
    goal_id integer,
    score numeric(10,2),
    team character varying(100),
    active boolean,
    chance_id integer,
    CONSTRAINT goal_wallet_pkey PRIMARY KEY (id)
);


--
-- TOC entry 230 (class 1259 OID 17591)
-- Name: group_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE group_item (
    id serial NOT NULL,
    group_id integer,
    product_luma integer,
    quantity real,
    CONSTRAINT group_item_pkey PRIMARY KEY (id)
);

--
-- TOC entry 232 (class 1259 OID 17596)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupo (
    id serial NOT NULL,
    group_name character varying(80) NOT NULL,
    group_description text,
    ativo boolean DEFAULT true,
    CONSTRAINT group_pkey PRIMARY KEY (id)
);

--
-- TOC entry 234 (class 1259 OID 17605)
-- Name: information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE information (
    id serial NOT NULL,
    description text,
    CONSTRAINT information_pkey PRIMARY KEY (id)
);

--
-- TOC entry 237 (class 1259 OID 17615)
-- Name: lost_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lost_action (
    id serial NOT NULL,
    name character varying(200),
    parent_id integer,
    visible boolean,
    "select" boolean,
    CONSTRAINT lost_action_pkey PRIMARY KEY (id)
);

--
-- TOC entry 239 (class 1259 OID 17621)
-- Name: lost_chance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lost_chance (
    id serial NOT NULL,
    chance_id integer,
    lost_action_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    wallet integer,
    description text,
    CONSTRAINT lost_chance_pkey PRIMARY KEY (id)
);

--
-- TOC entry 240 (class 1259 OID 17629)
-- Name: number_imported; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE number_imported (
    id serial NOT NULL,
    number_imported character varying(15),
    ddd character varying(3),
    CONSTRAINT number_imported_pkey PRIMARY KEY (id)
);

--
-- TOC entry 243 (class 1259 OID 17637)
-- Name: proposal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal (
    id serial NOT NULL,
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
    contrato_sthima integer,
    CONSTRAINT proposal_pkey PRIMARY KEY (id)
);

--
-- TOC entry 245 (class 1259 OID 17648)
-- Name: proposal_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_address (
    id serial NOT NULL,
    uf text,
    city integer,
    cep text,
    street text,
    number text,
    complement text,
    proposal_id integer,
    district character varying,
    CONSTRAINT proposal_address_pkey PRIMARY KEY (id)
);

--
-- TOC entry 334 (class 1259 OID 41285)
-- Name: proposal_benefits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_benefits (
    id serial NOT NULL,
    proposal_id integer,
    investment_value money,
    monthly_bonus_value money,
    activation_bonus_value money,
    permanence_deadline integer,
    permanence_unit integer,
    CONSTRAINT proposal_benefits_pkey PRIMARY KEY (id)
);

--
-- TOC entry 246 (class 1259 OID 17655)
-- Name: proposal_circuit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_circuit (
    id serial NOT NULL,
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
    final_client character varying(255),
    CONSTRAINT proposal_circuit_pkey PRIMARY KEY (id)
);

--
-- TOC entry 328 (class 1259 OID 35617)
-- Name: proposal_circuit_sva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_circuit_sva (
    id serial NOT NULL,
    proposal_circuit_id integer NOT NULL,
    sva_id integer NOT NULL,
    ativation_fare money DEFAULT 0 NOT NULL,
    monthly_cost money DEFAULT 0 NOT NULL,
    CONSTRAINT proposal_circuit_sva_pkey PRIMARY KEY (id)
);

--
-- TOC entry 330 (class 1259 OID 35637)
-- Name: proposal_circuit_sva_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_circuit_sva_products (
    id serial NOT NULL,
    proposal_circuit_sva_id integer NOT NULL,
    external_id integer,
    name character varying(255) NOT NULL,
    amount integer NOT NULL,
    type character varying(100) NOT NULL,
    CONSTRAINT proposal_circuit_sva_products_pkey PRIMARY KEY (id)
);

--
-- TOC entry 248 (class 1259 OID 17663)
-- Name: proposal_document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_document (
    id serial NOT NULL,
    proposal_id integer NOT NULL,
    proposal_odt_id integer,
    odt_file character varying,
    pdf_file character varying,
    user_id integer,
    dateinc timestamp(0) without time zone,
    dategen timestamp(0) without time zone,
    CONSTRAINT proposal_document_pkey PRIMARY KEY (id)
);

--
-- TOC entry 250 (class 1259 OID 17671)
-- Name: proposal_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_feature (
    id serial NOT NULL,
    atrivalo_codigoid integer,
    value character varying,
    activation_fare money,
    monthly_cost money,
    proposal_id integer,
    quantity integer,
    CONSTRAINT proposal_feature_pkey PRIMARY KEY (id)
);

--
-- TOC entry 252 (class 1259 OID 17679)
-- Name: proposal_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_information (
    proposal_id serial NOT NULL,
    information_id integer NOT NULL,
    CONSTRAINT proposal_information_pkey PRIMARY KEY (proposal_id, information_id)
);

--
-- TOC entry 253 (class 1259 OID 17682)
-- Name: proposal_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_number (
    id serial NOT NULL,
    proposal_id integer,
    number_type integer,
    quantity integer,
    activation_fare money,
    monthly_cost money,
    CONSTRAINT proposal_number_pkey PRIMARY KEY (id)
);

--
-- TOC entry 255 (class 1259 OID 17687)
-- Name: proposal_number_imported; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_number_imported (
    proposal_id integer NOT NULL,
    number_imported_id integer NOT NULL,
    CONSTRAINT proposal_number_imported_pkey PRIMARY KEY (proposal_id, number_imported_id)
);

--
-- TOC entry 256 (class 1259 OID 17690)
-- Name: proposal_odt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_odt (
    id serial NOT NULL,
    filename character varying(200),
    service_id integer,
    date_record timestamp(0) without time zone,
    author integer,
    active boolean,
    CONSTRAINT proposal_odt_pkey PRIMARY KEY (id)
);

--
-- TOC entry 258 (class 1259 OID 17695)
-- Name: proposal_protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_protocol (
    id serial NOT NULL,
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
    comment text,
    CONSTRAINT proposal_protocol_pkey PRIMARY KEY (id)
);

--
-- TOC entry 260 (class 1259 OID 17706)
-- Name: proposal_protocol_historic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_protocol_historic (
    id serial NOT NULL,
    date_inc timestamp(0) without time zone NOT NULL,
    proposal_protocol_id integer NOT NULL,
    aut_usuarios_id integer NOT NULL,
    department character varying(60) NOT NULL,
    proposal_protocol_status_id integer NOT NULL,
    reason_denial text NOT NULL,
    contract_denial_reason_id integer,
    CONSTRAINT proposal_protocol_historic_pkey PRIMARY KEY (id)
);

--
-- TOC entry 262 (class 1259 OID 17715)
-- Name: proposal_protocol_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_protocol_status (
    id serial NOT NULL,
    name character varying NOT NULL,
    CONSTRAINT proposal_protocol_status_pkey PRIMARY KEY (id)
);

--
-- TOC entry 263 (class 1259 OID 17721)
-- Name: proposal_responsible; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_responsible (
    id serial NOT NULL,
    proposal_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying,
    cpf character varying,
    birthday date,
    phone character varying,
    cellphone character varying,
    email character varying,
    cad_users_id integer,
    CONSTRAINT proposal_responsible_pkey PRIMARY KEY (id)
);

--
-- TOC entry 265 (class 1259 OID 17729)
-- Name: proposal_responsible_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_responsible_type (
    id serial NOT NULL,
    name character varying,
    CONSTRAINT proposal_responsible_type_pkey PRIMARY KEY (id)
);

--
-- TOC entry 267 (class 1259 OID 17737)
-- Name: proposal_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_status (
    id serial NOT NULL,
    valproposal_id boolean,
    physical_proposal_pendency boolean,
    date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    date_update timestamp(0) without time zone,
    motivo_proposta_invalida text,
    pending_seller boolean,
    id_reason integer,
    CONSTRAINT proposal_status_pkey PRIMARY KEY (id)
);

--
-- TOC entry 324 (class 1259 OID 25354)
-- Name: proposal_time_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_time_counters (
    id serial NOT NULL,
    proposal_id integer NOT NULL,
    initial_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    final_date timestamp(0) without time zone,
    proposal_time_counters_stacks_id integer NOT NULL,
    proposal_protocol_status_id integer,
    CONSTRAINT proposal_time_counters_pkey PRIMARY KEY (id)
);

--
-- TOC entry 322 (class 1259 OID 25345)
-- Name: proposal_time_counters_stacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proposal_time_counters_stacks (
    id serial NOT NULL,
    name character varying(80) NOT NULL,
    deadline integer NOT NULL,
    CONSTRAINT proposal_time_counters_stacks_pkey PRIMARY KEY (id)
);

--
-- TOC entry 272 (class 1259 OID 17756)
-- Name: ranking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ranking (
    id serial NOT NULL,
    points integer,
    team character varying(200),
    date_record timestamp(0) without time zone DEFAULT now(),
    total integer,
    ciclo integer DEFAULT 1,
    CONSTRAINT ranking_pkey PRIMARY KEY (id)
);

--
-- TOC entry 273 (class 1259 OID 17762)
-- Name: reason_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reason_category (
    id serial NOT NULL,
    category character varying(255) NOT NULL,
    status boolean NOT NULL,
    date_record time(6) without time zone,
    CONSTRAINT reason_category_pkey PRIMARY KEY (id)
);

--
-- TOC entry 274 (class 1259 OID 17765)
-- Name: requirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE requirement (
    id serial NOT NULL,
    name character varying NOT NULL,
    luma_id integer,
    unit character varying(10),
    CONSTRAINT requirement_pkey PRIMARY KEY (id)
);

--
-- TOC entry 276 (class 1259 OID 17773)
-- Name: return_reason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE return_reason (
    id serial NOT NULL,
    reason character varying(255) NOT NULL,
    category_id integer NOT NULL,
    status boolean NOT NULL,
    date_record timestamp(6) without time zone,
    CONSTRAINT return_reason_pkey PRIMARY KEY (id)
);

--
-- TOC entry 326 (class 1259 OID 35607)
-- Name: sva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sva (
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    nickname character varying(100) NOT NULL,
    CONSTRAINT sva_pkey PRIMARY KEY (id)
);

--
-- TOC entry 281 (class 1259 OID 17789)
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team (
    id serial NOT NULL,
    teamtype_id integer NOT NULL,
    team_name character varying(150),
    team_active boolean DEFAULT true NOT NULL,
    team_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    CONSTRAINT team_pkey PRIMARY KEY (id)
);

--
-- TOC entry 282 (class 1259 OID 17794)
-- Name: team_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team_state (
    id serial NOT NULL,
    team_id integer NOT NULL,
    teamstate_uf character varying(2) NOT NULL,
    teamstate_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    teamstate_active boolean DEFAULT true NOT NULL,
    CONSTRAINT team_state_pkey PRIMARY KEY (id)
);

--
-- TOC entry 285 (class 1259 OID 17803)
-- Name: team_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team_type (
    id serial NOT NULL,
    teamtype_name character varying(150),
    teamtype_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    teamtype_active boolean DEFAULT true NOT NULL,
    CONSTRAINT team_type_pkey PRIMARY KEY (id)
);

--
-- TOC entry 287 (class 1259 OID 17810)
-- Name: team_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team_user (
    id serial NOT NULL,
    team_id integer NOT NULL,
    user_id integer NOT NULL,
    teamuser_date_record timestamp(0) without time zone DEFAULT now() NOT NULL,
    teamuser_active boolean DEFAULT true NOT NULL,
    CONSTRAINT team_user_pkey PRIMARY KEY (id)
);

--
-- TOC entry 289 (class 1259 OID 17817)
-- Name: thirdservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE thirdservice (
    id serial NOT NULL,
    name character varying NOT NULL,
    date_record timestamp(0) without time zone NOT NULL,
    cost numeric(10,2) NOT NULL,
    user_registrant integer NOT NULL,
    active boolean NOT NULL,
    type integer NOT NULL,
    CONSTRAINT thirdservice_pkey PRIMARY KEY (id)
);

--
-- TOC entry 291 (class 1259 OID 17825)
-- Name: type_thirdservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE type_thirdservice (
    id serial NOT NULL,
    name character varying NOT NULL,
    active boolean NOT NULL,
    acronyn character varying NOT NULL,
    CONSTRAINT type_thirdservice_pkey PRIMARY KEY (id)
);

--
-- TOC entry 293 (class 1259 OID 17833)
-- Name: viable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable (
    id serial NOT NULL,
    lat character varying(100),
    lon character varying(100),
    cep character varying(100),
    steet text,
    number character varying(2044),
    complement text,
    viable boolean DEFAULT false,
    hash character varying(65),
    uf character varying(2),
    city integer,
    active boolean,
    viable_status integer,
    date_record timestamp(0) without time zone,
    author integer,
    chance_id integer,
    speed_type integer,
    min_activation numeric(12,2),
    min_monthly numeric(12,2),
    district character varying,
    speed integer,
    interface integer,
    coords text,
    shadow_lpu_id integer,
    price_zone integer,
    fiber_distance numeric(10,2),
    fiber_unit character varying(10),
    cont_codigoid integer,
    next_viable_id integer,
    latlon_manual boolean,
    days_deadline integer,
    skip_engineer boolean,
    request_contract_deadline integer,
    request_contract_deadline_unit integer,
    interface_real integer,
    comment text,
    troca_endereco boolean,
    pair integer,
    capilares integer,
    comment_presale text,
    total_fo numeric(10,2),
    id_group_sva integer,
    network_type character varying,
    id_datacenter integer,
    espaco_datacenter boolean DEFAULT false,
    delivery_place character varying,
    comment_voice text,
    CONSTRAINT viable_pkey PRIMARY KEY (id)
);

--
-- TOC entry 294 (class 1259 OID 17840)
-- Name: viable_approval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_approval (
    id serial NOT NULL,
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
    network_type character varying,
    CONSTRAINT viable_approval_pkey PRIMARY KEY (id)
);

--
-- TOC entry 296 (class 1259 OID 17848)
-- Name: viable_approval_thirdservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_approval_thirdservice (
    id serial NOT NULL,
    viable_approval_id integer NOT NULL,
    thirdservice_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    price numeric(10,2) NOT NULL,
    viable integer,
    CONSTRAINT viable_approval_thirdservice_pkey PRIMARY KEY (id)
);

--
-- TOC entry 298 (class 1259 OID 17853)
-- Name: viable_document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_document (
    id serial NOT NULL,
    viable_id integer NOT NULL,
    document_id integer,
    author integer NOT NULL,
    active boolean NOT NULL,
    date_record timestamp(0) without time zone DEFAULT now(),
    filename character varying(100),
    path character varying(200) NOT NULL,
    CONSTRAINT viable_document_pkey PRIMARY KEY (id)
);

--
-- TOC entry 300 (class 1259 OID 17859)
-- Name: viable_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_feature (
    id serial NOT NULL,
    featureattribute_id integer,
    viable_id integer,
    quantity integer,
    viable_feature_id integer,
    CONSTRAINT viable_feature_pkey PRIMARY KEY (id)
);

--
-- TOC entry 303 (class 1259 OID 17866)
-- Name: viable_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_point (
    viable_id integer,
    point_id integer,
    CONSTRAINT viable_point_pkey PRIMARY KEY (viable_id, point_id)
);

--
-- TOC entry 305 (class 1259 OID 17871)
-- Name: viable_requirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_requirement (
    id serial NOT NULL,
    viable_id integer,
    requirement_id integer,
    quantity numeric(10,2),
    price money,

    group_id integer,
    goal integer,
    CONSTRAINT viable_requirement_pkey PRIMARY KEY (id)
);

--
-- TOC entry 307 (class 1259 OID 17876)
-- Name: viable_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viable_status (
    id serial NOT NULL,
    name character varying(100),
    CONSTRAINT viable_status_pkey PRIMARY KEY (id)
);

--
-- TOC entry 310 (class 1259 OID 17883)
-- Name: vip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vip (
    id serial NOT NULL,
    user_id integer,
    date_record timestamp(0) without time zone DEFAULT now(),
    active boolean,
    description text,
    level_id integer,
    CONSTRAINT vip_pkey PRIMARY KEY (id)
);

--
-- TOC entry 312 (class 1259 OID 17893)
-- Name: vip_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vip_level (
    id serial NOT NULL,
    level integer,
    name character varying(100),
    CONSTRAINT vip_level_pkey PRIMARY KEY (id)
);
