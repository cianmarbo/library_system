--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Accounts; Type: TABLE; Schema: public; Owner: cianmarbo
--

CREATE TABLE public."Accounts" (
    id integer NOT NULL,
    username text DEFAULT 'username'::text NOT NULL,
    password text DEFAULT 'password'::text NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public."Accounts" OWNER TO cianmarbo;

--
-- Name: Accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: cianmarbo
--

ALTER TABLE public."Accounts" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Accounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Books; Type: TABLE; Schema: public; Owner: cianmarbo
--

CREATE TABLE public."Books" (
    id integer NOT NULL,
    title text,
    isbn text,
    author text,
    genre text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public."Books" OWNER TO cianmarbo;

--
-- Name: Books_id_seq; Type: SEQUENCE; Schema: public; Owner: cianmarbo
--

ALTER TABLE public."Books" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Books_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Accounts; Type: TABLE DATA; Schema: public; Owner: cianmarbo
--

COPY public."Accounts" (id, username, password, "createdAt", "updatedAt") FROM stdin;
1	cian	password123	2023-08-23 00:00:00+01	2023-08-23 00:00:00+01
2	billy	billybob123	2023-08-23 00:00:00+01	2023-08-23 00:00:00+01
\.


--
-- Data for Name: Books; Type: TABLE DATA; Schema: public; Owner: cianmarbo
--

COPY public."Books" (id, title, isbn, author, genre, "createdAt", "updatedAt", status) FROM stdin;
9	TCP/IP Illustrated: Volume 1	978-0201633467	Richard Stevens	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
12	American Prometheus	978-0375412028	Kai Bird and Martin J. Sherwin	Factual	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
8	Linux Kernel Networking	978-143026196455999	Rami Rosen	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
18	Inside the Machine	978-1593276683	Jon Stokes	Information Technology	2023-08-09 00:00:00+01	2023-08-09 00:00:00+01	1
2	Nineteen Eighty Four	978-0140817744	George Orwell	Fiction	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
1	2001: A Space Odyssey	978-0090898305	Arthur C. Clarke	Science Fiction	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
3	Game Engine Black Book: Wolfenstein 3D	978-1727646702	Fabien Sanglard	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
4	Game Engine Black Book: DOOM	979-8362469443	Fabien Sanglard	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
14	The Linux Programming Interface	978-1593272203	Michael Kerrisk	Information Technology	2023-08-09 00:00:00+01	2023-08-09 00:00:00+01	1
7	Programming PHP (4th Edition)	978-1492054139	Kevin Tatroe and Peter MacIntyre	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
13	Normal People	978-0571334650	Sally Rooney	Fiction	2023-08-09 00:00:00+01	2023-08-09 00:00:00+01	1
5	Real-Time Rendering (Fourth Edition)	978-1138627000	Multiple Authors	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
6	Computer Systems	978-9780131784567	Randal E. Bryant and David O'Hallaron	Information Technology	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
10	The Hitchhiker's Guide to the Galaxy	978-0330508537	Douglas Adams	Science Fiction	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
11	3001: The Final Odyssey	978-0345315229	Arthur C. Clarke	Science Fiction	2023-09-08 00:00:00+01	2023-09-08 00:00:00+01	1
\.


--
-- Name: Accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cianmarbo
--

SELECT pg_catalog.setval('public."Accounts_id_seq"', 2, true);


--
-- Name: Books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cianmarbo
--

SELECT pg_catalog.setval('public."Books_id_seq"', 18, true);


--
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: cianmarbo
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);


--
-- Name: Books Books_pkey; Type: CONSTRAINT; Schema: public; Owner: cianmarbo
--

ALTER TABLE ONLY public."Books"
    ADD CONSTRAINT "Books_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

