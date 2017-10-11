SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    storenum character varying(25) DEFAULT ''::character varying NOT NULL,
    address character varying(100) DEFAULT ''::character varying NOT NULL,
    suite character varying(100) DEFAULT ''::character varying NOT NULL,
    city character varying(100) DEFAULT ''::character varying NOT NULL,
    state_code character varying(2) DEFAULT ''::character varying NOT NULL,
    zip character varying(25) DEFAULT ''::character varying NOT NULL,
    email character varying(100) DEFAULT ''::character varying NOT NULL,
    phone character varying(25) DEFAULT ''::character varying NOT NULL,
    contact_type bigint DEFAULT 0 NOT NULL,
    billto_id integer DEFAULT 0 NOT NULL,
    rep_id integer DEFAULT 0 NOT NULL,
    id_cs integer DEFAULT 0 NOT NULL
);


--
-- Name: TABLE contact; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE contact IS 'Stores Company, Customers, Reps, etc.  ';


--
-- Name: COLUMN contact.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN contact.id IS 'This is the Renee''s Garden id number.  The Cornucopia id number is in id_CS in case of confilicts between RG and CS';


--
-- Name: COLUMN contact.contact_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN contact.contact_type IS 'bitmap value for info about customer type, i.e. rep, company, customer, active, inactive, etc.';


--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    qty_order integer NOT NULL,
    qty_ship integer NOT NULL,
    cost numeric(18,2) NOT NULL,
    retail numeric(18,2) NOT NULL
);


--
-- Name: order_shipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_shipment (
    id integer NOT NULL,
    order_id integer NOT NULL,
    ship_date date NOT NULL,
    tracking_number character varying(50) NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE orders (
    id integer NOT NULL,
    ponum character varying(25) DEFAULT ''::character varying NOT NULL,
    order_date date DEFAULT ('now'::text)::date NOT NULL,
    request_ship_date date DEFAULT ('now'::text)::date NOT NULL,
    invoice_date date,
    total numeric(18,2) DEFAULT 0.0 NOT NULL,
    note text,
    contact_id integer NOT NULL,
    seed_year integer DEFAULT 0 NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    product_type_id integer NOT NULL,
    upc character varying DEFAULT ''::character varying NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    product_type_value integer DEFAULT 1 NOT NULL
);


--
-- Name: COLUMN product.product_type_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN product.product_type_id IS 'equates to packet_type in RG firebird database';


--
-- Name: COLUMN product.product_type_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN product.product_type_value IS 'bitwise value for product - i.e. packet, veg, flower, herb, etc.';


--
-- Name: product_price; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product_price (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    billto_id integer NOT NULL,
    retail numeric(18,2) NOT NULL,
    cost numeric(18,2) NOT NULL,
    seed_year integer NOT NULL
);


--
-- Name: product_price_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_price_id_seq OWNED BY product_price.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying DEFAULT ''::character varying NOT NULL,
    last_name character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: product_price id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_price ALTER COLUMN id SET DEFAULT nextval('product_price_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: order_shipment order_shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_shipment
    ADD CONSTRAINT order_shipment_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_price product_price_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT product_price_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_first_name ON users USING btree (first_name);


--
-- Name: index_users_on_last_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_last_name ON users USING btree (last_name);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: orders fk_contact; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_contact FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item fk_orders; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_orders FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item fk_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_shipment order_shipment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_shipment
    ADD CONSTRAINT order_shipment_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_price product_price_billto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT product_price_billto_id_fkey FOREIGN KEY (billto_id) REFERENCES contact(id);


--
-- Name: product_price product_price_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT product_price_product_id_fkey FOREIGN KEY (product_id) REFERENCES product(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('0'),
('20171010225242'),
('20171011220452');


