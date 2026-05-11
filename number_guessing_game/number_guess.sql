--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    total_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10);
INSERT INTO public.games VALUES (1, 20);
INSERT INTO public.games VALUES (1, 15);
INSERT INTO public.games VALUES (11, 354);
INSERT INTO public.games VALUES (11, 206);
INSERT INTO public.games VALUES (14, 570);
INSERT INTO public.games VALUES (13, 323);
INSERT INTO public.games VALUES (16, 864);
INSERT INTO public.games VALUES (1, 9);
INSERT INTO public.games VALUES (12, 25);
INSERT INTO public.games VALUES (11, 440);
INSERT INTO public.games VALUES (14, 655);
INSERT INTO public.games VALUES (15, 505);
INSERT INTO public.games VALUES (15, 775);
INSERT INTO public.games VALUES (1, 10);
INSERT INTO public.games VALUES (12, 196);
INSERT INTO public.games VALUES (13, 200);
INSERT INTO public.games VALUES (13, 57);
INSERT INTO public.games VALUES (15, 648);
INSERT INTO public.games VALUES (15, 988);
INSERT INTO public.games VALUES (11, 626);
INSERT INTO public.games VALUES (11, 251);
INSERT INTO public.games VALUES (13, 195);
INSERT INTO public.games VALUES (13, 340);
INSERT INTO public.games VALUES (16, 415);
INSERT INTO public.games VALUES (15, 72);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (1, 13);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 10);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Test');
INSERT INTO public.users VALUES (2, 'user_1778499802931');
INSERT INTO public.users VALUES (3, 'user_1778499802930');
INSERT INTO public.users VALUES (4, 'user_1778500090827');
INSERT INTO public.users VALUES (5, 'user_1778500090826');
INSERT INTO public.users VALUES (6, 'user_1778501055642');
INSERT INTO public.users VALUES (7, 'user_1778501055641');
INSERT INTO public.users VALUES (8, 'New user');
INSERT INTO public.users VALUES (9, 'user_1778501853809');
INSERT INTO public.users VALUES (10, 'user_1778501853808');
INSERT INTO public.users VALUES (11, 'user_1778502289817');
INSERT INTO public.users VALUES (12, 'user_1778502289816');
INSERT INTO public.users VALUES (13, 'user_1778502340871');
INSERT INTO public.users VALUES (14, 'user_1778502340870');
INSERT INTO public.users VALUES (15, 'user_1778502543841');
INSERT INTO public.users VALUES (16, 'user_1778502543840');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 16, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

