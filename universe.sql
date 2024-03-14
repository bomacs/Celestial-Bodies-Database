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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_sun numeric NOT NULL,
    serial_num character varying(30) NOT NULL
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
    name character varying(30),
    galaxy_types character varying(30),
    age_in_million_years integer NOT NULL,
    serial_num character varying(30) NOT NULL
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
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_its_planet numeric,
    planet_id integer,
    serial_num character varying(30)
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
    name character varying(30) NOT NULL,
    planet_types character varying(30),
    has_life boolean,
    age_in_million_years integer,
    star_id integer,
    serial_num character varying(30) NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    galaxy_id integer,
    number_of_planets integer,
    serial_num character varying(30)
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Dwarf planet and largest object in the asteroid belt', 277000, 'AST00001');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Third largest object in the asteroid belt', 277000, 'AST00003');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Brightest Asteroid and second largest object in the asteroid belt', 236000, 'AST00002');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 12300, 'GAL00001');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 13000, 'GAL00002');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 'GAL00003');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 12300, 'GAL00004');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13000, 'GAL00005');
INSERT INTO public.galaxy VALUES (6, 'Phinwell', 'Spiral', 12000, 'GAL00006');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 384400, 1, 'M00001');
INSERT INTO public.moon VALUES (2, 'Phobos', true, 9378, 4, 'M00002');
INSERT INTO public.moon VALUES (3, 'Deimos', true, 23460, 4, 'M00003');
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 1070412, 3, 'M00004');
INSERT INTO public.moon VALUES (5, 'Callisto', true, 1882709, 3, 'M00005');
INSERT INTO public.moon VALUES (6, 'lo', true, 9378, 3, 'M00006');
INSERT INTO public.moon VALUES (7, 'Europa', true, 671034, 4, 'M00007');
INSERT INTO public.moon VALUES (8, 'Triton', true, 1070412, 6, 'M00008');
INSERT INTO public.moon VALUES (9, 'Titan', true, 12709, 3, 'M00009');
INSERT INTO public.moon VALUES (10, 'Enceladus', true, 238037, 7, 'M00010');
INSERT INTO public.moon VALUES (11, 'Tethys', true, 294619, 7, 'M000011');
INSERT INTO public.moon VALUES (12, 'Rhea', true, 10705, 6, 'M000012');
INSERT INTO public.moon VALUES (17, 'Mimas', true, 129709, 10, 'M00013');
INSERT INTO public.moon VALUES (18, 'Ariel', true, 238037, 7, 'M00014');
INSERT INTO public.moon VALUES (19, 'Umbriel', true, 294619, 10, 'M000015');
INSERT INTO public.moon VALUES (20, 'Oberon', false, 34105, 11, 'M000016');
INSERT INTO public.moon VALUES (21, 'Miranda', true, 129709, 10, 'M00017');
INSERT INTO public.moon VALUES (22, 'Charon', true, 2538037, 12, 'M00018');
INSERT INTO public.moon VALUES (23, 'Hyperion', false, 894619, 11, 'M00019');
INSERT INTO public.moon VALUES (24, 'Phoebe', false, 34105, 4, 'M00020');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 1000000, 5, 'P00001');
INSERT INTO public.planet VALUES (2, 'Venus', 'Gas giant', false, 1000000, 5, 'P00002');
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', false, 1000000, 5, 'P00003');
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 1000000, 5, 'P00004');
INSERT INTO public.planet VALUES (5, 'Keppler 22B', 'Gas giant', false, 100000000, 4, 'P00005');
INSERT INTO public.planet VALUES (6, 'Trappist-1e', 'Gas giant', false, 1000000000, 1, 'P00006');
INSERT INTO public.planet VALUES (7, 'Tau Ceti e', 'Terrestrial', false, 100000000, 4, 'P00007');
INSERT INTO public.planet VALUES (10, 'Gleise 581c', 'Gas giant', false, 100000000, 4, 'P00008');
INSERT INTO public.planet VALUES (11, 'WASP-12B', 'Gas giant', false, 1000000000, 1, 'P00009');
INSERT INTO public.planet VALUES (12, 'HD-13343b', 'Terrestrial', false, 100000000, 4, 'P00010');
INSERT INTO public.planet VALUES (13, 'Kepler-62c', 'Gas giant', false, 1000000, 3, 'P00011');
INSERT INTO public.planet VALUES (14, 'Proxima Centauri', 'Gas giant', false, 100000000, 2, 'P00012');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima-Centuari', 'Red dwarf star', 1, 1, 'STR00001');
INSERT INTO public.star VALUES (2, 'Sirius', 'Binary star system, brightest in the sky', 2, 3, 'STR00002');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Biary Star System', 3, 6, 'STR00003');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant Star', 4, 0, 'STR00004');
INSERT INTO public.star VALUES (5, 'Polaris', 'North Star, part of Ursa Minor Constellation', 1, 0, 'STR00005');
INSERT INTO public.star VALUES (6, 'Vega', '', 5, 2, 'STR00006');


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

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


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
-- Name: asteroid asteroid_serial_num_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_serial_num_key UNIQUE (serial_num);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_serial_num_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_serial_num_key UNIQUE (serial_num);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_serial_num_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_serial_num_key UNIQUE (serial_num);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_serial_num_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_serial_num_key UNIQUE (serial_num);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_serial_num_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_serial_num_key UNIQUE (serial_num);


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

