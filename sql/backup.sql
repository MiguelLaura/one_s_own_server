--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: autohebergement; Type: TABLE; Schema: public; Owner: laura
--

CREATE TABLE public.autohebergement (
    num_aspect integer NOT NULL,
    aspect character varying NOT NULL,
    pos boolean
);


ALTER TABLE public.autohebergement OWNER TO laura;

--
-- Name: commande; Type: TABLE; Schema: public; Owner: laura
--

CREATE TABLE public.commande (
    nom character varying NOT NULL,
    descr character varying,
    "position" integer NOT NULL
);


ALTER TABLE public.commande OWNER TO laura;

--
-- Name: conseil; Type: TABLE; Schema: public; Owner: laura
--

CREATE TABLE public.conseil (
    num_conseil integer NOT NULL,
    descr character varying NOT NULL
);


ALTER TABLE public.conseil OWNER TO laura;

--
-- Name: eleve; Type: TABLE; Schema: public; Owner: laura
--

CREATE TABLE public.eleve (
    num integer NOT NULL,
    nom character varying NOT NULL,
    prenom character varying,
    date_naissance date,
    inst character varying
);


ALTER TABLE public.eleve OWNER TO laura;

--
-- Name: instrument; Type: TABLE; Schema: public; Owner: laura
--

CREATE TABLE public.instrument (
    lib character varying NOT NULL,
    lib_long character varying
);


ALTER TABLE public.instrument OWNER TO laura;

--
-- Name: ticket; Type: TABLE; Schema: public; Owner: laura
--

CREATE TABLE public.ticket (
    nom_film character varying(24) NOT NULL,
    num_salle integer,
    prix real,
    date_projection date,
    horaire_projection time without time zone
);


ALTER TABLE public.ticket OWNER TO laura;

--
-- Data for Name: autohebergement; Type: TABLE DATA; Schema: public; Owner: laura
--

COPY public.autohebergement (num_aspect, aspect, pos) FROM stdin;
1	Les données restent chez vous	t
2	Ça prend du temps	f
3	Vous gardez le contrôle de vos fichiers	t
4	Vous vous chargez vous-même de la sécurité	f
5	Votre vie privée est respectée	t
6	Il faut vouloir apprendre	f
7	Vous avez des services qui répondent exactement à vos besoins	t
8	C'est à nous de régler les problèmes rencontrés	f
9	Vous choisissez le matériel utilisé (par exemple, à faible consommation électrique)	t
10	C'est gratifiant de savoir faire soi-même	t
\.


--
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: laura
--

COPY public.commande (nom, descr, "position") FROM stdin;
cd	Permet de changer de répertoire	1
ls	Permet de voir le contenu d'un répertoire	2
touch	Permet de créer un fichier	3
mv	Permet de déplacer un ou des fichiers ou répertoires	4
cat	Permet de lire un fichier	5
pwd	Permet de savoir où on est	6
mkdir	Permet de créer un répertoire	7
rm	Permet de supprimer un fichier	8
cp	Permet de copier un fichier	9
man	Permet de consulter le manuel	10
\.


--
-- Data for Name: conseil; Type: TABLE DATA; Schema: public; Owner: laura
--

COPY public.conseil (num_conseil, descr) FROM stdin;
1	Apprendre des autres
2	Internet ets votre ami
3	Prenez votre temps
4	Ne pas se décourager
5	Utiliser des clés ssh
6	Bloquer l'accès à root par internet
7	Pensez à la sécurité de ce que vous faites
8	Utiliser Docker
9	Bien séparer les choses
10	Y aller par étape
\.


--
-- Data for Name: eleve; Type: TABLE DATA; Schema: public; Owner: laura
--

COPY public.eleve (num, nom, prenom, date_naissance, inst) FROM stdin;
1	Jimmy	\N	\N	Guitare
2	Robby	\N	\N	Guitare
\.


--
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: laura
--

COPY public.instrument (lib, lib_long) FROM stdin;
Violon	\N
Guitare	\N
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: laura
--

COPY public.ticket (nom_film, num_salle, prix, date_projection, horaire_projection) FROM stdin;
I Origins	12	7.9	2020-03-20	13:37:00
Drive	47	8.9	2020-08-15	13:45:00
Mr Nobody	12	16.9	2020-05-04	07:20:00
\.


--
-- Name: autohebergement autohebergement_pkey; Type: CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.autohebergement
    ADD CONSTRAINT autohebergement_pkey PRIMARY KEY (num_aspect);


--
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (nom);


--
-- Name: conseil conseil_pkey; Type: CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.conseil
    ADD CONSTRAINT conseil_pkey PRIMARY KEY (num_conseil);


--
-- Name: eleve eleve_pkey; Type: CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_pkey PRIMARY KEY (num);


--
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (lib);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (nom_film);


--
-- Name: eleve eleve_inst_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laura
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_inst_fkey FOREIGN KEY (inst) REFERENCES public.instrument(lib);


--
-- PostgreSQL database dump complete
--

