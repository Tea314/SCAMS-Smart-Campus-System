--
-- PostgreSQL database dump
--

\restrict t0OgcADhevLHfzeFYJxcTA57vCf1KfBOK4ATzmMDy3PArIespziaFhO5gvWLNOH

-- Dumped from database version 17.7 (Debian 17.7-3.pgdg13+1)
-- Dumped by pg_dump version 17.7 (Debian 17.7-3.pgdg13+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO your_user;

--
-- Name: buildings; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.buildings (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.buildings OWNER TO your_user;

--
-- Name: buildings_id_seq; Type: SEQUENCE; Schema: public; Owner: your_user
--

CREATE SEQUENCE public.buildings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buildings_id_seq OWNER TO your_user;

--
-- Name: buildings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_user
--

ALTER SEQUENCE public.buildings_id_seq OWNED BY public.buildings.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.devices OWNER TO your_user;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: your_user
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devices_id_seq OWNER TO your_user;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_user
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: room_devices; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.room_devices (
    id integer NOT NULL,
    room_id integer NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.room_devices OWNER TO your_user;

--
-- Name: room_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: your_user
--

CREATE SEQUENCE public.room_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_devices_id_seq OWNER TO your_user;

--
-- Name: room_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_user
--

ALTER SEQUENCE public.room_devices_id_seq OWNED BY public.room_devices.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    floor_number integer NOT NULL,
    building_id integer NOT NULL,
    capacity integer NOT NULL,
    image_url character varying(255)
);


ALTER TABLE public.rooms OWNER TO your_user;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: your_user
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO your_user;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_user
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.schedules (
    id integer NOT NULL,
    room_id integer NOT NULL,
    purpose character varying(512) NOT NULL,
    team_members character varying(1024),
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    lecturer_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.schedules OWNER TO your_user;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: your_user
--

CREATE SEQUENCE public.schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedules_id_seq OWNER TO your_user;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_user
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: your_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role character varying(50) NOT NULL,
    email character varying(512) NOT NULL,
    hashed_password character varying(128) NOT NULL,
    full_name character varying(512) NOT NULL,
    email_hash character varying(64) NOT NULL
);


ALTER TABLE public.users OWNER TO your_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: your_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO your_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: buildings id; Type: DEFAULT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.buildings ALTER COLUMN id SET DEFAULT nextval('public.buildings_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: room_devices id; Type: DEFAULT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.room_devices ALTER COLUMN id SET DEFAULT nextval('public.room_devices_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.alembic_version (version_num) FROM stdin;
bd36a9df27a8
\.


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.buildings (id, name) FROM stdin;
1	A1 - Science Building
2	B5 - General Lecture Hall
3	C3 - Practice Building
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.devices (id, name) FROM stdin;
1	Projector
2	Smart Interactive Board
3	High-Performance PC
4	50-inch Display
\.


--
-- Data for Name: room_devices; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.room_devices (id, room_id, device_id) FROM stdin;
1	1	1
2	1	3
3	2	1
4	2	2
5	2	4
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.rooms (id, name, floor_number, building_id, capacity, image_url) FROM stdin;
1	Lab 101	1	1	25	https://pub-e5b45195a0b9403bbc59b58841ffffd9.r2.dev/lab.png
2	Lecture Room 501	5	2	80	https://pub-e5b45195a0b9403bbc59b58841ffffd9.r2.dev/lecture.png
3	Seminar Room 203	2	1	15	https://pub-e5b45195a0b9403bbc59b58841ffffd9.r2.dev/seminar.png
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.schedules (id, room_id, purpose, team_members, date, start_time, lecturer_id, created_at) FROM stdin;
1	2	AwnVyT_APSEnq3u0I2uPHgnVuf_ioUKfb9w0rmQW19BXix2aYVsBsMCSDsctKIDRe3Sd65k=	\N	2025-12-10	08:00:00	1	2025-12-12 15:57:17.098518
2	1	fjQpmDOdTEWUUo4vt4j3aCGRmIX6SBcSR1smtT4IdqTn7S81Ew-TphLX394vZnY_4C8BeYyp0_Q=	GKFLN5gxNu10_ytIIburOYT7N5q0RPVPNjSU-wxKlp0r1x-AakTpFq4MHf4=	2025-12-10	10:00:00	2	2025-12-12 15:57:17.098518
3	3	YsfpXJr9tDuOj2ZPZ32uOcUjmylGwoyMCvsb3I9P9dITaJKdkB99yw_3RV8F9OVtIA==	qdrAOXwnWHqlQ-bHcBwGHynJW12vI52zTEffmFZzpqyHVou2LQ2DPSCNNGcXcA==	2025-12-11	14:00:00	1	2025-12-12 15:57:17.098518
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: your_user
--

COPY public.users (id, role, email, hashed_password, full_name, email_hash) FROM stdin;
1	lecturer	qNWurB3uT07lx_MRMEyYSv9wczO9Ctk_ed4xZLMaIKXHbF8s9bn9N3AJFYom-gBbuu0=	$2b$12$FiuPUoWUvfQtUYRFa4DWa.wg1kKLKeZ.igKRJwjpI/zUf94e11hy.	5JJMpVntsnWzOTTjkz6abmhEoz8QMRWHJzAkRJiXDBEcN8pw2HHPQXmL6_o=	8ddbba309d9a3c1fdc7f2ffd2c69ad1c09589b54234aa82e2cf63baea5461856
2	lecturer	Ik4EKfWV8GgAnOpiIo1Ec7iPmWEwI6GFBu7yZB4MS8pzQQEHLywGpDDv0A6U83IZ	$2b$12$PW14LxslU95lA3oZodwvQOq65KbF1RxHxUOnbQd1YNWMVv9ZNt0uW	UmN8y-U2bRCR9aIsOA6ntjcucF-ZX2hgYPL2aYxTZKvY5aeMwyWuKw==	31531d1fa46797260448a182483ef19391025b4ff3521cef83ecc9f7b1a2c151
3	student	LCBuThfRZDC_j-vSodpW8Mz06w4TfWECoegqu4a5uvE2nxOr6KjdrhbE-_eSj6uGdH9w	$2b$12$BKvLn.uUsOVEsbZREA2lrO7eDc5Ovyuqph95Kvy1BWbH1CyVPPnF6	zurpM24MjnGvkx7ucq1kgcSMZAC2AzLi1ckfSC5YN3wvvaZjApQg6is2t_A=	2f1bc6d09b145267f45f8a1328ef60c5bc880c11ec1f4e1e1b71d0fa280c48ea
\.


--
-- Name: buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: your_user
--

SELECT pg_catalog.setval('public.buildings_id_seq', 3, true);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: your_user
--

SELECT pg_catalog.setval('public.devices_id_seq', 4, true);


--
-- Name: room_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: your_user
--

SELECT pg_catalog.setval('public.room_devices_id_seq', 5, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: your_user
--

SELECT pg_catalog.setval('public.rooms_id_seq', 3, true);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: your_user
--

SELECT pg_catalog.setval('public.schedules_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: your_user
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: room_devices room_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.room_devices
    ADD CONSTRAINT room_devices_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_buildings_id; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_buildings_id ON public.buildings USING btree (id);


--
-- Name: ix_buildings_name; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_buildings_name ON public.buildings USING btree (name);


--
-- Name: ix_devices_id; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_devices_id ON public.devices USING btree (id);


--
-- Name: ix_devices_name; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_devices_name ON public.devices USING btree (name);


--
-- Name: ix_room_devices_id; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_room_devices_id ON public.room_devices USING btree (id);


--
-- Name: ix_rooms_id; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_rooms_id ON public.rooms USING btree (id);


--
-- Name: ix_rooms_name; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_rooms_name ON public.rooms USING btree (name);


--
-- Name: ix_schedules_id; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_schedules_id ON public.schedules USING btree (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_email_hash; Type: INDEX; Schema: public; Owner: your_user
--

CREATE UNIQUE INDEX ix_users_email_hash ON public.users USING btree (email_hash);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: your_user
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: room_devices room_devices_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.room_devices
    ADD CONSTRAINT room_devices_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- Name: room_devices room_devices_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.room_devices
    ADD CONSTRAINT room_devices_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- Name: rooms rooms_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.buildings(id);


--
-- Name: schedules schedules_lecturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.users(id);


--
-- Name: schedules schedules_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_user
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- PostgreSQL database dump complete
--

\unrestrict t0OgcADhevLHfzeFYJxcTA57vCf1KfBOK4ATzmMDy3PArIespziaFhO5gvWLNOH

