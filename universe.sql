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
-- Name: base; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.base (
    name character varying(30) NOT NULL,
    description text,
    age integer,
    size integer,
    distance numeric,
    has_life boolean,
    is_spherical boolean,
    base_id integer NOT NULL
);


ALTER TABLE public.base OWNER TO freecodecamp;

--
-- Name: base_base_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.base_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_base_id_seq OWNER TO freecodecamp;

--
-- Name: base_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.base_base_id_seq OWNED BY public.base.base_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL
)
INHERITS (public.base);


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
    planet_id integer NOT NULL
)
INHERITS (public.base);


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
    star_id integer NOT NULL
)
INHERITS (public.base);


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
    galaxy_id integer NOT NULL
)
INHERITS (public.base);


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
-- Name: base base_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.base ALTER COLUMN base_id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy base_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN base_id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon base_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN base_id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet base_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN base_id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star base_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN base_id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Data for Name: base; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'The galaxy that contains our Solar System', 400, 748, 36.3, true, false, 1, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 'The nearest major galaxy to the Milky Way', 300, 859, 2.5, false, false, 2, 2);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 'It is a falaxy which was discovered bt Edward Pigott in March 1779', 200, 700, 54.6, false, false, 3, 3);
INSERT INTO public.galaxy VALUES ('Cartwheel Galaxy', 'It is a lenticular galaxy and ring galaxy about 500 million light-years awat in the constellation Sculpture', 300, 565, 80.5, false, false, 4, 4);
INSERT INTO public.galaxy VALUES ('Cigar Galaxy', 'It is a starbust galaxy approcimately 12 million light-years in the constellation Ursa Major', 250, 869, 449, false, false, 5, 5);
INSERT INTO public.galaxy VALUES ('Comet Galaxy', 'It is a spiral galaxy located 3.2 billion light-years from Earth.', 244, 998, 49.3, false, false, 6, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Europa', 'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter', NULL, NULL, NULL, NULL, NULL, 1, 8, 26);
INSERT INTO public.moon VALUES ('Hyperion', 'Hyperion, also known as Saturn VII, is the eighth-largest moon of Saturn', NULL, NULL, NULL, NULL, NULL, 2, 6, 27);
INSERT INTO public.moon VALUES ('Mimas', 'Mimas, also designated Saturn I, is the seventh-largest natural satellite of Saturn.', NULL, NULL, NULL, NULL, NULL, 3, 6, 28);
INSERT INTO public.moon VALUES ('Titan', 'Titan is the largest moon of Saturn and the second-largest in the Solar System', NULL, NULL, NULL, NULL, NULL, 4, 6, 29);
INSERT INTO public.moon VALUES ('Epimetheus', 'Epimetheus is an inner satellite of Saturn. It is also known as Saturn XI', NULL, NULL, NULL, NULL, NULL, 5, 6, 30);
INSERT INTO public.moon VALUES ('Telesto', 'Telesto is a moon of Saturn', NULL, NULL, NULL, NULL, NULL, 6, 6, 31);
INSERT INTO public.moon VALUES ('Thebe', 'Thebe, also known as Jupiter XIV, is the fourth of Jupiter moons by distance from the planet', NULL, NULL, NULL, NULL, NULL, 7, 8, 32);
INSERT INTO public.moon VALUES ('Themisto', 'Themisto, also known as Jupiter XVIII, is a small prograde irregular satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 8, 8, 33);
INSERT INTO public.moon VALUES ('Cyllene', 'Cyllene, also known as Jupiter XLVIII, is a natural satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 9, 8, 34);
INSERT INTO public.moon VALUES ('Jupiter LII', 'Jupiter LII, originally known as S/2010 J 2, is a natural satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 10, 8, 35);
INSERT INTO public.moon VALUES ('Herse', 'Herse, or Jupiter L, previously known by its provisional designation of S/2003 J 17', NULL, NULL, NULL, NULL, NULL, 11, 8, 36);
INSERT INTO public.moon VALUES ('Cllirrhoe', 'Callirrhoe, also known as Jupiter XVII', NULL, NULL, NULL, NULL, NULL, 12, 8, 37);
INSERT INTO public.moon VALUES ('Jupiter LI', 'Provisionally known as S/2010 J 1, is a natural satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 13, 8, 38);
INSERT INTO public.moon VALUES ('Eukelade', 'Also known as Jupiter XLVII, is a retrograde irregular satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 14, 8, 39);
INSERT INTO public.moon VALUES ('Iocaste', 'Also known as Jupiter XXIV, is a retrograde irregular satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 15, 8, 40);
INSERT INTO public.moon VALUES ('Aoede', 'Also known as Jupiter XLI, is a natural satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 16, 8, 41);
INSERT INTO public.moon VALUES ('Helike', 'Also known as Jupiter XLV, is a moon of Jupiter', NULL, NULL, NULL, NULL, NULL, 17, 8, 42);
INSERT INTO public.moon VALUES ('Arche', 'Also known as Jupiter XLIII, is a moon of Jupiter', NULL, NULL, NULL, NULL, NULL, 18, 8, 43);
INSERT INTO public.moon VALUES ('Amalthea', 'Is a moon of Jupiter', NULL, NULL, NULL, NULL, NULL, 19, 8, 44);
INSERT INTO public.moon VALUES ('Jupiter LXI', 'Provisionally known as S/2003 J 19, is a natural satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 20, 8, 45);
INSERT INTO public.moon VALUES ('Jupiter LV', 'Provisionally known as S/2003 J 18, is a natural satellite of Jupiter', NULL, NULL, NULL, NULL, NULL, 21, 8, 46);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'The 1st planet from the Sun', NULL, NULL, NULL, false, true, 1, 1, 14);
INSERT INTO public.planet VALUES ('Venus', 'Named after a God that constitutes beauty', NULL, NULL, NULL, false, true, 2, 1, 15);
INSERT INTO public.planet VALUES ('Earth', 'The world we live in', NULL, NULL, NULL, true, true, 3, 1, 16);
INSERT INTO public.planet VALUES ('Mars', 'Also known as the Red Planet because of its color', NULL, NULL, NULL, false, true, 4, 1, 17);
INSERT INTO public.planet VALUES ('Jupiter', 'The biggest planet in the Solar System', NULL, NULL, NULL, false, true, 5, 1, 18);
INSERT INTO public.planet VALUES ('Saturn', 'Known for the ring around the planet', NULL, NULL, NULL, false, true, 6, 1, 19);
INSERT INTO public.planet VALUES ('Uranus', 'Might just be a big ball of gas', NULL, NULL, NULL, false, true, 7, 1, 20);
INSERT INTO public.planet VALUES ('Neptune', 'Farthest planet from the Sun', NULL, NULL, NULL, false, true, 8, 1, 21);
INSERT INTO public.planet VALUES ('Pluto', 'Was condidered as the last planet in the Solar System for a long time', NULL, NULL, NULL, false, true, 9, 1, 22);
INSERT INTO public.planet VALUES ('Eris', 'The most massive and second-largest known dwarf planet in the Solar System', NULL, NULL, NULL, false, true, 10, 1, 23);
INSERT INTO public.planet VALUES ('Haumea', 'One of the dwarf planets', NULL, NULL, NULL, false, true, 11, 1, 24);
INSERT INTO public.planet VALUES ('Ceres', 'One of the dwarf planets', NULL, NULL, NULL, false, true, 12, 1, 25);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'The sun is the center of the Solar System', 4000, 5521, 4.2, false, true, 1, 1, 7);
INSERT INTO public.star VALUES ('Alpheratz', 'Biggest star in this constellation', 580, 570, 46.2, false, true, 2, 2, 8);
INSERT INTO public.star VALUES ('Mirach', 'A red-hued giant star of type M0.', 600, 2225, 38.2, false, true, 3, 2, 9);
INSERT INTO public.star VALUES ('Sirius A', 'A very serius star', 556, 501, 4.6, false, true, 4, 3, 10);
INSERT INTO public.star VALUES ('Canopus', 'Many have been made aware', 8000, 8852, 88.2, false, true, 5, 4, 11);
INSERT INTO public.star VALUES ('Arcturus', 'A singular form or Lorem Ipsum', 22540, 2858, 435.2, false, true, 6, 5, 12);
INSERT INTO public.star VALUES ('Vega', 'Popularized by Street Fighter games', 560, 1125, 223.2, false, true, 7, 6, 13);


--
-- Name: base_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.base_base_id_seq', 46, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: base base_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_name_key UNIQUE (name);


--
-- Name: base base_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pkey PRIMARY KEY (base_id);


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

