--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(15),
    unique_observation text,
    type character varying(10) NOT NULL,
    distance_from_earth numeric(10,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(15),
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    geologically_active boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(15),
    has_life boolean,
    star_id integer NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(11) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(15),
    distance_from_earth numeric,
    number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(1) NOT NULL,
    description text
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', NULL, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'andromeda', NULL, 'spiral', 2.5);
INSERT INTO public.galaxy VALUES (3, 'messier 87', NULL, 'elliptical', 53.5);
INSERT INTO public.galaxy VALUES (4, 'triangulum', NULL, 'spiral', 2.7);
INSERT INTO public.galaxy VALUES (5, 'sombrero', NULL, 'spiral', 29.4);
INSERT INTO public.galaxy VALUES (6, 'messier 82', NULL, 'starburst', 11.4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, NULL, true, false);
INSERT INTO public.moon VALUES (2, 'phobos', 4, NULL, false, false);
INSERT INTO public.moon VALUES (4, 'lo', 5, NULL, true, true);
INSERT INTO public.moon VALUES (5, 'europa', 5, NULL, true, true);
INSERT INTO public.moon VALUES (6, 'ganymede', 5, NULL, true, true);
INSERT INTO public.moon VALUES (3, 'deimos', 4, NULL, false, false);
INSERT INTO public.moon VALUES (7, 'triton', 8, NULL, true, true);
INSERT INTO public.moon VALUES (8, 'proteus', 8, NULL, false, false);
INSERT INTO public.moon VALUES (9, 'naiad', 8, NULL, false, false);
INSERT INTO public.moon VALUES (11, 'mimas', 6, NULL, true, false);
INSERT INTO public.moon VALUES (12, 'enceladus', 6, NULL, true, true);
INSERT INTO public.moon VALUES (13, 'tethys', 6, NULL, true, false);
INSERT INTO public.moon VALUES (14, 'dione', 6, NULL, true, false);
INSERT INTO public.moon VALUES (15, 'rhea', 6, NULL, true, false);
INSERT INTO public.moon VALUES (16, 'titan', 6, NULL, true, true);
INSERT INTO public.moon VALUES (17, 'lapetus', 6, NULL, true, false);
INSERT INTO public.moon VALUES (18, 'miranda', 7, NULL, true, false);
INSERT INTO public.moon VALUES (19, 'ariel', 7, NULL, true, false);
INSERT INTO public.moon VALUES (20, 'umbriel', 7, NULL, true, false);
INSERT INTO public.moon VALUES (21, 'titania', 7, NULL, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', false, 1, 0);
INSERT INTO public.planet VALUES (2, 'venus', false, 1, 0);
INSERT INTO public.planet VALUES (3, 'earth', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'mars', false, 1, 2);
INSERT INTO public.planet VALUES (5, 'jupiter', false, 1, 79);
INSERT INTO public.planet VALUES (6, 'saturn', false, 1, 82);
INSERT INTO public.planet VALUES (8, 'neptune', false, 1, 14);
INSERT INTO public.planet VALUES (7, 'uranus', false, 1, 27);
INSERT INTO public.planet VALUES (9, 'kepler-11b', NULL, 7, NULL);
INSERT INTO public.planet VALUES (14, 'kepler-11c', NULL, 7, NULL);
INSERT INTO public.planet VALUES (10, 'kepler-11d', NULL, 7, NULL);
INSERT INTO public.planet VALUES (11, 'kepler-11e', NULL, 7, NULL);
INSERT INTO public.planet VALUES (12, 'kepler-11f', NULL, 7, NULL);
INSERT INTO public.planet VALUES (13, 'kepler-11g', NULL, 7, NULL);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'gas giant', NULL);
INSERT INTO public.planet_types VALUES (2, 'neptunian', NULL);
INSERT INTO public.planet_types VALUES (3, 'super-earth', NULL);
INSERT INTO public.planet_types VALUES (4, 'terrestrial', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'sun', 94.1, 8);
INSERT INTO public.star VALUES (1, 2, 'proxima maxima', 4.2, 3);
INSERT INTO public.star VALUES (2, 3, 'mirach', 199, NULL);
INSERT INTO public.star VALUES (2, 4, 'alpheratz', 96.9, NULL);
INSERT INTO public.star VALUES (1, 5, 'antares', 554.5, NULL);
INSERT INTO public.star VALUES (1, 6, 'wolf 359', 7.8, 2);
INSERT INTO public.star VALUES (1, 7, 'kepler-11', 1679, 6);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'O', NULL);
INSERT INTO public.star_types VALUES (2, 'B', NULL);
INSERT INTO public.star_types VALUES (3, 'A', NULL);
INSERT INTO public.star_types VALUES (4, 'F', NULL);
INSERT INTO public.star_types VALUES (5, 'G', NULL);
INSERT INTO public.star_types VALUES (6, 'K', NULL);
INSERT INTO public.star_types VALUES (7, 'M', NULL);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_id_key UNIQUE (planet_types_id);


--
-- Name: planet_types planet_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: star_types star_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_type_id_key UNIQUE (star_types_id);


--
-- Name: star_types star_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_type_name_key UNIQUE (name);


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
-- PostgreSQL database dump complete
--

