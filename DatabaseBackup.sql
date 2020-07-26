--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

-- Started on 2020-07-26 15:49:46 PKT

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
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

--
-- TOC entry 199 (class 1259 OID 28519)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(25),
    country_detail character varying(250),
    time_stamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 28517)
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_country_id_seq OWNER TO postgres;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 198
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;


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
-- TOC entry 2282 (class 0 OID 0)
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
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 188
-- Name: medicines_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicines_medicine_id_seq OWNED BY public.medicines.medicine_id;


--
-- TOC entry 201 (class 1259 OID 28530)
-- Name: product_eligibility_criteria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_eligibility_criteria (
    condition_id integer NOT NULL,
    condition_name character varying,
    condition_answer character varying,
    time_stamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.product_eligibility_criteria OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 28528)
-- Name: product_eligibility_criteria_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_eligibility_criteria_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_eligibility_criteria_condition_id_seq OWNER TO postgres;

--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 200
-- Name: product_eligibility_criteria_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_eligibility_criteria_condition_id_seq OWNED BY public.product_eligibility_criteria.condition_id;


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
-- TOC entry 2285 (class 0 OID 0)
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
-- TOC entry 2286 (class 0 OID 0)
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
-- TOC entry 2287 (class 0 OID 0)
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
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 2110 (class 2604 OID 28522)
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 28381)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 28372)
-- Name: medicines medicine_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines ALTER COLUMN medicine_id SET DEFAULT nextval('public.medicines_medicine_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 28533)
-- Name: product_eligibility_criteria condition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_eligibility_criteria ALTER COLUMN condition_id SET DEFAULT nextval('public.product_eligibility_criteria_condition_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 28409)
-- Name: purchase_invoice purchase_invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_invoice ALTER COLUMN purchase_invoice_id SET DEFAULT nextval('public.purchase_invoice_purchase_invoice_id_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 28418)
-- Name: sale_invoice sale_invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_invoice ALTER COLUMN sale_invoice_id SET DEFAULT nextval('public.sale_invoice_sale_invoice_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 28397)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 28349)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2272 (class 0 OID 28519)
-- Dependencies: 199
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, country_detail, time_stamp) FROM stdin;
1	abc	\N	2020-07-07 16:16:07.40218
\.


--
-- TOC entry 2264 (class 0 OID 28378)
-- Dependencies: 191
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, firstname, lastname, email, phone_number, purpose_of_usage, created_at) FROM stdin;
\.


--
-- TOC entry 2262 (class 0 OID 28369)
-- Dependencies: 189
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicines (medicine_id, medicine_name, brand_name, expiry, quantity, price, created_at, updated_at) FROM stdin;
1	pain killer	abc	2022-12-12 00:00:00	22	220	2020-07-15 18:58:01.095648	\N
2	pain killer	abc	2022-12-12 00:00:00	22	220	2020-07-15 18:58:57.387234	\N
3	pain killer	abc	2022-12-12 00:00:00	22	220	2020-07-15 18:59:36.639127	\N
4	pain killer	abc	2022-12-12 00:00:00	22	220	2020-07-15 19:00:19.924738	\N
5	pain killer	abc	2022-12-12 00:00:00	22	220	2020-07-26 11:59:06.651171	\N
\.


--
-- TOC entry 2274 (class 0 OID 28530)
-- Dependencies: 201
-- Data for Name: product_eligibility_criteria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_eligibility_criteria (condition_id, condition_name, condition_answer, time_stamp) FROM stdin;
1	Abc	\N	2020-07-07 16:20:32.126356
2	asd	\N	2020-07-07 16:21:32.814033
3	Abc	a	2020-07-07 16:21:47.095727
\.


--
-- TOC entry 2268 (class 0 OID 28406)
-- Dependencies: 195
-- Data for Name: purchase_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_invoice (purchase_invoice_id, totalamount, paymenttype, discount, payedamount, date) FROM stdin;
\.


--
-- TOC entry 2270 (class 0 OID 28415)
-- Dependencies: 197
-- Data for Name: sale_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_invoice (sale_invoice_id, totalamount, paymenttype, discount, payedamount, date) FROM stdin;
\.


--
-- TOC entry 2266 (class 0 OID 28394)
-- Dependencies: 193
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, compnyname, email, phone_number, address, created_at) FROM stdin;
\.


--
-- TOC entry 2259 (class 0 OID 28342)
-- Dependencies: 186
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password, is_enable, time_stamp) FROM stdin;
4	Admin	admin@pharmacy.com	$2a$10$QBceW.UUuLHFmMZPucW5fenNMzuK.yVDUGxxZ/KSelWUG7MuhshyW	t	2020-07-26 10:55:32.420785
\.


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 198
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 3, true);


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 190
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 188
-- Name: medicines_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicines_medicine_id_seq', 5, true);


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 200
-- Name: product_eligibility_criteria_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_eligibility_criteria_condition_id_seq', 3, true);


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 194
-- Name: purchase_invoice_purchase_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_invoice_purchase_invoice_id_seq', 1, false);


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 196
-- Name: sale_invoice_sale_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_invoice_sale_invoice_id_seq', 1, false);


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 192
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 1, false);


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- TOC entry 2135 (class 2606 OID 28525)
-- Name: countries countries_country_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_id_pkey PRIMARY KEY (country_id);


