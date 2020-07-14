--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

-- Started on 2020-07-05 15:54:45 PKT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 28356)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

--
-- TOC entry 191 (class 1259 OID 28378)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100),
    email character varying,
    phone_number character varying(45),
    purpose_of_usage character varying(250),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 28376)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 190
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 189 (class 1259 OID 28369)
-- Name: medicines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicines (
    medicine_id integer NOT NULL,
    medicine_name character varying(100),
    brand_name character varying(100),
    expiry timestamp without time zone,
    quantity integer,
    price integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


ALTER TABLE public.medicines OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 28367)
-- Name: medicines_medicine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicines_medicine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicines_medicine_id_seq OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 188
-- Name: medicines_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicines_medicine_id_seq OWNED BY public.medicines.medicine_id;


--
-- TOC entry 195 (class 1259 OID 28406)
-- Name: purchase_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_invoice (
    purchase_invoice_id integer NOT NULL,
    totalamount integer,
    paymenttype character varying(45),
    discount integer,
    payedamount integer,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.purchase_invoice OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 28404)
-- Name: purchase_invoice_purchase_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_invoice_purchase_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_invoice_purchase_invoice_id_seq OWNER TO postgres;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 194
-- Name: purchase_invoice_purchase_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_invoice_purchase_invoice_id_seq OWNED BY public.purchase_invoice.purchase_invoice_id;


--
-- TOC entry 197 (class 1259 OID 28415)
-- Name: sale_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_invoice (
    sale_invoice_id integer NOT NULL,
    totalamount integer,
    paymenttype character varying(45),
    discount integer,
    payedamount integer,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sale_invoice OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 28413)
-- Name: sale_invoice_sale_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_invoice_sale_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_invoice_sale_invoice_id_seq OWNER TO postgres;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 196
-- Name: sale_invoice_sale_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_invoice_sale_invoice_id_seq OWNED BY public.sale_invoice.sale_invoice_id;


--
-- TOC entry 193 (class 1259 OID 28394)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    compnyname character varying(100),
    email character varying,
    phone_number character varying(45),
    address character varying(100),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 28392)
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 192
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;


--
-- TOC entry 186 (class 1259 OID 28342)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(150),
    email character varying(150),
    password character varying(60),
    is_enable boolean DEFAULT false,
    time_stamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 28347)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 2089 (class 2604 OID 28381)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 28372)
-- Name: medicines medicine_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines ALTER COLUMN medicine_id SET DEFAULT nextval('public.medicines_medicine_id_seq'::regclass);


--
-- TOC entry 2093 (class 2604 OID 28409)
-- Name: purchase_invoice purchase_invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_invoice ALTER COLUMN purchase_invoice_id SET DEFAULT nextval('public.purchase_invoice_purchase_invoice_id_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 28418)
-- Name: sale_invoice sale_invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_invoice ALTER COLUMN sale_invoice_id SET DEFAULT nextval('public.sale_invoice_sale_invoice_id_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 28397)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 28349)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2239 (class 0 OID 28378)
-- Dependencies: 191
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, firstname, lastname, email, phone_number, purpose_of_usage, created_at) FROM stdin;
\.


--
-- TOC entry 2237 (class 0 OID 28369)
-- Dependencies: 189
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicines (medicine_id, medicine_name, brand_name, expiry, quantity, price, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2243 (class 0 OID 28406)
-- Dependencies: 195
-- Data for Name: purchase_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_invoice (purchase_invoice_id, totalamount, paymenttype, discount, payedamount, date) FROM stdin;
\.


--
-- TOC entry 2245 (class 0 OID 28415)
-- Dependencies: 197
-- Data for Name: sale_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_invoice (sale_invoice_id, totalamount, paymenttype, discount, payedamount, date) FROM stdin;
\.


--
-- TOC entry 2241 (class 0 OID 28394)
-- Dependencies: 193
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, compnyname, email, phone_number, address, created_at) FROM stdin;
\.


--
-- TOC entry 2234 (class 0 OID 28342)
-- Dependencies: 186
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password, is_enable, time_stamp) FROM stdin;
1	Admin	admin@pharmacy.com	$2a$10$qfgOqqihdlEoAk6ua5O5meahi1P82Sx2zz61USg9soJtmsnivwfOu	t	2020-04-16 21:11:34.101524
\.


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 190
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 188
-- Name: medicines_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicines_medicine_id_seq', 1, false);


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 194
-- Name: purchase_invoice_purchase_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_invoice_purchase_invoice_id_seq', 1, false);


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 196
-- Name: sale_invoice_sale_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_invoice_sale_invoice_id_seq', 1, false);


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 192
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 1, false);


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- TOC entry 2106 (class 2606 OID 28387)
-- Name: customers customers_customer_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customer_id_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2104 (class 2606 OID 28375)
-- Name: medicines medicines_medicine_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_medicine_id_pkey PRIMARY KEY (medicine_id);


--
-- TOC entry 2114 (class 2606 OID 28412)
-- Name: purchase_invoice purchase_invoice_supplier_purchase_invoice_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_invoice
    ADD CONSTRAINT purchase_invoice_supplier_purchase_invoice_id_pkey PRIMARY KEY (purchase_invoice_id);


--
-- TOC entry 2116 (class 2606 OID 28421)
-- Name: sale_invoice sale_invoice_supplier_sale_invoice_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_invoice
    ADD CONSTRAINT sale_invoice_supplier_sale_invoice_id_pkey PRIMARY KEY (sale_invoice_id);


--
-- TOC entry 2112 (class 2606 OID 28403)
-- Name: suppliers suppliers_supplier_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_supplier_id_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 2108 (class 2606 OID 28389)
-- Name: customers unique_customers_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT unique_customers_email UNIQUE (email);


--
-- TOC entry 2110 (class 2606 OID 28391)
-- Name: customers unique_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT unique_users_email UNIQUE (phone_number);


--
-- TOC entry 2098 (class 2606 OID 28351)
-- Name: users uniqueuseremail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniqueuseremail UNIQUE (email);


--
-- TOC entry 2100 (class 2606 OID 28353)
-- Name: users uniqueusername; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniqueusername UNIQUE (username);


--
-- TOC entry 2102 (class 2606 OID 28355)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


-- Completed on 2020-07-05 15:54:45 PKT

--
-- PostgreSQL database dump complete
--

