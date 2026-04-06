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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_from_sun integer,
    years_old integer,
    name character varying(50),
    galaxy_type character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_from_sun integer,
    years_old integer,
    name character varying(50) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    is_spherical boolean,
    description text,
    surface_temp numeric,
    name character varying(50) NOT NULL,
    life_friendly boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelite (
    name character varying(50) NOT NULL,
    satelite_id integer NOT NULL,
    satelite_type character varying(50)
);


ALTER TABLE public.satelite OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    years_old integer,
    distance_from_sun integer,
    star_type character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, NULL, 'Milky Way', 'Barred spiral');
INSERT INTO public.galaxy VALUES (2, NULL, NULL, 'Andromeda (M31)', 'Spiral');
INSERT INTO public.galaxy VALUES (3, NULL, NULL, 'Triangulum (M33)', 'Spiral');
INSERT INTO public.galaxy VALUES (4, NULL, NULL, 'Sombrero (M104)', 'Spiral‑lenticular');
INSERT INTO public.galaxy VALUES (5, NULL, NULL, 'Whirlpool (M51)', 'Spiral');
INSERT INTO public.galaxy VALUES (6, NULL, NULL, 'Centaurus A (NGC 5128)', 'Elliptical (peculiar)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, NULL, 'Moon', 3);
INSERT INTO public.moon VALUES (2, NULL, NULL, 'Phobos', 4);
INSERT INTO public.moon VALUES (3, NULL, NULL, 'Deimos', 4);
INSERT INTO public.moon VALUES (4, NULL, NULL, 'Io', 5);
INSERT INTO public.moon VALUES (5, NULL, NULL, 'Europa', 5);
INSERT INTO public.moon VALUES (6, NULL, NULL, 'Ganymede', 5);
INSERT INTO public.moon VALUES (7, NULL, NULL, 'Callisto', 5);
INSERT INTO public.moon VALUES (8, NULL, NULL, 'Amalthea', 5);
INSERT INTO public.moon VALUES (9, NULL, NULL, 'Thebe', 5);
INSERT INTO public.moon VALUES (10, NULL, NULL, 'Mimas', 6);
INSERT INTO public.moon VALUES (11, NULL, NULL, 'Enceladus', 6);
INSERT INTO public.moon VALUES (12, NULL, NULL, 'Tethys', 6);
INSERT INTO public.moon VALUES (13, NULL, NULL, 'Dione', 6);
INSERT INTO public.moon VALUES (14, NULL, NULL, 'Rhea', 6);
INSERT INTO public.moon VALUES (15, NULL, NULL, 'Titan', 6);
INSERT INTO public.moon VALUES (16, NULL, NULL, 'Iapetus', 6);
INSERT INTO public.moon VALUES (17, NULL, NULL, 'Miranda', 7);
INSERT INTO public.moon VALUES (18, NULL, NULL, 'Ariel', 7);
INSERT INTO public.moon VALUES (19, NULL, NULL, 'Umbriel', 7);
INSERT INTO public.moon VALUES (20, NULL, NULL, 'Titania', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, NULL, NULL, 'Mercury', NULL, 7);
INSERT INTO public.planet VALUES (2, NULL, NULL, NULL, 'Venus', NULL, 7);
INSERT INTO public.planet VALUES (3, NULL, NULL, NULL, 'Earth', NULL, 7);
INSERT INTO public.planet VALUES (4, NULL, NULL, NULL, 'Mars', NULL, 7);
INSERT INTO public.planet VALUES (5, NULL, NULL, NULL, 'Jupiter', NULL, 7);
INSERT INTO public.planet VALUES (6, NULL, NULL, NULL, 'Saturn', NULL, 7);
INSERT INTO public.planet VALUES (7, NULL, NULL, NULL, 'Uranus', NULL, 7);
INSERT INTO public.planet VALUES (8, NULL, NULL, NULL, 'Neptune', NULL, 7);
INSERT INTO public.planet VALUES (9, NULL, NULL, NULL, 'Planet A', NULL, 1);
INSERT INTO public.planet VALUES (10, NULL, NULL, NULL, 'Planet B', NULL, 2);
INSERT INTO public.planet VALUES (11, NULL, NULL, NULL, 'Planet C', NULL, 3);
INSERT INTO public.planet VALUES (12, NULL, NULL, NULL, 'Planet D', NULL, 4);


--
-- Data for Name: satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelite VALUES ('Hubble Space Telescope', 1, 'Telescope');
INSERT INTO public.satelite VALUES ('International Space Station (ISS)', 2, 'SpaceStation');
INSERT INTO public.satelite VALUES ('GPS III SV04 (Vespucci)', 3, 'GPS satelite');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius A', 1, NULL, NULL, 'A1 V (A‑type main‑sequence)', 1);
INSERT INTO public.star VALUES ('Betelgeuse', 2, NULL, NULL, 'M1‑2 Ia‑ab (Red supergiant)', 1);
INSERT INTO public.star VALUES ('Rigel', 3, NULL, NULL, 'B8 Ia (Blue supergiant)', 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 4, NULL, NULL, 'M5.5 Ve (Red dwarf, main‑sequence)', 1);
INSERT INTO public.star VALUES ('Vega', 5, NULL, NULL, 'A0 V (A‑type main‑sequence)', 1);
INSERT INTO public.star VALUES ('Deneb', 6, NULL, NULL, 'A2 Ia (Blue‑white luminous supergiant)', 1);
INSERT INTO public.star VALUES ('Sun', 7, NULL, NULL, 'G2 V', 1);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satelite satelite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_name_key UNIQUE (name);


--
-- Name: satelite satelite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_pkey PRIMARY KEY (satelite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

