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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30),
    asteroid_id integer NOT NULL,
    distance integer,
    unique_value integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    galaxy_id integer NOT NULL,
    distance integer,
    age integer,
    mass numeric,
    description text,
    magnetic_field boolean,
    ring_system boolean,
    unique_value integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    moon_id integer NOT NULL,
    distance integer,
    age integer,
    mass numeric,
    description text,
    magnetic_field boolean,
    ring_system boolean,
    planet_id integer,
    unique_value integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    planet_id integer NOT NULL,
    age integer,
    distance integer,
    mass numeric,
    description text,
    magnetic_field boolean,
    ring_system boolean,
    star_id integer,
    unique_value integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    star_id integer NOT NULL,
    distance integer,
    age integer,
    mass numeric,
    description text,
    magnetic_field boolean,
    ring_system boolean,
    galaxy_id integer,
    unique_value integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('asteroid1', 1, 200, 1);
INSERT INTO public.asteroid VALUES ('asteroid2', 2, 200, 2);
INSERT INTO public.asteroid VALUES ('asteroid3', 3, 200, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('galaxy1', 1, 200, 2000, 30, 'Ok', false, false, 1);
INSERT INTO public.galaxy VALUES ('galaxy2', 2, 200, 2000, 30, 'Ok', false, false, 2);
INSERT INTO public.galaxy VALUES ('galaxy3', 3, 200, 2000, 30, 'Ok', false, false, 3);
INSERT INTO public.galaxy VALUES ('galaxy4', 4, 200, 2000, 30, 'Ok', false, false, 4);
INSERT INTO public.galaxy VALUES ('galaxy5', 5, 200, 2000, 30, 'Ok', false, false, 5);
INSERT INTO public.galaxy VALUES ('galaxy6', 6, 200, 2000, 30, 'Ok', false, false, 6);
INSERT INTO public.galaxy VALUES ('galaxy7', 7, 200, 2000, 30, 'Ok', false, false, 7);
INSERT INTO public.galaxy VALUES ('galaxy8', 8, 200, 2000, 30, 'Ok', false, false, 8);
INSERT INTO public.galaxy VALUES ('galaxy9', 9, 200, 2000, 30, 'Ok', false, false, 9);
INSERT INTO public.galaxy VALUES ('galaxy11', 11, 200, 2000, 30, 'Ok', false, false, 11);
INSERT INTO public.galaxy VALUES ('galaxy12', 12, 200, 2000, 30, 'Ok', false, false, 12);
INSERT INTO public.galaxy VALUES ('galaxy10', 10, 200, 2000, 30, 'Ok', false, false, 10);
INSERT INTO public.galaxy VALUES ('galaxy13', 13, 200, 2000, 30, 'Ok', false, false, 13);
INSERT INTO public.galaxy VALUES ('galaxy14', 14, 200, 2000, 30, 'Ok', false, false, 14);
INSERT INTO public.galaxy VALUES ('galaxy15', 15, 200, 2000, 30, 'Ok', false, false, 15);
INSERT INTO public.galaxy VALUES ('galaxy16', 16, 200, 2000, 30, 'Ok', false, false, 16);
INSERT INTO public.galaxy VALUES ('galaxy17', 17, 200, 2000, 30, 'Ok', false, false, 17);
INSERT INTO public.galaxy VALUES ('galaxy18', 18, 200, 2000, 30, 'Ok', false, false, 18);
INSERT INTO public.galaxy VALUES ('galaxy19', 19, 200, 2000, 30, 'Ok', false, false, 19);
INSERT INTO public.galaxy VALUES ('galaxy20', 20, 200, 2000, 30, 'Ok', false, false, 20);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon1', 1, 200, 2000, 30, 'Ok', false, false, 1, 1);
INSERT INTO public.moon VALUES ('moon2', 2, 200, 2000, 30, 'Ok', false, false, 2, 2);
INSERT INTO public.moon VALUES ('moon3', 3, 200, 2000, 30, 'Ok', false, false, 3, 3);
INSERT INTO public.moon VALUES ('moon4', 4, 200, 2000, 30, 'Ok', false, false, 4, 4);
INSERT INTO public.moon VALUES ('moon5', 5, 200, 2000, 30, 'Ok', false, false, 5, 5);
INSERT INTO public.moon VALUES ('moon6', 6, 200, 2000, 30, 'Ok', false, false, 6, 6);
INSERT INTO public.moon VALUES ('moon7', 7, 200, 2000, 30, 'Ok', false, false, 7, 7);
INSERT INTO public.moon VALUES ('moon8', 8, 200, 2000, 30, 'Ok', false, false, 8, 8);
INSERT INTO public.moon VALUES ('moon9', 9, 200, 2000, 30, 'Ok', false, false, 9, 9);
INSERT INTO public.moon VALUES ('moon10', 10, 200, 2000, 30, 'Ok', false, false, 10, 10);
INSERT INTO public.moon VALUES ('moon11', 11, 200, 2000, 30, 'Ok', false, false, 11, 11);
INSERT INTO public.moon VALUES ('moon12', 12, 200, 2000, 30, 'Ok', false, false, 12, 12);
INSERT INTO public.moon VALUES ('moon13', 13, 200, 2000, 30, 'Ok', false, false, 13, 13);
INSERT INTO public.moon VALUES ('moon14', 14, 200, 2000, 30, 'Ok', false, false, 14, 14);
INSERT INTO public.moon VALUES ('moon15', 15, 200, 2000, 30, 'Ok', false, false, 15, 15);
INSERT INTO public.moon VALUES ('moon16', 16, 200, 2000, 30, 'Ok', false, false, 16, 16);
INSERT INTO public.moon VALUES ('moon17', 17, 200, 2000, 30, 'Ok', false, false, 17, 17);
INSERT INTO public.moon VALUES ('moon18', 18, 200, 2000, 30, 'Ok', false, false, 18, 18);
INSERT INTO public.moon VALUES ('moon19', 19, 200, 2000, 30, 'Ok', false, false, 19, 19);
INSERT INTO public.moon VALUES ('moon20', 20, 200, 2000, 30, 'Ok', false, false, 20, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('planet1', 1, 2000, 200, 30, 'Ok', false, false, 1, 1);
INSERT INTO public.planet VALUES ('planet2', 2, 2000, 200, 30, 'Ok', false, false, 2, 2);
INSERT INTO public.planet VALUES ('planet3', 3, 2000, 200, 30, 'Ok', false, false, 3, 3);
INSERT INTO public.planet VALUES ('planet4', 4, 2000, 200, 30, 'Ok', false, false, 4, 4);
INSERT INTO public.planet VALUES ('planet5', 5, 2000, 200, 30, 'Ok', false, false, 5, 5);
INSERT INTO public.planet VALUES ('planet6', 6, 2000, 200, 30, 'Ok', false, false, 6, 6);
INSERT INTO public.planet VALUES ('planet7', 7, 2000, 200, 30, 'Ok', false, false, 7, 7);
INSERT INTO public.planet VALUES ('planet8', 8, 2000, 200, 30, 'Ok', false, false, 8, 8);
INSERT INTO public.planet VALUES ('planet9', 9, 2000, 200, 30, 'Ok', false, false, 9, 9);
INSERT INTO public.planet VALUES ('planet10', 10, 2000, 200, 30, 'Ok', false, false, 10, 10);
INSERT INTO public.planet VALUES ('planet11', 11, 2000, 200, 30, 'Ok', false, false, 11, 11);
INSERT INTO public.planet VALUES ('planet12', 12, 2000, 200, 30, 'Ok', false, false, 12, 12);
INSERT INTO public.planet VALUES ('planet13', 13, 2000, 200, 30, 'Ok', false, false, 13, 13);
INSERT INTO public.planet VALUES ('planet14', 14, 2000, 200, 30, 'Ok', false, false, 14, 14);
INSERT INTO public.planet VALUES ('planet15', 15, 2000, 200, 30, 'Ok', false, false, 15, 15);
INSERT INTO public.planet VALUES ('planet16', 16, 2000, 200, 30, 'Ok', false, false, 16, 16);
INSERT INTO public.planet VALUES ('planet17', 17, 2000, 200, 30, 'Ok', false, false, 17, 17);
INSERT INTO public.planet VALUES ('planet18', 18, 2000, 200, 30, 'Ok', false, false, 18, 18);
INSERT INTO public.planet VALUES ('planet19', 19, 2000, 200, 30, 'Ok', false, false, 19, 19);
INSERT INTO public.planet VALUES ('planet20', 20, 2000, 200, 30, 'Ok', false, false, 20, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star1', 1, 200, 2000, 30, 'Ok', false, false, 1, 1);
INSERT INTO public.star VALUES ('star2', 2, 200, 2000, 30, 'Ok', false, false, 2, 2);
INSERT INTO public.star VALUES ('star3', 3, 200, 2000, 30, 'Ok', false, false, 3, 3);
INSERT INTO public.star VALUES ('star4', 4, 200, 2000, 30, 'Ok', false, false, 4, 4);
INSERT INTO public.star VALUES ('star5', 5, 200, 2000, 30, 'Ok', false, false, 5, 5);
INSERT INTO public.star VALUES ('star6', 6, 200, 2000, 30, 'Ok', false, false, 6, 6);
INSERT INTO public.star VALUES ('star7', 7, 200, 2000, 30, 'Ok', false, false, 7, 7);
INSERT INTO public.star VALUES ('star8', 8, 200, 2000, 30, 'Ok', false, false, 8, 8);
INSERT INTO public.star VALUES ('star9', 9, 200, 2000, 30, 'Ok', false, false, 9, 9);
INSERT INTO public.star VALUES ('star10', 10, 200, 2000, 30, 'Ok', false, false, 10, 10);
INSERT INTO public.star VALUES ('star11', 11, 200, 2000, 30, 'Ok', false, false, 11, 11);
INSERT INTO public.star VALUES ('star12', 12, 200, 2000, 30, 'Ok', false, false, 12, 12);
INSERT INTO public.star VALUES ('star13', 13, 200, 2000, 30, 'Ok', false, false, 13, 13);
INSERT INTO public.star VALUES ('star14', 14, 200, 2000, 30, 'Ok', false, false, 14, 14);
INSERT INTO public.star VALUES ('star15', 15, 200, 2000, 30, 'Ok', false, false, 15, 15);
INSERT INTO public.star VALUES ('star16', 16, 200, 2000, 30, 'Ok', false, false, 16, 16);
INSERT INTO public.star VALUES ('star17', 17, 200, 2000, 30, 'Ok', false, false, 17, 17);
INSERT INTO public.star VALUES ('star18', 18, 200, 2000, 30, 'Ok', false, false, 18, 18);
INSERT INTO public.star VALUES ('star19', 19, 200, 2000, 30, 'Ok', false, false, 19, 19);
INSERT INTO public.star VALUES ('star20', 20, 200, 2000, 30, 'Ok', false, false, 20, 20);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroid_unique_value_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_unique_value_key UNIQUE (unique_value);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_value_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_value_key UNIQUE (unique_value);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_value_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_value_key UNIQUE (unique_value);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_value_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_value_key UNIQUE (unique_value);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_value_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_value_key UNIQUE (unique_value);


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

