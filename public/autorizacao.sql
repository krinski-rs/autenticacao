CREATE SCHEMA autorizacao;

SET search_path = autorizacao, pg_catalog;

CREATE TABLE autorizacao.menu
(
    id serial NOT NULL,
    menu_id integer,
    nome character varying(20) NOT NULL,
    ativo boolean NOT NULL,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    CONSTRAINT menu_pkey PRIMARY KEY (id),
    CONSTRAINT menu_menu_fkey FOREIGN KEY (menu_id)
        REFERENCES autorizacao.menu (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE autorizacao.regra
(
    id seria NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT regras_pkey PRIMARY KEY (id)
);

CREATE TABLE autorizacao.usuario
(
    id seria NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default" NOT NULL,
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(100) COLLATE pg_catalog."default" NOT NULL,
    salt character varying(100) COLLATE pg_catalog."default" NOT NULL,
    ativo boolean NOT NULL DEFAULT true,
    data_cadastro timestamp(0) without time zone NOT NULL DEFAULT now(),
    CONSTRAINT usuarios_pkey PRIMARY KEY (id),
    CONSTRAINT usuarios_unique UNIQUE (username)
);

CREATE TABLE autorizacao.usuario_regra
(
    id_usuarios integer NOT NULL,
    id_regras integer NOT NULL,
    CONSTRAINT usuario_regra_pkey PRIMARY KEY (id_usuarios, id_regras),
    CONSTRAINT usuario_regra_regras_fkey FOREIGN KEY (id_regras)
        REFERENCES autorizacao.regras (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT usuario_regra_usuarios_fkey FOREIGN KEY (id_usuarios)
        REFERENCES autorizacao.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
