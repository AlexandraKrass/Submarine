CREATE TABLE tst.boat
(
  id serial NOT NULL,
  tech_data integer,
  country integer,
  mark integer,
  color integer,
  availability text,
  CONSTRAINT boat_pkey PRIMARY KEY (id),
  CONSTRAINT boat_country_fkey FOREIGN KEY (country)
      REFERENCES tst.country (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT boat_mark_fkey FOREIGN KEY (mark)
      REFERENCES tst.mark (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT boat_tech_data_fkey FOREIGN KEY (tech_data)
      REFERENCES tst.tech_data (id_ti) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE tst.clients
(
  id integer NOT NULL,
  full_name text,
  pass_data text,
  address text,
  tel_number integer,
  CONSTRAINT clients_pkey PRIMARY KEY (id)
);

CREATE TABLE tst.color
(
  id serial NOT NULL,
  tone text,
  CONSTRAINT color_pkey PRIMARY KEY (id)
);

CREATE TABLE tst.country
(
  id serial NOT NULL,
  country text,
  city text,
  CONSTRAINT country_pkey PRIMARY KEY (id)
);

CREATE TABLE tst.mark
(
  id serial NOT NULL,
  name text,
  CONSTRAINT mark_pkey PRIMARY KEY (id)
);

CREATE TABLE tst.realization
(
  id_rlztn serial NOT NULL,
  date date,
  delivery text,
  payment text,
  client integer,
  boat integer,
  CONSTRAINT realization_pkey PRIMARY KEY (id_rlztn),
  CONSTRAINT realization_boat_fkey FOREIGN KEY (boat)
      REFERENCES tst.boat (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT realization_client_fkey FOREIGN KEY (client)
      REFERENCES tst.clients (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE tst.ti
(
  id integer NOT NULL,
  length integer,
  type_shell integer,
  crew integer,
  number_bay integer,
  number_rocket integer,
  CONSTRAINT ti_pkey PRIMARY KEY (id)
);



Select tst.selling('{"mark":"Королева"}');