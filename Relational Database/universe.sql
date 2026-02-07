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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    mass numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    description text,
    has_life boolean,
    mass numeric(20,2) NOT NULL
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
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    description text,
    has_life boolean,
    mass numeric(20,2) NOT NULL,
    planet_id integer
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
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    description text,
    has_life boolean,
    mass numeric(20,2) NOT NULL,
    star_id integer
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
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    description text,
    has_life boolean,
    mass numeric(20,2) NOT NULL,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4500, 2.77, 'Largest object in the asteroid belt between Mars and Jupiter', false, 0.00015);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4500, 2.36, 'Second largest object in the asteroid belt, has a rocky surface', false, 0.00009);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 4500, 2.77, 'One of the largest asteroids in the asteroid belt, irregular shape', false, 0.0001);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 3000, 50000, 'contains earth', true, 500.50);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 'Nearest spiral galaxy to Milky Way', false, 1230000000000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000000, 'A smaller spiral galaxy in the Local Group', false, 500000000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 12000, 23000000, 'Famous spiral galaxy with prominent arms', false, 160000000000.00);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 13000, 53000000, 'Supergiant elliptical galaxy with a massive black hole', false, 2400000000000.00);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13000, 29000000, 'Bright spiral galaxy with a large central bulge', false, 800000000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4540, 0, 'Natural satellite of Earth', false, 0.01, 1);
INSERT INTO public.moon VALUES (21, 'Luna', 4540, 0, 'Natural satellite of Gliese 581g', false, 0.01, 1);
INSERT INTO public.moon VALUES (22, 'Phobos', 4500, 0, 'Smaller moon of Mars', false, 0.00, 1);
INSERT INTO public.moon VALUES (23, 'Deimos', 4500, 0, 'Outer moon of Mars', false, 0.00, 1);
INSERT INTO public.moon VALUES (24, 'Io', 4500, 0, 'Volcanically active moon of Jupiter', false, 0.02, 5);
INSERT INTO public.moon VALUES (25, 'Europa', 4500, 0, 'Icy moon of Jupiter, potential subsurface ocean', false, 0.01, 5);
INSERT INTO public.moon VALUES (26, 'Ganymede', 4500, 0, 'Largest moon in the Solar System', false, 0.02, 5);
INSERT INTO public.moon VALUES (27, 'Callisto', 4500, 0, 'Heavily cratered moon of Jupiter', false, 0.02, 5);
INSERT INTO public.moon VALUES (28, 'Titan', 4500, 0, 'Largest moon of Saturn, thick atmosphere', false, 0.02, 6);
INSERT INTO public.moon VALUES (29, 'Rhea', 4500, 0, 'Moon of Saturn', false, 0.00, 6);
INSERT INTO public.moon VALUES (30, 'Iapetus', 4500, 0, 'Moon of Saturn with two-tone coloration', false, 0.00, 6);
INSERT INTO public.moon VALUES (31, 'Oberon', 4500, 0, 'Moon of Uranus', false, 0.00, 7);
INSERT INTO public.moon VALUES (32, 'Titania', 4500, 0, 'Moon of Uranus', false, 0.00, 7);
INSERT INTO public.moon VALUES (33, 'Triton', 4500, 0, 'Largest moon of Neptune', false, 0.00, 8);
INSERT INTO public.moon VALUES (34, 'Nereid', 4500, 0, 'Outer irregular moon of Neptune', false, 0.00, 8);
INSERT INTO public.moon VALUES (35, 'Kepler-22b I', 6000, 0, 'Moon of Kepler-22b', false, 0.00, 9);
INSERT INTO public.moon VALUES (36, 'Kepler-22b II', 6000, 0, 'Moon of Kepler-22b', false, 0.00, 9);
INSERT INTO public.moon VALUES (37, 'Proxima b I', 4500, 0, 'Moon of Proxima b', false, 0.00, 10);
INSERT INTO public.moon VALUES (38, 'Proxima b II', 4500, 0, 'Moon of Proxima b', false, 0.00, 10);
INSERT INTO public.moon VALUES (39, 'Polaris b I', 7000, 0, 'Moon of Polaris b', false, 0.00, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4540, 0, 'Third planet from its star', true, 1.00, 1);
INSERT INTO public.planet VALUES (5, 'Mercury', 4500, 0, 'Closest planet to its star', false, 0.06, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 4500, 1, 'Second planet from its star, thick atmosphere', false, 0.82, 1);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 6000, 20, 'Exoplanet in the habitable zone of Gliese 581', false, 3.10, 1);
INSERT INTO public.planet VALUES (8, 'Mars', 4500, 2, 'Fourth planet, known as the Red Planet', false, 0.11, 1);
INSERT INTO public.planet VALUES (9, 'Jupiter', 4500, 5, 'Largest planet in its system', false, 317.80, 1);
INSERT INTO public.planet VALUES (10, 'Saturn', 4500, 10, 'Famous for its rings', false, 95.20, 2);
INSERT INTO public.planet VALUES (11, 'Uranus', 4500, 19, 'Ice giant, tilted rotation axis', false, 14.50, 2);
INSERT INTO public.planet VALUES (12, 'Neptune', 4500, 30, 'Farthest ice giant in the system', false, 17.10, 2);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 6000, 600, 'Exoplanet in the habitable zone', false, 5.00, 3);
INSERT INTO public.planet VALUES (14, 'Proxima b', 4500, 4, 'Exoplanet orbiting Proxima Centauri', false, 1.30, 1);
INSERT INTO public.planet VALUES (15, 'Polaris b', 7000, 433, 'Companion planet of Polaris', false, 2.00, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 242, 8, 'Brightest star in the night sky', false, 2.02, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5000, 4, 'Closest star system to the Solar System', false, 1.10, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10000, 642, 'Red supergiant in Orion constellation', false, 20.00, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 9000, 860, 'Blue supergiant star in Orion', false, 21.00, 2);
INSERT INTO public.star VALUES (5, 'Vega', 4550, 25, 'Bright star in Lyra constellation', false, 2.10, 3);
INSERT INTO public.star VALUES (6, 'Polaris', 7000, 433, 'North Star in Ursa Minor', false, 5.40, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

