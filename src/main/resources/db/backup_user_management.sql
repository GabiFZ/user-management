--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2026-01-25 00:42:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 218 (class 1259 OID 25708)
-- Name: seq_address; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_address
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_address OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 25709)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id bigint DEFAULT nextval('public.seq_address'::regclass) NOT NULL,
    country character varying(45) NOT NULL,
    city character varying(45) NOT NULL,
    door_number character varying(10) NOT NULL,
    additional_details character varying(65)
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25715)
-- Name: seq_app_user; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_app_user
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_app_user OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25716)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    user_id bigint DEFAULT nextval('public.seq_app_user'::regclass) NOT NULL,
    fk_role bigint DEFAULT 1 NOT NULL,
    fk_address bigint,
    firstname character varying(65),
    lastname character varying(65),
    username character varying(45) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(65) NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    date_added timestamp without time zone DEFAULT (now())::timestamp without time zone NOT NULL
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25772)
-- Name: seq_course; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_course
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_course OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25773)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id bigint DEFAULT nextval('public.seq_course'::regclass) NOT NULL,
    course_name character varying(65) NOT NULL,
    fk_course_category bigint NOT NULL
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25763)
-- Name: seq_course_category; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_course_category
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_course_category OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25764)
-- Name: course_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_category (
    course_category_id bigint DEFAULT nextval('public.seq_course_category'::regclass) NOT NULL,
    course_category_name character varying(65) NOT NULL
);


ALTER TABLE public.course_category OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25700)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id bigint NOT NULL,
    role_name character varying(45) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 4837 (class 0 OID 25709)
-- Dependencies: 219
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, country, city, door_number, additional_details) FROM stdin;
5	UAE	Dubai	1001	Luxury Living
6	Italy	Tuscany	13	Vineyard View
7	Netherlands	Amsterdam	33	Canal View
8	USA	Miami	456	Oceanfront
9	France	French Alps	7	Ski In/Out
\.


--
-- TOC entry 4839 (class 0 OID 25716)
-- Dependencies: 221
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (user_id, fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added) FROM stdin;
8	1	5	Ryan	Garcia	ryangarcia	passwordabc	ryan.garcia@example.com	f	2026-01-09 10:38:20.171121
9	3	\N	Gabi	Ion	Gabi2005	$2a$10$ls59iekZoEyszbC3XRqoB.vyvsM8oV2n.YJxb5g8bVthF4C5Xkhw2	gabi.ion@outlook.com	t	2026-01-09 10:38:20.185697
12	1	\N	Ana	Maria	ana123	$2a$10$vZkD1LbX/6gf.nFVDDtUOuPq9qV9FsumcUN0fymLUt1L8a4/AJepe	ana@email.com	t	2026-01-10 14:48:09.945555
13	1	\N	Maria	Ioana	Maria123	$2a$10$HAbiGz39.430qEnHLU1snO9Jb5nRAx6hZ8vnbJ7xowuFAPWoo2b4.	maria@email.ro	t	2026-01-24 19:56:42.858455
\.


--
-- TOC entry 4843 (class 0 OID 25773)
-- Dependencies: 225
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, course_name, fk_course_category) FROM stdin;
1	Java Masterclass	1
2	Spring Boot 3 for Advanced	1
3	Intermediate Chinese	3
4	Public Speaking	2
5	Marketing Research	2
6	Git and Github	1
7	HTML and CSS	1
8	Beginning French	3
9	SEO Strategies	2
10	JavaScript with Angular	1
11	C++ Masterclass	1
12	Advanced French	3
\.


--
-- TOC entry 4841 (class 0 OID 25764)
-- Dependencies: 223
-- Data for Name: course_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_category (course_category_id, course_category_name) FROM stdin;
1	PROGRAMMING
2	BUSINESS
3	FOREIGN LANGUAGES
\.


--
-- TOC entry 4835 (class 0 OID 25700)
-- Dependencies: 217
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, role_name) FROM stdin;
1	USER
2	VISITOR
3	ADMIN
\.


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 218
-- Name: seq_address; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_address', 9, true);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 220
-- Name: seq_app_user; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_app_user', 13, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 224
-- Name: seq_course; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_course', 12, true);


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 222
-- Name: seq_course_category; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_course_category', 3, true);


--
-- TOC entry 4672 (class 2606 OID 25714)
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- TOC entry 4674 (class 2606 OID 25730)
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- TOC entry 4676 (class 2606 OID 25726)
-- Name: app_user app_user_fk_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_fk_address_key UNIQUE (fk_address);


--
-- TOC entry 4678 (class 2606 OID 25724)
-- Name: app_user app_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pk PRIMARY KEY (user_id);


--
-- TOC entry 4680 (class 2606 OID 25728)
-- Name: app_user app_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_username_key UNIQUE (username);


--
-- TOC entry 4682 (class 2606 OID 25771)
-- Name: course_category course_category_course_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category
    ADD CONSTRAINT course_category_course_category_name_key UNIQUE (course_category_name);


--
-- TOC entry 4684 (class 2606 OID 25769)
-- Name: course_category course_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category
    ADD CONSTRAINT course_category_pk PRIMARY KEY (course_category_id);


--
-- TOC entry 4686 (class 2606 OID 25778)
-- Name: course course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pk PRIMARY KEY (course_id);


--
-- TOC entry 4668 (class 2606 OID 25704)
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (role_id);


--
-- TOC entry 4670 (class 2606 OID 25706)
-- Name: role role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_role_name_key UNIQUE (role_name);


--
-- TOC entry 4687 (class 2606 OID 25736)
-- Name: app_user app_user_fk_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_fk_address FOREIGN KEY (fk_address) REFERENCES public.address(id);


--
-- TOC entry 4688 (class 2606 OID 25731)
-- Name: app_user app_user_fk_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_fk_role FOREIGN KEY (fk_role) REFERENCES public.role(role_id);


--
-- TOC entry 4689 (class 2606 OID 25779)
-- Name: course course_fk_course_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_fk_course_category FOREIGN KEY (fk_course_category) REFERENCES public.course_category(course_category_id);


-- Completed on 2026-01-25 00:42:39

--
-- PostgreSQL database dump complete
--

