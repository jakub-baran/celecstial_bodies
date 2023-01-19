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
    name character varying NOT NULL,
    galaxy_type text,
    size_in_ly numeric,
    constellation text
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
    name character varying NOT NULL,
    planet_id integer,
    year_of_discovery integer,
    numeral integer NOT NULL,
    mean_radius_in_km numeric
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
    name character varying NOT NULL,
    has_life boolean,
    number_of_moons integer,
    type character varying,
    size_in_km numeric,
    star_id integer,
    has_water boolean
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
    name character varying NOT NULL,
    distance_from_earth_in_ly numeric,
    mass_in_sm character varying,
    type character varying,
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'SB(s)m', 7000, 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'SB(s)m pec', 3500, 'Tucana/Hydrus');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 'SA(s)b', 110000, 'Andromeda');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SDBc', 52850, 'Saggitarius');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'SA(s)cd', 30000, 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'S0 pec', 48500, 'Centaurus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, 1, 1737.4);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 1, 11.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 2, 6.2);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 1, 1821.6);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 2, 1560.8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 3, 5268.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1610, 4, 2410.3);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 1789, 1, 198.2);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1789, 2, 252.1);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1684, 3, 531);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1846, 1, 1353.4);
INSERT INTO public.moon VALUES (12, 'Hippocamp', 8, 2013, 39, 18);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 1851, 1, 1157.8);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 1851, 2, 1169.4);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1787, 3, 1576.8);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1787, 4, 761.4);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 1948, 5, 235.8);
INSERT INTO public.moon VALUES (19, 'Ophelia', 7, 1986, 6, 21.4);
INSERT INTO public.moon VALUES (20, 'Cordelia', 7, 1986, 7, 20.1);
INSERT INTO public.moon VALUES (15, 'Bianca', 7, 1986, 8, 27);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 'terrestrial', 4880, 1, true);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0, 'terrestrial', 12104, 1, true);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 'terrestrial', 12742, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', false, 0, 'terrestrial', 6779, 1, true);
INSERT INTO public.planet VALUES (5, 'Jupyter', false, 80, 'gas giant', 139820, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 83, 'gas giant', 116460, 1, true);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', false, 0, 'super Earth exoplanet', 14908, 7, true);
INSERT INTO public.planet VALUES (9, 'Kepler-186e', false, 0, 'super Earth exoplanet', 727700, 7, true);
INSERT INTO public.planet VALUES (10, 'Kepler-186d', false, 0, 'super Earth exoplanet', 8856, 7, true);
INSERT INTO public.planet VALUES (11, 'Kepler-186c', false, 0, 'super Earth exoplanet', 7964, 7, true);
INSERT INTO public.planet VALUES (12, 'Kepler-186b', false, 0, 'super Earth exoplanet', 68167, 7, true);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 14, 'ice giant', 49244, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0000158125, '1', 'G2V', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.246, '0.1221', 'M5.5Ve', 1);
INSERT INTO public.star VALUES (3, 'Polaris', 430, '1.26', 'F8 Ib', 1);
INSERT INTO public.star VALUES (4, 'Sirius', 8.611, '2.063', 'A0', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 642.5, '11', 'M1-2', 1);
INSERT INTO public.star VALUES (6, 'Vega', 25, '2.1', 'A0V', 1);
INSERT INTO public.star VALUES (7, 'Kepler-186', 429.5, '0.544', 'M1V', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


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

