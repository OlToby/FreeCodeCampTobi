--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: creatures; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creatures (
    name character varying(255) NOT NULL,
    species character varying(255) NOT NULL,
    age_in_years numeric,
    creatures_id integer NOT NULL
);


ALTER TABLE public.creatures OWNER TO freecodecamp;

--
-- Name: creatures_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creatures_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_species_id_seq OWNER TO freecodecamp;

--
-- Name: creatures_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creatures_species_id_seq OWNED BY public.creatures.creatures_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean,
    diameter numeric,
    has_god boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(255),
    age_in_million_years integer,
    diameter numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(255),
    has_life boolean,
    age_in_million_years integer,
    planet_type text,
    diameter numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(255),
    diameter numeric,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: creatures creatures_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures ALTER COLUMN creatures_id SET DEFAULT nextval('public.creatures_species_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: creatures; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creatures VALUES ('Humans', 'Humanoid', NULL, 1);
INSERT INTO public.creatures VALUES ('Reptilians', 'Reptiloids', NULL, 2);
INSERT INTO public.creatures VALUES ('Greys', 'Humanoid', NULL, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Comet', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Catwheel', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Calisto', NULL, NULL);
INSERT INTO public.moon VALUES (3, 1, 'Titan', NULL, NULL);
INSERT INTO public.moon VALUES (6, 1, 'Atlas', NULL, NULL);
INSERT INTO public.moon VALUES (7, 1, 'Iapetus', NULL, NULL);
INSERT INTO public.moon VALUES (8, 1, 'Miranda', NULL, NULL);
INSERT INTO public.moon VALUES (9, 1, 'Enceladus', NULL, NULL);
INSERT INTO public.moon VALUES (10, 1, 'Dione', NULL, NULL);
INSERT INTO public.moon VALUES (11, 1, 'Tethys', NULL, NULL);
INSERT INTO public.moon VALUES (12, 1, 'Titania', NULL, NULL);
INSERT INTO public.moon VALUES (13, 1, 'Hyperion', NULL, NULL);
INSERT INTO public.moon VALUES (14, 1, 'Oberon', NULL, NULL);
INSERT INTO public.moon VALUES (15, 1, 'Mimas', NULL, NULL);
INSERT INTO public.moon VALUES (16, 1, 'Amalthea', NULL, NULL);
INSERT INTO public.moon VALUES (17, 1, 'Deimos', NULL, NULL);
INSERT INTO public.moon VALUES (18, 1, 'Europa', NULL, NULL);
INSERT INTO public.moon VALUES (19, 1, 'Rhea', NULL, NULL);
INSERT INTO public.moon VALUES (20, 1, 'Charon', NULL, NULL);
INSERT INTO public.moon VALUES (21, 1, 'Haumea', NULL, NULL);
INSERT INTO public.moon VALUES (22, 1, 'Ceres', NULL, NULL);
INSERT INTO public.moon VALUES (23, 1, 'Himalia', NULL, NULL);
INSERT INTO public.moon VALUES (24, 1, 'Thebe', NULL, NULL);
INSERT INTO public.moon VALUES (25, 1, 'Elara', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, 'Mercury', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 1, 'Mars', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 1, 'Neptun', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 1, 'Nibiru', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 1, 'Rubicon', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 1, 'Pluto', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 1, 'Venus', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 1, 'Pandora', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 1, 'Eris', NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Lynx', NULL, NULL);
INSERT INTO public.star VALUES (3, 6, 'Eridanus', NULL, NULL);
INSERT INTO public.star VALUES (4, 6, 'Cassiopeia', NULL, NULL);
INSERT INTO public.star VALUES (5, 6, 'Scorpius', NULL, NULL);
INSERT INTO public.star VALUES (6, 6, 'Lyra', NULL, NULL);
INSERT INTO public.star VALUES (7, 6, 'Serpens', NULL, NULL);


--
-- Name: creatures_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creatures_species_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: creatures creatures_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_pkey PRIMARY KEY (creatures_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: creatures unique_creature_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT unique_creature_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

