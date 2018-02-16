CREATE SCHEMA engenharia;
SET search_path = engenharia, pg_catalog;


CREATE TABLE kmz_file
(
  id serial NOT NULL,
  filename character varying(100),
  date_record timestamp without time zone,
  user_id character varying(4),
  path character varying(100),
  CONSTRAINT kmz_file_pkey PRIMARY KEY (id)
);

CREATE TABLE type
(
  id serial NOT NULL,
  name character varying(100) NOT NULL,
  CONSTRAINT type_pk PRIMARY KEY (id)
);


CREATE TABLE kmz
(
  id serial NOT NULL,
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
  activation_deadline integer,
  CONSTRAINT kmz_pkey PRIMARY KEY (id),
  CONSTRAINT kmz_kmz_file_id_kmz_file_id_fkey FOREIGN KEY (kmz_file_id)
      REFERENCES kmz_file (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT kmz_type_id_type_id FOREIGN KEY (type_id)
      REFERENCES type (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE point
(
  id serial NOT NULL,
  name character varying(500) NOT NULL,
  color character varying(7) NOT NULL,
  type_id integer NOT NULL,
  date_valid timestamp without time zone,
  max_speed integer,
  interface character varying(3) NOT NULL,
  active boolean NOT NULL,
  location_type integer NOT NULL,
  author integer NOT NULL,
  date_record timestamp(0) without time zone NOT NULL DEFAULT now(),
  circ_codigoid integer,
  activation_deadline integer,
  state character varying(2) NOT NULL,
  CONSTRAINT point_pkey PRIMARY KEY (id),
  CONSTRAINT point_type_id_type_id_fk FOREIGN KEY (type_id)
      REFERENCES type (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE location
(
  id serial NOT NULL,
  latitude numeric(25,20),
  longitude numeric(25,20),
  location_id integer,
  point_id integer,
  radius integer,
  CONSTRAINT location_pkey PRIMARY KEY (id),
  CONSTRAINT location_location_id_location_id_fk FOREIGN KEY (location_id)
      REFERENCES location (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT location_point_id_point_id_fk FOREIGN KEY (point_id)
      REFERENCES point (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);