--
-- TOC entry 2123 (class 2606 OID 28387)
-- Name: customers customers_customer_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customer_id_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2121 (class 2606 OID 28375)
-- Name: medicines medicines_medicine_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_medicine_id_pkey PRIMARY KEY (medicine_id);


--
-- TOC entry 2139 (class 2606 OID 28539)
-- Name: product_eligibility_criteria products_eligibility_criteria_condition_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_eligibility_criteria
    ADD CONSTRAINT products_eligibility_criteria_condition_id_pkey PRIMARY KEY (condition_id);


--
-- TOC entry 2131 (class 2606 OID 28412)
-- Name: purchase_invoice purchase_invoice_supplier_purchase_invoice_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_invoice
    ADD CONSTRAINT purchase_invoice_supplier_purchase_invoice_id_pkey PRIMARY KEY (purchase_invoice_id);


--
-- TOC entry 2133 (class 2606 OID 28421)
-- Name: sale_invoice sale_invoice_supplier_sale_invoice_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_invoice
    ADD CONSTRAINT sale_invoice_supplier_sale_invoice_id_pkey PRIMARY KEY (sale_invoice_id);


--
-- TOC entry 2129 (class 2606 OID 28403)
-- Name: suppliers suppliers_supplier_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_supplier_id_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 2137 (class 2606 OID 28527)
-- Name: countries unique_countries_country_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT unique_countries_country_name UNIQUE (country_name);


--
-- TOC entry 2125 (class 2606 OID 28389)
-- Name: customers unique_customers_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT unique_customers_email UNIQUE (email);


--
-- TOC entry 2141 (class 2606 OID 28541)
-- Name: product_eligibility_criteria unique_product_eligibility_criteria_condition_name_condition_an; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_eligibility_criteria
    ADD CONSTRAINT unique_product_eligibility_criteria_condition_name_condition_an UNIQUE (condition_name, condition_answer);


--
-- TOC entry 2127 (class 2606 OID 28391)
-- Name: customers unique_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT unique_users_email UNIQUE (phone_number);


--
-- TOC entry 2115 (class 2606 OID 28351)
-- Name: users uniqueuseremail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniqueuseremail UNIQUE (email);


--
-- TOC entry 2117 (class 2606 OID 28353)
-- Name: users uniqueusername; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniqueusername UNIQUE (username);


--
-- TOC entry 2119 (class 2606 OID 28355)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


-- Completed on 2020-07-26 15:49:46 PKT

--
-- PostgreSQL database dump complete
--

